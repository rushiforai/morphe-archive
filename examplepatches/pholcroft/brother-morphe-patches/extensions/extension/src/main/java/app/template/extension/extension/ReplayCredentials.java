package app.template.extension.extension;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import javax.crypto.Mac;
import javax.crypto.SecretKey;

/** Generates opaque context IDs without persisting or exporting community values. */
public final class ReplayCredentials {
    private static final byte[] DOMAIN = "brother-preview-snmp-context-v1".getBytes(StandardCharsets.UTF_8);
    public static String contextId(SecretKey key, int version, String community) throws java.security.GeneralSecurityException {
        if (key == null || community == null) throw new IllegalArgumentException();
        byte[] secret = community.getBytes(StandardCharsets.UTF_8);
        Mac mac = Mac.getInstance("HmacSHA256"); mac.init(key);
        mac.update(ByteBuffer.allocate(4).putInt(DOMAIN.length).array()); mac.update(DOMAIN);
        mac.update(ByteBuffer.allocate(4).putInt(version).array());
        mac.update(ByteBuffer.allocate(4).putInt(secret.length).array()); mac.update(secret);
        byte[] digest=mac.doFinal(); java.util.Arrays.fill(secret,(byte)0);
        char[] alphabet="0123456789abcdef".toCharArray(); char[] out=new char[digest.length*2];
        for(int i=0;i<digest.length;i++){int v=digest[i]&255;out[i*2]=alphabet[v>>>4];out[i*2+1]=alphabet[v&15];}
        return new String(out);
    }
    private ReplayCredentials() {}
}
