/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.ColorFilter;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableWrapper;
import android.view.View;
import android.widget.ImageView;

import androidx.annotation.Nullable;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the Unlock app icons patch asks when Facebook checks whether the account may use its paid
 * app icons.
 *
 * <p>Facebook 582 ships every alternate launcher icon in the app, as disabled activity-aliases of
 * its launcher, and Settings and privacy > App icon switches between them on the phone with no
 * server call. Which ones the picker unlocks, and whether the start-up job puts the default icon
 * back, both come from the account's Facebook Plus benefits: the benefit provider's check of a
 * benefit name, and the picker's own look at each synced set of benefits. While the switch is on,
 * {@link #unlocked} answers the provider's check yes for the app icon benefit alone, and
 * {@link #entitled} answers the picker's look yes, so every icon applies the way a free one does and
 * stays. Every other benefit is Facebook's answer.
 *
 * <p>The first start after an update also runs Facebook's component manager, which puts every
 * component back to its manifest state: the launcher entry on and each icon alias off, so a picked
 * icon was lost on every repatch. While the switch is on, {@link #componentState} skips the launcher
 * entry and its aliases there and passes every other component through.
 *
 * <p>It fails closed to Facebook: the switch off, a pause, settings that aren't ready yet, or a
 * failure in here, and Facebook's own answer stands.
 */
public final class AppIcons {
    /** The benefit name Facebook gives its paid app icons. */
    public static final String BENEFIT = "CUSTOM_APP_ICON";

    /** The launcher entry. Every app icon is an activity-alias of it named {@code LAUNCHER + ".<icon>"}. */
    public static final String LAUNCHER = "com.facebook.katana.LoginActivity";

    /** The blue picker choice is Facebook's normal icon, so it keeps the stock wordmark. */
    static final String DEFAULT_ICON = LAUNCHER + ".blue_fb";

    /** Every icon alias in Facebook 582's manifest, in picker order with the normal blue icon last. */
    private static final String[] ICON_ALIASES = {
            "worldcup_ic", "fab_ic", "vaporwave_ic", "fierce_ic", "loved_ic",
            "dreamy_ic", "quiet_cool", "katana", "blue_fb"
    };

    /** The diagnostic counter route: each check Facebook made, and the ones answered yes. */
    static final String ROUTE = "App icons";

    private AppIcons() {
    }

    /**
     * Injection point, first in the benefit provider's check of one benefit. True answers the check
     * yes at once, for the app icon benefit only. Never throws.
     */
    public static boolean unlocked(@Nullable String benefit) {
        if (!BENEFIT.equals(benefit)) return false;
        return unlock("benefit check");
    }

    /**
     * Injection point, on the picker's look at a synced set of benefits. Answers [facebook], or true
     * while the switch unlocks the icons. Never throws.
     */
    public static boolean entitled(boolean facebook) {
        if (!facebook) return unlock("picker's benefit set");
        try {
            HookStatus.invoked(FamilyNames.APP_ICONS);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.APP_ICONS, "picker's benefit set", failure);
        }
        return true;
    }

    /**
     * Injection point, in place of the component manager's PackageManager.setComponentEnabledSetting
     * call. Makes that call unless {@link #keepsIcon} keeps the component as it is, so the call's own
     * errors still reach the manager.
     */
    public static void componentState(PackageManager manager, ComponentName component, int state, int flags) {
        if (keepsIcon(component)) return;
        manager.setComponentEnabledSetting(component, state, flags);
    }

    /**
     * Whether the component manager leaves [component] as it is: the launcher entry or one of its
     * icon aliases, while the switch is on. Never throws.
     */
    public static boolean keepsIcon(@Nullable ComponentName component) {
        try {
            String name = component == null ? null : component.getClassName();
            if (name == null || !(name.equals(LAUNCHER) || name.startsWith(LAUNCHER + "."))) return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.APP_ICONS, "update reset", failure);
            return false;
        }
        return unlock("update reset");
    }

    /**
     * The launcher entry that's on now, for the intents that open Facebook on the patches' behalf:
     * the settings shortcut, a notification's buttons and a saved file's. Picking an icon turns
     * {@link #LAUNCHER} off and the icon's alias on, and Android starts nothing for an intent that
     * names a component that's off, so after an icon change those taps did nothing (#119). Every
     * alias points at the same screen as {@link #LAUNCHER}. {@link #LAUNCHER} itself when Android
     * lists none of them, or on any failure. Never throws.
     */
    public static ComponentName launcher(Context context) {
        String packageName = context.getPackageName();
        try {
            Intent main = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(packageName);
            // Components that are off aren't listed without MATCH_DISABLED_COMPONENTS.
            for (ResolveInfo entry : context.getPackageManager().queryIntentActivities(main, 0)) {
                String name = entry.activityInfo == null ? null : entry.activityInfo.name;
                if (name != null && (name.equals(LAUNCHER) || name.startsWith(LAUNCHER + "."))) {
                    return new ComponentName(packageName, name);
                }
            }
        } catch (Throwable failure) {
            Logger.printException(() -> "App icons: could not find the launcher entry that's on", failure);
        }
        return new ComponentName(packageName, LAUNCHER);
    }

    /**
     * Replaces the home header's stock wordmark with the enabled alternate launcher icon, when both
     * Unlock app icons and Use the icon at the top of Home are on (#172). Facebook has already loaded
     * its wordmark when this runs, so the default icon, either switch off, Pause, and every failure
     * leave that wordmark alone. Home header text takes the header first when it has words. Never
     * throws.
     */
    public static void dressLogo(@Nullable View logo) {
        if (HeaderText.replacesLogo()) return;
        if (!unlock("header logo", Settings.USE_APP_ICON_IN_HEADER)) return;
        try {
            if (!(logo instanceof ImageView)) return;
            Context context = logo.getContext();
            ComponentName picked = pickedIcon(context);
            if (picked == null || DEFAULT_ICON.equals(picked.getClassName())) return;
            Drawable icon = context.getPackageManager().getActivityIcon(picked);
            ImageView image = (ImageView) logo;
            Drawable wordmark = image.getDrawable();
            image.clearColorFilter();
            image.setImageTintList(null);
            image.setImageDrawable(new UntintedDrawable(icon, headerIconSize(image, wordmark, icon)));
            image.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            Logger.printDebug(() -> "App icons: put " + picked.getClassName() + " in the header");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.APP_ICONS, "header logo", failure);
            Logger.printException(() -> "App icons: could not put the picked icon in the header", failure);
        }
    }

    /** The explicitly enabled alias, or null while Facebook's normal launcher entry is on. */
    @Nullable
    private static ComponentName pickedIcon(Context context) {
        PackageManager manager = context.getPackageManager();
        String packageName = context.getPackageName();
        for (String suffix : ICON_ALIASES) {
            ComponentName alias = new ComponentName(packageName, LAUNCHER + "." + suffix);
            if (manager.getComponentEnabledSetting(alias) == PackageManager.COMPONENT_ENABLED_STATE_ENABLED) {
                return alias;
            }
        }
        return null;
    }

    /** Keeps a square icon inside the height Facebook reserved for its stock wordmark. */
    private static int headerIconSize(ImageView image, @Nullable Drawable wordmark, Drawable icon) {
        int size = wordmark == null ? -1 : wordmark.getIntrinsicHeight();
        if (size <= 0) size = image.getMeasuredHeight() - image.getPaddingTop() - image.getPaddingBottom();
        if (size <= 0) size = image.getHeight() - image.getPaddingTop() - image.getPaddingBottom();
        if (size <= 0 && image.getLayoutParams() != null && image.getLayoutParams().height > 0) {
            size = image.getLayoutParams().height - image.getPaddingTop() - image.getPaddingBottom();
        }
        if (size <= 0) size = icon.getIntrinsicHeight();
        return size;
    }

    /**
     * The wordmark view applies Facebook's theme color as an ImageView color filter. Launcher icons
     * are full color, so this wrapper passes drawing and sizing through while refusing that filter.
     */
    private static final class UntintedDrawable extends DrawableWrapper {
        private final int size;

        UntintedDrawable(Drawable icon, int size) {
            super(icon.mutate());
            this.size = size;
            getDrawable().clearColorFilter();
        }

        @Override
        public int getIntrinsicWidth() {
            return size > 0 ? size : super.getIntrinsicWidth();
        }

        @Override
        public int getIntrinsicHeight() {
            return size > 0 ? size : super.getIntrinsicHeight();
        }

        @Override
        public void setColorFilter(@Nullable ColorFilter colorFilter) {
            getDrawable().clearColorFilter();
        }
    }

    /** True while the switch unlocks the icons, counted under [hook]. Never throws. */
    private static boolean unlock(String hook) {
        return unlock(hook, null);
    }

    /** Same, and the hook also needs [also] on when one is given. */
    private static boolean unlock(String hook, @Nullable BooleanSetting also) {
        try {
            HookStatus.invoked(FamilyNames.APP_ICONS);
            FeedFilterCounters.sawList(ROUTE, 1);
            if (!Utils.settingsReady() || !Settings.UNLOCK_APP_ICONS.get()) return false;
            if (also != null && !also.get()) return false;
            FeedFilterCounters.removed(ROUTE, 1, hook);
            Logger.printDebug(() -> "App icons: unlocked for the " + hook);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.APP_ICONS, hook, failure);
            return false;
        }
    }
}
