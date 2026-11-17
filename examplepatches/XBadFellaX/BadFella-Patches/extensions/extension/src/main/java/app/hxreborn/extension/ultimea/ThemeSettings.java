/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 *
 * Additional term under GPLv3 Section 7(b): When conveying this material
 * or modified versions, preserve this notice and credit hxreborn for this
 * material in any Appropriate Legal Notices displayed by works containing it.
 */
package app.hxreborn.extension.ultimea;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.util.Log;
import android.view.View;
import android.view.Window;
import org.json.JSONException;
import org.json.JSONObject;

public final class ThemeSettings {
    private static final String MODE_FILE = "hx_ultimea_theme";
    private static final int AMOLED = 2;
    private static final int AMOLED_BACKGROUND = 0xff000000;

    private ThemeSettings() {}

    public static void prepare(Context context) {
        writeMode(context, AMOLED);
    }

    public static void initialize(Activity activity) {
        Window window = activity.getWindow();
        int background = AMOLED_BACKGROUND;
        window.setStatusBarColor(background);
        window.setNavigationBarColor(background);
        View decor = window.getDecorView();
        decor.setOnSystemUiVisibilityChangeListener((visibility) -> setDarkBars(decor, visibility));
        setDarkBars(decor, decor.getSystemUiVisibility());
    }

    public static void rewriteSystemBars(JSONObject style) {
        int background = AMOLED_BACKGROUND;
        try {
            style.put("statusBarIconBrightness", "Brightness.light");
            style.put("systemNavigationBarIconBrightness", "Brightness.light");
            style.put("statusBarColor", background);
            style.put("systemNavigationBarColor", background);
            style.put("systemNavigationBarDividerColor", background);
            style.put("systemStatusBarContrastEnforced", false);
            style.put("systemNavigationBarContrastEnforced", false);
        } catch (JSONException ex) {
            Log.e("BadFellaUltimea", "Could not set system bar colors", ex);
        }
    }

    private static boolean writeMode(Context context, int mode) {
        File file = new File(context.getFilesDir(), MODE_FILE);
        File replacement = null;
        try {
            replacement = File.createTempFile(MODE_FILE, null, context.getFilesDir());
            try (FileOutputStream output = new FileOutputStream(replacement)) {
                output.write(mode);
                output.getFD().sync();
            }
            if (!replacement.renameTo(file)) {
                throw new IOException("Theme mode replacement failed");
            }
            return true;
        } catch (IOException ex) {
            Log.e("BadFellaUltimea", "Could not save theme mode", ex);
            return false;
        } finally {
            if (replacement != null && replacement.exists() && !replacement.delete()) {
                Log.w("BadFellaUltimea", "Temporary theme mode could not be removed");
            }
        }
    }

    private static void setDarkBars(View decor, int visibility) {
        int flags = visibility & ~View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            flags &= ~View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
        }
        if (flags != visibility) {
            decor.setSystemUiVisibility(flags);
        }
    }

}
