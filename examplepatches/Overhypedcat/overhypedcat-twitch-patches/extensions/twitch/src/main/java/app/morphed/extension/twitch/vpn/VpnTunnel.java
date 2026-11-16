package app.morphed.extension.twitch.vpn;

import java.io.IOException;

import app.morphed.extension.twitch.net.Web;

/** A WireGuard tunnel with its IP stack and HTTP client: one server, up until closed. */
public final class VpnTunnel {
    public final WgConfig config;
    private final WireGuard wireGuard;
    private final IpStack stack;
    private final TunnelWeb web;

    private VpnTunnel(WgConfig config, WireGuard wireGuard, IpStack stack) {
        this.config = config;
        this.wireGuard = wireGuard;
        this.stack = stack;
        this.web = new TunnelWeb(stack);
    }

    /** Connects to the server; IOException saying why when it can't. */
    public static VpnTunnel open(WgConfig config, int timeoutMs) throws IOException {
        WireGuard wireGuard = new WireGuard(config);
        IpStack stack = new IpStack(config.address, config.dns, config.mtu, wireGuard::send);
        try {
            wireGuard.start(stack::receive, timeoutMs);
        } catch (IOException | RuntimeException e) {
            stack.close(); // its timer thread too
            wireGuard.close();
            throw e;
        }
        return new VpnTunnel(config, wireGuard, stack);
    }

    public Web web() {
        return web;
    }

    /** Drops kept connections that have been idle too long. */
    public void tidy() {
        web.reap();
    }

    /** Not closed: its keys may need renewing, which the next send asks for. */
    public boolean isOpen() {
        return wireGuard.isOpen();
    }

    public boolean isUp() {
        return wireGuard.isUp();
    }

    public void close() {
        web.closeAll();
        stack.close();
        wireGuard.close();
    }
}
