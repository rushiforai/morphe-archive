package app.template.extension.pdb;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;

import java.util.ArrayList;
import java.util.List;

/**
 * Free MBTI / theme app-icon switching.
 *
 * <p>Pdb ships ~58 launcher activity-aliases ({@code pdb.app.aliasENFJ},
 * {@code pdb.app.aliasZenlight}, …) that map {@code LauncherActivity} to themed
 * launcher icons; the stock app only enables one of them from inside its own
 * theme settings. This helper lets the user pick any of them (or restore the
 * stock default) straight from the extras screen.
 *
 * <p>The currently-enabled entry is remembered in the extension's preference file so
 * switching never leaves two launcher icons enabled.
 */
public final class PdbIcons {

    private static final String BASE_LAUNCHER = "pdb.app.LauncherActivity";

    private PdbIcons() {}

    /** Sorted list of the app's launcher icon aliases. */
    public static List<String> aliases(Context ctx) {
        List<String> out = new ArrayList<>();
        try {
            PackageManager pm = ctx.getPackageManager();
            PackageInfo info = pm.getPackageInfo(ctx.getPackageName(),
                PackageManager.GET_ACTIVITIES
                    | PackageManager.GET_DISABLED_COMPONENTS
                    | PackageManager.GET_META_DATA);
            java.util.LinkedHashSet<String> found = new java.util.LinkedHashSet<>();
            ActivityInfo[] all = info.activities;
            if (all != null) {
                for (ActivityInfo ai : all) {
                    if (ai.name != null && ai.name.startsWith("pdb.app.alias")) found.add(ai.name);
                }
            }
            out.addAll(found);
        } catch (Throwable ignored) {
        }
        java.util.Collections.sort(out);
        return out;
    }

    /** Short display name for an alias: {@code pdb.app.aliasZenlight} → {@code Zenlight}. */
    public static String pretty(String component) {
        if (component == null) return "stock";
        int dot = component.lastIndexOf('.');
        String name = dot >= 0 ? component.substring(dot + 1) : component;
        return name.replaceFirst("^alias", "");
    }

    /** The launcher entry the extension currently keeps enabled, or {@code null}. */
    public static String current(Context ctx) {
        return PdbSettings.getString(PdbTools.prefs(ctx), PdbSettings.ICON_ALIAS, "");
    }

    /** Every launcher icon back to the stock {@code LauncherActivity} entry. */
    public static boolean reset(Context ctx) {
        try {
            PackageManager pm = ctx.getPackageManager();
            // Disable every alias, not just the one we remember enabling: the app
            // itself may have enabled a theme alias before the extension ran.
            for (String alias : aliases(ctx)) {
                setEnabled(pm, ctx.getPackageName(), alias, false);
            }
            setEnabled(pm, ctx.getPackageName(), BASE_LAUNCHER, true);
            PdbTools.prefs(ctx).edit().remove(PdbSettings.ICON_ALIAS).apply();
            return true;
        } catch (Throwable t) {
            PdbTools.toast(ctx, "Morphe: icon reset failed — " + t);
            return false;
        }
    }

    /**
     * Enables exactly one icon entry: the chosen alias (or the stock default when
     * {@code aliasName} is empty), disabling whatever the extension enabled before.
     */
    public static boolean switchTo(Context ctx, String aliasName) {
        try {
            PackageManager pm = ctx.getPackageManager();

            if (aliasName == null || aliasName.trim().isEmpty()) {
                return reset(ctx);
            }
            String target = aliasName.trim();
            if (!target.contains(".")) target = "pdb.app.alias" + target;

            // Only one launcher entry may stay enabled. Disable every other alias
            // (including one the app enabled from its theme settings) first.
            for (String alias : aliases(ctx)) {
                if (!alias.equals(target)) setEnabled(pm, ctx.getPackageName(), alias, false);
            }
            setEnabled(pm, ctx.getPackageName(), target, true);
            setEnabled(pm, ctx.getPackageName(), BASE_LAUNCHER, false);
            PdbTools.prefs(ctx).edit().putString(PdbSettings.ICON_ALIAS, target).apply();
            return true;
        } catch (Throwable t) {
            PdbTools.toast(ctx, "Morphe: icon switch failed — " + t);
            return false;
        }
    }

    private static void setEnabled(PackageManager pm, String pkg, String cls, boolean enabled) {
        try {
            pm.setComponentEnabledSetting(
                new ComponentName(pkg, cls),
                enabled ? PackageManager.COMPONENT_ENABLED_STATE_ENABLED
                    : PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);
        } catch (Throwable ignored) {
        }
    }
}
