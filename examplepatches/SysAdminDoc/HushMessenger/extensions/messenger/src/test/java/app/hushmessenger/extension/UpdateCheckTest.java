package app.hushmessenger.extension;

import android.os.Looper;
import android.view.View;
import android.widget.TextView;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 35, 36})
public class UpdateCheckTest {
    private static final String DEFAULT_URL = SettingsActivity.releasesUrl;
    private static final String RELEASE_PAGE = "https://github.com/SysAdminDoc/HushMessenger/releases/tag/v99.0.0";

    private interface Reply { void send(OutputStream out) throws IOException; }

    private ServerSocket server;
    private final CountDownLatch hold = new CountDownLatch(1);
    private final AtomicInteger requests = new AtomicInteger();
    private volatile Reply reply;
    private SettingsActivity lastOpened;
    private final java.util.List<org.robolectric.android.controller.ActivityController<SettingsActivity>> screens = new java.util.ArrayList<>();
    private final java.util.List<String> requestHeaders = new java.util.concurrent.CopyOnWriteArrayList<>();
    private final java.util.concurrent.atomic.AtomicLong now = new java.util.concurrent.atomic.AtomicLong(1_790_000_000_000L);

    @Before public void start() throws IOException {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        server = new ServerSocket(0, 50, InetAddress.getByName("127.0.0.1"));
        Thread acceptor = new Thread(() -> {
            while (true) {
                Socket client;
                try { client = server.accept(); } catch (IOException closed) { return; }
                requests.incrementAndGet();
                new Thread(() -> serve(client)).start();
            }
        });
        acceptor.setDaemon(true);
        acceptor.start();
        SettingsActivity.releasesUrl = "http://127.0.0.1:" + server.getLocalPort() + "/releases/latest";
        SettingsActivity.updateTimeoutMillis = 500;
        SettingsActivity.updateClock = now::get;
    }

    @After public void stop() throws IOException {
        closeScreens();
        hold.countDown();
        server.close();
        SettingsActivity.releasesUrl = DEFAULT_URL;
        SettingsActivity.updateTimeoutMillis = 5000;
        SettingsActivity.updateClock = System::currentTimeMillis;
    }

    @Test public void versionsCompareAsNumbers() {
        assertTrue(SettingsActivity.compareVersions("0.10.0", "0.9.0") > 0);
        assertTrue(SettingsActivity.compareVersions("0.9.0", "0.10.0") < 0);
        assertTrue(SettingsActivity.compareVersions("1.0.0", "0.99.0") > 0);
        assertEquals(0, SettingsActivity.compareVersions("v0.6.0", "0.6.0"));
        assertEquals(0, SettingsActivity.compareVersions("0.6", "0.6.0"));
        assertTrue(SettingsActivity.compareVersions("0.7.0-dev.1", "0.6.0") > 0);
        assertTrue(SettingsActivity.compareVersions("0.7.0-dev.1", "0.7.0") < 0);
        assertTrue(SettingsActivity.compareVersions("0.7.0", "0.7.0-dev.1") > 0);
        assertTrue(SettingsActivity.compareVersions("1.0.0-beta.11", "1.0.0-beta.2") > 0);
        assertTrue(SettingsActivity.compareVersions("1.0.0-2", "1.0.0-alpha") < 0);
        assertTrue(SettingsActivity.compareVersions("1.0.0-alpha", "1.0.0-alpha.1") < 0);
        assertEquals(0, SettingsActivity.compareVersions("1.0.0+build.2", "1.0.0+build.1"));
        assertTrue(SettingsActivity.compareVersions("2147483648.0.0", "2147483647.0.0") > 0);
    }

    @Test public void onlyThisProjectsReleasePagesAreOffered() {
        assertEquals(RELEASE_PAGE, SettingsActivity.releasePage(RELEASE_PAGE));
        assertEquals("", SettingsActivity.releasePage("https://github.com/someone/else/releases/tag/v99.0.0"));
        assertEquals("", SettingsActivity.releasePage("https://github.com/SysAdminDoc/HushMessenger.evil/releases/x"));
        assertEquals("", SettingsActivity.releasePage("http://github.com/SysAdminDoc/HushMessenger/releases/tag/v1"));
        assertEquals("", SettingsActivity.releasePage("https://github.com/SysAdminDoc/HushMessenger/releases/../../../evil/x"));
        assertEquals("", SettingsActivity.releasePage("https://github.com/SysAdminDoc/HushMessenger/releases/tag/%2e%2e/x"));
        assertEquals("", SettingsActivity.releasePage("https://github.com/SysAdminDoc/HushMessenger/releases/tag/.."));
        assertEquals("", SettingsActivity.releasePage("https://github.com/SysAdminDoc/HushMessenger/releases/tag/v1?x=https://evil"));
        assertEquals("", SettingsActivity.releasePage("https://github.com.evil/SysAdminDoc/HushMessenger/releases/tag/v1"));
        assertEquals("", SettingsActivity.releasePage(""));
    }

