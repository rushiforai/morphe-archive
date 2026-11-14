/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Dialog;
import android.content.Context;
import android.net.Uri;
import android.util.LruCache;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Open on the web (#71). Telegram's servers keep a banned account out of a channel's posts, but a
 * public channel's page at t.me/s/name shows them to anyone. With Open restricted channels on, the
 * alert Telegram shows when it can't open a chat gets a button that opens that page in a browser.
 * The name comes from the chat itself, or else from the link that led to it: Telegram keeps each
 * name it looked up for a while, and a channel that banned you comes back with no name of its own.
 */
public final class BannedChannelWeb {
    private BannedChannelWeb() {}

    /** A Telegram public name: letters, digits and underscores, which is all a link may carry here. */
    private static final Pattern NAME = Pattern.compile("[A-Za-z0-9_]{3,32}");
    static final String PAGE = "https://t.me/s/";

    /** What the button needs from Telegram; a test swaps it. */
    interface Telegram {
        /** The chat the chat screen [screen] shows, or null. */
        Object chatOf(Object screen);

        /** The account [screen] is in. */
        int account(Object screen);

        /** Each name [account] looked up lately, with what Telegram keeps about it. */
        Map<?, ?> lookups(int account) throws ReflectiveOperationException;

        /** Gives the alert being built in [builder] a second button. */
        void addButton(Object builder, String text, Object listener);

        /** Telegram's alert button listener type. */
        Class<?> listenerType();

        /** Opens [page] in a browser, never in this Telegram; false when nothing could. */
        boolean open(Context context, Uri page);
    }

    static volatile Telegram telegram = new Telegram() {
        @Override public Object chatOf(Object screen) { return BannedChannelWeb.chatOf(screen); }
        @Override public int account(Object screen) { return BannedChannelWeb.account(screen); }

        @Override public Map<?, ?> lookups(int account) throws ReflectiveOperationException {
            Class<?> controller = Class.forName("org.telegram.messenger.MessagesController");
            Object instance = HostNames.method(controller, "getInstance", int.class).invoke(null, account);
            Object resolver = instance == null ? null : HostNames.method(controller, "getUserNameResolver").invoke(instance);
            if (resolver == null) return Collections.emptyMap();
            Field cache = HostNames.declaredField(resolver.getClass(), "resolvedCache");
            cache.setAccessible(true);
            Object names = cache.get(resolver);
            return names instanceof LruCache ? ((LruCache<?, ?>) names).snapshot() : Collections.emptyMap();
        }

        @Override public void addButton(Object builder, String text, Object listener) { BannedChannelWeb.addButton(builder, text, listener); }
        @Override public Class<?> listenerType() { return BannedChannelWeb.listenerType(); }
        @Override public boolean open(Context context, Uri page) { return LinkRouting.openInBrowser(context, page); }
    };

    /**
     * Called as the chat screen [screen] builds its alert for a chat it can't open, right after the
     * alert's OK. Adds Open on the web when the switch is on and the chat has a public name.
     */
    public static void offer(Object builder, Object screen) {
        try {
            if (builder == null || !Utils.settingsReady() || !Settings.OPEN_RESTRICTED_CHATS.get()) return;
            Telegram host = telegram;
            String name = publicName(host, host.account(screen), host.chatOf(screen));
            if (name == null) return;
            Class<?> type = host.listenerType();
            if (type == null || !type.isInterface()) return;
            host.addButton(builder, L10n.t("Open on the web"), listener(type, name));
            HookStatus.counted(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS, "banned channel offered on the web");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS, "banned channel web button", failure);
        }
    }

    /** The chat's public name: its own, an active one of its several, or the one Telegram looked it up by. */
    static String publicName(Telegram host, int account, Object chat) {
        if (chat == null) return null;
        String own = valid(stringField(chat, "username"));
        if (own != null) return own;
        Object names = field(chat, "usernames");
        if (names instanceof List) {
            for (Object each : (List<?>) names) {
                if (each == null || !Boolean.TRUE.equals(field(each, "active"))) continue;
                String active = valid(stringField(each, "username"));
                if (active != null) return active;
            }
        }
        Object id = field(chat, "id");
        if (!(id instanceof Long) || (Long) id == 0) return null;
        long dialog = -(Long) id;
        try {
            for (Map.Entry<?, ?> lookup : host.lookups(account).entrySet()) {
                if (!(lookup.getKey() instanceof String) || !holds(lookup.getValue(), dialog)) continue;
                String looked = valid((String) lookup.getKey());
                if (looked != null) return looked;
            }
        } catch (ReflectiveOperationException | RuntimeException unreadable) {
            HookStatus.threw(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS, "looked-up names", unreadable);
        }
        return null;
    }

    /** Whether Telegram's note about a looked-up name points at [dialog]: the chat's ID, which no time can be. */
    private static boolean holds(Object lookup, long dialog) {
        if (lookup == null) return false;
        for (Field each : lookup.getClass().getDeclaredFields()) {
            if (each.getType() != long.class || Modifier.isStatic(each.getModifiers())) continue;
            try {
                each.setAccessible(true);
                if (each.getLong(lookup) == dialog) return true;
            } catch (ReflectiveOperationException | RuntimeException unreadable) {
                // Another field may still say it.
            }
        }
        return false;
    }

    /** The button's listener: opens the channel's public page and lets the alert close as OK would. */
    static Object listener(Class<?> type, String name) {
        Uri page = Uri.parse(PAGE + name);
        return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, (proxy, method, args) -> {
            if (method.getDeclaringClass() == Object.class) {
                switch (method.getName()) {
                    case "equals": return proxy == args[0];
                    case "hashCode": return System.identityHashCode(proxy);
                    default: return "HushTelegram Open on the web";
                }
            }
            Object dialog = args != null && args.length > 0 ? args[0] : null;
            Context context = dialog instanceof Dialog ? ((Dialog) dialog).getContext() : Utils.getContext();
            open(context, page);
            return null;
        });
    }

    static void open(Context context, Uri page) {
        try {
            if (context != null && telegram.open(context, page)) {
                HookStatus.counted(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS, "banned channel opened on the web");
                return;
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.BYPASS_CHANNEL_RESTRICTIONS, "banned channel web page", failure);
        }
        Utils.showToastLong(L10n.f("No browser could open %1$s.", page.toString()));
    }

    private static String valid(String name) {
        return name != null && NAME.matcher(name).matches() ? name : null;
    }

    private static String stringField(Object owner, String name) {
        Object value = field(owner, name);
        return value instanceof String ? (String) value : null;
    }

    private static Object field(Object owner, String name) {
        try {
            return owner.getClass().getField(name).get(owner);
        } catch (ReflectiveOperationException | RuntimeException missing) {
            return null;
        }
    }

    // Stubs: the patch writes each body for this build of Telegram.

    /** The chat screen's {@code currentChat}. */
    public static Object chatOf(Object screen) { return null; }

    /** The chat screen's {@code getCurrentAccount()}. */
    public static int account(Object screen) { return 0; }

    /** {@code builder.setNegativeButton(text, listener)}, or its neutral one: a second button beside OK. */
    public static void addButton(Object builder, String text, Object listener) {}

    /** {@code AlertDialog.OnButtonClickListener}. */
    public static Class<?> listenerType() { return null; }
}
