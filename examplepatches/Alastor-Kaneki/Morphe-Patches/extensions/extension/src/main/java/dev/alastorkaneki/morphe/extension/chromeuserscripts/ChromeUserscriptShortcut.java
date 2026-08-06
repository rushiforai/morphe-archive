package dev.alastorkaneki.morphe.extension.chromeuserscripts;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.drawable.Icon;
import android.os.Build;

import java.util.Collections;

/** Adds a guaranteed Material You-compatible long-press shortcut to the userscript manager. */
final class ChromeUserscriptShortcut {
    private static final String SHORTCUT_ID = "monkeyscript-manager";

    private ChromeUserscriptShortcut() { }

    static void install(Context context) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N_MR1 || context == null) return;
        try {
            ShortcutManager manager = context.getSystemService(ShortcutManager.class);
            if (manager == null) return;
            Intent intent = new Intent(context, UserscriptManagerActivity.class)
                    .setAction(Intent.ACTION_VIEW)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
            ShortcutInfo shortcut = new ShortcutInfo.Builder(context, SHORTCUT_ID)
                    .setShortLabel("Userscripts")
                    .setLongLabel("Open userscript manager")
                    .setIcon(Icon.createWithResource(context, android.R.drawable.ic_menu_manage))
                    .setIntent(intent)
                    .build();
            manager.setDynamicShortcuts(Collections.singletonList(shortcut));
        } catch (Throwable ignored) { }
    }
}
