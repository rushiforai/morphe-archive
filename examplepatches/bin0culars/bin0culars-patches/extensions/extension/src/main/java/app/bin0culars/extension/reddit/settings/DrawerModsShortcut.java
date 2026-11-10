package app.bin0culars.extension.reddit.settings;

import java.util.ArrayList;
import java.util.List;

public final class DrawerModsShortcut {

    private DrawerModsShortcut() {
    }

    private static Object modsItem(Object presenter) {
        // Modified during patching.
        return null;
    }

    private static List<?> drawerItems(Object presenter) {
        // Modified during patching.
        return null;
    }

    private static void setDrawerItems(Object presenter, List<?> items) {
        // Modified during patching.
    }

    public static void onDrawerListBuilt(Object presenter) {
        try {
            if (presenter == null) {
                return;
            }
            List<?> list = drawerItems(presenter);
            Object mods = modsItem(presenter);
            if (list != null && mods != null) {
                int index = -1;
                for (int i = 0; i < list.size(); i++) {
                    if (list.get(i) == mods) {
                        index = i;
                        break;
                    }
                }
                if (index > 0) {
                    List<Object> copy = new ArrayList<>(list);
                    copy.remove(index);
                    copy.add(0, mods);
                    setDrawerItems(presenter, copy);
                }
            }
        } catch (Throwable ignored) {
        }
    }
}
