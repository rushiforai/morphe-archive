package app.voidhack.extension.applemusic.library;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

public final class LibraryMenu {
    private static final int MENU_ID = 0x766f6964;

    private LibraryMenu() {}

    private static final class MenuEntries extends ArrayList<Object> {
        final Object state;
        MenuEntries(Object state, List<?> entries) {
            if (entries != null) addAll(entries);
            this.state = state;
        }
    }

    public static List<?> withMenuState(Object state, List<?> entries) { return new MenuEntries(state, entries); }

    public static void addMenu(Object host, Menu menu) {
        if (menu.findItem(MENU_ID) != null) return;
        try {
            Activity activity = (Activity) MusicReflection.call(host, "getActivity");
            if (activity == null) return;
            menu.add(Menu.NONE, MENU_ID, 90, LibraryStrings.text(activity, "download_all")).setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
            menu.findItem(MENU_ID).setOnMenuItemClickListener(item -> { LibraryTools.open(activity, 3); return true; });
        } catch (ReflectiveOperationException | RuntimeException exception) {
            Log.w("AppleMusicLibraryTools", "Could not attach library menu", exception);
        }
    }

    public static List<?> withTools(List<?> items, Context context) {
        if (!(context instanceof Activity)) return items;
        Activity activity = (Activity) context;
        int id = context.getResources().getIdentifier("top_level_library_page", "id", context.getPackageName());
        View tab = activity.findViewById(id);
        if (tab == null || !tab.isSelected()) return items;
        try {
            Object menuState = items instanceof MenuEntries ? ((MenuEntries) items).state : null;
            WeakReference<Activity> owner = new WeakReference<>(activity);
            Object callback = MusicReflection.action(() -> {
                Activity current = owner.get();
                if (current != null && !current.isFinishing()) {
                    if (menuState != null) MusicReflection.call(menuState, "setValue", false);
                    LibraryTools.open(current, 3);
                }
            });
            List<Object> result = items == null ? new ArrayList<>() : new ArrayList<>(items);
            int icon = context.getResources().getIdentifier("ic_actionsheet_download", "drawable", context.getPackageName());
            if (icon == 0) throw new IllegalStateException("Library menu icon is unavailable");
            result.add(MusicReflection.create("Aa.C$d", LibraryStrings.text(activity, "download_all"), icon, null, null, callback));
            return result;
        } catch (ReflectiveOperationException | RuntimeException exception) {
            Log.w("AppleMusicLibraryTools", "Could not attach library menu", exception);
            return items;
        }
    }
}
