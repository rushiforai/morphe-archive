/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.rootmute;

import static org.junit.Assert.*;

import java.util.LinkedHashSet;
import java.util.Set;

import org.json.JSONException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class RootPostMuteStoreTest {
    private final String account = "a".repeat(64);

    @Test public void theBoundedDocumentRoundTripsWithoutSharingAccounts() throws Exception {
        RootPostMuteStore store = new RootPostMuteStore().withRoots(account, Set.of("11", "22"))
                .withRoots("b".repeat(64), Set.of("33"));
        RootPostMuteStore loaded = RootPostMuteStore.decode(store.encode());
        assertEquals(Set.of("11", "22"), loaded.roots(account));
        assertEquals(Set.of("33"), loaded.roots("b".repeat(64)));
        assertTrue(loaded.roots("c".repeat(64)).isEmpty());
        assertThrows(UnsupportedOperationException.class, () -> loaded.roots(account).clear());
    }

    @Test public void fiveHundredRootsFitAndTheNextOneIsRefused() throws Exception {
        LinkedHashSet<String> roots = new LinkedHashSet<>();
        for (int i = 1; i <= RootPostMuteStore.MAX_ROOTS; i++) roots.add(Integer.toString(i));
        RootPostMuteStore store = new RootPostMuteStore().withRoots(account, roots);
        assertEquals(500, RootPostMuteStore.decode(store.encode()).roots(account).size());
        roots.add("501");
        assertThrows(IllegalArgumentException.class, () -> store.withRoots(account, roots));
        assertEquals(500, store.roots(account).size());
    }

    @Test public void onlyEightRecentlyChangedAccountsAreKept() {
        RootPostMuteStore store = new RootPostMuteStore();
        for (int i = 1; i <= 9; i++) store = store.withRoots(String.format("%064x", i), Set.of("11"));
        assertTrue(store.roots(String.format("%064x", 1)).isEmpty());
        for (int i = 2; i <= 9; i++) assertEquals(Set.of("11"), store.roots(String.format("%064x", i)));
    }

    @Test public void malformedIdsAndUnverifiedAccountKeysCannotEnterStorage() {
        for (String root : new String[]{"", "0", "-1", "1.0", "123x", " 11", "https://example.com/post/11", "1".repeat(31)}) {
            assertFalse(RootPostMuteStore.validRoot(root));
            assertThrows(IllegalArgumentException.class, () -> new RootPostMuteStore().withRoots(account, Set.of(root)));
        }
        assertThrows(IllegalArgumentException.class, () -> new RootPostMuteStore().withRoots("user-uuid", Set.of("11")));
    }

    @Test public void blogRulesShareTheListAndOnlyLowercaseBlogNamesFit() throws Exception {
        RootPostMuteStore store = new RootPostMuteStore().withRoots(account, Set.of("11", "reblogs:art-blog", "originals:x9"));
        assertEquals(Set.of("11", "reblogs:art-blog", "originals:x9"), RootPostMuteStore.decode(store.encode()).roots(account));
        assertTrue(RootPostMuteStore.reblogRule("reblogs:art-blog"));
        assertFalse(RootPostMuteStore.reblogRule("originals:x9"));
        assertEquals("art-blog", RootPostMuteStore.ruleBlog("reblogs:art-blog"));
        for (String rule : new String[]{"reblogs:", "reblogs:Art", "likes:art", "reblogs:art blog", "originals:a_b",
                "reblogs:" + "a".repeat(65), "reblogs:art:11", "Reblogs:art"}) {
            assertFalse(rule, RootPostMuteStore.validEntry(rule));
            assertThrows(IllegalArgumentException.class, () -> new RootPostMuteStore().withRoots(account, Set.of(rule)));
            String document = "{\"version\":1,\"accounts\":[{\"account\":\"" + account + "\",\"roots\":[\"" + rule + "\"]}]}";
            assertThrows(JSONException.class, () -> RootPostMuteStore.decode(document));
        }
    }

    @Test public void duplicateRootsAccountsAndWrongTypesAreRefusedAsWholeDocuments() {
        String prefix = "{\"version\":1,\"accounts\":[{\"account\":\"" + account + "\",\"roots\":";
        for (String roots : new String[]{"[\"11\",\"11\"]", "[11]", "[null]", "[\"unknown\"]"}) {
            assertThrows(JSONException.class, () -> RootPostMuteStore.decode(prefix + roots + "}]}"));
        }
        String entry = "{\"account\":\"" + account + "\",\"roots\":[\"11\"]}";
        assertThrows(JSONException.class, () -> RootPostMuteStore.decode("{\"version\":1,\"accounts\":[" + entry + "," + entry + "]}"));
    }
}
