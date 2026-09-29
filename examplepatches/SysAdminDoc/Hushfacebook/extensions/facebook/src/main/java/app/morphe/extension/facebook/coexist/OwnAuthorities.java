/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.coexist;

import android.app.Application;

import androidx.annotation.Nullable;

/**
 * Facebook's own content provider authorities, as the running app has them.
 *
 * <p>Facebook's code spells some of its authorities out, such as
 * {@code content://com.facebook.katana.ClientMessagePushDedupInfoProvider/mutestatus}, which it
 * clears at every start. Morphe's Clone app renames the package, and the clone's providers move
 * with it, so a clone reached the providers of the Facebook it was cloned from instead. That app
 * turned it away, and the clone crashed at launch (#16). Every place the code loads one of those
 * names hands it to {@link #name}, which answers the running app's.
 *
 * <p>Facebook fills in some of these names from static initialisers, which can run while its
 * content providers start and before Hushfacebook has a context. So the running package comes from
 * the process name, which Android sets before any of the app's code runs. Facebook names every
 * process after its package, a colon and a name of its own, and the patch's tests hold that. No
 * setting and no log is read here, for the same reason.
 */
@SuppressWarnings("unused")
public final class OwnAuthorities {
    static final String FACEBOOK = "com.facebook.katana";
    private static final String CONTENT = "content://";

    /** The running app's package, read off its process name the first time it's needed. */
    @Nullable
    static volatile String runningPackage;

    private OwnAuthorities() {
    }

    /**
     * [facebookName], one of Facebook's own authorities or a content:// address on one, as the
     * running app has it: unchanged in Facebook itself, under the clone's package in a clone. Any
     * other text comes back as it was.
     */
    public static String name(@Nullable String facebookName) {
        if (facebookName == null) return null;
        try {
            String running = runningPackage();
            if (running == null || FACEBOOK.equals(running)) return facebookName;
            int start = facebookName.startsWith(CONTENT) ? CONTENT.length() : 0;
            if (!facebookName.startsWith(FACEBOOK + ".", start)) return facebookName;
            return facebookName.substring(0, start) + running + facebookName.substring(start + FACEBOOK.length());
        } catch (Throwable failure) {
            // Facebook's own name is what every install but a clone uses.
            return facebookName;
        }
    }

    @Nullable
    private static String runningPackage() {
        String known = runningPackage;
        if (known != null) return known;
        known = packageOf(Application.getProcessName());
        runningPackage = known;
        return known;
    }

    /** The package a process of this name belongs to: the name up to its first colon. */
    @Nullable
    static String packageOf(@Nullable String processName) {
        if (processName == null) return null;
        int colon = processName.indexOf(':');
        String name = colon < 0 ? processName : processName.substring(0, colon);
        return name.isEmpty() ? null : name;
    }
}
