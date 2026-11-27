package dev.jason.gboardpatches.extension.webclipboard;

import org.junit.Assert;
import org.junit.Test;

public final class ClipboardSyncLoopbackAuthTest {
    private static final String TOKEN =
            "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef";
    private static final String OTHER_TOKEN =
            "abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789";

    @Test
    public void tokenMatchingRequiresFullUsablePerInstallSecret() {
        Assert.assertTrue(ClipboardSyncLoopbackAuth.tokenMatches(TOKEN, TOKEN));
        Assert.assertFalse(ClipboardSyncLoopbackAuth.tokenMatches(TOKEN, OTHER_TOKEN));
        Assert.assertFalse(ClipboardSyncLoopbackAuth.tokenMatches(TOKEN, "short-token"));
        Assert.assertFalse(ClipboardSyncLoopbackAuth.tokenMatches(TOKEN, TOKEN + "\n"));
    }

    @Test
    public void proofRequiresUsableTokenAndChallenge() {
        String challenge = "00112233445566778899aabbccddeeff";
        String proof = ClipboardSyncLoopbackAuth.proof(TOKEN, challenge);

        Assert.assertFalse(proof.isEmpty());
        Assert.assertTrue(ClipboardSyncLoopbackAuth.proofMatches(TOKEN, challenge, proof));
        Assert.assertFalse(ClipboardSyncLoopbackAuth.proofMatches(
                OTHER_TOKEN, challenge, proof));
        Assert.assertEquals("", ClipboardSyncLoopbackAuth.proof("short-token", challenge));
        Assert.assertEquals("", ClipboardSyncLoopbackAuth.proof(TOKEN, "bad challenge"));
    }
}
