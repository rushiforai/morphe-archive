/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.share;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.blockauthor.Reflect;
import app.morphe.extension.tiktok.settings.Settings;
import java.util.ArrayList;
import java.util.List;

/**
 * Runs before the share panel builds its rows. Never mutates the builder's lists.
 *
 * <p>These three run inside the share model's own constructor, so anything that escapes here
 * escapes into TikTok. A reader upstream had the Share button do nothing and then the app stop,
 * which is what that looks like from the outside: the model never finishes building, the sheet
 * never opens, and the next throw on the main thread takes the process with it. So each entry
 * point catches for itself and hands back exactly what TikTok passed in. A share sheet that is
 * missing none of the rows you hid is a much smaller failure than no share sheet at all, and
 * the export names which hook gave up.
 */
public final class ShareModelFilter {
    static final String FAMILY = "share sheet";

    private ShareModelFilter() {}

    public static List<?> channels(List<?> items) {
        try {
            return filter(items, Settings.HIDE_SHARE_CHANNELS.get());
        } catch (Throwable ex) {
            HookStatus.threw(FAMILY, "channels", ex);
            Logger.printException(() -> "Could not filter the share channels row", ex);
            return items;
        }
    }

    public static List<?> actions(List<?> items) {
        try {
            ShareActionCatalog.observe(items);
        } catch (Throwable ex) {
            HookStatus.threw(FAMILY, "action catalog", ex);
            Logger.printException(() -> "Could not record the share actions", ex);
        }
        try {
            return filter(items, Settings.HIDE_SHARE_ACTIONS.get());
        } catch (Throwable ex) {
            HookStatus.threw(FAMILY, "actions", ex);
            Logger.printException(() -> "Could not filter the share actions row", ex);
            return items;
        }
    }

    public static boolean contacts(boolean original) {
        try {
            return original && !Settings.HIDE_SHARE_CONTACTS.get();
        } catch (Throwable ex) {
            HookStatus.threw(FAMILY, "contacts", ex);
            Logger.printException(() -> "Could not read the Send to row setting", ex);
            return original;
        }
    }

    private static List<?> filter(List<?> items, boolean hideRow) {
        if (items == null) return null;
        if (hideRow) return new ArrayList<>();
        String hidden = Settings.SHARE_HIDDEN_ITEMS.get();
        if (hidden.trim().isEmpty()) return items;
        List<Object> kept = new ArrayList<>(items.size());
        for (Object item : items) {
            String key = Reflect.string(item, "key", "key");
            boolean hide = false;
            if (key != null) {
                for (String entry : hidden.split("[,\\n]")) {
                    if (!entry.trim().isEmpty()
                            && ShareActionCatalog.canonical(entry).equals(ShareActionCatalog.canonical(key))) {
                        hide = true;
                        break;
                    }
                }
            }
            if (!hide) kept.add(item);
        }
        return kept.size() == items.size() ? items : kept;
    }

}
