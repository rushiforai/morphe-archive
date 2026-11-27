package app.johninnl.modelhost.api;

public interface ConnectionListener {
    void onConnected(HostStatus status, HostCapabilities capabilities);
    void onDisconnected(HostException error);
}
