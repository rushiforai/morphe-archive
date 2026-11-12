/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.SharedPreferences;
import android.net.Uri;
import androidx.annotation.Nullable;
import java.util.ArrayList;

/**
 * Telegram's own proxy calls, for {@link FreeProxies} and {@link ProxyOrder}. A proxy is two objects in Telegram: the
 * address, port and secret a link names, and the entry in the proxy list that holds them. Both are
 * passed as Object here, since their classes have a different obfuscated name in every build.
 * Call these on the main thread, where Telegram's proxy screen calls them.
 */
public final class TelegramProxies {
    private TelegramProxies() {
    }

    // Stubs: the patch writes each body for this build of Telegram.

    /** The proxy a tg://proxy or t.me/proxy link names, read the way Telegram reads a tapped link, or null. */
    @Nullable
    public static Object parse(Uri link) {
        return null;
    }

    /**
     * Puts [proxy], from {@link #parse}, at the top of Telegram's proxy list and saves the list,
     * and returns its entry. A proxy that's already saved is left where it is, and its entry comes back.
     */
    @Nullable
    public static Object add(Object proxy) {
        return null;
    }

    /** Connects through [entry] and turns Use proxy on, as tapping it on Telegram's proxy screen does. */
    public static void use(Object entry) {
    }

    /** Whether Telegram's Use proxy is on. */
    public static boolean enabled() {
        return false;
    }

    /** The entry Telegram connects through when Use proxy is on, or null. */
    @Nullable
    public static Object current() {
        return null;
    }

    /** Telegram's saved proxy entries, newest first, loaded from its settings when it hasn't yet. */
    @Nullable
    public static ArrayList<?> proxies() {
        return null;
    }

    /** The proxy an entry holds, which equals another entry's when both name the same address, port and secret. */
    @Nullable
    public static Object proxy(Object entry) {
        return null;
    }

    /** Writes [entry]'s proxy to [into] the way Telegram writes the one in use to its settings, for {@link ProxyOrder}. */
    public static void describe(Object entry, SharedPreferences.Editor into) {
    }

    /** Takes [entry] out of the list. Telegram turns Use proxy off when it's the current one, so never pass that. */
    public static void delete(Object entry) {
    }

    /** Turns on Telegram's own switching to another saved proxy when the current one stops answering. */
    public static void rotate() {
    }
}
