package app.template.extension.extension;

import javax.crypto.SecretKey;

public final class ReplayKeyTest {
    public static void run() throws Exception {
        SecretKey first=ReplayKey.getOrCreate();
        String id=ReplayCredentials.contextId(first,1,"test-community");
        SecretKey second=ReplayKey.getOrCreate();
        if(!id.equals(ReplayCredentials.contextId(second,1,"test-community")))
            throw new AssertionError("Keystore key must remain stable across retrievals");
        if(first.getEncoded()!=null)throw new AssertionError("Key material must not be exportable");
    }
}
