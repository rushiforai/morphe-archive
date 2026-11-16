/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-13.
 */
package app.morphe.extension.shared.spoof;

import static org.junit.Assert.*;

import android.content.pm.PackageInfo;
import java.lang.reflect.Method;
import org.junit.Test;

public class WebViewCheckTest {
    private static Integer major(String version) throws Exception {
        Method method = WebViewCheck.class.getDeclaredMethod("getMajorVersion", String.class);
        method.setAccessible(true);
        return (Integer) method.invoke(null, version);
    }

    private static WebViewCheck.WebViewStatus status(String version) throws Exception {
        PackageInfo info = version == null ? null : new PackageInfo();
        if (info != null) info.versionName = version;
        Method method = WebViewCheck.class.getDeclaredMethod("getStatus", PackageInfo.class);
        method.setAccessible(true);
        return (WebViewCheck.WebViewStatus) method.invoke(null, info);
    }

    @Test public void parsesMajorVersionWithoutDependingOnAppVersion() throws Exception {
        assertEquals(Integer.valueOf(130), major("130.0.6723.0"));
        assertEquals(Integer.valueOf(145), major("145"));
        assertNull(major(null));
        assertNull(major(""));
        assertNull(major("unknown.1"));
        assertNull(major("99999999999999999.0"));
    }

    @Test public void warnsOnlyForMissingOrKnownOutdatedProviders() throws Exception {
        assertEquals(WebViewCheck.WebViewStatus.MISSING, status(null));
        assertEquals(WebViewCheck.WebViewStatus.OUTDATED, status("129.0.1"));
        assertEquals(WebViewCheck.WebViewStatus.OK, status("130.0.1"));
        assertEquals(WebViewCheck.WebViewStatus.OK, status("145.0.1"));
        assertEquals(WebViewCheck.WebViewStatus.OK, status("vendor-version"));
    }
}
