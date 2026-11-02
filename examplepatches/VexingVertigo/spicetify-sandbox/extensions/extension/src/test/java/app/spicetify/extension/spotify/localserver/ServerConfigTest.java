package app.spicetify.extension.spotify.localserver;

import static org.junit.Assert.*;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import java.lang.reflect.Field;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class ServerConfigTest {
    private static final String USER_ID = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    private static final String LIBRARY_ID = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb";

    private JellyfinConnection jellyfin(String token) {
        JellyfinClient.Account account = new JellyfinClient.Account(
                new ServerConnection("https://music.example/proxy/", "", ""),
                ServerConfig.deviceId(), USER_ID, "Listener", token);
        return new JellyfinConnection(account, LIBRARY_ID, "Music");
    }

    private SharedPreferences preferences() {
        return RuntimeEnvironment.getApplication().getSharedPreferences("spicetify_local_server", Context.MODE_PRIVATE);
    }

    @Before public void setup() throws Exception {
        Field saved = ServerConfig.class.getDeclaredField("preferences");
        saved.setAccessible(true);
        saved.set(null, null);
        Application app = RuntimeEnvironment.getApplication();
        ServerConfig.initialize(app);
        ServerConfig.configure(false, "", "", "");
    }
    @Test public void reconfigurationInvalidatesOldSnapshotAndClearsIndex() {
        ServerConfig.configure(true, "https://dav.example/old/", "old-user", "old-pass");
        ServerConfig.Snapshot old = ServerConfig.snapshot();
        ServerConfig.configure(true, "https://dav.example/new/", "new-user", "new-pass");
        assertFalse(ServerConfig.isCurrent(old));
        assertFalse(ServerConfig.publish(old, () -> fail("Stale scan published")));
        assertTrue(ServerIndex.tracks().isEmpty());
    }
    @Test public void disableCancelsExistingSession() {
        ServerConfig.configure(true, "https://dav.example/music/", "user", "pass");
        ServerConfig.Snapshot old = ServerConfig.snapshot();
        ServerConfig.enabled(false);
        assertFalse(ServerConfig.isCurrent(old));
        assertEquals("Disabled", ServerIndex.status());
        ServerIndex.scanAsync();
        assertEquals("Disabled", ServerIndex.status());
    }
    @Test public void blankPasswordRetentionIsScopedToTheSameRootAndAccount() {
        ServerConfig.configure(true, "https://dav.example/music/", "user", "pass");
        ServerConfig.configure(true, "https://dav.example/music", "user", null);
        assertTrue(ServerConfig.snapshot().hasPassword());
        ServerConfig.configure(true, "https://other.example/music/", "user", null);
        assertFalse(ServerConfig.snapshot().hasPassword());
    }
    @Test public void repeatedInitializationPreservesActiveSession() {
        ServerConfig.configure(true, "https://dav.example/music/", "user", "pass");
        ServerConfig.Snapshot before = ServerConfig.snapshot();
        ServerConfig.initialize(RuntimeEnvironment.getApplication());
        assertSame(before, ServerConfig.snapshot());
    }
    @Test public void explicitEmptyPasswordClearsTheSecret() {
        ServerConfig.configure(true, "https://dav.example/music/", "user", "pass");
        ServerConfig.configure(true, "https://dav.example/music/", "user", "");
        assertFalse(ServerConfig.snapshot().hasPassword());
    }

    @Test public void jellyfinSelectionSurvivesReloadWithoutSavingAWebDavSecret() throws Exception {
        String deviceId = ServerConfig.deviceId();
        ServerConfig.configure(true, "https://dav.example/music/", "user", "webdav-secret");
        ServerConfig.Snapshot previous = ServerConfig.snapshot();
        assertTrue(ServerConfig.configureJellyfinIfCurrent(previous, true, jellyfin("jellyfin-token")));
        assertEquals(ServerConfig.Provider.JELLYFIN, ServerConfig.snapshot().provider());
        assertEquals("Music", ServerConfig.snapshot().jellyfinConnection().libraryName);
        assertFalse(preferences().getAll().values().contains("webdav-secret"));
        assertEquals(deviceId, preferences().getString("device_id", ""));

        Field saved = ServerConfig.class.getDeclaredField("preferences");
        saved.setAccessible(true);
        saved.set(null, null);
        ServerConfig.initialize(RuntimeEnvironment.getApplication());
        assertEquals(deviceId, ServerConfig.deviceId());
        assertEquals(ServerConfig.Provider.JELLYFIN, ServerConfig.snapshot().provider());
        assertEquals("jellyfin-token", ServerConfig.snapshot().jellyfinConnection().token());
        assertTrue(ServerConfig.snapshot().enabled);
    }

    @Test public void staleJellyfinSelectionCannotReplaceChangedSettings() {
        ServerConfig.Snapshot beforeLogin = ServerConfig.snapshot();
        ServerConfig.configure(true, "https://dav.example/music/", "user", "webdav-secret");
        assertFalse(ServerConfig.configureJellyfinIfCurrent(beforeLogin, true, jellyfin("late-token")));
        assertEquals(ServerConfig.Provider.WEBDAV, ServerConfig.snapshot().provider());
        assertFalse(preferences().getAll().values().contains("late-token"));
    }

    @Test public void disableRetainsJellyfinButForgetRemovesItsSessionAndIndex() {
        assertTrue(ServerConfig.configureJellyfinIfCurrent(ServerConfig.snapshot(), true, jellyfin("jellyfin-token")));
        ServerConfig.Snapshot active = ServerConfig.snapshot();
        ServerConfig.enabled(false);
        assertFalse(ServerConfig.isCurrent(active));
        assertEquals(ServerConfig.Provider.JELLYFIN, ServerConfig.snapshot().provider());
        assertEquals("jellyfin-token", ServerConfig.snapshot().jellyfinConnection().token());
        assertTrue(ServerIndex.tracks().isEmpty());
        ServerConfig.forget();
        assertEquals(ServerConfig.Provider.NONE, ServerConfig.snapshot().provider());
        assertFalse(preferences().getAll().values().contains("jellyfin-token"));
        assertEquals("Disabled", ServerIndex.status());
    }

    @Test public void switchingBackToWebDavRemovesInactiveJellyfinCredentials() {
        assertTrue(ServerConfig.configureJellyfinIfCurrent(ServerConfig.snapshot(), true, jellyfin("jellyfin-token")));
        ServerConfig.configure(true, "https://dav.example/music/", "user", "webdav-secret");
        assertEquals(ServerConfig.Provider.WEBDAV, ServerConfig.snapshot().provider());
        assertNull(ServerConfig.snapshot().jellyfinConnection());
        assertTrue(ServerConfig.snapshot().hasPassword());
        assertFalse(preferences().getAll().values().contains("jellyfin-token"));
    }
}
