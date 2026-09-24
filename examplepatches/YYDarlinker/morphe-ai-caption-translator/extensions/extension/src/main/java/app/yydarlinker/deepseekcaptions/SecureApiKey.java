package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.content.SharedPreferences;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import android.util.Base64;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.security.KeyStore;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;

/** Stores the API key encrypted with a non-exportable Android Keystore key. */
final class SecureApiKey {
    private static final String STORE = "deepseek_caption_secret";
    private static final String VALUE = "api_key_ciphertext";
    private static final String ALIAS = "yydarlinker.deepseek.caption.api.key.v1";
    private static final String ANDROID_KEY_STORE = "AndroidKeyStore";

    private SecureApiKey() {}

    static void save(Context context, String apiKey) throws Exception {
        synchronized(ApiProfiles.LOCK) {
        if (apiKey == null || apiKey.trim().isEmpty()) {
            throw new IllegalArgumentException("API Key 不能为空");
        }
        SecretKey key = getOrCreateKey();
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] ciphertext = cipher.doFinal(apiKey.trim().getBytes(StandardCharsets.UTF_8));
        byte[] iv = cipher.getIV();

        ByteBuffer packed = ByteBuffer.allocate(1 + iv.length + ciphertext.length);
        packed.put((byte) iv.length);
        packed.put(iv);
        packed.put(ciphertext);
        String encoded = Base64.encodeToString(packed.array(), Base64.NO_WRAP);
        prefs(context).edit().putString(valueKey(context), encoded).putString(valueKey(context)+"_origin",origin(context)).apply();
        }
    }

    static String load(Context context) {
        synchronized(ApiProfiles.LOCK) {
        if(!originMatches(context))return "";
        String encoded = prefs(context).getString(valueKey(context), "");
        if (encoded == null || encoded.isEmpty()) return "";
        try {
            byte[] packed = Base64.decode(encoded, Base64.DEFAULT);
            ByteBuffer buffer = ByteBuffer.wrap(packed);
            int ivLength = buffer.get() & 0xFF;
            if (ivLength < 12 || ivLength > 32 || buffer.remaining() <= ivLength) return "";
            byte[] iv = new byte[ivLength];
            buffer.get(iv);
            byte[] ciphertext = new byte[buffer.remaining()];
            buffer.get(ciphertext);

            KeyStore store = KeyStore.getInstance(ANDROID_KEY_STORE);
            store.load(null);
            SecretKey key = (SecretKey) store.getKey(ALIAS, null);
            if (key == null) return "";

            Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
            cipher.init(Cipher.DECRYPT_MODE, key, new GCMParameterSpec(128, iv));
            return new String(cipher.doFinal(ciphertext), StandardCharsets.UTF_8);
        } catch (Throwable ignored) {
            return "";
        }
    }

    }

    private static String valueKey(Context c){return valueKey(ApiProfiles.active(c));}
    private static String valueKey(String id){return ApiProfiles.LEGACY.equals(id)?VALUE:VALUE+"_"+id;}

    private static String origin(Context c){
        java.net.URI u=java.net.URI.create(ApiProfiles.values(c).getString("base_url",DeepSeekConfig.DEFAULT_BASE_URL));
        return u.getScheme().toLowerCase(java.util.Locale.ROOT)+"://"+u.getRawAuthority().toLowerCase(java.util.Locale.ROOT);
    }
    private static boolean originMatches(Context c){String saved=prefs(c).getString(valueKey(c)+"_origin","");return saved.isEmpty()||saved.equals(origin(c));}
    static void bindLegacyOrigin(Context c){synchronized(ApiProfiles.LOCK){
        if(prefs(c).contains(valueKey(c))&&!prefs(c).contains(valueKey(c)+"_origin"))prefs(c).edit().putString(valueKey(c)+"_origin",origin(c)).apply();
    }}
    static boolean hasSavedValue(Context context){synchronized(ApiProfiles.LOCK){return prefs(context).contains(valueKey(context))&&originMatches(context);}}
    static boolean hasKey(Context context) {
        return !load(context).isEmpty();
    }

    static void clear(Context context) {
        // All profile ciphertexts share the non-exportable key. Clearing ONE must not delete it.
        synchronized(ApiProfiles.LOCK){clear(context, ApiProfiles.active(context));}
    }

    static void clear(Context context, String id) {
        synchronized (ApiProfiles.LOCK) {
            prefs(context).edit().remove(valueKey(id)).remove(valueKey(id)+"_origin").apply();
        }
    }

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(STORE, Context.MODE_PRIVATE);
    }

    private static SecretKey getOrCreateKey() throws Exception {
        KeyStore store = KeyStore.getInstance(ANDROID_KEY_STORE);
        store.load(null);
        SecretKey existing = (SecretKey) store.getKey(ALIAS, null);
        if (existing != null) return existing;

        KeyGenerator generator = KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES, ANDROID_KEY_STORE);
        KeyGenParameterSpec spec = new KeyGenParameterSpec.Builder(
                ALIAS,
                KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT
        )
                .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
                .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
                .setRandomizedEncryptionRequired(true)
                .build();
        generator.init(spec);
        return generator.generateKey();
    }
}
