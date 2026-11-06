package app.hushmessenger.extension;

import java.util.Collections;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class RestrictedNotifyTest {
    /** Named like Messenger's thread folder enum on 586. */
    enum Folder { NONE, INBOX, PENDING, OTHER, ARCHIVED, SPAM, RESTRICTED }
    /** A second folder type whose RESTRICTED has a body, so the constant's class isn't the enum's own. */
    enum OtherFolder { RESTRICTED { @Override public String toString() { return "restricted"; } }, INBOX }
    enum NoInbox { OTHER, RESTRICTED }

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
    }

    @After public void forgetErrors() { Settings.hookErrors.clear(); }

    private static void on() { Settings.preferences.edit().putBoolean("restricted_notify", true).commit(); }

    @Test public void onlyItsOwnSwitchSendsARestrictedChatThroughTheInboxCheck() {
        assertSame(Folder.RESTRICTED, Settings.notificationFolder(Folder.RESTRICTED));
        assertEquals(0, Settings.lastActive("restricted_notify"));
        on();
        assertSame(Folder.INBOX, Settings.notificationFolder(Folder.RESTRICTED));
        assertTrue(Settings.lastActive("restricted_notify") > 0);
        Settings.preferences.edit().putBoolean("restricted_notify", false).commit();
        assertSame("The next message after switching off keeps its folder", Folder.RESTRICTED, Settings.notificationFolder(Folder.RESTRICTED));
        assertEquals(Collections.singletonMap("restricted_notify", false), Settings.preferences.getAll());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void everyOtherFolderPassesUntouchedAndIsNotCountedAsAUse() {
        on();
        for (Folder folder : Folder.values()) {
            if (folder != Folder.RESTRICTED) assertSame(folder.name(), folder, Settings.notificationFolder(folder));
        }
        assertNull(Settings.notificationFolder(null));
        Object name = "RESTRICTED";
        assertSame("Only an enum constant is a folder", name, Settings.notificationFolder(name));
        assertEquals(0, Settings.lastActive("restricted_notify"));
    }

    @Test public void eachFolderTypeGetsItsOwnInbox() {
        on();
        assertSame(Folder.INBOX, Settings.notificationFolder(Folder.RESTRICTED));
        assertSame(OtherFolder.INBOX, Settings.notificationFolder(OtherFolder.RESTRICTED));
        assertSame(Folder.INBOX, Settings.notificationFolder(Folder.RESTRICTED));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aFolderTypeWithoutAnInboxKeepsTheFolderAndRecordsTheFailure() {
        on();
        assertSame(NoInbox.RESTRICTED, Settings.notificationFolder(NoInbox.RESTRICTED));
        assertEquals(Collections.singleton("restricted_notify"), Settings.hookErrors.keySet());
        Settings.hookErrors.clear();
        assertSame("A folder type that has one still gets it", Folder.INBOX, Settings.notificationFolder(Folder.RESTRICTED));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void offPauseSafeModeAndAMissingControlKeepTheFolder() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("restricted_notify", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertSame(state, Folder.RESTRICTED, Settings.notificationFolder(Folder.RESTRICTED));
            assertEquals(state, 0, Settings.lastActive("restricted_notify"));
        }
    }

    @Test public void theSwitchSitsUnderPrivacyStartsOffAndIsMarkedExperimental() {
        String[] spec = null;
        for (String[] control : SettingsActivity.CONTROLS) if (control[0].equals("restricted_notify")) spec = control;
        assertNotNull(spec);
        assertEquals("Notify for restricted chats", spec[1]);
        assertEquals("privacy", spec[3]);
        assertTrue("Not checked on a phone yet", SettingsActivity.EXPERIMENTAL.contains("restricted_notify"));
        assertTrue(Settings.installed.contains("restricted_notify"));
        assertFalse(Settings.preferences.getBoolean("restricted_notify", false));
    }
}
