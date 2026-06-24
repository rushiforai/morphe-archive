package app.ytmusicproxy.extension;

public final class ProxyConfig implements ProxySettings {
    public static final boolean DEFAULT_ENABLED = true;
    public static final String DEFAULT_HOST = "127.0.0.1";
    public static final String DEFAULT_PORT = "1081";
    public static final String DEFAULT_USERNAME = "";
    public static final String DEFAULT_PASSWORD = "";

    private final boolean enabled;
    private final String host;
    private final String port;
    private final String username;
    private final String password;

    private ProxyConfig(boolean enabled, String host, String port, String username, String password) {
        this.enabled = enabled;
        this.host = nullToEmpty(host).trim();
        this.port = nullToEmpty(port).trim();
        this.username = nullToEmpty(username);
        this.password = nullToEmpty(password);
    }

    public static ProxyConfig defaults() {
        return create(DEFAULT_ENABLED, DEFAULT_HOST, DEFAULT_PORT, DEFAULT_USERNAME, DEFAULT_PASSWORD);
    }

    public static ProxyConfig create(
            boolean enabled,
            String host,
            String port,
            String username,
            String password
    ) {
        return new ProxyConfig(enabled, host, port, username, password);
    }

    public boolean isEnabled() {
        return enabled;
    }

    public boolean isInstallable() {
        return enabled && !host.isEmpty() && parsePort() != null;
    }

    Integer parsePort() {
        try {
            int parsedPort = Integer.parseInt(port);
            return parsedPort >= 1 && parsedPort <= 65535 ? parsedPort : null;
        } catch (NumberFormatException ex) {
            return null;
        }
    }

    @Override
    public String getHost() {
        return host;
    }

    @Override
    public String getPort() {
        return port;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public String getPassword() {
        return password;
    }

    private static String nullToEmpty(String value) {
        return value == null ? "" : value;
    }
}
