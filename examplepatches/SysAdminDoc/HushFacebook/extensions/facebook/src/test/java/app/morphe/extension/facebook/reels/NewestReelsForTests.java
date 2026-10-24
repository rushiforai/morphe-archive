/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** Hands the Newest reels first hooks two reels and a rerank, for tests in any package. */
public final class NewestReelsForTests {
    private NewestReelsForTests() {
    }

    /**
     * Two Reels tab signals are made, the newer reel's second, and Facebook's rerank puts the older
     * one first. True when the newer one ends up first, which is the switch changing what Facebook
     * would have done.
     */
    public static boolean putsTheNewestFirst() {
        NewestReels.timeForTests = edge -> "newer".equals(edge) ? 200 : 100;
        try {
            Object older = new Object();
            Object newer = new Object();
            if (NewestReels.records("fb_shorts_tab")) {
                NewestReels.posted("fb_shorts_tab", "older", older);
                NewestReels.posted("fb_shorts_tab", "newer", newer);
            }
            List<Object> ranked = new ArrayList<>(Arrays.asList(older, newer));
            NewestReels.sort(ranked);
            return ranked.get(0) == newer;
        } finally {
            NewestReels.forgetForTests();
        }
    }
}
