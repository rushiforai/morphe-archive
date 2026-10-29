package app.fakh.extension.linkedin;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.drawable.Icon;
import android.net.Uri;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;

/**
 * A launcher shortcut (long press the LinkedIn icon) that opens Puzzle games, drawn like LinkedIn's own shortcuts.
 * It has its own switch in the More tab settings; turning it off removes the shortcut.
 */
final class GamesShortcut {
    private static final String ID = "fakh_puzzle_games";
    private static boolean scheduled;

    private GamesShortcut() {
    }

    /**
     * Called whenever an SDUI screen resumes; publishes the shortcut once per start. LinkedIn replaces its own
     * shortcuts while starting up, so it is published again a few seconds later.
     */
    static void schedule(Activity activity) {
        if (scheduled || !Settings.moreMenu()) return;
        scheduled = true;
        Context context = activity.getApplicationContext();
        activity.getWindow().getDecorView().postDelayed(() -> publish(context), 1000);
        activity.getWindow().getDecorView().postDelayed(() -> publish(context), 6000);
    }

    /** Adds or removes the shortcut right away, when its switch changes. */
    static void update(Context context) {
        publish(context.getApplicationContext());
    }

    private static void publish(Context context) {
        try {
            ShortcutManager manager = context.getSystemService(ShortcutManager.class);
            if (manager == null) return;
            MoreMenu.Item games = null;
            for (MoreMenu.Item item : MoreMenu.items()) if ("games".equals(item.id)) games = item;
            if (games == null || !Settings.gamesShortcut()) {
                manager.removeDynamicShortcuts(Collections.singletonList(ID));
                return;
            }
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(games.url))
                    .setPackage(context.getPackageName())
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            ShortcutInfo shortcut = new ShortcutInfo.Builder(context, ID)
                    .setShortLabel(games.label)
                    .setLongLabel(games.label)
                    .setIcon(icon(context))
                    .setIntent(intent)
                    .setRank(0)
                    .build();
            // Updates the shortcut in place, which moves it back to the top if LinkedIn reordered its own.
            manager.addDynamicShortcuts(Collections.singletonList(shortcut));
            Settings.debugLog("games shortcut published");
        } catch (Throwable t) {
            Diagnostics.error("games shortcut failed", t);
        }
    }

    /** The puzzle piece on the round background of LinkedIn's own shortcuts, or the app icon if that fails. */
    private static Icon icon(Context context) {
        try {
            Class<?> icons = Class.forName("com.linkedin.android.delux.compose.core.DSSystemIconsV2");
            int glyph;
            try {
                Field field = icons.getDeclaredField("puzzlePieceFillMedium");
                field.setAccessible(true);
                glyph = field.getInt(null);
            } catch (NoSuchFieldException e) {
                Method getter = icons.getDeclaredMethod("getPuzzlePieceFillMedium");
                getter.setAccessible(true);
                glyph = (int) getter.invoke(null);
            }
            Method create = Class.forName("com.linkedin.android.infra.app.ShortcutHelper")
                    .getDeclaredMethod("createShortcutIcon", Context.class, int.class);
            create.setAccessible(true);
            return (Icon) create.invoke(null, context, glyph);
        } catch (Throwable t) {
            Diagnostics.error("games shortcut icon failed", t);
            return Icon.createWithResource(context, context.getApplicationInfo().icon);
        }
    }
}
