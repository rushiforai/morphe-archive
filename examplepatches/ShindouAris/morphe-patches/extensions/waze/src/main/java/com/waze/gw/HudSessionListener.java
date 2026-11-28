package com.waze.gw;

/** Common lifecycle callbacks emitted by a protocol session. */
interface HudSessionListener {
    void onSessionConnected(String transport, int rate);
    void onSessionDisconnected(String reason);
    void onSessionError(String category, String detail);
    void onSessionWantsDisconnect();
    void onSessionPeerActivity(String type, long atElapsedMs);
}
