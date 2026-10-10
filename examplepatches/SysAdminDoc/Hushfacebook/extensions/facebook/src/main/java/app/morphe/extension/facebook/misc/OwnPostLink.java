/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import androidx.annotation.Nullable;

import java.util.Locale;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Sanitize sharing links' own-link switch (#98). When someone shares a post, Facebook asks its
 * server for a facebook.com/share/ link made for that one share, which can point back to whoever
 * shared it, and keeps it by the post. The link a share hands out is that one whenever Facebook
 * has it, and the post's own address, its www link, when it doesn't. Copy link takes its link from
 * there, and so do the share sheet's other ways to send a link.
 *
 * <p>With the switch on, the post's own address goes out instead, the same one Facebook falls back
 * to. Off, paused, before the settings are ready, with no own address that's a web link, or a
 * failure in here, and the link is Facebook's own.
 */
public final class OwnPostLink {
    /** Counted under the patch's name each time a post's own address goes out in place of a /share/ link. */
    static final String OWN_LINK_GIVEN = "Post's own link given";

    private static final String FAMILY = FamilyNames.SANITIZE_SHARING_LINKS;

    private static volatile boolean logged;

    private OwnPostLink() {
    }

    /**
     * The hook right after Facebook reads the /share/ link it keeps for a post, handed that link,
     * or null when there's none, and the post's own address, the link Facebook gives without one.
     * Answers the own address with the switch on and Facebook's link otherwise. Never throws.
     */
    @Nullable
    public static String shareLink(@Nullable String shareLink, @Nullable String ownLink) {
        HookStatus.invoked(FAMILY);
        // No /share/ link means Facebook gives the own address already. Settings mustn't load
        // before the extension has its context.
        if (shareLink == null || shareLink.isEmpty() || !Utils.settingsReady()) return shareLink;
        try {
            if (!Settings.SHARE_POST_OWN_LINK.get()) return shareLink;
            HookStatus.bound(FAMILY, "share link");
            if (!isWebLink(ownLink)) return shareLink;
            HookStatus.counted(FAMILY, OWN_LINK_GIVEN);
            logOnce();
            return ownLink;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "share link", failure);
            return shareLink;
        }
    }

    /** Whether {@code link} is an http or https address. */
    static boolean isWebLink(@Nullable String link) {
        if (link == null) return false;
        String lower = link.toLowerCase(Locale.ROOT);
        return lower.startsWith("https://") || lower.startsWith("http://");
    }

    private static void logOnce() {
        if (logged) return;
        logged = true;
        Logger.printDebug(() -> "Sanitize sharing links: shared a post's own link instead of a /share/ link");
    }

    /** Forgets the one-time log line. Tests only. */
    static void forgetForTests() {
        logged = false;
    }
}
