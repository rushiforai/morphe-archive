/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.net.Uri;
import android.preference.Preference;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

import app.morphe.extension.facebook.settings.SettingsRows.Row;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Facebook's Whitehat settings, the screen where a security researcher lets Facebook trust user
 * installed certificates, sets a proxy and turns TLS 1.3 off. Facebook shows it only after a web
 * enrollment. This row starts that screen and nothing else: Hushfacebook never changes its settings.
 *
 * <p>The screen's code isn't in the APK. On 577, 580 and 581 the activity in base.apk is a shell that
 * loads the downloadable Voltron module "internsettings" first (assets/app_modules.json lists it under
 * "downloadable"; neither base.apk nor any split carries assets/internsettings) and throws "Failed to
 * load module for activity: WhitehatSettingsActivity" when it can't, which closes Facebook. So the row
 * looks for the module where Facebook's loader does (ModuleApkUtil's split_internsettings.apk, or
 * {@code <dataDir>/modules/internsettings_<hash>/download.zip} with the hash from app_modules.json)
 * and, without it, opens the web page instead.
 */
@SuppressWarnings("deprecation")
final class WhitehatScreen {
    /** Kept class name, declared in all three builds' manifests (exported=false). */
    static final String ACTIVITY = "com.facebook.katana.internsettingsactivity.WhitehatSettingsActivity";
    static final String MODULE = "internsettings";
    static final String WEB_PAGE = "https://www.facebook.com/whitehat";

    /** Set by tests: whether the module is there. Null asks the phone. */
    static Boolean availableForTests;

    private WhitehatScreen() {
    }

    /** The row under Pause, backup and diagnostics. Its summary says which of the two a tap opens. */
    static Preference row(Context context) {
        Preference row = new Row(context);
        row.setTitle(L10n.t("Facebook's Whitehat settings"));
        row.setSummary(available(context)
                ? L10n.t("Facebook's own screen for security research, where it can trust certificates you installed "
                        + "and send its traffic through a proxy. Hushfacebook doesn't change anything there.")
                : L10n.t("Facebook hasn't downloaded this screen to this phone, so a tap opens the Whitehat page "
                        + "on the web instead."));
        row.setPersistent(false);
        row.setOnPreferenceClickListener(p -> {
            open(p.getContext());
            return true;
        });
        return row;
    }

    /** The explicit, in-process intent for Facebook's screen. */
    static Intent screenIntent(Context context) {
        return new Intent().setComponent(new ComponentName(context.getPackageName(), ACTIVITY));
    }

    static Intent webIntent() {
        return new Intent(Intent.ACTION_VIEW, Uri.parse(WEB_PAGE)).addCategory(Intent.CATEGORY_BROWSABLE);
    }

    /** Asked again at the tap: the module can arrive or go while the screen is open. */
    static void open(Context context) {
        boolean screen = available(context);
        try {
            context.startActivity(screen ? screenIntent(context) : webIntent());
        } catch (ActivityNotFoundException | SecurityException missing) {
            // A build without the activity, or no browser. Uncaught, Android's exception closed Facebook.
            Logger.printInfo(() -> "Nothing opened Facebook's Whitehat settings: " + missing.getClass().getSimpleName());
            Utils.showToastLong(screen
                    ? L10n.t("This Facebook build has no Whitehat settings screen.")
                    : L10n.f("No app on this phone can open the link. The address is %1$s.", L10n.isolate(WEB_PAGE)));
        }
    }

    static boolean available(Context context) {
        if (availableForTests != null) return availableForTests;
        try {
            ApplicationInfo info = context.getApplicationInfo();
            return installed(readAppModules(context), info.dataDir == null ? null : new File(info.dataDir),
                    info.splitSourceDirs);
        } catch (Throwable t) {
            // Unreadable metadata is a missing module: the web page is the safe answer.
            Logger.printInfo(() -> "Couldn't tell whether the Whitehat module is there: " + t.getClass().getSimpleName());
            return false;
        }
    }

    /**
     * Whether Facebook's loader would find the module: installed as a split, or downloaded into
     * {@code modules/<name>_<hash>/download.zip} under the app's data folder.
     *
     * @param appModules the text of assets/app_modules.json, or null when the APK has none
     */
    static boolean installed(String appModules, File dataDir, String[] splitSourceDirs) {
        if (splitSourceDirs != null) {
            for (String split : splitSourceDirs) {
                if (split != null && split.endsWith("split_" + MODULE + ".apk") && new File(split).exists()) return true;
            }
        }
        if (appModules == null || dataDir == null) return false;
        try {
            JSONArray downloadable = new JSONObject(appModules).optJSONArray("downloadable");
            if (downloadable == null) return false;
            for (int i = 0; i < downloadable.length(); i++) {
                JSONObject module = downloadable.optJSONObject(i);
                if (module == null || !MODULE.equals(module.optString("name"))) continue;
                if (module.optBoolean("disabled", false)) return false;
                String hash = module.optString("hash", "");
                if (hash.isEmpty()) return false;
                return new File(new File(new File(dataDir, "modules"), MODULE + "_" + hash), "download.zip").isFile();
            }
        } catch (Exception malformed) {
            return false;
        }
        return false;
    }

    private static String readAppModules(Context context) {
        try (InputStream in = context.getAssets().open("app_modules.json")) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            for (int n; (n = in.read(buffer)) > 0; ) out.write(buffer, 0, n);
            return out.toString(StandardCharsets.UTF_8.name());
        } catch (Exception none) {
            return null;
        }
    }
}
