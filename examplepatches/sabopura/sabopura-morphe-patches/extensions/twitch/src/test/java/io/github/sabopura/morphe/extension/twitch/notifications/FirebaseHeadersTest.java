package io.github.sabopura.morphe.extension.twitch.notifications;

import java.net.*;
import org.junit.Test;
import static org.junit.Assert.*;

public class FirebaseHeadersTest {
    @Test public void acceptsOnlyOfficialInstallationAndRefreshEndpoints() throws Exception {
        for (String suffix : new String[]{"", "/id/authTokens:generate"}) {
            String value = FirebaseHeaders.header(new URL("https://firebaseinstallations.googleapis.com/v1/projects/example/installations" + suffix), "X-Android-Cert", "local");
            assertEquals("8C68C13822723A2B1FA844BED340031BEB1F9463", value);
        }
    }
    @Test public void reportsTheStockPackageOnlyToInstallations() throws Exception {
        URL installations = new URL("https://firebaseinstallations.googleapis.com/v1/projects/p/installations");
        assertEquals("tv.twitch.android.app", FirebaseHeaders.header(installations, "X-Android-Package", "com.other.app"));
        assertEquals("com.other.app", FirebaseHeaders.header(new URL("https://passport.twitch.tv/login"), "X-Android-Package", "com.other.app"));
    }
    @Test public void preservesOtherHostsPathsSchemesAndHeaders() throws Exception {
        for (String url : new String[]{
                "http://firebaseinstallations.googleapis.com/v1/projects/p/installations",
                "https://firebaseinstallations.googleapis.com.evil.example/v1/projects/p/installations",
                "https://firebaseinstallations.googleapis.com:8443/v1/projects/p/installations",
                "https://user:password@firebaseinstallations.googleapis.com/v1/projects/p/installations",
                "https://firebaseinstallations.googleapis.com/not-installations",
                "https://passport.twitch.tv/login"})
            assertEquals(url, "local", FirebaseHeaders.header(new URL(url), "X-Android-Cert", "local"));
        assertEquals("local", FirebaseHeaders.header(new URL("https://firebaseinstallations.googleapis.com/v1/projects/p/installations"), "Authorization", "local"));
    }
    @Test public void preservesAddVersusSetSemantics() throws Exception {
        URLConnection connection = new URLConnection(new URL("https://firebaseinstallations.googleapis.com/v1/projects/p/installations")) {
            public void connect() {}
        };
        FirebaseHeaders.add(connection, "X-Android-Cert", "local");
        FirebaseHeaders.add(connection, "X-Android-Cert", "local");
        assertEquals(2, connection.getRequestProperties().get("X-Android-Cert").size());
        FirebaseHeaders.set(connection, "X-Android-Cert", "local");
        URLConnection control = new URLConnection(connection.getURL()) { public void connect() {} };
        String expected = "8C68C13822723A2B1FA844BED340031BEB1F9463";
        control.addRequestProperty("X-Android-Cert", expected);
        control.addRequestProperty("X-Android-Cert", expected);
        control.setRequestProperty("X-Android-Cert", expected);
        assertEquals(control.getRequestProperties(), connection.getRequestProperties());
        FirebaseHeaders.add(connection, "Authorization", "synthetic");
        assertEquals("synthetic", connection.getRequestProperty("Authorization"));
    }
}
