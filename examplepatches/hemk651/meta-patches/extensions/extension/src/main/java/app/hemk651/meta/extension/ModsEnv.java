/*
 * Meta Patches — extension environment constants.
 *
 * This class is part of the Meta Patches extension, which is merged into the
 * target app by the Meta Patches patch bundle. The menu is forked from the
 * InstaFL embedded app (https://github.com/mamiiblt/instafel) by
 * mamiiblt (Muhammed Ali Bulut) and rebranded to Meta Patches.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.meta.extension;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;

/**
 * Build information and repository metadata of the patch bundle.
 */
public class ModsEnv {

    // ── Branding ────────────────────────────────────────────────────────────
    /** Display name of the menu. */
    public static final String APP_NAME = "Mods";
    /** Project name used in about screens. */
    public static final String PROJECT_NAME = "Meta Patches";

    // ── Build information ───────────────────────────────────────────────────
    /**
     * Patch bundle version. Generated at extension build time from the Gradle
     * project version (see extensions/extension/build.gradle.kts), which the
     * release flow sets to the release version, so the menu shows the version
     * that is actually installed.
     */
    public static final String PATCH_VERSION = BuildConfig.PATCH_VERSION;
    /**
     * Installation type of the patched app. The clone generation of InstaFL is
     * not ported, so a Meta Patches build is always a normal package.
     */
    public static final String INSTALL_TYPE = "Normal package";

    // ── Repository information ──────────────────────────────────────────────
    public static final String REPO_OWNER = "hemk651";
    public static final String REPO_NAME = "meta-patches";
    public static final String REPO_URL = "https://github.com/hemk651/meta-patches";
    public static final String DEVELOPER_URL = "https://github.com/hemk651";
    // ── Inspired By and Credits ─────────────────────────────────────────────
    /**
     * The menu UI and the patch logic are forked from InstaFL.
     * Credit must always stay visible to the original developer.
     */
    public static final String CREDITS_TITLE = "Inspired By and Credits";
    public static final String CREDITS_URL = "https://github.com/mamiiblt/instafel";
    public static final String CREDITS_TEXT =
            "This project is a fork of InstaFL, originally developed by "
                    + "mamiiblt (Muhammed Ali Bulut). The menu, tools and patch "
                    + "ideas come from InstaFL — thanks to them for building "
                    + "and sharing the project.\n"
                    + "Project: https://github.com/mamiiblt/instafel\n\n"
                    + "Meta Patches is an independent fork; it is not affiliated "
                    + "with InstaFL, Meta, or Instagram.";

    // ── Runtime state ───────────────────────────────────────────────────────
    private static String igVersion = null;
    private static String igVersionCode = null;

    /**
     * Instagram version of the APK the extension runs in, resolved at runtime
     * so the extension does not need to be rebuilt for app updates.
     */
    public static String getIgVersion(Context ctx) {
        if (igVersion == null) {
            igVersion = readPackageInfo(ctx, false);
        }
        return igVersion == null ? "unknown" : igVersion;
    }

    /**
     * Instagram version code of the APK the extension runs in.
     */
    public static String getIgVersionCode(Context ctx) {
        if (igVersionCode == null) {
            igVersionCode = readPackageInfo(ctx, true);
        }
        return igVersionCode == null ? "unknown" : igVersionCode;
    }

    /**
     * Reads the version name or version code of the host package.
     */
    private static String readPackageInfo(Context ctx, boolean versionCode) {
        try {
            PackageManager pm = ctx.getPackageManager();
            PackageInfo info = pm.getPackageInfo(ctx.getPackageName(), 0);
            if (versionCode) {
                long code = Build.VERSION.SDK_INT >= 28
                        ? info.getLongVersionCode()
                        : info.versionCode;
                return Long.toString(code);
            }
            return info.versionName;
        } catch (Exception e) {
            return null;
        }
    }

    private ModsEnv() {
    }
}