    @Test public void aNewerReleaseOffersItsPage() throws Exception {
        reply = json(200, release("v99.0.0", RELEASE_PAGE));
        View root = openWithCheckOn();
        assertEquals("Version 99.0.0 is available", awaitStatus(root).getText().toString());
        assertNotNull(root.findViewWithTag("update_release"));
    }

    @Test public void theSameReleaseSaysUpToDate() throws Exception {
        reply = json(200, release("v" + BuildConfig.VERSION_NAME, page("v" + BuildConfig.VERSION_NAME)));
        View root = openWithCheckOn();
        assertEquals("You have the latest version.", awaitStatus(root).getText().toString());
        assertNull(root.findViewWithTag("update_release"));
    }

    @Test public void aReleaseLinkOutsideThisProjectIsRejected() throws Exception {
        reply = json(200, release("v99.0.0", "https://example.com/releases/tag/v99.0.0"));
        View root = openWithCheckOn();
        assertEquals("Couldn't check for updates. Check your connection and try again.", awaitStatus(root).getText().toString());
        assertNull(root.findViewWithTag("update_release"));
    }

    @Test public void rateLimitingShowsWhenAnExplicitRetryIsAvailable() throws Exception {
        reply = json(403, "{\"message\":\"API rate limit exceeded\"}");
        assertRetryStatus(awaitStatus(openWithCheckOn()));
        assertEquals(now.get() + 60_000, Settings.preferences.getLong(ReleaseCheck.RETRY_KEY, 0));
    }

    @Test public void aBodyWithoutATagShowsTheError() throws Exception {
        reply = json(200, "{\"name\":\"latest\"}");
        assertEquals("Couldn't check for updates. Check your connection and try again.", awaitStatus(openWithCheckOn()).getText().toString());
    }

