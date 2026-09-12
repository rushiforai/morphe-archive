package app.asken.extension;

import java.nio.charset.StandardCharsets;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

// Pure-Java reimplementation of com.yl.pack.YLPacker's native packJNI/unpackJNI (Qingniu/Yolanda scale SDK): HEX(AES-128-ECB/PKCS7(json, "yolandakitnewhdr")). Lets asken drop libylpacker.so, whose DT_NEEDED libpairipcore.so would otherwise pull PairIP (and its Play-license paywall) back into the process.
public final class YlpackerShim {
    private static final byte[] KEY = "yolandakitnewhdr".getBytes(StandardCharsets.UTF_8);
    private static final char[] HEX = "0123456789ABCDEF".toCharArray();

    private YlpackerShim() {}

    public static String pack(String json) {
        if (json == null) return null;
        try {
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(KEY, "AES"));
            byte[] enc = cipher.doFinal(json.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder(enc.length * 2);
            for (byte b : enc) { sb.append(HEX[(b >> 4) & 15]); sb.append(HEX[b & 15]); }
            return sb.toString();
        } catch (Exception e) { return null; }
    }

    public static String unpack(String hex) {
        if (hex == null) return null;
        try {
            int n = hex.length() / 2;
            byte[] in = new byte[n];
            for (int i = 0; i < n; i++) in[i] = (byte) Integer.parseInt(hex.substring(i * 2, i * 2 + 2), 16);
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(KEY, "AES"));
            return new String(cipher.doFinal(in), StandardCharsets.UTF_8);
        } catch (Exception e) { return null; }
    }
}
