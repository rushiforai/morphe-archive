package app.morphe.extension.swiftkey;

import android.content.Context;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.GeneralSecurityException;
import java.security.Key;
import java.security.KeyStore;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.List;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Connection details for the SyncClipboard server on the Mac.
 * The phone stores them encrypted with an Android Keystore key, in a folder Android never backs up.
 */
final class MacClipboardPairing {
    static final String CODE_PREFIX = "skclip1:";
    private static final String PIN_PREFIX = "sha256/";
    private static final String FILE_NAME = "mac_clipboard_sync.bin";
    private static final String KEY_ALIAS = "mac_clipboard_sync";
    private static final int IV_LENGTH = 12;

    final List<String> hosts;
    final int port;
    final String user;
    final String password;
    /** SHA-256 of the Mac certificate's public key. */
    final byte[] pin;

    private MacClipboardPairing(List<String> hosts, int port, String user, String password, byte[] pin) {
        this.hosts = hosts;
        this.port = port;
        this.user = user;
        this.password = password;
        this.pin = pin;
    }

    /** Reads the code shown on the Mac: the prefix followed by base64url JSON. */
    static MacClipboardPairing parse(String code) {
        String trimmed = code == null ? "" : code.trim();
        if (!trimmed.startsWith(CODE_PREFIX)) {
            throw new IllegalArgumentException("The clipboard does not hold a Mac pairing code.");
        }
        try {
            byte[] json = Base64.getUrlDecoder().decode(trimmed.substring(CODE_PREFIX.length()));
            return fromJson(new JSONObject(new String(json, StandardCharsets.UTF_8)));
        } catch (IllegalArgumentException | JSONException error) {
            throw new IllegalArgumentException("The pairing code is incomplete. Copy it again from the Mac.", error);
        }
    }

    private static MacClipboardPairing fromJson(JSONObject json) throws JSONException {
        JSONArray hostList = json.getJSONArray("hosts");
        List<String> hosts = new ArrayList<>();
        for (int i = 0; i < hostList.length(); i++) hosts.add(hostList.getString(i));
        int port = json.getInt("port");
        String user = json.getString("user");
        String password = json.getString("password");
        String pinText = json.getString("pin");
        if (!pinText.startsWith(PIN_PREFIX)) throw new JSONException("Unsupported key pin");
        byte[] pin = Base64.getDecoder().decode(pinText.substring(PIN_PREFIX.length()));
        if (hosts.isEmpty() || port < 1 || port > 65535 || user.isEmpty() || password.isEmpty() || pin.length != 32) {
            throw new JSONException("Incomplete pairing");
        }
        return new MacClipboardPairing(Collections.unmodifiableList(hosts), port, user, password, pin);
    }

    private JSONObject toJson() throws JSONException {
        return new JSONObject()
            .put("hosts", new JSONArray(hosts))
            .put("port", port)
            .put("user", user)
            .put("password", password)
            .put("pin", PIN_PREFIX + Base64.getEncoder().encodeToString(pin));
    }

    /** Returns null when the phone is not paired. The file is only readable after the first unlock. */
    static MacClipboardPairing load(Context context) throws IOException, GeneralSecurityException {
        File file = file(context);
        if (!file.exists()) return null;
        byte[] stored = Files.readAllBytes(file.toPath());
        if (stored.length <= IV_LENGTH) throw new IOException("The saved pairing is damaged");
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.DECRYPT_MODE, key(), new GCMParameterSpec(128, stored, 0, IV_LENGTH));
        byte[] json = cipher.doFinal(stored, IV_LENGTH, stored.length - IV_LENGTH);
        try {
            return fromJson(new JSONObject(new String(json, StandardCharsets.UTF_8)));
        } catch (JSONException error) {
            throw new IOException("The saved pairing is damaged", error);
        }
    }

    void save(Context context) throws IOException, GeneralSecurityException {
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.ENCRYPT_MODE, key());
        byte[] iv = cipher.getIV();
        if (iv.length != IV_LENGTH) throw new GeneralSecurityException("Unexpected IV length");
        byte[] sealed;
        try {
            sealed = cipher.doFinal(toJson().toString().getBytes(StandardCharsets.UTF_8));
        } catch (JSONException error) {
            throw new IOException(error);
        }
        File target = file(context);
        File temporary = new File(target.getPath() + ".tmp");
        try (FileOutputStream out = new FileOutputStream(temporary)) {
            out.write(iv);
            out.write(sealed);
            out.getFD().sync();
        }
        if (!temporary.renameTo(target)) throw new IOException("Could not save the pairing");
    }

    static void clear(Context context) {
        file(context).delete();
    }

    private static File file(Context context) {
        return new File(context.getNoBackupFilesDir(), FILE_NAME);
    }

    private static SecretKey key() throws GeneralSecurityException, IOException {
        KeyStore store = KeyStore.getInstance("AndroidKeyStore");
        store.load(null);
        Key existing = store.getKey(KEY_ALIAS, null);
        if (existing instanceof SecretKey) return (SecretKey) existing;
        KeyGenerator generator = KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES, "AndroidKeyStore");
        generator.init(new KeyGenParameterSpec.Builder(KEY_ALIAS,
                KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
            .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
            .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
            .build());
        return generator.generateKey();
    }
}
