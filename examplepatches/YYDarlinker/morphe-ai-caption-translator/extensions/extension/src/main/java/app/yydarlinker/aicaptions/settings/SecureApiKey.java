package app.yydarlinker.aicaptions.settings;

import androidx.annotation.Nullable;

import android.content.Context;
import android.content.SharedPreferences;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import android.util.Base64;

import java.net.URI;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.KeyStore;
import java.util.Locale;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;

/**
 * The API keys of the profiles, encrypted with one non-exportable key of the Android Keystore.
 *
 * <p>A saved key is bound to the origin of the endpoint it was saved for: if the endpoint of the
 * profile later points elsewhere, the key is not handed out.
 */
public final class SecureApiKey {
    private static final String VALUE = "api_key_ciphertext";
    private static final String ORIGIN = "_origin";
    private static final String ALIAS = "yydarlinker.deepseek.caption.api.key.v1";
    private static final String KEY_STORE = "AndroidKeyStore";
    private static final String CIPHER = "AES/GCM/NoPadding";

    private SecureApiKey() {}

    private static SharedPreferences prefs(Context context) {
        return CaptionStorage.CREDENTIALS.open(context);
    }

    private static String valueKey(String profile) {
        return ApiProfiles.LEGACY.equals(profile) ? VALUE : VALUE + "_" + profile;
    }

    private static String valueKey(Context context) {
        return valueKey(ApiProfiles.active(context));
    }

    /** The scheme and authority of the endpoint of the active profile. */
    private static String origin(Context context) {
        URI uri =
                URI.create(AiCaptionConfig.baseUrl(context));
        return uri.getScheme().toLowerCase(Locale.ROOT)
                + "://"
                + uri.getRawAuthority().toLowerCase(Locale.ROOT);
    }

    private static boolean originMatches(Context context) {
        String saved = ConfigRead.string(prefs(context), valueKey(context) + ORIGIN, "");
        String current = origin(context);
        return saved.isEmpty() || saved.equals(current);
    }

    public static void save(Context context, @Nullable String apiKey) throws Exception {
        if (apiKey == null || apiKey.trim().isEmpty())
            throw new IllegalArgumentException("API Key 不能为空");
        synchronized (ApiProfiles.LOCK) {
            Cipher cipher = Cipher.getInstance(CIPHER);
            cipher.init(Cipher.ENCRYPT_MODE, keyOrNew());
            byte[] iv = cipher.getIV();
            byte[] ciphertext = cipher.doFinal(apiKey.trim().getBytes(StandardCharsets.UTF_8));
            byte[] packed =
                    ByteBuffer.allocate(1 + iv.length + ciphertext.length)
                            .put((byte) iv.length)
                            .put(iv)
                            .put(ciphertext)
                            .array();
            String valueKey = valueKey(context);
            prefs(context)
                    .edit()
                    .putString(valueKey, Base64.encodeToString(packed, Base64.NO_WRAP))
                    .putString(valueKey + ORIGIN, origin(context))
                    .apply();
        }
    }

    /** Replaces a key only when any previous ciphertext can still be decrypted. */
    static void replace(Context context, @Nullable String apiKey) throws Exception {
        synchronized (ApiProfiles.LOCK) {
            StoredCredential old = checkedCredential(context);
            if (old.present() && old.resolve().isEmpty()) throw new ConfigRead.Failure();
            save(context, apiKey);
        }
    }

    static StoredCredential checkedCredential(Context context) {
        String key = valueKey(context);
        SharedPreferences store = prefs(context);
        ConfigRead.string(store, key + ORIGIN, "");
        return new StoredCredential(ConfigRead.string(store, key, ""));
    }

    /** The key of the active profile; empty if none is saved or it cannot be read. */
    public static String load(Context context) {
        synchronized (ApiProfiles.LOCK) {
            try {
            String encoded = ConfigRead.string(prefs(context), valueKey(context), "");
            if (encoded.isEmpty() || !originMatches(context)) return "";
            return decryptStored(encoded);
            } catch (ConfigRead.Failure unreadable) {
                return "";
            }
        }
    }

    /** Distinguishes malformed metadata from a missing/unavailable credential, without decrypting twice. */
    static String loadChecked(Context context) {
        String key = valueKey(context);
        ConfigRead.string(prefs(context), key, "");
        ConfigRead.string(prefs(context), key + ORIGIN, "");
        return load(context);
    }

