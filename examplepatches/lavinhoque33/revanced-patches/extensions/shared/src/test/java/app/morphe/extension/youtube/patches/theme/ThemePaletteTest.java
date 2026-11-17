/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-16.
 */
package app.morphe.extension.youtube.patches.theme;

import static org.junit.Assert.*;

import android.content.Context;
import android.content.pm.PackageInfo;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class ThemePaletteTest {
    @Before
    public void setUp() throws Exception {
        var application = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = application.getPackageName();
        packageInfo.versionName = "21.45.90";
        packageInfo.applicationInfo = application.getApplicationInfo();
        Shadows.shadowOf(application.getPackageManager()).installPackage(packageInfo);

        Field context = Utils.class.getDeclaredField("context");
        context.setAccessible(true);
        context.set(null, RuntimeEnvironment.getApplication());
        Settings.STATUS_BAR_TRANSLUCENCY.save(ThemePatch.StatusBarTranslucency.DEFAULT);
    }

    private static int[] darkColors() throws Exception {
        Method method = ThemePatch.class.getDeclaredMethod("getSelectedDarkColors", Context.class);
        method.setAccessible(true);
        return (int[]) method.invoke(null, RuntimeEnvironment.getApplication());
    }

    @Test
    public void stockPreservesMainstageAndLegacyPalettesIndependently() throws Exception {
        Settings.DARK_THEME.save("stock");
        int[] colors = darkColors();
        assertEquals(18, colors.length);
        assertEquals(0xFF0F0F0F, colors[5]);
        assertEquals(0xFF212121, colors[1]);
        assertEquals(0xFF282828, colors[0]);
        assertEquals(0xFF141416, colors[15]);
        assertEquals(0xFF2D2D31, colors[16]);
        assertEquals(0xFF2A2A2D, colors[17]);
    }

    @Test
    public void selectedDarkColorReachesEveryMainstageSurface() throws Exception {
        Settings.DARK_THEME.save("dark_blue");
        int[] colors = darkColors();
        for (int index : new int[]{0, 1, 5, 15, 16, 17}) {
            assertEquals("palette slot " + index, 0xFF001029, colors[index]);
        }
        assertEquals(0xF2001029, colors[2]);
        assertEquals(0x99001029, colors[12]);
    }

    @Test
    public void embeddedTableInflatesAndContainsAllEighteenReplaceableDarkSlots() throws Exception {
        Class<?> overlay = Class.forName(ThemePatch.class.getName() + "$RuntimeResourceOverlay");
        Method inflate = overlay.getDeclaredMethod("inflateTable");
        inflate.setAccessible(true);
        byte[] table = (byte[]) inflate.invoke(null);
        assertTrue(table.length > 1000);

        Field placeholders = overlay.getDeclaredField("DARK_PLACEHOLDERS");
        placeholders.setAccessible(true);
        byte[][] darkPlaceholders = (byte[][]) placeholders.get(null);
        assertEquals(18, darkPlaceholders.length);
        Method replace = overlay.getDeclaredMethod("replacePlaceholderColor", byte[].class, byte[].class, int.class);
        replace.setAccessible(true);
        for (byte[] placeholder : darkPlaceholders) {
            replace.invoke(null, table, placeholder, 0xFF001029);
        }
    }
}
