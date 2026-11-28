package com.waze.gw;

/**
 * Protocol-neutral session lifecycle used by HLP, H50 and H1 adapters.
 *
 * <p>The transport remains an independent byte stream.  A session owns handshake, inbound parsing,
 * cadence and protocol-specific state encoding.</p>
 */
interface HudProtocolSession {
    void prepare();
    void startHandshake();
    void accept(byte[] bytes, int count);
    void tick(long elapsedMs, HudCanonicalState state);
    boolean isReady();
    String protocolName();
    void stop();
}
