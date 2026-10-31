package app.hushmessenger.extension;

import android.net.Uri;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.widget.Switch;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.Shadows;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35)
public class SettingsTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.hookErrors.clear();
        Settings.metaAiTab = null;
        CrashGuard.resetForTests();
    }

    @Test public void theMetaAiTabKeepsItsFirstAnswerUntilARestart() {
        assertFalse(Settings.hideMetaAiTab());
        Settings.preferences.edit().putBoolean("meta_ai", true).commit();
        assertTrue(Settings.hideMetaAi());
        assertFalse(Settings.hideMetaAiTab());
        Settings.metaAiTab = null;
        assertTrue(Settings.hideMetaAiTab());
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertFalse(Settings.hideMetaAi());
        assertTrue(Settings.hideMetaAiTab());
    }

    @Test public void metaAiMentionRowsReadAsDisabledOnlyWhileTheSwitchIsOn() {
        Object enabled = new Object();
        Object disabled = new Object();
        assertSame(enabled, Settings.hideMetaAiRow(enabled, disabled));
        assertNull(Settings.hideMetaAiRow(null, disabled));
        Settings.preferences.edit().putBoolean("meta_ai", true).commit();
        assertSame(disabled, Settings.hideMetaAiRow(enabled, disabled));
        assertSame(disabled, Settings.hideMetaAiRow(null, disabled));
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertSame(enabled, Settings.hideMetaAiRow(enabled, disabled));
    }

    @Test public void theSearchHintDropsMetaAiOnlyWhileTheSwitchIsOn() {
        assertTrue(Settings.metaAiSearchHint(true));
        assertFalse(Settings.metaAiSearchHint(false));
        Settings.preferences.edit().putBoolean("meta_ai", true).commit();
        assertFalse(Settings.metaAiSearchHint(true));
        assertFalse(Settings.metaAiSearchHint(false));
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertTrue(Settings.metaAiSearchHint(true));
    }

    @Test public void allControlsPreserveStockUntilEnabled() {
        assertFalse(Settings.hideStories());
        assertFalse(Settings.hideFacebook());
        assertFalse(Settings.hideMetaAi());
        assertFalse(Settings.suppressTyping());
        assertFalse(Settings.enableBubbles());
        assertTrue(Settings.showSubtabs(true));
        assertFalse(Settings.showSubtabs(false));
        assertTrue(Settings.preferExternalBrowser(true, Uri.parse("https://example.com")));
        assertFalse(Settings.preferExternalBrowser(false, Uri.parse("https://example.com")));
    }

    @Test public void switchesAreIndependentAndPausePreservesChoices() {
        Settings.preferences.edit().putBoolean("stories", true).putBoolean("typing", true).apply();
        assertTrue(Settings.hideStories());
        assertTrue(Settings.suppressTyping());
        assertFalse(Settings.hideFacebook());
        Settings.preferences.edit().putBoolean("paused", true).apply();
        assertFalse(Settings.hideStories());
        assertFalse(Settings.suppressTyping());
        assertTrue(Settings.preferences.getBoolean("stories", false));
        Settings.preferences.edit().putBoolean("paused", false).apply();
        assertTrue(Settings.hideStories());
    }

    /** The recaller's answer: true keeps the unsent message in its notification, and only Keep unsent messages asks for that. */
    @Test @Config(sdk = {28, 36}) public void theRecallerKeepsTheNotificationOnlyWithKeepUnsentOn() {
        Settings.activeAt.clear();
        Settings.preferences.edit().putBoolean("keep_unsent", false).commit();
        assertFalse(Settings.unsentRecall("mid.1"));
        assertEquals(0, Settings.lastActive("keep_unsent"));
        Settings.preferences.edit().putBoolean("keep_unsent", true).commit();
        assertFalse(Settings.unsentRecall(null));
        assertFalse(Settings.unsentRecall(""));
        assertTrue(Settings.unsentRecall("mid.1"));
        assertTrue(Settings.isKeptUnsent("mid.1"));
        assertTrue(Settings.lastActive("keep_unsent") > 0);
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertFalse(Settings.unsentRecall("mid.2"));
        Settings.preferences.edit().putBoolean("paused", false).commit();
    }

    @Test @Config(sdk = {28, 36}) public void legacyUnsendHelpersRetainAndLabelOnlyRecordedMessages() {
        Settings.activeAt.clear();
        Settings.preferences.edit().putBoolean("keep_unsent", true).commit();
        assertTrue(Settings.keepUnsent());
        assertEquals("Eligibility is not an interception", 0, Settings.lastActive("keep_unsent"));
        assertEquals("ordinary text", Settings.labelKeptUnsent("ordinary text", "other-message"));
        assertTrue(Settings.suppressUnsent(true, "other-message"));
        assertEquals("Ordinary message reads are not interceptions", 0, Settings.lastActive("keep_unsent"));
        Settings.recordUnsent("retained-message");
        assertTrue(Settings.lastActive("keep_unsent") > 0);
        Settings.recordUnsent(null);
        Settings.recordUnsent("");
        assertEquals(java.util.Set.of("retained-message"), Settings.preferences.getStringSet("kept_unsent_ids", java.util.Set.of()));
        assertTrue(Settings.isKeptUnsent("retained-message"));
        assertFalse(Settings.isKeptUnsent(null));
        assertEquals("[unsent] original text", Settings.labelKeptUnsent("original text", "retained-message"));
        assertEquals("ordinary text", Settings.labelKeptUnsent("ordinary text", "other-message"));
        assertNull(Settings.labelKeptUnsent(null, "retained-message"));
        assertFalse(Settings.suppressUnsent(true, "retained-message"));
        assertFalse(Settings.suppressUnsent(false, "retained-message"));
        assertTrue(Settings.suppressUnsent(true, "other-message"));
        for (String disabled : new String[] {"paused", "keep_unsent"}) {
            Settings.preferences.edit().putBoolean(disabled, "paused".equals(disabled)).commit();
            assertFalse(Settings.keepUnsent());
            assertEquals("original text", Settings.labelKeptUnsent("original text", "retained-message"));
            assertTrue(Settings.suppressUnsent(true, "retained-message"));
            assertFalse(Settings.suppressUnsent(false, "retained-message"));
            assertTrue(Settings.isKeptUnsent("retained-message"));
            Settings.preferences.edit().putBoolean("paused", false).commit();
        }
    }

    @Test @Config(sdk = {28, 36}) public void unsentIdsAreBoundedWithoutTakingTheSettingsMonitor() throws Exception {
        Settings.preferences.edit().putBoolean("keep_unsent", true).commit();
        Settings.keepUnsent();
        var legacy = new java.util.HashSet<String>();
        for (int i = 0; i < 5000; i++) legacy.add("old-" + i);
        Settings.preferences.edit().putStringSet("kept_unsent_ids", legacy).commit();
        var finished = new java.util.concurrent.CountDownLatch(1);
        Thread writer = new Thread(() -> {
            try { Settings.recordUnsent("old-0"); } finally { finished.countDown(); }
        });
        try {
            synchronized (Settings.class) {
                writer.start();
                assertTrue("Recording must not acquire the UI/settings monitor", finished.await(3, java.util.concurrent.TimeUnit.SECONDS));
            }
        } finally { writer.join(5000); }
        assertFalse(writer.isAlive());
        assertEquals(4096, Settings.preferences.getStringSet("kept_unsent_ids", java.util.Set.of()).size());
        assertTrue(Settings.isKeptUnsent("old-0"));
        for (int i = 0; i < 10; i++) {
            Settings.recordUnsent("new-" + i);
            assertEquals(4096, Settings.preferences.getStringSet("kept_unsent_ids", java.util.Set.of()).size());
            assertTrue(Settings.isKeptUnsent("new-" + i));
        }
    }

    @Test @Config(sdk = {28, 36}) public void retainedUnsendChoiceSurvivesRestartWithoutClaimingChatCoverage() {
        Settings.preferences.edit().putBoolean("keep_unsent", true).commit();
        Settings.recordUnsent("retained-message");
        Settings.preferences = null;
        Settings.activeAt.clear();
        Settings.initialize(RuntimeEnvironment.getApplication());
        assertTrue(Settings.preferences.getBoolean("keep_unsent", false));
        assertTrue(Settings.isKeptUnsent("retained-message"));
        assertEquals(0, Settings.lastActive("keep_unsent"));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            var root = screen.get().getWindow().getDecorView();
            Switch choice = root.findViewWithTag("keep_unsent");
            assertTrue(choice.isChecked());
            String spoken = choice.getContentDescription().toString();
            assertTrue(spoken.contains("after someone unsends them"));
            assertTrue(spoken.contains("In encrypted chats the message stays in its notification instead"));
            assertTrue(spoken.contains("Group chats aren't tested"));
            assertTrue(spoken.contains("Your own unsends may be limited"));
            assertEquals("On. No unsent message received yet",
                ((android.widget.TextView) root.findViewWithTag("active_keep_unsent")).getText().toString());
        }
        assertEquals("[unsent] original text", Settings.labelKeptUnsent("original text", "retained-message"));
        assertFalse(Settings.suppressUnsent(true, "retained-message"));
        assertEquals("Reading an old retained message is not a new interception", 0, Settings.lastActive("keep_unsent"));
    }

    @Test @Config(sdk = {28, 36}) public void concurrentUnsendIdentifiersSurviveADiskReload() throws Exception {
        Settings.preferences.edit().putBoolean("keep_unsent", true)
            .putStringSet("kept_unsent_ids", java.util.Set.of("from-old-version")).commit();
        assertTrue(Settings.keepUnsent());
        java.util.concurrent.CountDownLatch start = new java.util.concurrent.CountDownLatch(1);
        java.util.concurrent.atomic.AtomicReference<Throwable> failure = new java.util.concurrent.atomic.AtomicReference<>();
        Thread[] workers = new Thread[100];
        java.util.Set<String> expected = new java.util.HashSet<>(java.util.Set.of("from-old-version", "shared-message"));
        for (int i = 0; i < workers.length; i++) {
            String id = "message-" + i;
            expected.add(id);
            workers[i] = new Thread(() -> {
                try {
                    start.await();
                    Settings.recordUnsent(id);
                    Settings.recordUnsent("shared-message");
                    Settings.recordUnsent(id);
                } catch (Throwable error) { failure.compareAndSet(null, error); }
            });
            workers[i].start();
        }
        start.countDown();
        for (Thread worker : workers) {
            worker.join(10_000);
            assertFalse("Writer finished", worker.isAlive());
        }
        assertNull(failure.get());
        assertEquals(expected, Settings.preferences.getStringSet("kept_unsent_ids", java.util.Set.of()));
        assertTrue(Settings.preferences.edit().commit());
        java.io.File file = new java.io.File(RuntimeEnvironment.getApplication().getApplicationInfo().dataDir,
            "shared_prefs/hushmessenger.xml");
        assertTrue(file.isFile());
        // A new framework instance reads the actual file instead of Context's cached in-memory preferences.
        var constructor = Class.forName("android.app.SharedPreferencesImpl").getDeclaredConstructor(java.io.File.class, int.class);
        constructor.setAccessible(true);
        var reloaded = (android.content.SharedPreferences) constructor.newInstance(file, Context.MODE_PRIVATE);
        assertNotSame(Settings.preferences, reloaded);
        Settings.preferences = reloaded;
        assertEquals(expected, reloaded.getStringSet("kept_unsent_ids", java.util.Set.of()));
        assertTrue(reloaded.getBoolean("keep_unsent", false));
        assertFalse(Settings.suppressUnsent(true, "from-old-version"));
        assertEquals("[unsent] text", Settings.labelKeptUnsent("text", "message-99"));
    }

    @Test @Config(sdk = {28, 36}) public void inactiveUnsendCallsAddNothingAndKeepStockBehavior() {
        for (String inactive : new String[] {"off", "paused", "safe_mode", "uninstalled"}) {
            Settings.installed = "uninstalled".equals(inactive) ? java.util.Set.of() : java.util.Set.of("keep_unsent");
            Settings.preferences.edit().clear().putBoolean("keep_unsent", !"off".equals(inactive))
                .putBoolean("paused", "paused".equals(inactive)).putBoolean("safe_mode", "safe_mode".equals(inactive))
                .putStringSet("kept_unsent_ids", java.util.Set.of("existing-message")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            Settings.recordUnsent("must-not-be-added");
            assertEquals(inactive, java.util.Set.of("existing-message"), Settings.preferences.getStringSet("kept_unsent_ids", java.util.Set.of()));
            assertEquals("text", Settings.labelKeptUnsent("text", "existing-message"));
            assertTrue(Settings.suppressUnsent(true, "existing-message"));
            assertFalse(Settings.suppressUnsent(false, "existing-message"));
        }
    }

    @Test public void encryptedTypingFlagDropsOnlyWhileTheSwitchIsOn() {
        assertTrue(Settings.outgoingTyping(true));
        assertFalse(Settings.outgoingTyping(false));
        Settings.preferences.edit().putBoolean("typing", true).apply();
        assertFalse(Settings.outgoingTyping(true));
        assertFalse(Settings.outgoingTyping(false));
        Settings.preferences.edit().putBoolean("paused", true).apply();
        assertTrue(Settings.outgoingTyping(true));
    }

    @Test public void browserOverrideOnlyUsesStockPreferenceForWebSchemes() {
        Settings.preferences.edit().putBoolean("external_browser", true).apply();
        assertTrue(Settings.preferExternalBrowser(false, Uri.parse("HTTPS://example.com/a?signature=kept")));
        assertTrue(Settings.preferExternalBrowser(false, Uri.parse("http://example.com")));
        for (String url : new String[] {"fb-messenger://thread/1", "intent://example", "file:///a", "mailto:a@example.com", "relative/path"}) {
            assertFalse(Settings.preferExternalBrowser(false, Uri.parse(url)));
            assertTrue(Settings.preferExternalBrowser(true, Uri.parse(url)));
        }
        assertFalse(Settings.preferExternalBrowser(false, null));
    }

    @Test public void peopleSectionKeepsMessengersOwnHideChoiceAndPauses() {
        assertFalse(Settings.hidePeopleSection(false));
        assertTrue(Settings.hidePeopleSection(true));
        assertTrue(Settings.keepPeopleSection(true));
        assertFalse(Settings.keepPeopleSection(false));
        Settings.preferences.edit().putBoolean("people", true).apply();
        assertTrue(Settings.hidePeopleSection(false));
        assertFalse(Settings.keepPeopleSection(true));
        Settings.preferences.edit().putBoolean("paused", true).apply();
        assertFalse(Settings.hidePeopleSection(false));
        assertTrue(Settings.hidePeopleSection(true));
        assertTrue(Settings.keepPeopleSection(true));
    }

    @Test public void pauseRestoresBrowserAndSubtabsExactly() {
        Settings.preferences.edit().putBoolean("external_browser", true).putBoolean("subtabs", true).apply();
        assertFalse(Settings.showSubtabs(true));
        Settings.preferences.edit().putBoolean("paused", true).apply();
        assertTrue(Settings.showSubtabs(true));
        assertFalse(Settings.showSubtabs(false));
        assertFalse(Settings.preferExternalBrowser(false, Uri.parse("https://example.com")));
    }

    @Test @Config(sdk = 28) public void bubbleOverrideDoesNotPretendAndroidNineSupportsBubbles() {
        Settings.preferences.edit().putBoolean("bubbles", true).apply();
        assertFalse(Settings.enableBubbles());
    }

    @Test public void supportedAndroidCanOptInToBubbleEligibility() {
        Settings.preferences.edit().putBoolean("bubbles", true).apply();
        assertTrue(Settings.enableBubbles());
    }

    @Test public void anUninitializedSecondaryProcessKeepsStockBehavior() {
        Settings.preferences = null;
        assertFalse(Settings.hideStories());
        assertFalse(Settings.suppressTyping());
        assertTrue(Settings.showSubtabs(true));
    }

    @Test public void screenChangesPersistAndAreReadableByHooks() {
        try (var controller = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Switch stories = controller.get().getWindow().getDecorView().findViewWithTag("stories");
            assertNotNull(stories);
            assertFalse(stories.isChecked());
            stories.performClick();
            assertTrue(Settings.hideStories());
            Switch pause = controller.get().getWindow().getDecorView().findViewWithTag("paused");
            pause.performClick();
            assertFalse(Settings.hideStories());
        }
        try (var controller = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Switch stories = controller.get().getWindow().getDecorView().findViewWithTag("stories");
            assertTrue(stories.isChecked());
        }
    }

    /** Shaped like Messenger's Menu tab folder row: context, key, metadata, badge and one title. */
    static class FakeDrawerFolderKey {
        final String name;
        FakeDrawerFolderKey(String name) { this.name = name; }
    }

    static final class FakeSettingsFolderKey extends FakeDrawerFolderKey {
        FakeSettingsFolderKey() { super("settings"); }
    }

    /** Messenger keeps folder metadata such as the unseen badge count in one Map. */
    static final class FakeHeterogeneousMap {
        final java.util.Map<Object, Object> entries;
        FakeHeterogeneousMap(java.util.Map<Object, Object> entries) { this.entries = entries; }
    }

    static final class FolderRow {
        final Context context;
        final FakeDrawerFolderKey key;
        final FakeHeterogeneousMap metadata;
        final Integer badge;
        final String title;
        FolderRow(Context context, FakeDrawerFolderKey key, FakeHeterogeneousMap metadata, Integer badge, String title) {
            this.context = context;
            this.key = key;
            this.metadata = metadata;
            this.badge = badge;
            this.title = title;
        }
    }

    static final class TwoTitleRow {
        final String first = "Settings";
        final String second = "Subtitle";
    }

    @Test public void menuSettingsRowCopiesTheFolderRowWithoutItsKeyOrBadge() {
        var application = RuntimeEnvironment.getApplication();
        FakeDrawerFolderKey key = new FakeSettingsFolderKey();
        FakeHeterogeneousMap metadata = new FakeHeterogeneousMap(new java.util.HashMap<>(java.util.Map.of("badge", 3)));
        FolderRow settings = new FolderRow(application, key, metadata, 3, "Settings");
        java.util.ArrayList<Object> rows = new java.util.ArrayList<>(java.util.List.of(settings));
        Settings.addMenuSettingsEntry(rows);
        assertEquals(2, rows.size());
        assertSame(settings, rows.get(0));
        assertEquals("Settings", settings.title);
        assertSame(metadata, settings.metadata);
        assertEquals(java.util.Map.of("badge", 3), metadata.entries);
        FolderRow hush = (FolderRow) rows.get(1);
        assertEquals("HushMessenger", hush.title);
        assertNull(hush.badge);
        assertSame(application, hush.context);
        assertNotSame(key, hush.key);
        assertEquals(FakeSettingsFolderKey.class, hush.key.getClass());
        assertNotSame(metadata, hush.metadata);
        assertTrue(hush.metadata.entries.isEmpty());
    }

    @Test public void menuSettingsRowFollowsSettingsWhenTheQrCodeRowSharesTheList() {
        var application = RuntimeEnvironment.getApplication();
        FolderRow settings = new FolderRow(application, new FakeSettingsFolderKey(), null, null, "Settings");
        FolderRow qrCode = new FolderRow(application, new FakeDrawerFolderKey("qr_code"), null, null, "QR code");
        java.util.ArrayList<Object> rows = new java.util.ArrayList<>(java.util.List.of(settings, qrCode));
        Settings.addMenuSettingsEntry(rows);
        assertEquals(3, rows.size());
        assertSame(settings, rows.get(0));
        assertEquals("HushMessenger", ((FolderRow) rows.get(1)).title);
        assertEquals(FakeSettingsFolderKey.class, ((FolderRow) rows.get(1)).key.getClass());
        assertSame(qrCode, rows.get(2));
        // Without its Settings row the list gets no copy, so the QR code row is never relabeled.
        java.util.ArrayList<Object> qrOnly = new java.util.ArrayList<>(java.util.List.of(qrCode));
        Settings.addMenuSettingsEntry(qrOnly);
        assertEquals(java.util.List.of(qrCode), qrOnly);
    }

    /** #22: both menus lose the row only while Hide the Menu row is on and the long-press shortcut has proved itself. */
    @Test public void hideTheMenuRowNeedsTheShortcutToHaveOpenedSettingsAndStillBeThere() {
        var application = RuntimeEnvironment.getApplication();
        java.util.List<Object> side = java.util.List.of(new Object(), new Object());
        try {
            HostScreensTest.answerControlsShortcut(true);
            Settings.preferences.edit().putBoolean("hide_menu_row", true).commit();
            assertEquals("not opened from the shortcut yet", 2, menuRows(application).size());
            Settings.noteShortcutUsed();
            assertEquals(1, menuRows(application).size());
            assertSame(side, Settings.addMenuDrawerEntry(side));
            HostScreensTest.answerControlsShortcut(false);
            assertEquals("the shortcut went missing", 2, menuRows(application).size());
            HostScreensTest.answerControlsShortcut(true);
            Settings.preferences.edit().putBoolean("hide_menu_row", false).commit();
            assertEquals(2, menuRows(application).size());
            assertTrue(Settings.hookErrors.isEmpty());
        } finally {
            HostScreens.controlsShortcut = null;
        }
    }

    private static java.util.ArrayList<Object> menuRows(Context context) {
        java.util.ArrayList<Object> rows = new java.util.ArrayList<>(
            java.util.List.of(new FolderRow(context, new FakeSettingsFolderKey(), null, null, "Settings")));
        Settings.addMenuSettingsEntry(rows);
        return rows;
    }

    @Test public void menuSettingsRowLeavesListsItCannotLabelAlone() {
        java.util.ArrayList<Object> rows = new java.util.ArrayList<>(java.util.List.of(new TwoTitleRow()));
        Settings.addMenuSettingsEntry(rows);
        assertEquals(1, rows.size());
        java.util.ArrayList<Object> empty = new java.util.ArrayList<>();
        Settings.addMenuSettingsEntry(empty);
        assertTrue(empty.isEmpty());
        Settings.addMenuSettingsEntry(null);
    }

    @Test public void onlyTheHushCopyOfTheSettingsRowOpensSettings() {
        var application = RuntimeEnvironment.getApplication();
        FolderRow settings = new FolderRow(application, new FakeSettingsFolderKey(), null, null, "Settings");
        assertSame(settings, Settings.drawerFolderClicked(settings));
        // A community or folder that happens to use the same name keeps Messenger's handling.
        FolderRow namesake = new FolderRow(application, new FakeDrawerFolderKey("community"), null, null, "HushMessenger");
        assertSame(namesake, Settings.drawerFolderClicked(namesake));
        assertNull(Shadows.shadowOf(application).getNextStartedActivity());
        FolderRow hush = new FolderRow(application, new FakeSettingsFolderKey(), null, null, "HushMessenger");
        assertNull(Settings.drawerFolderClicked(hush));
        Intent launched = Shadows.shadowOf(application).getNextStartedActivity();
        assertEquals(SettingsActivity.class.getName(), launched.getComponent().getClassName());
        assertEquals(application.getPackageName(), launched.getComponent().getPackageName());
        assertTrue((launched.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
    }

    /** Shaped like Messenger's keyboard tab: an activate event plus int icon and label fields. */
    static final class KeyboardTab {
        final Object event;
        final int icon = 7;
        KeyboardTab(Object event) { this.event = event; }
    }

    @Test public void avatarTabLeavesTheStickerKeyboardOnlyWhileTheSwitchIsOn() {
        KeyboardTab emoji = new KeyboardTab(new Object());
        KeyboardTab avatar = new KeyboardTab(new com.facebook.xapp.messaging.composer.avatar.composertab.event.ActivateAvatarSticker());
        KeyboardTab gifs = new KeyboardTab("gifs");
        java.util.List<Object> tabs = new java.util.ArrayList<>(java.util.List.of(emoji, avatar, gifs));
        Settings.preferences.edit().putBoolean("avatar_stickers", true).putBoolean("paused", true).apply();
        Settings.removeAvatarTabs(tabs);
        assertEquals(3, tabs.size());
        Settings.preferences.edit().putBoolean("paused", false).apply();
        Settings.removeAvatarTabs(tabs);
        assertEquals(java.util.List.of(emoji, gifs), tabs);
    }

    /** Messenger draws emoji on several threads at once, and the font is loaded once for all of them. */
    @Test public void threadsThatAskForTheSystemEmojiFontTogetherGetOneTypeface() throws Exception {
        String font = Settings.systemEmojiFont;
        java.util.concurrent.ExecutorService threads = java.util.concurrent.Executors.newFixedThreadPool(8);
        try {
            // Robolectric's default Typeface stand-in loads any path, as a new typeface each time.
            Settings.systemEmojiFont = "/system/fonts/AnyColorEmoji.ttf";
            Settings.systemEmoji = null;
            Settings.systemEmojiMissing = false;
            Settings.preferences.edit().putBoolean("use_system_emoji", true).apply();
            java.util.concurrent.CyclicBarrier together = new java.util.concurrent.CyclicBarrier(8);
            java.util.List<java.util.concurrent.Future<android.graphics.Typeface>> asks = new java.util.ArrayList<>();
            for (int i = 0; i < 8; i++) asks.add(threads.submit(() -> {
                together.await(5, java.util.concurrent.TimeUnit.SECONDS);
                return Settings.systemEmojiTypeface();
            }));
            java.util.Set<android.graphics.Typeface> got = java.util.Collections.newSetFromMap(new java.util.IdentityHashMap<>());
            for (var ask : asks) got.add(ask.get(10, java.util.concurrent.TimeUnit.SECONDS));
            assertEquals(1, got.size());
            assertNotNull(got.iterator().next());
            assertEquals("/system/fonts/AnyColorEmoji.ttf", Settings.systemEmojiSource);
        } finally {
            threads.shutdownNow();
            Settings.systemEmojiFont = font;
            Settings.systemEmoji = null;
            Settings.systemEmojiMissing = false;
            Settings.systemEmojiSource = null;
        }
    }

    // Robolectric's default Typeface stand-in accepts any path; the native one fails on a missing file like a phone does.
    @org.robolectric.annotation.GraphicsMode(org.robolectric.annotation.GraphicsMode.Mode.NATIVE)
    @Test public void aSystemEmojiFontThatWontLoadIsTriedOnceAndStopsCountingAsAUse() throws Exception {
        String font = Settings.systemEmojiFont;
        try {
            Settings.systemEmojiFont = "/nonexistent/NoColorEmoji.ttf";
            Settings.systemEmoji = null;
            Settings.systemEmojiMissing = false;
            Settings.activeAt.clear();
            Settings.preferences.edit().putBoolean("use_system_emoji", true).apply();
            assertNull(Settings.systemEmojiTypeface());
            String failure = Settings.hookErrors.get("use_system_emoji");
            assertNotNull(failure);
            assertTrue(failure.contains(" at Settings.systemEmojiTypeface"));
            long used = Settings.lastActive("use_system_emoji");
            assertTrue(Settings.hookErrorAt("use_system_emoji") >= used);
            Thread.sleep(5);
            // Later draws neither load the font again (which would record a newer failure) nor count as a use.
            assertNull(Settings.systemEmojiTypeface());
            assertNull(Settings.systemEmojiTypeface());
            assertEquals(failure, Settings.hookErrors.get("use_system_emoji"));
            assertEquals(used, Settings.lastActive("use_system_emoji"));
        } finally {
            Settings.systemEmojiFont = font;
            Settings.systemEmoji = null;
            Settings.systemEmojiMissing = false;
        }
    }

    // #25: a phone's emoji font isn't always NotoColorEmoji.ttf (Samsung ships SamsungColorEmoji.ttf, emoji modules
    // and other phones use their own), so Android 12+ uses the font Android itself shapes emoji with.
    @org.robolectric.annotation.GraphicsMode(org.robolectric.annotation.GraphicsMode.Mode.NATIVE)
    @Test @Config(sdk = {31, 36}) public void systemEmojiUsesTheFontAndroidDrawsEmojiWith() {
        try {
            Settings.systemEmoji = null;
            Settings.systemEmojiMissing = false;
            Settings.systemEmojiSource = null;
            Settings.preferences.edit().putBoolean("use_system_emoji", true).apply();
            String probe = Settings.EMOJI_PROBE;
            java.io.File shaped = android.graphics.text.TextRunShaper.shapeTextRun(probe, 0, probe.length(), 0,
                probe.length(), 0f, 0f, false, new android.graphics.Paint()).getFont(0).getFile();
            assertNotNull(Settings.systemEmojiTypeface());
            assertNull(Settings.hookErrors.get("use_system_emoji"));
            assertEquals(shaped.getPath(), Settings.systemEmojiSource);
            assertNotEquals(Settings.NOTO_EMOJI_FONT, Settings.systemEmojiSource);
        } finally {
            Settings.systemEmoji = null;
            Settings.systemEmojiMissing = false;
            Settings.systemEmojiSource = null;
        }
    }

    // #34: the phone's emoji font has no glyph for Messenger's own Like (U+F0000), so Messenger's font sits behind it.
    @org.robolectric.annotation.GraphicsMode(org.robolectric.annotation.GraphicsMode.Mode.NATIVE)
    @Test @Config(sdk = {31, 36}) public void systemEmojiKeepsMessengersOwnLikeGlyph() throws Exception {
        assertMessengerLikeSurvives(null);
    }

    // Where Android 12+ can't say which font it shapes emoji with, the phone's font comes from a file path instead.
    @org.robolectric.annotation.GraphicsMode(org.robolectric.annotation.GraphicsMode.Mode.NATIVE)
    @Test @Config(sdk = 31) public void systemEmojiFromAFontFileKeepsMessengersOwnLikeGlyph() throws Exception {
        String probe = Settings.EMOJI_PROBE;
        assertMessengerLikeSurvives(android.graphics.text.TextRunShaper.shapeTextRun(probe, 0, probe.length(), 0,
            probe.length(), 0f, 0f, false, new android.graphics.Paint()).getFont(0).getFile().getPath());
    }

    private void assertMessengerLikeSurvives(String systemFontPath) throws Exception {
        // Paint loads the native graphics runtime; Typeface's static setup fails if it comes first.
        android.graphics.Paint paint = new android.graphics.Paint();
        java.io.File messengerFont = java.io.File.createTempFile("FacebookEmoji", ".ttf");
        // Not under a "fonts" resource folder: Robolectric copies Android's fonts from the first "fonts/" on the classpath.
        try (java.io.InputStream in = getClass().getResourceAsStream("/messenger-emoji/like-only.ttf")) {
            java.nio.file.Files.copy(in, messengerFont.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
        }
        String like = new String(Character.toChars(0xF0000));
        android.graphics.Typeface messenger = android.graphics.Typeface.createFromFile(messengerFont);
        String font = Settings.systemEmojiFont;
        try {
            resetEmoji();
            Settings.systemEmojiFont = systemFontPath;
            Settings.preferences.edit().putBoolean("use_system_emoji", false).apply();
            assertSame(messenger, Settings.systemEmojiTypeface(messenger));
            Settings.preferences.edit().putBoolean("use_system_emoji", true).apply();
            android.graphics.Typeface system = Settings.systemEmojiTypeface();
            assertNotNull(system);
            // Until Messenger has loaded its font once there's nothing to fall back on.
            assertSame(system, Settings.systemEmojiTypeface(messenger));
            Settings.messengerEmojiFont(messengerFont);
            android.graphics.Typeface merged = Settings.systemEmojiTypeface(messenger);
            assertNotSame(system, merged);
            assertSame(merged, Settings.systemEmojiTypeface(messenger));
            // Messenger may ask before its own typeface is ready; the font file is what counts.
            assertSame(merged, Settings.systemEmojiTypeface(null));
            // One line per change of path, so a report's logcat shows which one the phone took.
            assertEquals(1, org.robolectric.shadows.ShadowLog.getLogsForTag("HushMessenger").stream()
                .filter(log -> log.msg.startsWith("use_system_emoji: phone emoji with Messenger's font behind it")).count());
            paint.setTypeface(system);
            assertFalse(paint.hasGlyph(like));
            paint.setTypeface(merged);
            assertTrue(paint.hasGlyph(like));
            assertTrue(paint.hasGlyph(Settings.EMOJI_PROBE));
            assertNull(Settings.hookErrors.get("use_system_emoji"));
            // The next run, right after an update: Messenger asks before its font loads and keeps that answer, so the
            // file from the last run stands in (#34).
            Settings.messengerEmojiFile = null;
            Settings.mergedEmojiFile = null;
            Settings.mergedEmoji = null;
            android.graphics.Typeface early = Settings.systemEmojiTypeface(null);
            assertNotSame(system, early);
            paint.setTypeface(early);
            assertTrue(paint.hasGlyph(like));
            // A remembered file that's gone leaves the phone's emoji until Messenger loads its font again.
            Settings.mergedEmojiFile = null;
            Settings.mergedEmoji = null;
            Settings.preferences.edit().putString(Settings.EMOJI_FONT_PATH, messengerFont.getPath() + ".gone").apply();
            assertSame(system, Settings.systemEmojiTypeface(null));
            // Off again: Messenger's own typeface, untouched.
            Settings.preferences.edit().putBoolean("use_system_emoji", false).apply();
            assertSame(messenger, Settings.systemEmojiTypeface(messenger));
        } finally {
            Settings.systemEmojiFont = font;
            resetEmoji();
            messengerFont.delete();
        }
    }

    @org.robolectric.annotation.GraphicsMode(org.robolectric.annotation.GraphicsMode.Mode.NATIVE)
    @Test @Config(sdk = 31) public void anUnreadableMessengerFontLeavesThePhonesEmoji() throws Exception {
        new android.graphics.Paint();
        try {
            resetEmoji();
            Settings.preferences.edit().putBoolean("use_system_emoji", true).apply();
            android.graphics.Typeface system = Settings.systemEmojiTypeface();
            Settings.messengerEmojiFont(new java.io.File("/nonexistent/FacebookEmoji.ttf"));
            assertSame(system, Settings.systemEmojiTypeface(android.graphics.Typeface.DEFAULT));
            assertSame(system, Settings.systemEmojiTypeface(android.graphics.Typeface.DEFAULT));
            String failure = Settings.hookErrors.get("use_system_emoji");
            assertNotNull(failure);
            assertFalse(failure.contains("nonexistent"));
        } finally {
            resetEmoji();
        }
    }

    /** #34 follow-up: before a phone has Messenger's emoji font, a Like in the chat list is a box, stock Messenger too. */
    @Test public void theChatListLikeIsAThumbsUpOnlyUntilMessengersFontIsKnown() throws Exception {
        String like = new String(Character.toChars(0xF0000)), thumbs = new String(Character.toChars(0x1F44D));
        java.io.File messengerFont = java.io.File.createTempFile("FacebookEmoji", ".ttf");
        try {
            resetEmoji();
            Settings.activeAt.clear();
            String snippet = "You: " + like;
            assertSame("Off leaves it as Messenger wrote it", snippet, Settings.chatListSnippet(snippet));
            assertEquals(0, Settings.lastActive("use_system_emoji"));
            Settings.preferences.edit().putBoolean("use_system_emoji", true).commit();
            assertEquals("You: " + thumbs, Settings.chatListSnippet(snippet).toString());
            assertTrue("A swap is a use", Settings.lastActive("use_system_emoji") > 0);
            assertEquals(thumbs + " ok " + thumbs, Settings.chatListSnippet(like + " ok " + like).toString());
            String plain = "See you at 5";
            assertSame("Nothing to swap", plain, Settings.chatListSnippet(plain));
            assertNull(Settings.chatListSnippet(null));

            // Both are two chars long, so a span over the sender's name stays on it.
            android.text.SpannableString styled = new android.text.SpannableString("Sam: " + like + " hi");
            Object bold = new android.text.style.StyleSpan(android.graphics.Typeface.BOLD);
            styled.setSpan(bold, 0, 3, android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            CharSequence swapped = Settings.chatListSnippet(styled);
            assertEquals("Sam: " + thumbs + " hi", swapped.toString());
            assertEquals(0, ((android.text.Spanned) swapped).getSpanStart(bold));
            assertEquals(3, ((android.text.Spanned) swapped).getSpanEnd(bold));
            assertEquals("Messenger's own text isn't changed in place", "Sam: " + like + " hi", styled.toString());
            // Each text keeps its class, so nothing Messenger casts it to breaks.
            assertSame(android.text.SpannableString.class, swapped.getClass());
            android.text.SpannableStringBuilder built = new android.text.SpannableStringBuilder("You: " + like);
            CharSequence swappedBuilt = Settings.chatListSnippet(built);
            assertSame(android.text.SpannableStringBuilder.class, swappedBuilt.getClass());
            assertNotSame(built, swappedBuilt);
            assertEquals("You: " + like, built.toString());
            assertSame(android.text.SpannedString.class,
                Settings.chatListSnippet(new android.text.SpannedString("You: " + like)).getClass());
            StringBuilder unknown = new StringBuilder("You: " + like);
            assertSame("A type it can't rebuild stays as it is", unknown, Settings.chatListSnippet(unknown));

            // Last run's font file, still there: Use system emoji draws the Like from it already.
            Settings.preferences.edit().putString(Settings.EMOJI_FONT_PATH, messengerFont.getPath()).commit();
            assertSame(snippet, Settings.chatListSnippet(snippet));
            Settings.preferences.edit().putString(Settings.EMOJI_FONT_PATH, messengerFont.getPath() + ".gone").commit();
            assertEquals("A remembered file that's gone doesn't count", "You: " + thumbs, Settings.chatListSnippet(snippet).toString());
            // Messenger loading its font in this run.
            Settings.messengerEmojiFont(new java.io.File(messengerFont.getPath() + ".gone"));
            assertSame(snippet, Settings.chatListSnippet(snippet));

            Settings.messengerEmojiFile = null;
            Settings.preferences.edit().remove(Settings.EMOJI_FONT_PATH).putBoolean("paused", true).commit();
            assertSame("Pause leaves it as Messenger wrote it", snippet, Settings.chatListSnippet(snippet));
            assertNull(Settings.hookErrors.get("use_system_emoji"));
        } finally {
            resetEmoji();
            messengerFont.delete();
        }
    }

    /** Messenger keeps its first emoji typeface for the run, so knowing the font file later doesn't bring the Like back. */
    @org.robolectric.annotation.GraphicsMode(org.robolectric.annotation.GraphicsMode.Mode.NATIVE)
    @Test @Config(sdk = 31) public void aRunThatStartedWithoutMessengersFontKeepsTheThumbsUp() throws Exception {
        new android.graphics.Paint();
        String like = new String(Character.toChars(0xF0000)), thumbs = new String(Character.toChars(0x1F44D));
        java.io.File messengerFont = java.io.File.createTempFile("FacebookEmoji", ".ttf");
        try (java.io.InputStream in = getClass().getResourceAsStream("/messenger-emoji/like-only.ttf")) {
            java.nio.file.Files.copy(in, messengerFont.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
        }
        String snippet = "You: " + like;
        try {
            resetEmoji();
            Settings.preferences.edit().putBoolean("use_system_emoji", true).commit();
            // A fresh install: Messenger asks before its font has downloaded, then the font turns up mid-run.
            android.graphics.Typeface system = Settings.systemEmojiTypeface();
            assertSame(system, Settings.systemEmojiTypeface(null));
            Settings.messengerEmojiFont(messengerFont);
            assertEquals("You: " + thumbs, Settings.chatListSnippet(snippet).toString());

            // The next start asks with the file known and gets Messenger's font behind the phone's.
            Settings.likeWithoutFont = false;
            assertNotSame(system, Settings.systemEmojiTypeface(null));
            assertSame(snippet, Settings.chatListSnippet(snippet));

            // A merge that fails leaves the phone's font alone, so the thumbs up comes back.
            Settings.likeWithoutFont = false;
            Settings.messengerEmojiFont(new java.io.File(messengerFont.getPath() + ".gone"));
            assertSame(system, Settings.systemEmojiTypeface(null));
            assertEquals("You: " + thumbs, Settings.chatListSnippet(snippet).toString());
        } finally {
            resetEmoji();
            messengerFont.delete();
        }
    }

    /** Android 9 can't put Messenger's font behind the phone's, so with Use system emoji on the Like is always a box there. */
    @Test @Config(sdk = 28) public void androidNineAlwaysShowsTheChatListLikeAsAThumbsUp() throws Exception {
        String like = new String(Character.toChars(0xF0000)), thumbs = new String(Character.toChars(0x1F44D));
        java.io.File messengerFont = java.io.File.createTempFile("FacebookEmoji", ".ttf");
        String snippet = "You: " + like;
        try {
            resetEmoji();
            Settings.preferences.edit().putBoolean("use_system_emoji", true)
                .putString(Settings.EMOJI_FONT_PATH, messengerFont.getPath()).commit();
            assertEquals("You: " + thumbs, Settings.chatListSnippet(snippet).toString());
            // The phone's emoji font didn't load, so Messenger draws with its own typeface, as stock does.
            Settings.systemEmojiMissing = true;
            assertSame(snippet, Settings.chatListSnippet(snippet));
        } finally {
            resetEmoji();
            messengerFont.delete();
        }
    }

    /** A font that's still being written fails the merge once, so the same file gets three tries and then no more. */
    @org.robolectric.annotation.GraphicsMode(org.robolectric.annotation.GraphicsMode.Mode.NATIVE)
    @Test @Config(sdk = 31) public void aFailedEmojiMergeIsRetriedOnTheSameFileUpToThreeTimes() throws Exception {
        android.graphics.Paint paint = new android.graphics.Paint();
        String probe = Settings.EMOJI_PROBE;
        String font = Settings.systemEmojiFont;
        java.io.File late = java.io.File.createTempFile("FacebookEmoji", ".ttf");
        java.io.File never = java.io.File.createTempFile("FacebookEmoji", ".ttf");
        assertTrue(late.delete() && never.delete());
        String like = new String(Character.toChars(0xF0000));
        try {
            resetEmoji();
            Settings.systemEmojiFont = android.graphics.text.TextRunShaper.shapeTextRun(probe, 0, probe.length(), 0,
                probe.length(), 0f, 0f, false, paint).getFont(0).getFile().getPath();
            Settings.preferences.edit().putBoolean("use_system_emoji", true).apply();
            android.graphics.Typeface system = Settings.systemEmojiTypeface();
            assertNotNull(system);
            Settings.messengerEmojiFont(late);
            assertSame("the file isn't there yet", system, Settings.systemEmojiTypeface(null));
            copyLikeFont(late);
            android.graphics.Typeface merged = Settings.systemEmojiTypeface(null);
            assertNotSame("the second try on the same file merges", system, merged);
            paint.setTypeface(merged);
            assertTrue(paint.hasGlyph(like));
            // A file that keeps failing is given up on after its third try, even once it turns up.
            Settings.messengerEmojiFont(never);
            for (int i = 0; i < 3; i++) assertSame(system, Settings.systemEmojiTypeface(null));
            copyLikeFont(never);
            assertSame(system, Settings.systemEmojiTypeface(null));
        } finally {
            Settings.systemEmojiFont = font;
            resetEmoji();
            late.delete();
            never.delete();
        }
    }

    private void copyLikeFont(java.io.File target) throws java.io.IOException {
        try (java.io.InputStream in = getClass().getResourceAsStream("/messenger-emoji/like-only.ttf")) {
            java.nio.file.Files.copy(in, target.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
        }
    }

    private static void resetEmoji() {
        Settings.systemEmoji = null;
        Settings.systemEmojiMissing = false;
        Settings.systemEmojiSource = null;
        Settings.systemEmojiShaped = null;
        Settings.messengerEmojiFile = null;
        Settings.mergedEmojiFile = null;
        Settings.mergedEmoji = null;
        Settings.mergeTries = 0;
        Settings.likeWithoutFont = false;
        Settings.lastEmojiLog = null;
        if (Settings.preferences != null) Settings.preferences.edit().remove(Settings.EMOJI_FONT_PATH).apply();
        Settings.hookErrors.remove("use_system_emoji");
    }

    @Test @Config(sdk = 28) public void systemEmojiBeforeAndroid12KeepsAndroidsStandardEmojiFont() {
        try {
            Settings.systemEmoji = null;
            Settings.systemEmojiMissing = false;
            Settings.systemEmojiSource = null;
            Settings.preferences.edit().putBoolean("use_system_emoji", true).apply();
            assertNotNull(Settings.systemEmojiTypeface());
            assertEquals(Settings.NOTO_EMOJI_FONT, Settings.systemEmojiSource);
        } finally {
            Settings.systemEmoji = null;
            Settings.systemEmojiMissing = false;
            Settings.systemEmojiSource = null;
        }
    }

    @Test public void inlineTabListsLoseTheAvatarTabEvenWhenItsEventSitsOneLevelDeeper() {
        KeyboardTab avatar = new KeyboardTab(new X.TabConfig(new com.facebook.xapp.messaging.composer.avatar.composertab.event.ActivateAvatarSticker()));
        KeyboardTab stickers = new KeyboardTab(new X.TabConfig("stickers"));
        KeyboardTab text = new KeyboardTab("not walked into");
        java.util.List<Object> tabs = new java.util.ArrayList<>(java.util.List.of(stickers, avatar, text));
        Settings.removeAvatarTabs(tabs);
        assertEquals(3, tabs.size());
        Settings.preferences.edit().putBoolean("avatar_stickers", true).apply();
        Settings.removeAvatarTabs(tabs);
        assertEquals(java.util.List.of(stickers, text), tabs);
        // Anything that isn't a changeable collection is left alone, and a list that refuses the change is kept as a hook error.
        assertEquals(0, Settings.hookErrorAt("avatar_stickers"));
        Settings.removeAvatarTabs(java.util.List.of(avatar));
        assertTrue(Settings.hookErrorAt("avatar_stickers") > 0);
        Settings.removeAvatarTabs(null);
    }

    @Test public void messengerButtonOpensItsLauncherTaskInsteadOfTheSettingsTask() {
        var application = RuntimeEnvironment.getApplication();
        Intent query = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
            .setPackage(application.getPackageName());
        ResolveInfo settings = new ResolveInfo();
        settings.activityInfo = new ActivityInfo();
        settings.activityInfo.packageName = application.getPackageName();
        settings.activityInfo.name = SettingsActivity.class.getName();
        ResolveInfo messenger = new ResolveInfo();
        messenger.activityInfo = new ActivityInfo();
        messenger.activityInfo.packageName = application.getPackageName();
        messenger.activityInfo.name = "com.facebook.orca.auth.StartScreenActivity";
        Shadows.shadowOf(application.getPackageManager()).addResolveInfoForIntent(query,
            java.util.List.of(settings, messenger));
        try (var controller = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            controller.get().getWindow().getDecorView().findViewWithTag("open_messenger").performClick();
            Intent launched = Shadows.shadowOf(controller.get()).getNextStartedActivity();
            assertEquals(messenger.activityInfo.name, launched.getComponent().getClassName());
            assertEquals(application.getPackageName(), launched.getComponent().getPackageName());
            assertTrue((launched.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
            assertTrue((launched.getFlags() & Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED) != 0);
        }
    }

    @Test public void openSkipsExtensionAliasesDisabledAndMalformedLauncherEntries() {
        var app = RuntimeEnvironment.getApplication();
        Intent query = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
            .setPackage(app.getPackageName());
        var entries = new java.util.ArrayList<ResolveInfo>();
        entries.add(new ResolveInfo());
        for (String name : new String[] {RestartActivity.class.getName(), SettingsActivity.DRAWER_ALIAS,
                "settings.Alias", "com.facebook.orca.Disabled", "com.facebook.orca.auth.StartScreenActivity"}) {
            ResolveInfo entry = new ResolveInfo();
            entry.activityInfo = new ActivityInfo();
            entry.activityInfo.packageName = app.getPackageName();
            entry.activityInfo.name = name;
            if (name.equals("settings.Alias")) entry.activityInfo.targetActivity = SettingsActivity.class.getName();
            entries.add(entry);
        }
        Shadows.shadowOf(app.getPackageManager()).addResolveInfoForIntent(query, entries);
        // Disabled at runtime while its manifest flag stays true, as when an alternate icon is chosen.
        app.getPackageManager().setComponentEnabledSetting(new android.content.ComponentName(app, "com.facebook.orca.Disabled"),
            android.content.pm.PackageManager.COMPONENT_ENABLED_STATE_DISABLED, android.content.pm.PackageManager.DONT_KILL_APP);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            screen.get().getWindow().getDecorView().findViewWithTag("open_messenger").performClick();
            Intent launched = Shadows.shadowOf(screen.get()).getNextStartedActivity();
            assertNotNull(launched);
            assertEquals("com.facebook.orca.auth.StartScreenActivity", launched.getComponent().getClassName());
            assertEquals(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED, launched.getFlags());
        }
    }

    @Test public void openFindsAnAlternateIconAliasEnabledAtRuntime() {
        var app = RuntimeEnvironment.getApplication();
        Intent query = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
            .setPackage(app.getPackageName());
        // The chosen LauncherAlias* icon is declared android:enabled="false" and enabled at runtime.
        ResolveInfo alias = new ResolveInfo();
        alias.activityInfo = new ActivityInfo();
        alias.activityInfo.packageName = app.getPackageName();
        alias.activityInfo.name = "com.facebook.orca.auth.LauncherAliasFab";
        alias.activityInfo.targetActivity = "com.facebook.messenger.neue.MainActivity";
        alias.activityInfo.enabled = false;
        Shadows.shadowOf(app.getPackageManager()).addResolveInfoForIntent(query, java.util.List.of(alias));
        app.getPackageManager().setComponentEnabledSetting(new android.content.ComponentName(app, alias.activityInfo.name),
            android.content.pm.PackageManager.COMPONENT_ENABLED_STATE_ENABLED, android.content.pm.PackageManager.DONT_KILL_APP);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            screen.get().getWindow().getDecorView().findViewWithTag("open_messenger").performClick();
            Intent launched = Shadows.shadowOf(screen.get()).getNextStartedActivity();
            assertNotNull(launched);
            assertEquals(alias.activityInfo.name, launched.getComponent().getClassName());
        }
    }

    @Test public void missingHostLauncherExplainsHowToRecover() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            screen.get().getWindow().getDecorView().findViewWithTag("open_messenger").performClick();
            assertNull(Shadows.shadowOf(screen.get()).getNextStartedActivity());
            assertEquals(new SettingsText(screen.get()).get("open_help"),
                org.robolectric.shadows.ShadowToast.getTextOfLatestToast());
        }
    }
}
