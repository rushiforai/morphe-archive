import app.template.extension.extension.ReplayCredentials;
import javax.crypto.spec.SecretKeySpec;

public class ReplayCredentialsTest {
    public static void main(String[] args) throws Exception {
        SecretKeySpec key = new SecretKeySpec(new byte[32], "HmacSHA256");
        byte[] otherBytes = new byte[32]; otherBytes[0] = 1;
        SecretKeySpec other = new SecretKeySpec(otherBytes, "HmacSHA256");
        String a = ReplayCredentials.contextId(key, 1, "example");
        if (!a.equals(ReplayCredentials.contextId(key, 1, "example"))) throw new AssertionError("same key and inputs must match");
        if (a.equals(ReplayCredentials.contextId(other, 1, "example"))) throw new AssertionError("new installation key must not match");
        if (a.equals(ReplayCredentials.contextId(key, 2, "example"))) throw new AssertionError("protocol version must participate");
        if (a.equals(ReplayCredentials.contextId(key, 1, "different"))) throw new AssertionError("credentials must participate");
        if (a.contains("example")) throw new AssertionError("context ID must not reveal community");
    }
}
