/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** Gives {@link ProxyOrder} a proxy list of names, since the unpatched app has none, for the editor's tests. */
public final class ProxyOrderForTests {
    private ProxyOrderForTests() {}

    /** Telegram's proxy list holds [names], each known as "k" and its name. */
    public static void useList(String... names) {
        List<Object> entries = new ArrayList<>(Arrays.asList((Object[]) names));
        ProxyOrder.store = new ProxyOrder.Store() {
            @Override public List<?> entries() {
                return entries;
            }

            @Override public String key(Object entry) {
                return "k" + entry;
            }

            @Override public String label(Object entry) {
                return entry + ":443";
            }

            @Override public boolean inUse(Object entry) {
                return false;
            }
        };
    }

    /** The order as it's kept: one key a line, pinned ones after a "*". */
    public static String arranged() {
        return ProxyOrder.Stored.ARRANGED.savedValue();
    }

    public static void restore() {
        ProxyOrder.store = new ProxyOrder.TelegramStore();
        ProxyOrder.Stored.ARRANGED.resetToDefault();
    }
}
