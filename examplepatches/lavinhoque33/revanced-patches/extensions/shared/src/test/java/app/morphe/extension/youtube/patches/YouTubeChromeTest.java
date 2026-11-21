/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.youtube.patches;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.pm.PackageInfo;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Insets;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewStub;
import android.view.Window;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.PopupMenu;
import android.widget.TextView;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.util.ReflectionHelpers;

import app.morphe.extension.shared.utils.BaseThemeUtils;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.general.GeneralPatch;
import app.morphe.extension.youtube.patches.general.NavigationButtonsPatch;
import app.morphe.extension.youtube.patches.shorts.ShortsPatch;
import app.morphe.extension.youtube.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
@SuppressWarnings("deprecation")
public class YouTubeChromeTest {
    private static final int LIGHT_COLOR = 0xFFD5BD97;
    private static final int DARK_COLOR = 0xFF192333;
    private static final int PAGE_COLOR = 0xFF99296B;

    private enum Image { MESSAGE_BUBBLE_OVERLAP, TAB_ACTIVITY, TAB_ACTIVITY_CAIRO, LIVE_CHAT, SEARCH }

    @Before
    public void setUp() {
        var app = RuntimeEnvironment.getApplication();
        var info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.applicationInfo = app.getApplicationInfo();
        info.versionName = "21.45.90";
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);

