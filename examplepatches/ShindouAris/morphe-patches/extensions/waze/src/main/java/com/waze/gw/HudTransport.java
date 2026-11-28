package com.waze.gw;

import java.io.IOException;

/**
 * Transport-neutral byte stream used by the HLP session. Implementations must serialize their
 * own connection lifecycle and must never invoke blocking connect work on the Android main thread.
 */
interface HudTransport {
    void connect() throws Exception;
    void disconnect();
    boolean isConnected();
    void sendFrame(byte[] frame) throws IOException;
    void setListener(HudTransportListener listener);
    String transportName();
}

interface HudTransportListener {
    void onTransportBytes(byte[] bytes, int count);
    void onTransportConnected();
    void onTransportDisconnected(String reason);
    void onTransportError(String category, Throwable error);
}
