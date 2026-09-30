/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.navigation;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;

import com.facebook.video.videohome.tab.WatchTab;

import org.robolectric.RuntimeEnvironment;

/** Hide the Reels tab as the tab bar builder asks it, for tests in any package. */
public final class ReelsTabForTests {
    private ReelsTabForTests() {
    }

    /** Says the patch is in the build, or with null, asks SettingsStatus again. */
    public static void inBuild(Boolean inBuild) {
        ReelsTab.inBuildForTests = inBuild;
    }

    /**
     * Asks the hook about the Reels tab, which Facebook's own settings don't hide, with the patch
     * in the build. True when it takes the tab off, which is the switch changing what Facebook
     * would have done.
     */
    public static boolean hidesTheTab() {
        Boolean before = ReelsTab.inBuildForTests;
        ReelsTab.inBuildForTests = Boolean.TRUE;
        try {
            return ReelsTab.hidesTab(false, new WatchTab());
        } finally {
            ReelsTab.inBuildForTests = before;
            ReelsTab.forget();
        }
    }

    /** The id Facebook gives its launcher shortcut to the Reels tab. */
    public static final String SHORTCUT_ID = ReelsTab.SHORTCUT_ID;

    /** What the patch counts each time it keeps that shortcut out. */
    public static final String SHORTCUT_HELD = ReelsTab.SHORTCUT_HELD;

    /** Facebook's launcher shortcut [id], as it pushes one. */
    public static ShortcutInfo facebookShortcut(Context context, String id) {
        return new ShortcutInfo.Builder(context, id)
                .setShortLabel(id)
                .setIntent(new Intent(Intent.ACTION_VIEW))
                .setRank(0)
                .build();
    }

    /**
     * Asks the hook about Facebook's push of its Reels shortcut, with the patch in the build. True
     * when it holds the push back, which is the switch changing what Facebook would have done.
     */
    public static boolean dropsTheShortcut() {
        Boolean before = ReelsTab.inBuildForTests;
        ReelsTab.inBuildForTests = Boolean.TRUE;
        try {
            Context context = RuntimeEnvironment.getApplication();
            return ReelsTab.dropsShortcut(context.getSystemService(ShortcutManager.class),
                    facebookShortcut(context, SHORTCUT_ID));
        } finally {
            ReelsTab.inBuildForTests = before;
            ReelsTab.forget();
        }
    }

    /** Forgets what the hook logged, as a new process would. */
    public static void forget() {
        ReelsTab.forget();
    }

    /** Asks the tab bar's count hook about the Reels tab. True when it answers none for it. */
    public static boolean clearsTheDot() {
        return ReelsTabDot.clear(new WatchTab());
    }
}
