/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.coexist;

import android.content.Context;
import android.content.pm.PackageManager;

import androidx.annotation.Nullable;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * The names Facebook's own code gives the two permissions it shares with Meta's other apps.
 *
 * <p>Android lets one signing key own a permission name, and Messenger, Facebook Lite, Meta
 * Business Suite and Workplace declare these two as well, so a re-signed Facebook and any of them
 * couldn't be installed together. Install beside Meta's apps renames both in Facebook's manifest.
 * Facebook's code names them too: it sends broadcasts that only a holder of one may receive, and
 * registers receivers that only a holder may reach, and a re-signed build holds only the renamed
 * one. Every place the code loads one of those names hands it to {@link #name}, which answers the
 * name this install holds.
 *
 * <p>On an ordinary install from Morphe Manager that's the renamed one. A Root Mount install runs
 * the patched code over Meta's own install, whose manifest and signature Android still goes by, so
 * there the renamed permission isn't declared at all and Facebook's own names come back as they
 * were. Answering the renamed name there would leave those broadcasts with nobody allowed to send
 * or receive them.
 *
 * <p>A copy renamed with Morphe's Clone app, its Update permissions option on, declares them once
 * more renamed, under its own package and an underscore, and the components that require them name
 * those (#16). There it's those names Facebook's code has to use.
 *
 * <p>This can run while Facebook's application is still starting, before Hushfacebook has a
 * context: Profilo's trace setup names one of them that early. It reads no setting, and until the
 * context is there it answers the renamed name without remembering it, since that's what nearly
 * every install holds.
 */
@SuppressWarnings("unused")
public final class SharedPermissions {
    static final String FACEBOOK_PREFIX = "com.facebook.";
    static final String RENAMED_PREFIX = "app.hushfacebook.";

    /** Declared by Facebook, Messenger, Lite, Business Suite and Workplace, at signature level. */
    static final String APP_COMMUNICATION = "com.facebook.permission.prod.FB_APP_COMMUNICATION";

    /** The same name as Facebook's code builds it, with its build flavour filled in by String.format. */
    static final String APP_COMMUNICATION_FORMAT = "com.facebook.permission.%s.FB_APP_COMMUNICATION";

    /** Guards the receiver that hands Facebook's device id to the other Meta apps. */
    static final String RECEIVER_ACCESS = "com.facebook.receiver.permission.ACCESS";

    /** Whether this install holds the renamed permission, or null until a context has said. */
    @Nullable
    static volatile Boolean holdsRenamed;

    /** What the renamed names this install holds start with, once {@link #holdsRenamed} is true. */
    static volatile String heldPrefix = RENAMED_PREFIX;

    private SharedPermissions() {
    }

    /**
     * The name to use in place of [facebookName], one of the names Facebook's code loads: the
     * renamed one when this install holds it, Facebook's own when it doesn't. Any other text comes
     * back as it was.
     */
    public static String name(@Nullable String facebookName) {
        HookStatus.invoked(FamilyNames.INSTALL_BESIDE_META_APPS);
        if (!isShared(facebookName)) return facebookName;
        try {
            String prefix = prefixHeld();
            if (prefix == null) {
                HookStatus.bound(FamilyNames.INSTALL_BESIDE_META_APPS, "Facebook's own names");
                return facebookName;
            }
            HookStatus.bound(FamilyNames.INSTALL_BESIDE_META_APPS, "renamed permissions");
            return prefix + facebookName.substring(FACEBOOK_PREFIX.length());
        } catch (Throwable failure) {
            // A permission check that throws is no reason to fail Facebook's broadcast, and the
            // renamed name is the one an ordinary install holds.
            HookStatus.threw(FamilyNames.INSTALL_BESIDE_META_APPS, "name", failure);
            Logger.printException(() -> "Could not tell which permission names this install holds", failure);
            return renamed(facebookName);
        }
    }

    /** Whether [text] is one of the names this class renames. */
    static boolean isShared(@Nullable String text) {
        return APP_COMMUNICATION.equals(text) || APP_COMMUNICATION_FORMAT.equals(text) || RECEIVER_ACCESS.equals(text);
    }

    /** [facebookName] under the renamed prefix: com.facebook.X becomes app.hushfacebook.X. */
    static String renamed(String facebookName) {
        return RENAMED_PREFIX + facebookName.substring(FACEBOOK_PREFIX.length());
    }

    /**
     * What the renamed permissions this install declares, and so holds, start with, or null when it
     * declares none. Asked once per process, once a context is there. The manifest renames both
     * together, so one of them answers for both.
     */
    @Nullable
    private static String prefixHeld() {
        Boolean known = holdsRenamed;
        if (known != null) return known ? heldPrefix : null;
        if (!Utils.settingsReady()) return RENAMED_PREFIX;
        Context context = Utils.getContext();
        if (context == null) return RENAMED_PREFIX;
        String clone = context.getPackageName() + "_" + RENAMED_PREFIX;
        String prefix = holds(context, RENAMED_PREFIX) ? RENAMED_PREFIX : holds(context, clone) ? clone : null;
        heldPrefix = prefix == null ? RENAMED_PREFIX : prefix;
        holdsRenamed = prefix != null;
        Logger.printInfo(() -> prefix == null
                ? "This install doesn't declare the renamed Meta app permissions (a Root Mount install?), so "
                        + "Facebook's code keeps its own names"
                : "This install declares the renamed Meta app permissions under " + prefix
                        + ", so Facebook's code uses them");
        return prefix;
    }

    private static boolean holds(Context context, String prefix) {
        String name = prefix + APP_COMMUNICATION.substring(FACEBOOK_PREFIX.length());
        return context.checkSelfPermission(name) == PackageManager.PERMISSION_GRANTED;
    }
}