        Utils.setContext(app);
        BaseThemeUtils.setThemeLightColor(LIGHT_COLOR);
        BaseThemeUtils.setThemeDarkColor(DARK_COLOR);
        BaseThemeUtils.setIsDarkModeEnabled(false);
        Settings.HIDE_TOOLBAR_MESSAGES_BUTTON.resetToDefault();
        Settings.HIDE_SHORTS_SPEED_EDUCATION.resetToDefault();
        Settings.OPAQUE_SYSTEM_NAVIGATION_BAR_LIGHT.resetToDefault();
        Settings.OPAQUE_SYSTEM_NAVIGATION_BAR_DARK.resetToDefault();
        Settings.NAVIGATION_BAR_STYLE.resetToDefault();
    }

    @Test
    public void messagesSwitchRemovesOnlyTheMessagesMenuItem() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            var menu = new PopupMenu(controller.get(), new View(controller.get())).getMenu();
            MenuItem messages = menu.add("Messages");
            GeneralPatch.hideToolbarMessagesButton(Image.MESSAGE_BUBBLE_OVERLAP, messages);
            assertTrue(menu.hasVisibleItems());

            Settings.HIDE_TOOLBAR_MESSAGES_BUTTON.save(true);
            GeneralPatch.hideToolbarMessagesButton(Image.MESSAGE_BUBBLE_OVERLAP, messages);
            assertFalse(messages.isVisible());
            assertFalse("The menu must not allocate a slot for the hidden item", menu.hasVisibleItems());

            for (Image icon : Image.values()) {
                if (icon == Image.MESSAGE_BUBBLE_OVERLAP) continue;
                MenuItem neighbor = menu.add(icon.name());
                GeneralPatch.hideToolbarMessagesButton(icon, neighbor);
                assertTrue(icon.name(), neighbor.isVisible());
            }
            MenuItem unknown = menu.add("Unknown");
            GeneralPatch.hideToolbarMessagesButton(null, unknown);
            assertTrue(unknown.isVisible());
            menu.clear();
            Settings.HIDE_TOOLBAR_MESSAGES_BUTTON.resetToDefault();
            MenuItem rebuilt = menu.add("Messages");
            GeneralPatch.hideToolbarMessagesButton(Image.MESSAGE_BUBBLE_OVERLAP, rebuilt);
            assertTrue(rebuilt.isVisible());
        }
    }

    @Test
    public void shortsSwitchSkipsInflationOfOnlyTheEducationStub() {
        var app = RuntimeEnvironment.getApplication();
        var reel = new FrameLayout(app);
        var education = new ViewStub(app, android.R.layout.simple_list_item_1);
        var indicator = new ViewStub(app, android.R.layout.simple_list_item_1);
        reel.addView(education);
        reel.addView(indicator);

        assertSame(education, ShortsPatch.getShortsSpeedEducationStub(education));
        Settings.HIDE_SHORTS_SPEED_EDUCATION.save(true);
        assertNull(ShortsPatch.getShortsSpeedEducationStub(education));
        assertSame("The tutorial stub remains an uninflated, gone placeholder", reel, education.getParent());
        assertEquals(View.GONE, education.getVisibility());
        assertTrue(indicator.inflate() instanceof TextView);

        Settings.HIDE_SHORTS_SPEED_EDUCATION.resetToDefault();
        assertTrue(ShortsPatch.getShortsSpeedEducationStub(education).inflate() instanceof TextView);
        assertNull(ShortsPatch.getShortsSpeedEducationStub(null));
    }

    @Test
    @Config(sdk = 28)
    public void oldAndroidKeepsTheNativeWindowColorEvenIfTheSettingsWereImported() {
        Settings.OPAQUE_SYSTEM_NAVIGATION_BAR_LIGHT.save(true);
        Settings.OPAQUE_SYSTEM_NAVIGATION_BAR_DARK.save(true);
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Window window = controller.get().getWindow();
            applyNativeColor(window, Color.TRANSPARENT);
            assertEquals(Color.TRANSPARENT, window.getNavigationBarColor());
        }
    }

    @Test
    public void legacyWindowFollowsLateThemeResolutionWithoutClobberingOtherNativeColorWrites() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Window window = controller.get().getWindow();
            View decor = window.getDecorView();
            applyNativeColor(window, Color.TRANSPARENT);
            assertEquals(Color.TRANSPARENT, window.getNavigationBarColor());

            Settings.OPAQUE_SYSTEM_NAVIGATION_BAR_DARK.save(true);
            ReflectionHelpers.setStaticField(BaseThemeUtils.class, "isDarkModeEnabled", null);
            applyNativeColor(window, Color.TRANSPARENT);
            assertEquals(Color.TRANSPARENT, window.getNavigationBarColor());

            BaseThemeUtils.setIsDarkModeEnabled(true);
            decor.getViewTreeObserver().dispatchOnPreDraw();
            assertEquals(DARK_COLOR, window.getNavigationBarColor());
            BaseThemeUtils.setIsDarkModeEnabled(false);
            decor.getViewTreeObserver().dispatchOnPreDraw();
            assertEquals(Color.TRANSPARENT, window.getNavigationBarColor());

            window.setNavigationBarColor(PAGE_COLOR);
            BaseThemeUtils.setIsDarkModeEnabled(true);
            decor.getViewTreeObserver().dispatchOnPreDraw();
            assertEquals(PAGE_COLOR, window.getNavigationBarColor());
        }
    }

    @Test
    @Config(sdk = 35)
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void enforcedEdgeToEdgePaintsOnlyTheVisibleNavigationInsetAndRestoresTheTheme() {
        Settings.OPAQUE_SYSTEM_NAVIGATION_BAR_LIGHT.save(true);
        try (var controller = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Window window = controller.get().getWindow();
            View decor = window.getDecorView();
            decor.layout(0, 0, 100, 120);
            applyNativeColor(window, Color.TRANSPARENT);

            setRootInsets(decor, Insets.of(0, 0, 0, 20), false);
            assertEquals(LIGHT_COLOR, overlayPixel(decor, 50, 110));
            assertEquals(PAGE_COLOR, overlayPixel(decor, 50, 90));
            BaseThemeUtils.setIsDarkModeEnabled(true);
            assertEquals(PAGE_COLOR, overlayPixel(decor, 50, 110));
            BaseThemeUtils.setIsDarkModeEnabled(false);
            assertEquals(LIGHT_COLOR, overlayPixel(decor, 50, 110));

            setRootInsets(decor, Insets.of(0, 0, 20, 0), false);
            assertEquals(LIGHT_COLOR, overlayPixel(decor, 90, 50));
            assertEquals(PAGE_COLOR, overlayPixel(decor, 50, 110));
            setRootInsets(decor, Insets.of(0, 0, 20, 0), true);
            assertEquals(PAGE_COLOR, overlayPixel(decor, 90, 50));
            setRootInsets(decor, Insets.NONE, false);
            assertEquals(PAGE_COLOR, overlayPixel(decor, 90, 50));
            assertEquals(Color.TRANSPARENT, window.getNavigationBarColor());
        }
    }

    @Test
    @Config(sdk = 36)
    public void globalOpaqueUsesItsExistingColorPathRegardlessOfThePerThemeSwitches() {
        Settings.NAVIGATION_BAR_STYLE.save(NavigationButtonsPatch.NavigationBarStyle.OPAQUE);
        Settings.OPAQUE_SYSTEM_NAVIGATION_BAR_DARK.save(true);
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Window window = controller.get().getWindow();
            assertEquals(LIGHT_COLOR, NavigationButtonsPatch.getSystemNavigationBarColor(window, Color.TRANSPARENT));
            BaseThemeUtils.setIsDarkModeEnabled(true);
            assertEquals(DARK_COLOR, NavigationButtonsPatch.getSystemNavigationBarColor(window, Color.TRANSPARENT));
        }
    }

    private static void applyNativeColor(Window window, int stockColor) {
        int color = NavigationButtonsPatch.getSystemNavigationBarColor(window, stockColor);
        if (color != window.getNavigationBarColor()) window.setNavigationBarColor(color);
    }

    private static void setRootInsets(View decor, Insets navigation, boolean imeVisible) {
        var insets = new WindowInsets.Builder()
                .setInsets(WindowInsets.Type.navigationBars(), navigation)
                .setVisible(WindowInsets.Type.navigationBars(), !Insets.NONE.equals(navigation))
                .setVisible(WindowInsets.Type.ime(), imeVisible)
                .build();
        // Feed the constructed insets into the real ViewRootImpl cache read by getRootWindowInsets().
        Object root = ReflectionHelpers.callInstanceMethod(decor, "getViewRootImpl");
        ReflectionHelpers.setField(root, "mLastWindowInsets", insets);
    }

    private static int overlayPixel(View decor, int x, int y) {
        decor.getViewTreeObserver().dispatchOnPreDraw();
        View overlay = ReflectionHelpers.getField(decor.getOverlay(), "mOverlayViewGroup");
        var bitmap = Bitmap.createBitmap(decor.getWidth(), decor.getHeight(), Bitmap.Config.ARGB_8888);
        try {
            bitmap.eraseColor(PAGE_COLOR);
            overlay.draw(new Canvas(bitmap));
            return bitmap.getPixel(x, y);
        } finally {
            bitmap.recycle();
        }
    }
}
