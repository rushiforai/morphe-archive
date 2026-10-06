package app.yydarlinker.deepseekcaptions;

/**
 * A credential reference that can be compared instead of a plaintext key.
 *
 * <p>The playback, animation and preview paths must never load the full configuration or decrypt the
 * API key just to record a log line. They pass this opaque fingerprint instead; the diagnostics writer
 * resolves the plaintext once, off the playback path, and only for a record whose fingerprint matches
 * the credential it is currently allowed to see. A record produced under an older credential is
 * therefore never redacted with the wrong key.</p>
 */
final class CaptionCredentialRef {
    static final CaptionCredentialRef NONE = new CaptionCredentialRef("", "");

    /** Hash of the plaintext credential; empty means "no credential available". */
    final String fingerprint;
    /** Stable one-way seed for the fallback redactor; derived the same way from the same key. */
    final String seed;

    private CaptionCredentialRef(String fingerprint, String seed) {
        this.fingerprint = fingerprint;
        this.seed = seed;
    }

    static CaptionCredentialRef of(String plaintext) {
        String value = plaintext == null ? "" : plaintext;
        if (value.isEmpty()) return NONE;
        return new CaptionCredentialRef(RebuildCache.hash("n36-credential:" + value), seedOf(value));
    }

    boolean known() { return !fingerprint.isEmpty(); }

    private static String seedOf(String value) {
        // A one-way digest of the same secret: it carries no other profile field and is not reversible.
        return RebuildCache.hash("n36-redaction-seed:" + value);
    }

    @Override public String toString() { return known() ? fingerprint.substring(0, 12) : "none"; }
}
