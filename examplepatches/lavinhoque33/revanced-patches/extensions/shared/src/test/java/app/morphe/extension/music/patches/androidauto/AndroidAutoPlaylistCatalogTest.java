/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-13.
 */
package app.morphe.extension.music.patches.androidauto;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.File;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

public class AndroidAutoPlaylistCatalogTest {
    @Rule public TemporaryFolder temporary = new TemporaryFolder();
    private static final String ACCOUNT_A = "a".repeat(64);
    private static final String ACCOUNT_B = "b".repeat(64);
    private static final AndroidAutoPlaylistCatalog.Entry FIRST =
            new AndroidAutoPlaylistCatalog.Entry("PLfirst", "First", "Author", "https://art/first");
    private static final AndroidAutoPlaylistCatalog.Entry SECOND =
            new AndroidAutoPlaylistCatalog.Entry("PLsecond", "Second", "", "");

    @Test public void completeCatalogSurvivesRestartAndRetainsMetadataOrder() throws Exception {
        File directory = temporary.newFolder();
        var store = new AndroidAutoPlaylistCatalog(directory);
        store.selectAccount(ACCOUNT_A);
        assertTrue(store.publish(store.begin(), List.of(SECOND, FIRST), true));

        var restarted = new AndroidAutoPlaylistCatalog(directory);
        restarted.selectAccount(ACCOUNT_A);
        assertTrue(restarted.hasSnapshot());
        assertEquals(List.of(SECOND, FIRST), restarted.read());
        assertFalse(new File(directory, ACCOUNT_A + ".catalog.part").exists());
    }

    @Test public void incompleteFailedAndTimedOutLoadsCannotReplaceCompleteCatalog() throws Exception {
        File directory = temporary.newFolder();
        var store = new AndroidAutoPlaylistCatalog(directory);
        store.selectAccount(ACCOUNT_A);
        store.publish(store.begin(), List.of(FIRST, SECOND), true);
        byte[] original = Files.readAllBytes(new File(directory, ACCOUNT_A + ".catalog").toPath());

        assertFalse(store.publish(store.begin(), List.of(FIRST), false));
        assertFalse(store.publish(store.begin(), List.of(), false));
        assertArrayEquals(original, Files.readAllBytes(new File(directory, ACCOUNT_A + ".catalog").toPath()));
        assertEquals(List.of(FIRST, SECOND), store.read());
    }

    @Test public void genuinelyEmptyCompletionReplacesOldCatalogButRemainsAnExistingSnapshot() throws Exception {
        var store = new AndroidAutoPlaylistCatalog(temporary.newFolder());
        store.selectAccount(ACCOUNT_A);
        store.publish(store.begin(), List.of(FIRST), true);
        assertTrue(store.publish(store.begin(), List.of(), true));
        assertTrue(store.hasSnapshot());
        assertEquals(List.of(), store.read());
    }

    @Test public void accountSwitchRejectsInflightLoadsEvenAfterSwitchingBack() throws Exception {
        File directory = temporary.newFolder();
        var store = new AndroidAutoPlaylistCatalog(directory);
        store.selectAccount(ACCOUNT_A);
        store.publish(store.begin(), List.of(FIRST), true);
        var oldLoad = store.begin();
        store.selectAccount(ACCOUNT_B);
        assertFalse(store.hasSnapshot());
        assertEquals(List.of(), store.read());
        assertFalse(store.publish(oldLoad, List.of(SECOND), true));
        store.publish(store.begin(), List.of(SECOND), true);
        store.selectAccount(ACCOUNT_A);
        assertFalse(store.publish(oldLoad, List.of(), true));
        assertEquals(List.of(FIRST), store.read());
        store.selectAccount(ACCOUNT_B);
        assertEquals(List.of(SECOND), store.read());
        store.selectAccount("");
        assertEquals(List.of(), store.read());
        assertFalse(store.publish(store.begin(), List.of(FIRST), true));
    }

    @Test public void lateOlderCompletionCannotOverwriteNewerCatalog() throws Exception {
        var store = new AndroidAutoPlaylistCatalog(temporary.newFolder());
        store.selectAccount(ACCOUNT_A);
        var older = store.begin();
        var newer = store.begin();
        store.publish(newer, List.of(SECOND), true);
        assertFalse(store.publish(older, List.of(FIRST), true));
        assertEquals(List.of(SECOND), store.read());
        assertFalse(store.publish(store.begin(), List.of(SECOND), true));
    }

    @Test public void nativeSelectedIdentitySeparatesPersonalAndBrandAccountsAndExcludesPrivateSessions() {
        var personal = Map.of("datasync_id", "personal-sync", "user_identity_id", "personal-id");
        var brand = Map.of("datasync_id", "brand-sync", "user_identity_id", "brand-id");
        assertNotEquals(AndroidAutoPlaylistAccount.identity(personal), AndroidAutoPlaylistAccount.identity(brand));
        assertEquals("", AndroidAutoPlaylistAccount.identity(Map.of("user_identity_id", "unselected")));
        assertEquals("", AndroidAutoPlaylistAccount.identity(Map.of("datasync_id", "sync",
                "user_identity_id", "id", "IS_INCOGNITO_SESSION_IDENTITY", true)));
        assertEquals("", AndroidAutoPlaylistAccount.identity(Map.of("datasync_id", "sync",
                "user_identity_id", "id", "user_signed_out", true)));
    }
}