    @Test public void aServerThatNeverAnswersTimesOut() throws Exception {
        // Hold the connection open past awaitStatus's window, so only the read timeout can end the wait.
        reply = out -> {
            try { hold.await(20, TimeUnit.SECONDS); } catch (InterruptedException ignored) { Thread.currentThread().interrupt(); }
        };
        long started = System.nanoTime();
        assertEquals("Couldn't check for updates. Check your connection and try again.", awaitStatus(openWithCheckOn()).getText().toString());
        long waited = TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - started);
        assertTrue("Gave up after " + waited + " ms with a 500 ms timeout", waited < 3000);
    }

    @Test public void nothingIsFetchedWhileTheSwitchIsOff() throws Exception {
        reply = json(200, release("v99.0.0", RELEASE_PAGE));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            Thread.sleep(300);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals(View.GONE, ((View) root.findViewWithTag("update_status")).getVisibility());
            root.findViewWithTag("check_now").performClick();
        }
        assertEquals(0, requests.get());
    }

    @Test public void malformedBodiesAndInvalidTagsAreRejectedWithoutAReleaseAction() throws Exception {
        String valid = release("v99.0.0", RELEASE_PAGE);
        String[] bad = {valid + " trailing", "[]", "null", "{'tag_name':'v99.0.0','html_url':'" + RELEASE_PAGE + "'}",
            "{\"tag_name\":null,\"html_url\":\"" + RELEASE_PAGE + "\"}",
            "{\"tag_name\":\"v99.0.0\",\"tag_name\":\"v1.0.0\",\"html_url\":\"" + RELEASE_PAGE + "\"}",
            release("v99.0", RELEASE_PAGE), release("v099.0.0", RELEASE_PAGE), release("v99.0.0-01", RELEASE_PAGE),
            release("v99.0.0-", RELEASE_PAGE), valid.substring(0, valid.length() - 1)};
        Settings.preferences.edit().putBoolean("check_updates", true).commit();
        for (String body : bad) {
            reply = json(200, body);
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                assertEquals(body, "Couldn't check for updates. Check your connection and try again.", awaitStatus(root).getText().toString());
                assertNull(root.findViewWithTag("update_release"));
            }
        }
    }

    @Test public void theByteLimitIsInclusiveAndLargerResponsesFail() throws Exception {
        String valid = release("v99.0.0", RELEASE_PAGE);
        Settings.preferences.edit().putBoolean("check_updates", true).commit();
        for (int size : new int[] {256 * 1024, 256 * 1024 + 1}) {
            now.addAndGet(ReleaseCheck.COOLDOWN_MS);
            reply = json(200, valid + " ".repeat(size - valid.getBytes(StandardCharsets.UTF_8).length));
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                assertEquals(size == 256 * 1024 ? "Version 99.0.0 is available" : "Couldn't check for updates. Check your connection and try again.", awaitStatus(root).getText().toString());
            }
        }
    }

    @Test public void malformedUtf8FailsBeforeJsonParsing() throws Exception {
        reply = out -> {
            byte[] bytes = {(byte) 0xc3, 0x28};
            out.write("HTTP/1.1 200 Test\r\nContent-Length: 2\r\nConnection: close\r\n\r\n".getBytes(StandardCharsets.US_ASCII));
            out.write(bytes);
            out.flush();
        };
        assertEquals("Couldn't check for updates. Check your connection and try again.", awaitStatus(openWithCheckOn()).getText().toString());
    }

    @Test public void enablingAndRetryingCheckOnceWithVisibleLoadingAndOneReleaseAction() throws Exception {
        reply = json(403, "{}");
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("check_updates").performClick();
            assertEquals("Checking for updates...", ((TextView) root.findViewWithTag("update_status")).getText().toString());
            assertRetryStatus(awaitStatus(root));
            assertEquals(1, requests.get());
            reply = json(200, release("v99.0.0", RELEASE_PAGE));
            now.addAndGet(60_001);
            root.findViewWithTag("check_now").performClick();
            assertEquals("Version 99.0.0 is available", awaitStatus(root).getText().toString());
            assertEquals(2, requests.get());
            root.findViewWithTag("check_now").performClick();
            assertNull(root.findViewWithTag("update_release"));
            awaitStatus(root);
            android.view.ViewGroup parent = (android.view.ViewGroup) root.findViewWithTag("update_status").getParent();
            int actions = 0;
            for (int i = 0; i < parent.getChildCount(); i++) if ("update_release".equals(parent.getChildAt(i).getTag())) actions++;
            assertEquals(1, actions);
            assertEquals(2, requests.get());
        }
    }

    @Test public void optOutDestructionAndNewerRequestsCancelDelayedCompletions() throws Exception {
        for (int code : new int[] {200, 403}) for (String action : new String[] {"optout", "destroy", "newer"}) {
            Settings.preferences.edit().clear().commit();
            CountDownLatch received = new CountDownLatch(1), finish = new CountDownLatch(1), answered = new CountDownLatch(1);
            reply = out -> {
                received.countDown();
                try { finish.await(3, TimeUnit.SECONDS); } catch (InterruptedException e) { Thread.currentThread().interrupt(); }
                try { json(code, release("v99.0.0", RELEASE_PAGE)).send(out); }
                finally { answered.countDown(); }
            };
            Settings.preferences.edit().putBoolean("check_updates", true).commit();
            var screen = Robolectric.buildActivity(SettingsActivity.class).setup();
            View root = screen.get().getWindow().getDecorView();
            assertTrue(received.await(2, TimeUnit.SECONDS));
            TextView status = root.findViewWithTag("update_status");
            if ("optout".equals(action)) root.findViewWithTag("check_updates").performClick();
            else if ("destroy".equals(action)) screen.pause().stop().destroy();
            else {
                reply = json(200, release("v" + BuildConfig.VERSION_NAME, page("v" + BuildConfig.VERSION_NAME)));
                root.findViewWithTag("check_now").performClick();
                assertEquals("You have the latest version.", awaitStatus(root).getText().toString());
            }
            assertNull(org.robolectric.util.ReflectionHelpers.getField(screen.get(), "updateConnection"));
            finish.countDown();
            assertTrue(answered.await(2, TimeUnit.SECONDS));
            Thread.sleep(100);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertNull(root.findViewWithTag("update_release"));
            if ("optout".equals(action)) assertEquals(View.GONE, status.getVisibility());
            else assertEquals("newer".equals(action) ? "You have the latest version." : "Checking for updates...", status.getText().toString());
            assertEquals(0, Settings.preferences.getLong(ReleaseCheck.RETRY_KEY, 0));
            String cached = Settings.preferences.getString(ReleaseCheck.CACHE_KEY, "");
            if ("newer".equals(action)) assertTrue(cached.contains("\nv" + BuildConfig.VERSION_NAME + "\n"));
            else assertEquals("", cached);
            if (!"destroy".equals(action)) screen.close();
        }
    }

    @Test public void stalledCacheWritesDoNotBlockCancellationOrOverwriteANewerCheck() throws Exception {
        for (int code : new int[] {200, 403, 304}) for (String action : new String[] {"optout", "destroy", "newer"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().commit();
            if (code == 304) Settings.preferences.edit().putString(ReleaseCheck.CACHE_KEY,
                cache("\"old\"", now.get() - ReleaseCheck.COOLDOWN_MS)).commit();
            reply = json(code, release("v99.0.0", RELEASE_PAGE), "ETag: \"changed\"\r\n");
            CountDownLatch writing = new CountDownLatch(1), releaseWrite = new CountDownLatch(1), returned = new CountDownLatch(1);
            CountDownLatch newerResponse = new CountDownLatch(1);
            AtomicInteger commits = new AtomicInteger();
            var stalledWorker = new java.util.concurrent.atomic.AtomicReference<Thread>();
            var screen = Robolectric.buildActivity(SettingsActivity.class).setup();
            var prefs = Settings.preferences;
            Settings.preferences = (android.content.SharedPreferences) java.lang.reflect.Proxy.newProxyInstance(
                getClass().getClassLoader(), new Class<?>[] {android.content.SharedPreferences.class}, (proxy, method, args) -> {
                    Object result = method.invoke(prefs, args);
                    if (!method.getName().equals("edit")) return result;
                    var editor = (android.content.SharedPreferences.Editor) result;
                    return java.lang.reflect.Proxy.newProxyInstance(getClass().getClassLoader(),
                        new Class<?>[] {android.content.SharedPreferences.Editor.class}, (editProxy, editMethod, editArgs) -> {
                            if (editMethod.getName().equals("commit") && Thread.currentThread().getName().equals("HushUpdateCheck")
                                && commits.incrementAndGet() == 1) {
                                stalledWorker.set(Thread.currentThread());
                                writing.countDown();
                                assertTrue(releaseWrite.await(10, TimeUnit.SECONDS));
                            }
                            Object edited = editMethod.invoke(editor, editArgs);
                            return edited == editor ? editProxy : edited;
                        });
                });
            Thread safetyRelease = new Thread(() -> {
                try { returned.await(3, TimeUnit.SECONDS); }
                catch (InterruptedException error) { Thread.currentThread().interrupt(); }
                if (returned.getCount() != 0) releaseWrite.countDown();
            });
            try {
                View root = screen.get().getWindow().getDecorView();
                root.findViewWithTag("check_updates").performClick();
                assertTrue(writing.await(3, TimeUnit.SECONDS));
                safetyRelease.start();
                if (action.equals("optout")) root.findViewWithTag("check_updates").performClick();
                else if (action.equals("destroy")) screen.pause().stop().destroy();
                else {
                    reply = out -> {
                        json(200, release("v" + BuildConfig.VERSION_NAME, page("v" + BuildConfig.VERSION_NAME))).send(out);
                        newerResponse.countDown();
                    };
                    root.findViewWithTag("check_now").performClick();
                }
                returned.countDown();
                assertEquals("Cancellation waited for the disk write: " + code + "/" + action, 1, releaseWrite.getCount());
                if (action.equals("newer")) assertTrue(newerResponse.await(3, TimeUnit.SECONDS));
                releaseWrite.countDown();
                stalledWorker.get().join(3000);
                assertFalse(stalledWorker.get().isAlive());
                if (action.equals("newer")) {
                    assertEquals("You have the latest version.", awaitStatus(root).getText().toString());
                    assertTrue(prefs.getString(ReleaseCheck.CACHE_KEY, "").contains("\nv" + BuildConfig.VERSION_NAME + "\n"));
                    assertEquals(0, prefs.getLong(ReleaseCheck.RETRY_KEY, 0));
                } else {
                    Shadows.shadowOf(Looper.getMainLooper()).idle();
                    assertNull(root.findViewWithTag("update_release"));
                }
            } finally {
                returned.countDown();
                releaseWrite.countDown();
                if (stalledWorker.get() != null) stalledWorker.get().join(3000);
                safetyRelease.join(3000);
                if (!screen.get().isDestroyed()) screen.close();
                Settings.preferences = prefs;
            }
        }
    }

    private View openWithCheckOn() {
        Settings.preferences.edit().putBoolean("check_updates", true).commit();
        var screen = Robolectric.buildActivity(SettingsActivity.class).setup();
        screens.add(screen);
        lastOpened = screen.get();
        return lastOpened.getWindow().getDecorView();
    }

    private void closeScreens() {
        for (var screen : screens) screen.close();
        screens.clear();
    }

    @Test public void recentResultsAreReusedAndExpiredResultsUseTheirOwnEtag() throws Exception {
        reply = json(200, release("v99.0.0", RELEASE_PAGE), "ETag: \"version-one\"\r\n");
        assertEquals("Version 99.0.0 is available", awaitStatus(openWithCheckOn()).getText().toString());
        assertTrue(Settings.preferences.getString(ReleaseCheck.CACHE_KEY, "").length() <= ReleaseCheck.MAX_CACHE_CHARS);
        reply = json(500, "{}");
        View reused = openWithCheckOn();
        assertEquals("Version 99.0.0 is available", awaitStatus(reused).getText().toString());
        reused.findViewWithTag("check_now").performClick();
        assertEquals("Version 99.0.0 is available", awaitStatus(reused).getText().toString());
        assertEquals(1, requests.get());
        now.addAndGet(ReleaseCheck.COOLDOWN_MS);
        reply = json(304, "", "ETag: \"version-one\"\r\n");
        reused.findViewWithTag("check_now").performClick();
        assertEquals("Version 99.0.0 is available", awaitStatus(reused).getText().toString());
        assertEquals(2, requests.get());
        assertTrue(requestHeaders.get(1), requestHeaders.get(1).contains("If-None-Match: \"version-one\"\r\n"));
        assertFalse(requestHeaders.toString().toLowerCase(java.util.Locale.ROOT).contains("authorization:"));
        reused.findViewWithTag("update_release").performClick();
        assertEquals(RELEASE_PAGE, Shadows.shadowOf(lastOpened).getNextStartedActivity().getDataString());
    }

    @Test public void notModifiedNeedsAValidatedConditionalRepresentation() throws Exception {
        for (String cache : new String[] {"", cache("", now.get() - ReleaseCheck.COOLDOWN_MS)}) {
            Settings.preferences.edit().putString(ReleaseCheck.CACHE_KEY, cache).commit();
            reply = json(304, "");
            View root = openWithCheckOn();
            assertEquals("Couldn't check for updates. Check your connection and try again.", awaitStatus(root).getText().toString());
            assertNull(root.findViewWithTag("update_release"));
            assertFalse(requestHeaders.get(requestHeaders.size() - 1).contains("If-None-Match:"));
        }
    }

    @Test public void aChangedEtagCannotRevalidateOldDataAndTheNextCheckIsUnconditional() throws Exception {
        String old = cache("\"old\"", now.get() - ReleaseCheck.COOLDOWN_MS);
        Settings.preferences.edit().putString(ReleaseCheck.CACHE_KEY, old).commit();
        reply = json(304, "", "ETag: \"different\"\r\n");
        View root = openWithCheckOn();
        assertEquals("Couldn't check for updates. Check your connection and try again.", awaitStatus(root).getText().toString());
        assertNull(root.findViewWithTag("update_release"));
        assertTrue(requestHeaders.get(0), requestHeaders.get(0).contains("If-None-Match: \"old\"\r\n"));
        // Keeping the old validator would resend it and fail the same way on every later check.
        assertEquals("", Settings.preferences.getString(ReleaseCheck.CACHE_KEY, ""));
        assertEquals(0, Settings.preferences.getLong(ReleaseCheck.RETRY_KEY, 0));
        reply = json(200, release("v99.0.0", RELEASE_PAGE), "ETag: \"new\"\r\n");
        root.findViewWithTag("check_now").performClick();
        assertEquals("Version 99.0.0 is available", awaitStatus(root).getText().toString());
        assertEquals(2, requests.get());
        assertFalse(requestHeaders.get(1), requestHeaders.get(1).contains("If-None-Match:"));
        assertTrue(Settings.preferences.getString(ReleaseCheck.CACHE_KEY, "").contains("\n\"new\"\n"));
    }

    @Test public void mismatchedTagAndCorruptCacheCannotOfferAReleaseAction() throws Exception {
        reply = json(200, release("v98.0.0", RELEASE_PAGE));
        assertEquals("Couldn't check for updates. Check your connection and try again.", awaitStatus(openWithCheckOn()).getText().toString());
        assertEquals("", Settings.preferences.getString(ReleaseCheck.CACHE_KEY, ""));
        String valid = cache("\"old\"", now.get() - ReleaseCheck.COOLDOWN_MS);
        String[] corrupt = {"x".repeat(ReleaseCheck.MAX_CACHE_CHARS + 1), valid.replace("v99.0.0\n", "v098.0.0\n"),
            valid.replace(RELEASE_PAGE, page("v98.0.0")), valid.replace(SettingsActivity.releasesUrl, SettingsActivity.releasesUrl + "-other"),
            cache("\"bad\rheader\"", now.get()), cache("\"old\"", now.get() + 1), valid + "\nextra",
            valid.substring(0, valid.lastIndexOf('\n') + 1) + "1.0", valid.replace(RELEASE_PAGE, "")};
        for (String saved : corrupt) {
            Settings.preferences.edit().putString(ReleaseCheck.CACHE_KEY, saved).commit();
            reply = json(304, "");
            View root = openWithCheckOn();
            assertEquals(saved, "Couldn't check for updates. Check your connection and try again.", awaitStatus(root).getText().toString());
            assertNull(root.findViewWithTag("update_release"));
            assertFalse(requestHeaders.get(requestHeaders.size() - 1).contains("If-None-Match:"));
        }
        Settings.preferences.edit().putBoolean(ReleaseCheck.CACHE_KEY, true).commit();
        assertEquals("Couldn't check for updates. Check your connection and try again.", awaitStatus(openWithCheckOn()).getText().toString());
    }

    @Test public void rateLimitsHonorBothHeadersAndPersistUntilTheDeadline() throws Exception {
        for (int code : new int[] {403, 429}) {
            closeScreens();
            Settings.preferences.edit().clear().commit();
            int before = requests.get();
            long deadline = (now.get() / 1000 + 120) * 1000;
            reply = json(code, "{}", "Retry-After: 60\r\nX-RateLimit-Remaining: 0\r\nX-RateLimit-Reset: " + deadline / 1000 + "\r\n");
            View root = openWithCheckOn();
            assertRetryStatus(awaitStatus(root));
            assertEquals(deadline, Settings.preferences.getLong(ReleaseCheck.RETRY_KEY, 0));
            assertEquals(View.ACCESSIBILITY_LIVE_REGION_POLITE, ((TextView) root.findViewWithTag("update_status")).getAccessibilityLiveRegion());
            now.addAndGet(119_000);
            root.findViewWithTag("check_now").performClick();
            assertRetryStatus(awaitStatus(root));
            assertRetryStatus(awaitStatus(openWithCheckOn()));
            assertEquals(before + 1, requests.get());
            now.addAndGet(1001);
            reply = json(200, release("v99.0.0", RELEASE_PAGE));
            root.findViewWithTag("check_now").performClick();
            assertEquals("Version 99.0.0 is available", awaitStatus(root).getText().toString());
            assertEquals(before + 2, requests.get());
            assertEquals(0, Settings.preferences.getLong(ReleaseCheck.RETRY_KEY, 0));
        }
    }

    @Test public void secondaryLimitsUseRetryAfterOrBackoffInsteadOfThePrimaryReset() throws Exception {
        for (int variant = 0; variant < 3; variant++) {
            closeScreens();
            Settings.preferences.edit().clear().commit();
            int before = requests.get();
            long reset = now.get() / 1000 + (variant == 1 ? -3600 : 3600);
            String headers = (variant == 0 ? "Retry-After: 60\r\n" : "")
                + (variant < 2 ? "X-RateLimit-Remaining: 100\r\n" : "")
                + "X-RateLimit-Reset: " + reset + "\r\n";
            reply = json(403, "{}", headers);
            View root = openWithCheckOn();
            assertRetryStatus(awaitStatus(root));
            assertEquals(now.get() + 60_000, Settings.preferences.getLong(ReleaseCheck.RETRY_KEY, 0));
            now.addAndGet(59_000);
            root.findViewWithTag("check_now").performClick();
            assertRetryStatus(awaitStatus(root));
            assertEquals(before + 1, requests.get());
            now.addAndGet(1001);
            reply = json(200, release("v99.0.0", RELEASE_PAGE));
            root.findViewWithTag("check_now").performClick();
            assertEquals("Version 99.0.0 is available", awaitStatus(root).getText().toString());
            assertEquals(before + 2, requests.get());
        }
    }

    @Test public void retryDatesAndMalformedHeadersUseBoundedBackoff() throws Exception {
        String date = java.time.Instant.ofEpochMilli(now.get() + 80_000).atZone(java.time.ZoneOffset.UTC)
            .format(java.time.format.DateTimeFormatter.RFC_1123_DATE_TIME);
        reply = json(429, "{}", "Retry-After: " + date + "\r\n");
        View root = openWithCheckOn();
        assertRetryStatus(awaitStatus(root));
        assertEquals(now.get() + 80_000, Settings.preferences.getLong(ReleaseCheck.RETRY_KEY, 0));
        now.addAndGet(80_001);
        reply = json(403, "{}", "Retry-After: 9999999999999999999\r\nX-RateLimit-Reset: nope\r\n");
        root.findViewWithTag("check_now").performClick();
        assertRetryStatus(awaitStatus(root));
        assertEquals(now.get() + 120_000, Settings.preferences.getLong(ReleaseCheck.RETRY_KEY, 0));
    }

    @Test public void retryTimesStayWithinADayAndNeverUndercutTheBackoff() throws Exception {
        String farDate = java.time.Instant.ofEpochMilli(now.get() + 365 * ReleaseCheck.MAX_RETRY_MS).atZone(java.time.ZoneOffset.UTC)
            .format(java.time.format.DateTimeFormatter.RFC_1123_DATE_TIME);
        for (int variant = 0; variant < 5; variant++) {
            closeScreens();
            Settings.preferences.edit().clear().commit();
            long seconds = now.get() / 1000;
            String headers = new String[] {"Retry-After: 0\r\n", "X-RateLimit-Remaining: 0\r\nX-RateLimit-Reset: " + (seconds - 3600) + "\r\n",
                "Retry-After: 999999999\r\n", "X-RateLimit-Remaining: 0\r\nX-RateLimit-Reset: " + (seconds + 30 * 86_400) + "\r\n",
                "Retry-After: " + farDate + "\r\n"}[variant];
            reply = json(429, "{}", headers);
            View root = openWithCheckOn();
            assertRetryStatus(awaitStatus(root));
            long deadline = now.get() + (variant < 2 ? 60_000 : ReleaseCheck.MAX_RETRY_MS);
            assertEquals(headers, deadline, Settings.preferences.getLong(ReleaseCheck.RETRY_KEY, 0));
            if (variant == 0) {
                // A second immediate retry still follows the growing backoff.
                now.set(deadline);
                root.findViewWithTag("check_now").performClick();
                assertRetryStatus(awaitStatus(root));
                assertEquals(now.get() + 120_000, Settings.preferences.getLong(ReleaseCheck.RETRY_KEY, 0));
            } else if (variant == 2) {
                int before = requests.get();
                now.set(deadline - 1);
                root.findViewWithTag("check_now").performClick();
                assertRetryStatus(awaitStatus(root));
                assertEquals(before, requests.get());
                now.set(deadline);
                reply = json(200, release("v99.0.0", RELEASE_PAGE));
                root.findViewWithTag("check_now").performClick();
                assertEquals("Version 99.0.0 is available", awaitStatus(root).getText().toString());
                assertEquals(before + 1, requests.get());
            }
        }
    }

    @Test public void aRetryTimeSavedMoreThanADayAheadDoesNotParkChecks() throws Exception {
        // Earlier versions saved any server time, and a clock set back pushes a saved one further out.
        Settings.preferences.edit().putLong(ReleaseCheck.RETRY_KEY, now.get() + ReleaseCheck.MAX_RETRY_MS)
            .putString(ReleaseCheck.RETRY_ENDPOINT_KEY, SettingsActivity.releasesUrl).commit();
        reply = json(200, release("v99.0.0", RELEASE_PAGE));
        assertRetryStatus(awaitStatus(openWithCheckOn()));
        assertEquals(0, requests.get());
        closeScreens();
        Settings.preferences.edit().putLong(ReleaseCheck.RETRY_KEY, now.get() + ReleaseCheck.MAX_RETRY_MS + 1).commit();
        assertEquals("Version 99.0.0 is available", awaitStatus(openWithCheckOn()).getText().toString());
        assertEquals(1, requests.get());
        assertEquals(0, Settings.preferences.getLong(ReleaseCheck.RETRY_KEY, 0));
    }

    @Test public void installedAheadNamesBothVersionsWithoutAnUpdateAction() throws Exception {
        reply = json(200, release("v0.14.0", page("v0.14.0")));
        View root = openWithCheckOn();
        assertEquals("Installed " + BuildConfig.VERSION_NAME + ". Latest published version is 0.14.0.", awaitStatus(root).getText().toString());
        assertNull(root.findViewWithTag("update_release"));
    }

    @Test public void redirectsAreNotFollowed() throws Exception {
        reply = json(302, "", "Location: " + SettingsActivity.releasesUrl + "-redirect\r\n");
        assertEquals("Couldn't check for updates. Check your connection and try again.", awaitStatus(openWithCheckOn()).getText().toString());
        assertEquals(1, requests.get());
    }

    private static void assertRetryStatus(TextView status) {
        assertTrue(status.getText().toString(), status.getText().toString().startsWith("GitHub couldn't answer yet. Try Check now after "));
    }

    @Test @Config(sdk = 36, qualifiers = "w411dp-h914dp-mdpi")
    @org.robolectric.annotation.GraphicsMode(org.robolectric.annotation.GraphicsMode.Mode.NATIVE)
    public void retryStatusAndActionAreAccessibleInBothThemesAtLargeText() throws Exception {
        try {
            for (boolean light : new boolean[] {false, true}) for (float scale : new float[] {1f, 2f}) {
                RuntimeEnvironment.setFontScale(scale);
                Settings.preferences.edit().clear().putBoolean("light", light).commit();
                reply = json(429, "{}", "Retry-After: 120\r\n");
                int before = requests.get();
                try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                    View root = screen.get().getWindow().getDecorView();
                    root.findViewWithTag("tab_app").performClick();
                    assertTrue(root.findViewWithTag("check_updates").performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_CLICK, null));
                    TextView status = awaitStatus(root);
                    assertRetryStatus(status);
                    for (int pass = 0; pass < 3; pass++) {
                        root.measure(View.MeasureSpec.makeMeasureSpec(411, View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(914, View.MeasureSpec.EXACTLY));
                        root.layout(0, 0, 411, 914);
                        if (pass == 1) status.requestRectangleOnScreen(new android.graphics.Rect(0, 0, status.getWidth(), status.getHeight()), true);
                        Shadows.shadowOf(Looper.getMainLooper()).idle();
                    }
                    android.graphics.Rect visible = new android.graphics.Rect();
                    assertTrue(status.getGlobalVisibleRect(visible));
                    assertEquals(status.getHeight(), visible.height());
                    assertEquals(View.ACCESSIBILITY_LIVE_REGION_POLITE, status.getAccessibilityLiveRegion());
                    assertTrue(root.findViewWithTag("check_now").performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_CLICK, null));
                    assertRetryStatus(awaitStatus(root));
                    assertEquals(before + 1, requests.get());
                    String output = System.getenv("HUSH_SETTINGS_CAPTURES");
                    if (output != null) {
                        var directory = java.nio.file.Path.of(output);
                        java.nio.file.Files.createDirectories(directory);
                        var pixels = android.graphics.Bitmap.createBitmap(411, 914, android.graphics.Bitmap.Config.ARGB_8888);
                        root.draw(new android.graphics.Canvas(pixels));
                        try (var stream = java.nio.file.Files.newOutputStream(directory.resolve("updates-" + (light ? "light" : "dark") + "-" + (int) scale + ".png"))) {
                            assertTrue(pixels.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, stream));
                        } finally { pixels.recycle(); }
                    }
                    View action = root.findViewWithTag("check_now");
                    action.requestRectangleOnScreen(new android.graphics.Rect(0, 0, action.getWidth(), action.getHeight()), true);
                    root.layout(0, 0, 411, 914);
                    assertTrue(action.getGlobalVisibleRect(visible));
                    assertEquals(action.getHeight(), visible.height());
                    if (output != null) {
                        var pixels = android.graphics.Bitmap.createBitmap(411, 914, android.graphics.Bitmap.Config.ARGB_8888);
                        root.draw(new android.graphics.Canvas(pixels));
                        try (var stream = java.nio.file.Files.newOutputStream(java.nio.file.Path.of(output).resolve(
                            "updates-" + (light ? "light" : "dark") + "-" + (int) scale + "-action.png"))) {
                            assertTrue(pixels.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, stream));
                        } finally { pixels.recycle(); }
                    }
                }
            }
        } finally { RuntimeEnvironment.setFontScale(1f); }
    }

    private static String page(String tag) { return "https://github.com/SysAdminDoc/HushMessenger/releases/tag/" + tag; }
    private String cache(String etag, long time) { return "1\n" + SettingsActivity.releasesUrl + "\nv99.0.0\n" + RELEASE_PAGE + "\n" + etag + "\n" + time; }

    private static TextView awaitStatus(View root) throws InterruptedException {
        TextView status = root.findViewWithTag("update_status");
        long deadline = System.currentTimeMillis() + 10_000;
        while ((status.getVisibility() != View.VISIBLE || status.getText().toString().equals("Checking for updates...")) && System.currentTimeMillis() < deadline) {
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            Thread.sleep(20);
        }
        assertEquals(View.VISIBLE, status.getVisibility());
        assertNotEquals("Checking for updates...", status.getText().toString());
        return status;
    }

    private static String release(String tag, String page) {
        return "{\"html_url\":\"" + page + "\",\"tag_name\":\"" + tag + "\",\"author\":{\"html_url\":\"https://github.com/SysAdminDoc\"}}";
    }

    /** Reads the request headers, then lets the test's reply answer, and closes the connection. */
    private void serve(Socket client) {
        try (Socket socket = client) {
            InputStream in = socket.getInputStream();
            StringBuilder headers = new StringBuilder();
            int matched = 0;
            while (matched < 4) {
                int next = in.read();
                if (next < 0) return;
                headers.append((char) next);
                matched = next == "\r\n\r\n".charAt(matched) ? matched + 1 : (next == '\r' ? 1 : 0);
            }
            requestHeaders.add(headers.toString());
            reply.send(socket.getOutputStream());
        } catch (IOException ignored) {
            // The client gave up (the timeout case); nothing to answer.
        }
    }

    private static Reply json(int code, String body) {
        return json(code, body, "");
    }

    private static Reply json(int code, String body, String extraHeaders) {
        return out -> {
            byte[] bytes = body.getBytes(StandardCharsets.UTF_8);
            String head = "HTTP/1.1 " + code + " Test\r\nContent-Type: application/json\r\nContent-Length: "
                + bytes.length + "\r\n" + extraHeaders + "Connection: close\r\n\r\n";
            out.write(head.getBytes(StandardCharsets.US_ASCII));
            out.write(bytes);
            out.flush();
        };
    }
}
