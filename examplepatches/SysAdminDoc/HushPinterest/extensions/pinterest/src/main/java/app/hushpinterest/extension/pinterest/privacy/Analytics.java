/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.privacy;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.security.cert.Certificate;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.net.ssl.HttpsURLConnection;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/** Runtime controls affect telemetry only. The Firebase manifest flag is a separate build fact. */
public final class Analytics {
    private Analytics() {}

    private static final Set<String> TASKS = new HashSet<>(Arrays.asList(
            "TAG_APPSFLYER_INIT", "TAG_FIREBASE_ANALYTICS_INIT", "TAG_RUM_REPORTING",
            "TAG_LOG_LOCATION_PERMISSIONS", "TAG_LOG_DEVICE_PROFILE", "TAG_LOG_ENTRY_POINT",
            "TAG_SCHEDULE_SUBMIT_NETWORK_METRICS", "TAG_LANDING_SIGNALS_UPLOAD", "TAG_ADS_APP_INSTALL_LOG",
            "TAG_ADS_OPEN_MEASUREMENT_SDK_INIT"));

    private static boolean active() {
        try {
            return Utils.settingsReady() && PatchFamily.DISABLE_ANALYTICS.inBuild() && Settings.DISABLE_ANALYTICS.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "switch read", failure);
            return false;
        }
    }

    /** Used by wrappers that return completed vendor responses instead of sending usage uploads. */
    public static boolean blockUpload() {
        HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);
        if (!active()) return false;
        HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "telemetry upload suppressed");
        return true;
    }

    /** Auth, account, feed, Firebase messaging and WorkManager tasks remain eligible. */
    public static boolean blockTask(Object tag) {
        HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);
        if (!(tag instanceof Enum<?>) || !active()) return false;
        if (!TASKS.contains(((Enum<?>) tag).name())) return false;
        HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "analytics startup task skipped");
        return true;
    }

    /** Injected only into AppsFlyer's transport, including a tracker already started before a toggle. */
    public static URLConnection openConnection(URL url) throws IOException {
        if (!blockUpload()) return url.openConnection();
        return new QuietConnection(url);
    }

    /** A completed local response lets SDK callbacks finish without scheduling network retries. */
    private static final class QuietConnection extends HttpsURLConnection {
        private final OutputStream sink = new OutputStream() {
            @Override public void write(int value) {}
            @Override public void write(byte[] buffer, int offset, int length) {}
        };

        QuietConnection(URL url) { super(url); }
        @Override public void connect() { connected = true; }
        @Override public void disconnect() { connected = false; }
        @Override public boolean usingProxy() { return false; }
        @Override public String getCipherSuite() { return ""; }
        @Override public Certificate[] getLocalCertificates() { return null; }
        @Override public Certificate[] getServerCertificates() { return new Certificate[0]; }
        @Override public int getResponseCode() { return HTTP_OK; }
        @Override public String getResponseMessage() { return "OK"; }
        @Override public String getContentType() { return "application/json"; }
        @Override public int getContentLength() { return 2; }
        @Override public InputStream getInputStream() { return new ByteArrayInputStream(new byte[]{'{', '}'}); }
        @Override public OutputStream getOutputStream() { return sink; }
        @Override public Map<String, List<String>> getHeaderFields() { return Collections.emptyMap(); }
    }
}
