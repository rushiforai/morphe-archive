package local.privacy;

import java.security.NoSuchAlgorithmException;

/** JNI-facing delegate. All ordinary digests retain their original values. */
public final class MessageDigest {
    private final java.security.MessageDigest delegate;

    private MessageDigest(java.security.MessageDigest delegate) {
        this.delegate = delegate;
    }

    public static MessageDigest getInstance(String algorithm) throws NoSuchAlgorithmException {
        return new MessageDigest(java.security.MessageDigest.getInstance(algorithm));
    }

    public void update(byte[] input) { delegate.update(input); }
    public byte[] digest() { return SignerCompat.identity(delegate.digest()); }
    public byte[] digest(byte[] input) { return SignerCompat.identity(delegate.digest(input)); }
}
