package patches.bright;

/** Clock and key abstractions so signing stays testable and never logs its key. */
interface EpochClock {

    long nowSeconds();
}

interface SigningKeySource {

    /** Returns the configured key bytes, or null when no key was provisioned. */
    byte[] load();
}

interface ArticleHeaderSigner {

    /**
     * The private article header value for the current instant, or null when no
     * key is provisioned. The returned value never appears in URLs, cookies,
     * webpage requests, logs or JavaScript.
     */
    String sign();
}

interface CancelToken {

    boolean isCancelled();

    void throwIfCancelled() throws InterruptedException;
}
