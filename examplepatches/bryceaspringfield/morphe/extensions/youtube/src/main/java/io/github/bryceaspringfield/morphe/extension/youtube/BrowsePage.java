package io.github.bryceaspringfield.morphe.extension.youtube;

import java.lang.reflect.Field;

final class BrowsePage {

    private static Field field;
    private static boolean tried;

    private BrowsePage() {
    }

    static synchronized String id() {
        if (!tried) {
            tried = true;
            try {
                field = Class.forName("app.morphe.extension.youtube.patches.components.LayoutComponentsFilter")
                        .getDeclaredField("browseId");
                field.setAccessible(true);
            } catch (Throwable t) {
                field = null;
            }
        }
        try {
            Object v = field == null ? null : field.get(null);
            return v == null ? "" : v.toString();
        } catch (Throwable t) {
            return "";
        }
    }

    private static String lastLogged = "";

    static boolean isChannel() {
        String id = id();
        if (XSettings.DEBUG.get() && !id.equals(lastLogged)) {
            lastLogged = id;
            app.morphe.extension.shared.Logger.printDebug(() -> "YouTube Extras: browse page id [" + id + "]");
        }
        return id.startsWith("UC") || id.startsWith("FEchannel") || id.startsWith("FEpost");
    }
}