    /** Immutable encrypted snapshot for deferred diagnostic redaction; contains no plaintext. */
    public static final class StoredCredential {
        private final String encrypted;
        StoredCredential(String encrypted) { this.encrypted = encrypted; }
        public boolean present() { return !encrypted.isEmpty(); }
        public String identity() {
            return "stored:" + app.yydarlinker.caption.contracts.CaptionContracts.hash(encrypted);
        }
        public String resolve() { return decryptStored(encrypted); }
    }

    /** Captures the active profile/key binding without Android Keystore or cipher operations. */
    public static StoredCredential captureCredential(@Nullable Context context) {
        if (context == null) return new StoredCredential("");
        try {
            String profile = ApiProfiles.activeSnapshot(context);
            // This captured ciphertext is used only to redact a record, never as a request key.
            // Network credential loading keeps its existing origin checks and profile lock.
            return new StoredCredential(prefs(context).getString(valueKey(profile), ""));
        } catch (RuntimeException unavailable) {
            return new StoredCredential("");
        }
    }

    /** Called by normal credential loading or the diagnostics writer, never by animation logging. */
    static String decryptStored(@Nullable String encoded) {
        if (encoded == null || encoded.isEmpty()) return "";
        try {
            ByteBuffer packed = ByteBuffer.wrap(Base64.decode(encoded, Base64.DEFAULT));
            int ivLength = packed.get() & 0xFF;
            if (ivLength < 12 || ivLength > 32 || packed.remaining() <= ivLength) return "";
            byte[] iv = new byte[ivLength];
            packed.get(iv);
            byte[] ciphertext = new byte[packed.remaining()];
            packed.get(ciphertext);
            SecretKey key = existingKey();
            if (key == null) return "";
            Cipher cipher = Cipher.getInstance(CIPHER);
            cipher.init(Cipher.DECRYPT_MODE, key, new GCMParameterSpec(128, iv));
            return new String(cipher.doFinal(ciphertext), StandardCharsets.UTF_8);
        } catch (GeneralSecurityException | RuntimeException unreadable) {
            return "";
        }
    }

    /** Keys saved before the origin was recorded are bound to the current origin. */
    static void bindLegacyOrigin(Context context) {
        synchronized (ApiProfiles.LOCK) {
            String valueKey = valueKey(context);
            SharedPreferences prefs = prefs(context);
            if (prefs.contains(valueKey) && !prefs.contains(valueKey + ORIGIN)) {
                final String previousOrigin;
                try {
                    previousOrigin = origin(context);
                } catch (ConfigRead.Failure lostOrigin) {
                    throw new ConfigRead.Failure("config_origin_recovery");
                }
                prefs.edit().putString(valueKey + ORIGIN, previousOrigin).apply();
            }
        }
    }

    static boolean hasSavedValue(Context context) {
        synchronized (ApiProfiles.LOCK) {
            ConfigRead.string(prefs(context), valueKey(context), "");
            return prefs(context).contains(valueKey(context)) && originMatches(context);
        }
    }

    static void clear(Context context) {
        clear(context, ApiProfiles.active(context));
    }

    /** Forgets the key of one profile. The keystore key stays: the other profiles use it too. */
    static void clear(Context context, String profile) {
        synchronized (ApiProfiles.LOCK) {
            String valueKey = valueKey(profile);
            prefs(context).edit().remove(valueKey).remove(valueKey + ORIGIN).apply();
        }
    }

    static boolean hasStoredEntries(Context context, String profile) {
        String key = valueKey(profile);
        return prefs(context).contains(key) || prefs(context).contains(key + ORIGIN);
    }

    @Nullable private static SecretKey existingKey() throws GeneralSecurityException {
        try {
            KeyStore store = KeyStore.getInstance(KEY_STORE);
            store.load(null);
            return (SecretKey) store.getKey(ALIAS, null);
        } catch (java.io.IOException unavailable) {
            throw new java.security.KeyStoreException(unavailable);
        }
    }

    private static SecretKey keyOrNew() throws GeneralSecurityException {
        SecretKey existing = existingKey();
        if (existing != null) return existing;
        KeyGenerator generator =
                KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES, KEY_STORE);
        generator.init(
                new KeyGenParameterSpec.Builder(
                                ALIAS,
                                KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
                        .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
                        .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
                        .setRandomizedEncryptionRequired(true)
                        .build());
        return generator.generateKey();
    }
}
