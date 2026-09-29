/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.os.Looper;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.SwitchPreference;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.CookieHandler;
import java.net.CookieManager;
import java.net.HttpCookie;
import java.net.SocketTimeoutException;
import java.net.URI;
import java.net.UnknownHostException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

import app.morphe.extension.facebook.settings.FakeGitHub.Reply;
import app.morphe.extension.facebook.settings.ReleaseCheck.Result;
import app.morphe.extension.facebook.settings.ReleaseCheck.Stored;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.WorkerPoolForTests;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.FailingStore;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * The release check against a GitHub that answers from the test: what it asks, what it keeps of
 * each answer, how often it asks, and what the settings screen then says. No test here goes online.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class ReleaseCheckTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** 2026-09-21 14:13 UTC. */
    private static final long NOW = 1_790_000_000_000L;
    private static final long HOUR = TimeUnit.HOURS.toMillis(1);
    private static final long DAY = TimeUnit.DAYS.toMillis(1);

    /** The 0.1.8 release's notes on GitHub, as they are. */
    private static final String NOTES_0_1_8 = "Hushfacebook 0.1.8 fixes the known issue from 0.1.7: Clean up Reels now "
            + "takes the Follow button off reels on the Reels tab.\n\nChecked on a signed-in test phone (Galaxy S22, "
            + "Android 16) before release.\n\nAll 22 patches applied without force to Facebook 580.0.0.51.74 and "
            + "577.0.0.50.72, with no manifest changes. Local checks passed: 471 extension tests, 171 patch tests and "
            + "both Android lints.\n\nRequires Morphe Manager 1.32.0 or newer.\n";

    private static final String NEWER = "Hushfacebook " + L10n.isolate("0.2.0") + " is out. Update it in Morphe Manager.";

    private final ReleaseCheck.Transport original = ReleaseCheck.transport;
    private final long originalDeadline = ReleaseCheck.deadlineMs;
    private FakeGitHub github;

    @Before
    public void start() {
        ReleaseCheckForTests.forget();
        github = new FakeGitHub();
        ReleaseCheck.transport = github;
        ReleaseCheck.versionForTests = "0.1.8";
        ReleaseCheck.facebookForTests = "580.0.0.51.74";
    }

    @After
    public void restore() {
        ReleaseCheckForTests.forget();
        ReleaseCheck.transport = original;
        ReleaseCheck.deadlineMs = originalDeadline;
        ReleaseCheck.versionForTests = null;
        ReleaseCheck.facebookForTests = null;
        Settings.CHECK_FOR_RELEASES.resetToDefault();
        PatchFamily.inBuildForTests = null;
        ScreenColors.shown = null;
        PauseForTests.resume();
        ShadowToast.reset();
    }

    private ReleaseCheck.Answer fetch() {
        return ReleaseCheck.fetch(github, "0.1.8");
    }

    // ---- What an answer says -------------------------------------------------------------------

    @Test
    public void aNewerReleaseIsNamedOnTheCardWithTheFacebookItTargets() {
        github.then(Reply.release("v0.2.0", "Hushfacebook v0.2.0 targets Facebook 582.0.0.40.70 "
                + "(com.facebook.katana), and 580.0.0.51.74 still works.\n\nMore notes."));
        ReleaseCheck.run(NOW);

        assertEquals(NOW, (long) Stored.CHECKED_AT.get());
        assertEquals("OK", Stored.RESULT.get());
        assertEquals("0.2.0", Stored.NEWEST.get());
        assertEquals("582.0.0.40.70", Stored.TARGET.get());
        assertEquals(NEWER + " It targets Facebook " + L10n.isolate("582.0.0.40.70") + ".", ReleaseCheck.statusLine());
        assertEquals(NEWER, ReleaseCheck.checkNowSummary());

        // Once Hushfacebook is 0.2.0 the line goes, with no new try, and only the other Facebook stays.
        ReleaseCheck.versionForTests = "0.2.0";
        assertEquals("Hushfacebook " + L10n.isolate("0.2.0") + " targets Facebook " + L10n.isolate("582.0.0.40.70") + ".",
                ReleaseCheck.statusLine());
        assertEquals("You have the newest Hushfacebook release.", ReleaseCheck.checkNowSummary());
        ReleaseCheck.facebookForTests = "582.0.0.40.70";
        assertNull(ReleaseCheck.statusLine());
        assertEquals(1, github.asked.size());
    }

    @Test
    public void theSameReleaseSaysNothingOnTheCard() {
        github.then(Reply.release("v0.1.8", NOTES_0_1_8));
        ReleaseCheck.run(NOW);

        assertEquals("0.1.8", Stored.NEWEST.get());
        assertEquals("the notes' first target sentence, its newest version", "580.0.0.51.74", Stored.TARGET.get());
        assertNull(ReleaseCheck.statusLine());
        assertEquals("You have the newest Hushfacebook release.", ReleaseCheck.checkNowSummary());
    }

    @Test
    public void anOlderReleaseSaysNothingOnTheCard() {
        github.then(Reply.release("v0.1.7", NOTES_0_1_8));
        ReleaseCheck.run(NOW);

        assertEquals("0.1.7", Stored.NEWEST.get());
        assertNull("a build newer than the latest release, as a test build is", ReleaseCheck.statusLine());
        assertEquals("You have the newest Hushfacebook release.", ReleaseCheck.checkNowSummary());
    }

    @Test
    public void aTargetOtherThanTheRunningFacebookIsNamed() {
        ReleaseCheck.facebookForTests = "577.0.0.50.72";
        github.then(Reply.release("v0.1.8", NOTES_0_1_8));
        ReleaseCheck.run(NOW);

        assertEquals("Hushfacebook " + L10n.isolate("0.1.8") + " targets Facebook " + L10n.isolate("580.0.0.51.74") + ".",
                ReleaseCheck.statusLine());
        // Notes that name no Facebook build say nothing about one.
        ReleaseCheckForTests.forget();
        github.then(Reply.release("v0.1.8", "Bug fixes."));
        ReleaseCheck.run(NOW);
        assertEquals("", Stored.TARGET.get());
        assertNull(ReleaseCheck.statusLine());
        // And a Facebook version this can't read isn't taken for another one.
        ReleaseCheck.facebookForTests = "Unknown";
        github.then(Reply.release("v0.1.8", NOTES_0_1_8));
        ReleaseCheck.run(NOW + DAY);
        assertNull(ReleaseCheck.statusLine());
    }

    @Test
    public void aRunningVersionThisCantReadNamesTheNewestWithoutComparing() {
        ReleaseCheck.versionForTests = "";
        github.then(Reply.release("v0.2.0", null));
        ReleaseCheck.run(NOW);

        assertEquals("The newest Hushfacebook release is " + L10n.isolate("0.2.0") + ".", ReleaseCheck.checkNowSummary());
        assertNull("no newer release it can be sure of", ReleaseCheck.statusLine());
    }

    @Test
    public void malformedJsonIsUnreadableAndKeepsTheReleaseFoundBefore() {
        github.then(Reply.release("v0.2.0", null));
        ReleaseCheck.run(NOW);
        assertEquals("0.2.0", Stored.NEWEST.get());

        String nul = String.valueOf((char) 0);
        StringBuilder deep = new StringBuilder();
        for (int i = 0; i < 200; i++) deep.append('[');
        String[] broken = {
                "", "not json", "{\"tag_name\": \"v0.3.0\"", "[{\"tag_name\": \"v0.3.0\"}]",
                "{\"tag_name\": \"v0.3.0\"} and more", "{\"tag_name\": \"v0.3.0\", \"tag_name\": \"v0.4.0\"}",
                "{\"name\": \"v0.3.0\"}", "{\"tag_name\": 3}", "{\"tag_name\": null}", "{\"tag_name\": \"latest\"}",
                "{\"tag_name\": \"v0.3.0<script>\"}", "{\"tag_name\": \"v0.3.0\", \"prerelease\": true}",
                "{\"tag_name\": \"v0.3.0\", \"draft\": true}", "{\"tag_name\": \"v0.3.0" + nul + "\"}",
                "{\"body\": " + deep + "}",
        };
        for (String text : broken) {
            github.then(Reply.json(text));
            ReleaseCheck.Answer answer = fetch();
            assertEquals(text, Result.UNREADABLE, answer.result);
            assertNull(answer.newest);
        }
        // Bytes that aren't UTF-8.
        github.then(Reply.streaming(() -> new ByteArrayInputStream(new byte[]{'{', '"', 't', '"', ':', (byte) 0xC3, '}'})));
        assertEquals(Result.UNREADABLE, fetch().result);

        github.then(Reply.json("{oops"));
        ReleaseCheck.run(NOW + DAY);
        assertEquals("UNREADABLE", Stored.RESULT.get());
        assertEquals("what the last good answer found stays", "0.2.0", Stored.NEWEST.get());
        assertEquals("GitHub's answer couldn't be used. Try again later.", ReleaseCheck.checkNowSummary());
        assertEquals(NEWER, ReleaseCheck.statusLine());
    }

    /** An answer the store can't keep leaves the last one on the card, as a restart would find it. */
    @Test
    public void anAnswerTheStoreCanNotKeepLeavesTheLastOneOnTheCard() {
        github.then(Reply.release("v0.2.0", null));
        ReleaseCheck.run(NOW);
        assertEquals(NEWER, ReleaseCheck.statusLine());

        github.then(Reply.release("v0.3.0", null));
        // The first editor keeps the time of the try; the second is the answer's one commit.
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.NONE, FailingStore.Fault.COMMIT_THROWS)) {
            ReleaseCheck.run(NOW + DAY);
        }
        assertEquals(NOW + DAY, (long) Stored.CHECKED_AT.get());
        assertEquals("0.2.0", Stored.NEWEST.get());
        assertEquals(NEWER, ReleaseCheck.statusLine());
    }

    @Test
    public void anOversizedBodyIsReadNoFurtherThanTheCap() {
        // Announced past the cap: refused before a byte is read.
        Reply announced = Reply.release("v0.2.0", null).announcing(ReleaseCheck.MAX_BODY_BYTES + 1L);
        github.then(announced);
        assertEquals(Result.TOO_LARGE, fetch().result);
        assertFalse("the body was read", announced.bodyOpened());
        assertTrue(announced.closed());

        // Announced as nothing, then endless: read to one chunk past the cap and no further.
        AtomicLong read = new AtomicLong();
        github.then(Reply.streaming(() -> new InputStream() {
            @Override
            public int read() {
                read.incrementAndGet();
                return ' ';
            }

            @Override
            public int read(byte[] buffer, int offset, int length) {
                java.util.Arrays.fill(buffer, offset, offset + length, (byte) ' ');
                read.addAndGet(length);
                return length;
            }
        }));
        assertEquals(Result.TOO_LARGE, fetch().result);
        assertTrue("read " + read.get() + " bytes", read.get() <= ReleaseCheck.MAX_BODY_BYTES + 8 * 1024);

        // The cap itself is fine, which is the control.
        String release = FakeGitHub.release("v0.2.0", null);
        char[] padding = new char[ReleaseCheck.MAX_BODY_BYTES - release.getBytes(StandardCharsets.UTF_8).length];
        java.util.Arrays.fill(padding, ' ');
        github.then(Reply.json(release + new String(padding)));
        ReleaseCheck.Answer atTheCap = fetch();
        assertEquals(Result.OK, atTheCap.result);
        assertEquals("0.2.0", atTheCap.newest);

        github.then(Reply.release("v0.2.0", null).announcing(ReleaseCheck.MAX_BODY_BYTES + 1L));
        ReleaseCheck.run(NOW);
        assertEquals("TOO_LARGE", Stored.RESULT.get());
        assertEquals("GitHub's answer couldn't be used. Try again later.", ReleaseCheck.checkNowSummary());
    }

    @Test
    public void aTimeoutIsKeptAndTheNextTryWaitsADay() {
        github.then(Reply.failing(new SocketTimeoutException("connect timed out")));
        ReleaseCheck.run(NOW);
        assertEquals("TIMEOUT", Stored.RESULT.get());
        assertEquals(NOW, (long) Stored.CHECKED_AT.get());
        assertEquals("Couldn't reach GitHub. Try again later.", ReleaseCheck.checkNowSummary());

        // A read that times out part way through the body.
        github.then(Reply.streaming(() -> new InputStream() {
            private int given;

            @Override
            public int read() throws IOException {
                if (given++ < 10) return '{';
                throw new SocketTimeoutException("Read timed out");
            }
        }));
        assertEquals(Result.TIMEOUT, fetch().result);

        // A body that trickles in, each read inside the read timeout, runs out the whole check's time.
        ReleaseCheck.deadlineMs = 60;
        github.then(Reply.streaming(() -> new InputStream() {
            @Override
            public int read() {
                return ' ';
            }

            @Override
            public int read(byte[] buffer, int offset, int length) {
                try {
                    Thread.sleep(15);
                } catch (InterruptedException interrupted) {
                    Thread.currentThread().interrupt();
                }
                buffer[offset] = ' ';
                return 1;
            }
        }));
        long started = System.nanoTime();
        assertEquals(Result.TIMEOUT, fetch().result);
        assertTrue("the trickle held the check for " + TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - started) + " ms",
                System.nanoTime() - started < TimeUnit.SECONDS.toNanos(5));
        ReleaseCheck.deadlineMs = originalDeadline;

        // No connection at all is the same to the person reading the row.
        github.then(Reply.failing(new UnknownHostException("api.github.com")));
        assertEquals(Result.OFFLINE, fetch().result);
        assertEquals("Couldn't reach GitHub. Try again later.", ReleaseCheck.resultLine(Result.OFFLINE, "", "0.1.8"));

        // The failed try at NOW waits its day like any other: an hour later a start asks nothing,
        // a day later it asks again.
        Settings.CHECK_FOR_RELEASES.save(true);
        int asked = github.asked.size();
        ReleaseCheck.onFacebookStart(NOW + HOUR);
        ReleaseCheckForTests.settle();
        assertEquals("a failed try was tried again within the day", asked, github.asked.size());
        github.then(Reply.release("v0.1.8", NOTES_0_1_8));
        ReleaseCheck.onFacebookStart(NOW + DAY);
        ReleaseCheckForTests.settle();
        assertEquals(asked + 1, github.asked.size());
        assertEquals("OK", Stored.RESULT.get());
    }

    @Test
    public void a403RateLimitIsKeptAndTheNextTryWaitsADay() {
        github.then(Reply.status(403).header("X-RateLimit-Remaining", "0").header("X-RateLimit-Reset", "1790003600"));
        ReleaseCheck.run(NOW);
        assertEquals("RATE_LIMITED", Stored.RESULT.get());
        assertEquals("GitHub is turning away checks from this network for now. Try again later.",
                ReleaseCheck.checkNowSummary());
        assertNull(ReleaseCheck.statusLine());

        // GitHub's secondary limits: a 403 or a 429 that says when to come back.
        github.then(Reply.status(403).header("Retry-After", "60"));
        assertEquals(Result.RATE_LIMITED, fetch().result);
        github.then(Reply.status(429));
        assertEquals(Result.RATE_LIMITED, fetch().result);
        // A 403 that isn't a limit, and other errors, are errors: the control.
        github.then(Reply.status(403).header("X-RateLimit-Remaining", "59"));
        assertEquals(Result.HTTP_ERROR, fetch().result);
        for (int status : new int[]{404, 500, 502, 204}) {
            github.then(Reply.status(status));
            assertEquals(String.valueOf(status), Result.HTTP_ERROR, fetch().result);
        }

        // The limited try at NOW keeps the next start from asking for a day.
        Settings.CHECK_FOR_RELEASES.save(true);
        int asked = github.asked.size();
        ReleaseCheck.onFacebookStart(NOW + 23 * HOUR);
        ReleaseCheckForTests.settle();
        assertEquals(asked, github.asked.size());
    }

    // ---- What it asks, and where ---------------------------------------------------------------

    @Test
    public void theRequestIsOneGetToApiGithubComWithAPlainUserAgent() {
        github.then(Reply.release("v0.1.8", NOTES_0_1_8));
        ReleaseCheck.run(NOW);

        assertEquals(1, github.asked.size());
        assertEquals("https://api.github.com/repos/SysAdminDoc/Hushfacebook/releases/latest",
                github.asked.get(0).toExternalForm());
        Map<String, String> expected = new LinkedHashMap<>();
        expected.put("Accept", "application/vnd.github+json");
        expected.put("X-GitHub-Api-Version", "2022-11-28");
        expected.put("User-Agent", "Hushfacebook/0.1.8");
        assertEquals("nothing but the request itself", expected, github.sent.get(0));

        // Only a version's own characters get into the User-Agent.
        assertEquals("Hushfacebook", ReleaseCheck.userAgent(""));
        assertEquals("Hushfacebook", ReleaseCheck.userAgent(null));
        assertEquals("Hushfacebook/0.2.0-dev.1", ReleaseCheck.userAgent("0.2.0-dev.1"));
        assertEquals("Hushfacebook/0.1.8Cookieab", ReleaseCheck.userAgent("0.1.8\r\nCookie: a=b"));
    }

    @Test
    public void aRedirectIsFollowedOnlyWhileItStaysOnApiGithubCom() {
        // GitHub answers for a renamed repository with a redirect on its own host.
        github.then(Reply.status(301).header("Location", "https://api.github.com/repositories/1073000000/releases/latest"))
                .then(Reply.release("v0.2.0", null));
        ReleaseCheck.Answer followed = fetch();
        assertEquals(Result.OK, followed.result);
        assertEquals("https://api.github.com/repositories/1073000000/releases/latest",
                github.asked.get(1).toExternalForm());
        assertEquals("the same request on the second hop", github.sent.get(0), github.sent.get(1));

        String[] elsewhere = {
                "https://example.org/releases/latest", "http://api.github.com/repos/x", "https://api.github.com:8443/x",
                "https://someone@api.github.com/x", "https://api.github.com.example.org/x", "//example.org/x",
                "https://api.github.com\\@example.org/x", "ftp://api.github.com/x",
        };
        for (String location : elsewhere) {
            FakeGitHub fresh = new FakeGitHub().then(Reply.status(302).header("Location", location));
            ReleaseCheck.Answer answer = ReleaseCheck.fetch(fresh, "0.1.8");
            assertEquals(location, Result.REFUSED, answer.result);
            assertEquals(location + " was asked", 1, fresh.asked.size());
        }

        FakeGitHub nowhere = new FakeGitHub().then(Reply.status(302));
        assertEquals(Result.HTTP_ERROR, ReleaseCheck.fetch(nowhere, "0.1.8").result);

        FakeGitHub loop = new FakeGitHub().always(
                Reply.status(307).header("Location", "https://api.github.com/repos/SysAdminDoc/Hushfacebook/releases/latest"));
        assertEquals(Result.HTTP_ERROR, ReleaseCheck.fetch(loop, "0.1.8").result);
        assertEquals(ReleaseCheck.MAX_REDIRECTS + 1, loop.asked.size());

        assertNull(ReleaseCheck.refusal(url("https://API.GITHUB.COM/repos/x")));
        assertNull(ReleaseCheck.refusal(url("https://api.github.com:443/repos/x")));
    }

    @Test
    public void offByDefaultAndThenAtMostOnceADayOnAStart() {
        assertFalse(Settings.CHECK_FOR_RELEASES.defaultValue);
        ReleaseCheck.onFacebookStart(NOW);
        ReleaseCheckForTests.settle();
        assertTrue("a start asked with the switch off", github.asked.isEmpty());
        assertEquals(0L, (long) Stored.CHECKED_AT.get());

        Settings.CHECK_FOR_RELEASES.save(true);
        github.then(Reply.release("v0.1.8", NOTES_0_1_8));
        ReleaseCheck.onFacebookStart(NOW);
        ReleaseCheckForTests.settle();
        assertEquals(1, github.asked.size());

        ReleaseCheck.onFacebookStart(NOW + HOUR);
        ReleaseCheck.onFacebookStart(NOW + DAY - 1);
        ReleaseCheckForTests.settle();
        assertEquals("asked again within the day", 1, github.asked.size());

        // Paused, the switch answers off: nothing asked, a day later or not.
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        ReleaseCheck.onFacebookStart(NOW + 2 * DAY);
        ReleaseCheckForTests.settle();
        assertEquals(1, github.asked.size());
        PauseForTests.resume();

        // Before the settings are ready, nothing is read and nothing asked.
        SettingsContextRule.withoutContext(() -> ReleaseCheck.onFacebookStart(NOW + 3 * DAY));
        ReleaseCheckForTests.settle();
        assertEquals(1, github.asked.size());

        // A clock set back past the last try doesn't hold every check off until it comes round.
        github.then(Reply.release("v0.1.8", NOTES_0_1_8));
        ReleaseCheck.onFacebookStart(NOW - 30 * DAY);
        ReleaseCheckForTests.settle();
        assertEquals(2, github.asked.size());
    }

    @Test
    public void aTryIsKeptBeforeItsRequestGoesOut() {
        AtomicLong keptWhenAsked = new AtomicLong(-1);
        github.onRequest = () -> keptWhenAsked.set(Stored.CHECKED_AT.get());
        github.then(Reply.failing(new IOException("Connection reset")));
        ReleaseCheck.run(NOW);

        // A Facebook closed during that request would have found NOW kept at its next start.
        assertEquals(NOW, keptWhenAsked.get());
        assertFalse(ReleaseCheck.due(NOW + HOUR, Stored.CHECKED_AT.get()));
        assertTrue(ReleaseCheck.due(NOW + DAY, Stored.CHECKED_AT.get()));
        assertTrue(ReleaseCheck.due(NOW, 0));
        assertTrue(ReleaseCheck.due(NOW - HOUR, NOW));
    }

    @Test
    public void checkNowRunsWithTheSwitchOffAndAnswersOnTheMainThread() throws Exception {
        assertFalse(Settings.CHECK_FOR_RELEASES.get());
        AtomicInteger heard = new AtomicInteger();
        AtomicReference<Thread> heardOn = new AtomicReference<>();
        ReleaseCheck.Listener screen = () -> {
            heard.incrementAndGet();
            heardOn.set(Thread.currentThread());
        };
        ReleaseCheck.watch(screen);
        CountDownLatch hold = new CountDownLatch(1);
        github.onRequest = () -> {
            try {
                assertTrue(hold.await(10, TimeUnit.SECONDS));
            } catch (InterruptedException interrupted) {
                throw new AssertionError(interrupted);
            }
        };
        github.then(Reply.release("v0.2.0", null));
        try {
            assertTrue(ReleaseCheck.checkNow());
            assertTrue(ReleaseCheck.isRunning());
            assertEquals("Checking GitHub now.", ReleaseCheck.checkNowSummary());
            // A second tap while the first is on its way asks nothing more.
            assertTrue(ReleaseCheck.checkNow());
        } finally {
            hold.countDown();
        }
        Utils.awaitBackgroundTasksForTests();
        assertEquals("heard before the main thread ran", 0, heard.get());
        ReleaseCheckForTests.settle();

        assertEquals(1, github.asked.size());
        assertFalse(ReleaseCheck.isRunning());
        assertEquals(1, heard.get());
        assertSame(Looper.getMainLooper().getThread(), heardOn.get());
        assertEquals(NEWER, ReleaseCheck.checkNowSummary());
        ReleaseCheck.unwatch(screen);
    }

    /** The worker pool is one per JVM, so it's held full the way {@link WorkerPoolForTests} says. */
    @Test
    public void aFullWorkerQueueLeavesTheCheckFreeToRunLater() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = open(controller);
            Preference checkNow = page.findPreference(HushfacebookPreferenceFragment.CHECK_NOW);
            assertNotNull(checkNow);

            try (WorkerPoolForTests full = WorkerPoolForTests.fill()) {
                assertFalse(ReleaseCheck.checkNow());
                assertFalse("a check that never ran still counts as running", ReleaseCheck.isRunning());
                checkNow.getOnPreferenceClickListener().onPreferenceClick(checkNow);
                assertEquals("Couldn't start that. Try again in a moment.", ShadowToast.getTextOfLatestToast());
                assertEquals(ReleaseCheck.idleSummary(), String.valueOf(checkNow.getSummary()));
            }
            ReleaseCheckForTests.settle();
            assertTrue("nothing was asked while the queue was full", github.asked.isEmpty());

            // And it works once the queue has room.
            github.then(Reply.release("v0.2.0", null));
            checkNow.getOnPreferenceClickListener().onPreferenceClick(checkNow);
            ReleaseCheckForTests.settle();
            assertEquals(1, github.asked.size());
            assertEquals(NEWER, String.valueOf(checkNow.getSummary()));
        }
    }

    // ---- The screen ----------------------------------------------------------------------------

    @Test
    public void everyBuildHasTheSwitchAndCheckNowAboveThePauseRow() {
        PatchFamily.inBuildForTests = EnumSet.noneOf(PatchFamily.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = rows(open(controller));
            int toggle = indexOf(rows, Settings.CHECK_FOR_RELEASES.key);
            int checkNow = indexOf(rows, HushfacebookPreferenceFragment.CHECK_NOW);
            int pause = indexOf(rows, BaseSettings.PAUSED.key);
            assertTrue("no release check switch in a build with no patches", toggle >= 0);
            assertTrue(rows.get(toggle) instanceof SwitchPreference);
            assertFalse("the switch starts on", ((SwitchPreference) rows.get(toggle)).isChecked());
            assertEquals("Check now sits under its switch", toggle + 1, checkNow);
            assertTrue("the release check is drawn below the Pause row", checkNow < pause);
            assertEquals(ReleaseCheck.idleSummary(), String.valueOf(rows.get(checkNow).getSummary()));
            assertEquals(-1, indexOf(rows, Settings.STOP_UPDATE_PROMPTS.key));
        }

        // With Stop update prompts in the build, Facebook's own prompts come first under Updates.
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.UPDATE_PROMPTS);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            List<Preference> rows = rows(open(controller));
            assertEquals(indexOf(rows, Settings.STOP_UPDATE_PROMPTS.key) + 1, indexOf(rows, Settings.CHECK_FOR_RELEASES.key));
        }
    }

    @Test
    public void checkNowSaysItsCheckingThenTheCardAndTheRowNameTheNewerRelease() throws Exception {
        CountDownLatch hold = new CountDownLatch(1);
        github.onRequest = () -> {
            try {
                assertTrue(hold.await(10, TimeUnit.SECONDS));
            } catch (InterruptedException interrupted) {
                throw new AssertionError(interrupted);
            }
        };
        github.then(Reply.release("v0.2.0", NOTES_0_1_8.replace("580.0.0.51.74 and 577.0.0.50.72", "580.0.0.51.74")));
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = open(controller);
            Preference card = rows(page).get(0);
            Preference checkNow = page.findPreference(HushfacebookPreferenceFragment.CHECK_NOW);
            String before = String.valueOf(card.getSummary());
            assertFalse(before, before.contains("\n"));

            try {
                checkNow.getOnPreferenceClickListener().onPreferenceClick(checkNow);
                assertEquals("Checking GitHub now.", String.valueOf(checkNow.getSummary()));
            } finally {
                hold.countDown();
            }
            ReleaseCheckForTests.settle();

            assertEquals(NEWER, String.valueOf(checkNow.getSummary()));
            assertEquals(before + "\n" + NEWER, String.valueOf(card.getSummary()));
        }

        // A screen opened later says so too, with no new try, and so does a paused one.
        github.onRequest = null;
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = open(controller);
            assertTrue(String.valueOf(rows(page).get(0).getSummary()).endsWith("\n" + NEWER));
            assertEquals(NEWER, String.valueOf(page.findPreference(HushfacebookPreferenceFragment.CHECK_NOW).getSummary()));
        }
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Preference card = rows(open(controller)).get(0);
            assertEquals("Hushfacebook is paused", String.valueOf(card.getTitle()));
            assertTrue(String.valueOf(card.getSummary()).endsWith("\n" + NEWER));
        }
        assertEquals(1, github.asked.size());
    }

    @Test
    public void aSettingsFileNeverCarriesTheCheck() throws Exception {
        Settings.CHECK_FOR_RELEASES.save(true);
        String file = SettingsBackup.create();
        assertFalse(file, file.contains(Settings.CHECK_FOR_RELEASES.key));

        Settings.CHECK_FOR_RELEASES.save(false);
        String turnsItOn = "{\"format\":\"hushfacebook-settings\",\"schema\":1,\"settings\":{\""
                + Settings.CHECK_FOR_RELEASES.key + "\":true}}";
        SettingsBackup.Snapshot snapshot = SettingsBackup.parse(turnsItOn);
        assertEquals("the check is an entry the import doesn't know", 1, snapshot.unknown);
        assertEquals(0, snapshot.changes().size());
        SettingsBackup.apply(snapshot);
        assertFalse(Settings.CHECK_FOR_RELEASES.savedValue());
    }

    // ---- The diagnostic report -----------------------------------------------------------------

    @Test
    public void theReportSaysWhatTheCheckDidAndNothingWhenItNeverRan() {
        assertEquals("a phone that never checked has nothing to say", Collections.emptyList(),
                ReleaseCheck.reportLines(false));
        Settings.CHECK_FOR_RELEASES.save(true);
        assertEquals(Collections.singletonList("switch: hushfacebook_check_releases=on"), ReleaseCheck.reportLines(false));

        github.then(Reply.release("v0.2.0", "This release targets Facebook 582.0.0.40.70."));
        ReleaseCheck.run(NOW);
        List<String> lines = ReleaseCheck.reportLines(false);
        assertEquals(Arrays.asList(
                "switch: hushfacebook_check_releases=on",
                "last try: 2026-09-21 14:13 UTC, result: ok",
                "latest release: 0.2.0, targets Facebook 582.0.0.40.70"), lines);
        assertEquals("switch: disabled while paused (saved hushfacebook_check_releases=on)",
                ReleaseCheck.reportLines(true).get(0));

        // Through the export, whole: a paused process always makes a report.
        LogBufferManager.registerReportSection(ReleaseCheck.REPORT);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("\n[RELEASE CHECK]\n"));
        for (String line : ReleaseCheck.reportLines(true)) {
            assertTrue("the export changed or lost \"" + line + "\":\n" + report, report.contains("\n" + line + "\n"));
        }
    }

    // ---- Reading versions ----------------------------------------------------------------------

    @Test
    public void targetsAreReadTheWaysReleaseNotesSayThem() {
        // The bundle index's description, the GitHub release's notes and the changelog.
        assertEquals("580.0.0.51.74", ReleaseCheck.targetIn("Hushfacebook v0.1.8 targets Facebook 580.0.0.51.74 "
                + "(com.facebook.katana), and 577.0.0.50.72 still works.\n\nClean up Reels now takes the Follow button off."));
        assertEquals("580.0.0.51.74", ReleaseCheck.targetIn(NOTES_0_1_8));
        assertEquals("580.0.0.51.74", ReleaseCheck.targetIn("* **Facebook:** The 22 patches target Facebook "
                + "580.0.0.51.74 and 577.0.0.50.72. Morphe Manager 1.32.0 or newer is required."));
        assertEquals("580.0.0.51.74", ReleaseCheck.targetIn("- All 13 patches applied to Facebook 580.0.0.51.74 and "
                + "577.0.0.50.72 without forced compatibility mode or manifest changes."));
        // The newest version the sentence names, whichever comes first.
        assertEquals("580.0.0.51.74", ReleaseCheck.targetIn("It targets Facebook 577.0.0.50.72 and 580.0.0.51.74."));
        // The first sentence that says so counts.
        assertEquals("582.0.0.40.70", ReleaseCheck.targetIn("This targets Facebook 582.0.0.40.70. It no longer "
                + "targets Facebook 583.0.0.1.1, oddly."));

        assertNull(ReleaseCheck.targetIn(""));
        assertNull(ReleaseCheck.targetIn("Facebook 580.0.0.51.74 broke the reel button."));
        assertNull(ReleaseCheck.targetIn("It targets Facebook users who post reels."));
        assertNull("a version in the next sentence isn't a target",
                ReleaseCheck.targetIn("This release targets Facebook. 582.0.0.40.70 is out too."));
        assertNull("a version code isn't a version", ReleaseCheck.targetIn("It targets Facebook (vc 475019344)."));
        assertNull(ReleaseCheck.targetIn("Checked on a Galaxy S22 with Android 16."));
    }

    @Test
    public void versionsCompareByTheirNumbers() {
        assertTrue(ReleaseCheck.compare("0.1.10", "0.1.9") > 0);
        assertTrue(ReleaseCheck.compare("0.2.0", "0.1.8") > 0);
        assertTrue(ReleaseCheck.compare("0.1.7", "0.1.8") < 0);
        assertEquals(0, (int) ReleaseCheck.compare("0.1.8", "v0.1.8"));
        assertEquals(0, (int) ReleaseCheck.compare("1.0", "1.0.0"));
        assertTrue("a pre-release comes before its release", ReleaseCheck.compare("0.2.0-dev", "0.2.0") < 0);
        assertTrue(ReleaseCheck.compare("0.2.0", "0.2.0-dev") > 0);
        assertTrue(ReleaseCheck.compare("0.2.0-dev", "0.1.8") > 0);
        assertTrue(ReleaseCheck.compare("580.0.0.51.74", "577.0.0.50.72") > 0);
        assertNull(ReleaseCheck.compare("", "0.1.8"));
        assertNull(ReleaseCheck.compare("Unknown", "0.1.8"));
        assertNull(ReleaseCheck.compare(null, "0.1.8"));

        assertEquals("0.2.0", ReleaseCheck.versionOfTag("v0.2.0"));
        assertEquals("0.2.0", ReleaseCheck.versionOfTag("0.2.0"));
        assertEquals("0.2.0-beta.1", ReleaseCheck.versionOfTag("v0.2.0-beta.1"));
        assertEquals("0.2.0", ReleaseCheck.versionOfTag(" v0.2.0\n"));
        assertNull(ReleaseCheck.versionOfTag("latest"));
        assertNull(ReleaseCheck.versionOfTag("v0.2.0 is out"));
        assertNull(ReleaseCheck.versionOfTag("v"));
    }

    // ---- Cookies -------------------------------------------------------------------------------

    /**
     * Facebook 580 makes a java.net.CookieManager the process's default, and HttpURLConnection puts
     * what the default offers on every request, so the transport asks it first.
     */
    @Test
    public void aRequestCarriesNoCookieWhateverThePhoneKeeps() throws Exception {
        URI api = URI.create(ReleaseCheck.LATEST_RELEASE);
        assertNull(ReleaseTransport.cookieRefusal(null, api));

        // A cookie an answer from GitHub left behind is dropped, and the request carries none.
        CookieManager manager = new CookieManager();
        HttpCookie left = new HttpCookie("_gh_sess", "x");
        left.setDomain("api.github.com");
        left.setPath("/");
        left.setVersion(0);
        manager.getCookieStore().add(api, left);
        assertEquals("the control: the manager would have added it", Collections.singletonList("_gh_sess=x"),
                manager.get(api, Collections.<String, List<String>>emptyMap()).get("Cookie"));
        assertNull(ReleaseTransport.cookieRefusal(manager, api));
        assertTrue(manager.getCookieStore().get(api).isEmpty());
        assertTrue(manager.get(api, Collections.<String, List<String>>emptyMap()).get("Cookie").isEmpty());

        // Facebook's own cookies stay where they are.
        URI facebook = URI.create("https://www.facebook.com/");
        HttpCookie session = new HttpCookie("c_user", "1");
        session.setDomain(".facebook.com");
        session.setPath("/");
        session.setVersion(0);
        manager.getCookieStore().add(facebook, session);
        assertNull(ReleaseTransport.cookieRefusal(manager, api));
        assertEquals(1, manager.getCookieStore().get(facebook).size());

        // A handler that would still add one stops the request, and one that adds none doesn't.
        assertNotNull(ReleaseTransport.cookieRefusal(handler(Collections.singletonMap("Cookie",
                Collections.singletonList("a=b"))), api));
        assertNotNull(ReleaseTransport.cookieRefusal(handler(Collections.singletonMap("cookie2",
                Collections.singletonList("$Version=1"))), api));
        assertNull(ReleaseTransport.cookieRefusal(handler(Collections.singletonMap("Cookie",
                Collections.<String>emptyList())), api));
        assertNull(ReleaseTransport.cookieRefusal(handler(Collections.<String, List<String>>emptyMap()), api));
    }

    private static CookieHandler handler(Map<String, List<String>> adds) {
        return new CookieHandler() {
            @Override
            public Map<String, List<String>> get(URI uri, Map<String, List<String>> headers) {
                return adds;
            }

            @Override
            public void put(URI uri, Map<String, List<String>> headers) {
            }
        };
    }

    // ---- Helpers -------------------------------------------------------------------------------

    private static java.net.URL url(String text) {
        try {
            return new java.net.URL(text);
        } catch (java.net.MalformedURLException malformed) {
            throw new AssertionError(malformed);
        }
    }

    private static HushfacebookPreferenceFragment open(ActivityController<Activity> controller) {
        HushfacebookPreferenceFragment page = new HushfacebookPreferenceFragment();
        controller.get().getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
        return page;
    }

    private static List<Preference> rows(HushfacebookPreferenceFragment page) {
        List<Preference> rows = new ArrayList<>();
        collect(page.getPreferenceScreen(), rows);
        return rows;
    }

    private static void collect(PreferenceGroup group, List<Preference> rows) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference preference = group.getPreference(i);
            if (preference instanceof PreferenceGroup) collect((PreferenceGroup) preference, rows);
            else rows.add(preference);
        }
    }

    private static int indexOf(List<Preference> rows, String key) {
        for (int i = 0; i < rows.size(); i++) {
            if (key.equals(rows.get(i).getKey())) return i;
        }
        return -1;
    }
}
