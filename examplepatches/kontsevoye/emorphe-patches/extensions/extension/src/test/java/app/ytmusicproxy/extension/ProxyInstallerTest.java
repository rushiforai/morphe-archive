package app.ytmusicproxy.extension;

import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.net.Proxy;
import java.net.ProxySelector;
import java.net.URI;
import java.util.List;

public class ProxyInstallerTest {
    public static void main(String[] args) throws Exception {
        testInvalidPortLeavesProxyStateUnchanged();
        testHttpProxySetsHttpAndHttpsProperties();
        testCredentialsInstallProxyAuthenticator();
        testSnapshotCapturesAppliedProxy();
        testResetClearsProxyAndRestoresPreviousSelector();
        testProxyConfigDefaultsToEnabledLocalHttpProxy();
        testProxyConfigRejectsDisabledOrInvalidValues();
        System.out.println("ProxyInstallerTest PASS");
    }

    private static void testInvalidPortLeavesProxyStateUnchanged() throws Exception {
        resetProxyState();
        ProxySelector originalSelector = ProxySelector.getDefault();

        ProxyInstaller.apply(settings("127.0.0.1", "70000", "", ""));

        assertSame(originalSelector, ProxySelector.getDefault(), "invalid port should not replace ProxySelector");
        assertNull(System.getProperty("https.proxyHost"), "invalid port should not set https proxy host");
    }

    private static void testHttpProxySetsHttpAndHttpsProperties() throws Exception {
        resetProxyState();

        ProxyInstaller.apply(settings("127.0.0.1", "8080", "", ""));

        assertEquals("127.0.0.1", System.getProperty("http.proxyHost"), "http host");
        assertEquals("8080", System.getProperty("http.proxyPort"), "http port");
        assertEquals("127.0.0.1", System.getProperty("https.proxyHost"), "https host");
        assertEquals("8080", System.getProperty("https.proxyPort"), "https port");

        List<Proxy> proxies = ProxySelector.getDefault().select(new URI("https://music.youtube.com/"));
        assertEquals(Proxy.Type.HTTP, proxies.get(0).type(), "proxy selector should return HTTP proxy");
    }

    private static void testCredentialsInstallProxyAuthenticator() {
        resetProxyState();

        ProxyInstaller.apply(settings("127.0.0.1", "8080", "alice", "secret"));

        PasswordAuthentication authentication = Authenticator.requestPasswordAuthentication(
                "127.0.0.1",
                null,
                8080,
                "http",
                "proxy auth",
                "Basic",
                null,
                Authenticator.RequestorType.PROXY
        );

        assertEquals("alice", authentication.getUserName(), "proxy username");
        assertEquals("secret", new String(authentication.getPassword()), "proxy password");
    }

    private static void testSnapshotCapturesAppliedProxy() {
        resetProxyState();

        ProxyInstaller.apply(settings("127.0.0.1", "8080", "alice", "secret"));

        ProxyInstaller.Snapshot snapshot = ProxyInstaller.getSnapshot();
        assertEquals("127.0.0.1", snapshot.getHost(), "snapshot host");
        assertEquals(8080, snapshot.getPort(), "snapshot port");
        assertEquals("alice", snapshot.getUsername(), "snapshot username");
        assertEquals("secret", snapshot.getPassword(), "snapshot password");
        assertEquals(true, snapshot.hasAuthentication(), "snapshot should capture auth");
    }

    private static void testResetClearsProxyAndRestoresPreviousSelector() throws Exception {
        resetProxyState();
        ProxySelector originalSelector = ProxySelector.getDefault();

        ProxyInstaller.apply(settings("127.0.0.1", "8080", "", ""));
        ProxyInstaller.reset();

        assertSame(originalSelector, ProxySelector.getDefault(), "reset should restore previous selector");
        assertNull(System.getProperty("http.proxyHost"), "reset should clear http proxy host");
        assertNull(System.getProperty("http.proxyPort"), "reset should clear http proxy port");
        assertNull(System.getProperty("https.proxyHost"), "reset should clear https proxy host");
        assertNull(System.getProperty("https.proxyPort"), "reset should clear https proxy port");
        assertNull(ProxyInstaller.getSnapshot(), "reset should clear installed snapshot");
    }

    private static void testProxyConfigDefaultsToEnabledLocalHttpProxy() {
        ProxyConfig config = ProxyConfig.defaults();

        assertEquals(true, config.isEnabled(), "default config should be enabled");
        assertEquals("127.0.0.1", config.getHost(), "default host");
        assertEquals("1081", config.getPort(), "default port");
        assertEquals(true, config.isInstallable(), "default config should be installable");
    }

    private static void testProxyConfigRejectsDisabledOrInvalidValues() {
        assertEquals(
                false,
                ProxyConfig.create(false, "127.0.0.1", "1081", "", "").isInstallable(),
                "disabled config should not be installable"
        );
        assertEquals(
                false,
                ProxyConfig.create(true, " ", "1081", "", "").isInstallable(),
                "blank host should not be installable"
        );
        assertEquals(
                false,
                ProxyConfig.create(true, "127.0.0.1", "70000", "", "").isInstallable(),
                "invalid port should not be installable"
        );
    }

    private static ProxySettings settings(
            String host,
            String port,
            String username,
            String password
    ) {
        return new ProxySettings() {
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
        };
    }

    private static void resetProxyState() {
        ProxyInstaller.reset();
        System.clearProperty("http.proxyHost");
        System.clearProperty("http.proxyPort");
        System.clearProperty("https.proxyHost");
        System.clearProperty("https.proxyPort");
        Authenticator.setDefault(null);
    }

    private static void assertSame(Object expected, Object actual, String message) {
        if (expected != actual) {
            throw new AssertionError(message);
        }
    }

    private static void assertEquals(Object expected, Object actual, String message) {
        if (!expected.equals(actual)) {
            throw new AssertionError(message + ": expected <" + expected + "> but was <" + actual + ">");
        }
    }

    private static void assertNull(Object actual, String message) {
        if (actual != null) {
            throw new AssertionError(message + ": expected null but was <" + actual + ">");
        }
    }
}
