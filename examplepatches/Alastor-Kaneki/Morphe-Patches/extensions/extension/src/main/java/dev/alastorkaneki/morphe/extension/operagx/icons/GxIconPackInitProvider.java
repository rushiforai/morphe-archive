package dev.alastorkaneki.morphe.extension.operagx.icons;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.database.Cursor;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.Build;

import java.util.Collections;
import java.util.List;

/** Publishes a stable long-press entry that opens the icon selector. */
public final class GxIconPackInitProvider extends ContentProvider {
    private static final String SHORTCUT_ID = "gx_icon_pack_selector";

    @Override
    public boolean onCreate() {
        Context context = getContext();
        if (context != null) publishShortcut(context);
        return true;
    }

    public static void publishShortcut(Context context) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N_MR1) return;
        try {
            ShortcutManager manager = context.getSystemService(ShortcutManager.class);
            if (manager == null) return;

            Intent intent = new Intent(GxIconPackRegistry.ACTION_OPEN);
            intent.setClass(context, GxIconPackActivity.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);

            ShortcutInfo.Builder builder = new ShortcutInfo.Builder(context, SHORTCUT_ID)
                    .setShortLabel("GX Icon Pack")
                    .setLongLabel("Choose Opera GX launcher icon")
                    .setIntent(intent);
            int icon = context.getResources().getIdentifier(
                    "gxip_classic_gx",
                    "drawable",
                    context.getPackageName()
            );
            if (icon != 0) builder.setIcon(Icon.createWithResource(context, icon));
            ShortcutInfo shortcut = builder.build();

            boolean exists = false;
            List<ShortcutInfo> dynamic = manager.getDynamicShortcuts();
            for (ShortcutInfo current : dynamic) {
                if (SHORTCUT_ID.equals(current.getId())) {
                    exists = true;
                    break;
                }
            }
            if (exists) {
                manager.updateShortcuts(Collections.singletonList(shortcut));
            } else if (dynamic.size() < manager.getMaxShortcutCountPerActivity()) {
                manager.addDynamicShortcuts(Collections.singletonList(shortcut));
            }
        } catch (Throwable ignored) {
            // Shortcut support varies by launcher. The activity remains available by intent action.
        }
    }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection,
                        String[] selectionArgs, String sortOrder) {
        return null;
    }

    @Override public String getType(Uri uri) { return null; }
    @Override public Uri insert(Uri uri, ContentValues values) {
        throw new UnsupportedOperationException();
    }
    @Override public int delete(Uri uri, String selection, String[] selectionArgs) {
        throw new UnsupportedOperationException();
    }
    @Override public int update(Uri uri, ContentValues values,
                                String selection, String[] selectionArgs) {
        throw new UnsupportedOperationException();
    }
}
