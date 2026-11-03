/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.pinedrama.follow;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;


import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.List;

/**
 * A follow PineDrama turns down comes back looking like a success, so the only thing that tells
 * the user is this notice. It has to fire on a real refusal and stay quiet otherwise.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class FollowDiagnosticsTest {
    private boolean debug;

    public static final class ParsedResponse {
        public final Object LIZIZ;
        ParsedResponse(Object body) { this.LIZIZ = body; }
        public String LIZJ() { return "true"; }
        public int LIZ() { return 0; }
    }

    @Before
    public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        debug = BaseSettings.DEBUG.get();
        BaseSettings.DEBUG.save(false);
        FollowDiagnostics.resetForTests();
    }

    @org.junit.After
    public void tearDown() {
        BaseSettings.DEBUG.save(debug);
        FollowDiagnostics.resetForTests();
    }

    private static FollowDiagnostics.FollowRequestContext context() {
        return new FollowDiagnostics.FollowRequestContext(1, "/aweme/v1/commit/follow/user/");
    }

    @Test
    public void aMissingRequestPathNamesTheFollowHookInsteadOfStayingUnknown() throws Exception {
        HookStatus.clear();
        try {
            java.lang.reflect.Method requestPath = FollowDiagnostics.class.getDeclaredMethod(
                    "requestPath", Object.class);
            requestPath.setAccessible(true);
            assertEquals(null, requestPath.invoke(null, new Object()));

            List<String> missing = HookStatus.missing("follow diagnostics");
            assertEquals("Expected one missing request path, got " + missing, 1, missing.size());
            assertTrue(missing.get(0), missing.get(0).contains("java.lang.Object#getPath"));
        } finally {
            HookStatus.clear();
        }
    }

    public static final class ChatBody {
        public int status_code = 4003;
        public String status_msg = "Slow down";
        public String comment_text = "a private sentence";
        public long user_id = 7123456789012345678L;
    }

    private static List<String> liveCommentLines() {
        List<String> lines = new ArrayList<>();
        for (org.robolectric.shadows.ShadowLog.LogItem log : org.robolectric.shadows.ShadowLog.getLogs()) {
            if (log.msg.startsWith("[Morphe PineDrama FollowProbe] live comment response ")) lines.add(log.msg);
        }
        return lines;
    }

    public static final class EnterBody {
        public int status_code = 0;
        public String status_msg = "ok";
    }

    private static List<String> linesStarting(String prefix) {
        List<String> lines = new ArrayList<>();
        for (org.robolectric.shadows.ShadowLog.LogItem log : org.robolectric.shadows.ShadowLog.getLogs()) {
            if (log.msg.startsWith(prefix)) lines.add(log.msg);
        }
        return lines;
    }

    private static final String REFUSED_LIKE = "{\"status_code\":2098,\"status_msg\":\"Try again later.\"}";

    private static List<String> likeLines() {
        return linesStarting("[Morphe PineDrama FollowProbe] like response ");
    }

    private static final String API_HOST = "https://api16-normal-c-useast2a.tiktokv.com";

    /** Shaped like PineDrama's com.bytedance.retrofit2.client.Request: getPath() is URI.getPath(). */
    public static final class UrlRequest {
        private final String url;
        UrlRequest(String url) { this.url = url; }
        public String getPath() { return java.net.URI.create(url).getPath(); }
        public String getUrl() { return url; }
    }

    public static final class CaptchaGateRequest {
        private final String path;
        CaptchaGateRequest(String path) { this.path = path; }
        public String getPath() { return path; }
    }
}
