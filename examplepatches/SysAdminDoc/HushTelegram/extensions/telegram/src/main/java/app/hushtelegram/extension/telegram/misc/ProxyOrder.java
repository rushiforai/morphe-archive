/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.SharedPreferences;
import androidx.annotation.Nullable;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.StringSetting;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

/**
 * Proxy order (#71). Telegram's proxy screen sorts its list every time it shows it: the proxy in
 * use first, then the rest by how fast they answered. Saving the list sorts it the same way, so an
 * order of the person's own can't live in Telegram's list. It lives here, and the patch hands the
 * screen's one sort to {@link #sort}.
 *
 * <p>Pinned proxies come first, in the order they were left in. Once a proxy has been dragged, the
 * whole list keeps the order it was left in, and a proxy saved later goes below it in Telegram's
 * order. With pins alone, the rest keep Telegram's order. A proxy is known by a hash of what
 * Telegram saves for it, so its address and secret aren't kept a second time.
 */
public final class ProxyOrder {
    /**
     * The order, kept in the settings store. It changes Telegram's screen, so Pause answers it
     * empty, and it stays out of a settings file, since its proxies are this phone's.
     */
    static final class Stored {
        /** One proxy a line, in order: its key, after a "*" when it's pinned. Pinned lines come first. */
        static final StringSetting ARRANGED = new StringSetting("hushtelegram_proxy_order", "", false, false);

        private Stored() {
        }
    }

    /** Telegram's proxy list. A test sets its own. Called on the main thread. */
    interface Store {
        /** The saved entries, newest first, or null when the list can't be reached. */
        @Nullable
        List<?> entries();

        /** What tells [entry]'s proxy from every other: the same for two entries of one proxy. */
        String key(Object entry);

        /** The proxy's address and port, as the row shows it. */
        String label(Object entry);

        /** Whether Telegram connects through [entry] now. */
        boolean inUse(Object entry);
    }

    /** One proxy as the order editor shows it. */
    public static final class Row {
        public final String key;
        public final String label;
        public final boolean inUse;
        public boolean pinned;

        Row(String key, String label, boolean inUse, boolean pinned) {
            this.key = key;
            this.label = label;
            this.inUse = inUse;
            this.pinned = pinned;
        }
    }

    static volatile Store store = new TelegramStore();

    private static final String PIN = "*";

    private ProxyOrder() {
    }

    // ---- The proxy screen -----------------------------------------------------------------------

    /**
     * Called in place of the proxy screen's Collections.sort of the entries it's about to show.
     * Puts [shown] in the order kept here, the rest after them sorted by [telegram]. Paused, with
     * nothing kept, or on any failure, it's Telegram's sort alone.
     */
    public static void sort(List<Object> shown, Comparator<Object> telegram) {
        HookStatus.invoked(FamilyNames.FREE_PROXIES);
        Map<String, Integer> rank;
        try {
            rank = Utils.settingsReady() ? ranks(Stored.ARRANGED.get()) : Collections.emptyMap();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FREE_PROXIES, "proxy order read", failure);
            rank = Collections.emptyMap();
        }
        if (rank.isEmpty()) {
            Collections.sort(shown, telegram);
            return;
        }
        List<Object> known = new ArrayList<>();
        List<Object> rest = new ArrayList<>();
        Map<Object, Integer> at = new HashMap<>();
        try {
            Store from = store;
            for (Object entry : shown) {
                Integer place = entry == null ? null : rank.get(from.key(entry));
                if (place == null) {
                    rest.add(entry);
                } else {
                    at.put(entry, place);
                    known.add(entry);
                }
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FREE_PROXIES, "proxy order key", failure);
            Collections.sort(shown, telegram);
            return;
        }
        if (known.isEmpty()) {
            Collections.sort(shown, telegram);
            return;
        }
        Collections.sort(known, (a, b) -> Integer.compare(at.get(a), at.get(b)));
        Collections.sort(rest, telegram);
        shown.clear();
        shown.addAll(known);
        shown.addAll(rest);
        HookStatus.counted(FamilyNames.FREE_PROXIES, "proxy list in your order");
    }

    /** Each kept key's place, pinned or not. */
    private static Map<String, Integer> ranks(String arranged) {
        Map<String, Integer> rank = new HashMap<>();
        for (String line : lines(arranged)) {
            String key = line.startsWith(PIN) ? line.substring(PIN.length()) : line;
            if (!rank.containsKey(key)) rank.put(key, rank.size());
        }
        return rank;
    }

    private static List<String> lines(String arranged) {
        List<String> lines = new ArrayList<>();
        for (String line : arranged.split("\n")) {
            if (!line.isEmpty() && !line.equals(PIN)) lines.add(line);
        }
        return lines;
    }

    // ---- The order editor -----------------------------------------------------------------------

    /**
     * Telegram's saved proxies as the proxy screen shows them: pinned ones first, then the rest in
     * the order kept, then any not in it, the one in use first. Empty when there are none or the
     * list can't be reached. Called on the main thread.
     */
    public static List<Row> rows() {
        List<Row> rows = new ArrayList<>();
        try {
            Store from = store;
            List<?> entries = from.entries();
            if (entries == null) return rows;
            Map<String, Row> saved = new LinkedHashMap<>();
            for (Object entry : new ArrayList<>(entries)) {
                if (entry == null) continue;
                String key = from.key(entry);
                if (!saved.containsKey(key)) saved.put(key, new Row(key, from.label(entry), from.inUse(entry), false));
            }
            for (String line : lines(Stored.ARRANGED.savedValue())) {
                boolean pinned = line.startsWith(PIN);
                Row row = saved.remove(pinned ? line.substring(PIN.length()) : line);
                if (row == null) continue;
                row.pinned = pinned;
                rows.add(row);
            }
            List<Row> rest = new ArrayList<>(saved.values());
            // Telegram puts the one in use on top, and its own speed order isn't known here.
            for (int i = 0; i < rest.size(); i++) {
                if (rest.get(i).inUse) {
                    rest.add(0, rest.remove(i));
                    break;
                }
            }
            rows.addAll(rest);
        } catch (RuntimeException failure) {
            Logger.printException(() -> "Proxy order: Telegram's proxy list couldn't be read", failure);
            rows.clear();
        }
        return rows;
    }

    /**
     * Keeps [rows]' order: every pinned row, and with [ownOrder] every other row too, so the screen
     * shows them as they are here. Without it, the rows that aren't pinned keep Telegram's order.
     * False when it couldn't be saved.
     */
    public static boolean save(List<Row> rows, boolean ownOrder) {
        List<String> lines = new ArrayList<>();
        for (Row row : rows) if (row.pinned) lines.add(PIN + row.key);
        if (ownOrder) for (Row row : rows) if (!row.pinned) lines.add(row.key);
        return Stored.ARRANGED.save(String.join("\n", lines));
    }

    /** Whether the order kept goes past the pinned proxies, so a drag has set it. */
    public static boolean ownOrder() {
        for (String line : lines(Stored.ARRANGED.savedValue())) {
            if (!line.startsWith(PIN)) return true;
        }
        return false;
    }

    /** Whether [entry]'s proxy is pinned, so a refresh of free proxies leaves it in the list. */
    static boolean pinned(Object entry) {
        String key = PIN + store.key(entry);
        for (String line : lines(Stored.ARRANGED.savedValue())) {
            if (line.equals(key)) return true;
        }
        return false;
    }

    /** What the Proxy order row says under its title. */
    public static String summary() {
        int pins = 0;
        for (String line : lines(Stored.ARRANGED.savedValue())) {
            if (line.startsWith(PIN)) pins++;
        }
        if (ownOrder()) {
            return pins == 0
                    ? L10n.t("Telegram's proxy list is in your order. Tap to change it.")
                    : L10n.quantity(pins, "Telegram's proxy list is in your order, with %1$d proxy pinned on top.",
                            "Telegram's proxy list is in your order, with %1$d proxies pinned on top.", pins);
        }
        if (pins > 0) {
            return L10n.quantity(pins, "%1$d proxy pinned on top of Telegram's proxy list. The rest keep Telegram's order.",
                    "%1$d proxies pinned on top of Telegram's proxy list. The rest keep Telegram's order.", pins);
        }
        return L10n.t("Drag the proxies in Telegram's proxy list into your own order, or pin some on top.");
    }

    // ---- Keys -----------------------------------------------------------------------------------

    /** What a proxy is told apart by: its address, port, secret and sign-in, as Telegram writes them. */
    private static final List<String> KEY_FIELDS = Arrays.asList(
            "proxy_ip", "proxy_port", "proxy_secret", "proxy_user", "proxy_pass");

    /**
     * A hash of the settings Telegram writes for a proxy, by name, so it's the same in every build
     * and a field a later build adds doesn't lose the order. Everything written counts when the
     * names have changed, so two proxies never share a key.
     */
    static String key(Map<String, String> written) {
        Map<String, String> told = new TreeMap<>();
        for (String name : KEY_FIELDS) {
            if (written.containsKey(name)) told.put(name, written.get(name));
        }
        if (!told.containsKey("proxy_ip")) told = new TreeMap<>(written);
        StringBuilder text = new StringBuilder();
        for (Map.Entry<String, String> each : told.entrySet()) {
            text.append(each.getKey()).append('=').append(each.getValue()).append('\n');
        }
        try {
            byte[] hash = MessageDigest.getInstance("SHA-256").digest(text.toString().getBytes(StandardCharsets.UTF_8));
            StringBuilder hex = new StringBuilder();
            for (byte b : hash) hex.append(String.format("%02x", b & 0xff));
            return hex.toString();
        } catch (NoSuchAlgorithmException impossible) {
            throw new IllegalStateException(impossible);
        }
    }

    /** The address and port Telegram writes for a proxy, as a row shows them. */
    static String label(Map<String, String> written) {
        String address = written.get("proxy_ip");
        String port = written.get("proxy_port");
        if (address == null || address.isEmpty()) return L10n.t("Proxy");
        return port == null || port.isEmpty() ? address : address + ":" + port;
    }

    /** Takes down what Telegram's proxy writer puts in its settings, and writes nothing. */
    static final class Capture implements SharedPreferences.Editor {
        final Map<String, String> written = new TreeMap<>();

        @Override public SharedPreferences.Editor putString(String key, @Nullable String value) {
            if (value != null) written.put(key, value);
            return this;
        }

        @Override public SharedPreferences.Editor putStringSet(String key, @Nullable Set<String> values) {
            if (values != null) written.put(key, new TreeSet<>(values).toString());
            return this;
        }

        @Override public SharedPreferences.Editor putInt(String key, int value) {
            written.put(key, String.valueOf(value));
            return this;
        }

        @Override public SharedPreferences.Editor putLong(String key, long value) {
            written.put(key, String.valueOf(value));
            return this;
        }

        @Override public SharedPreferences.Editor putFloat(String key, float value) {
            written.put(key, String.valueOf(value));
            return this;
        }

        @Override public SharedPreferences.Editor putBoolean(String key, boolean value) {
            written.put(key, String.valueOf(value));
            return this;
        }

        @Override public SharedPreferences.Editor remove(String key) {
            written.remove(key);
            return this;
        }

        @Override public SharedPreferences.Editor clear() {
            written.clear();
            return this;
        }

        @Override public boolean commit() {
            return true;
        }

        @Override public void apply() {
        }
    }

    /** Telegram's proxy list through the calls the patch wrote. */
    static final class TelegramStore implements Store {
        @Nullable
        @Override public List<?> entries() {
            return TelegramProxies.proxies();
        }

        private static Map<String, String> written(Object entry) {
            Capture capture = new Capture();
            TelegramProxies.describe(entry, capture);
            return capture.written;
        }

        @Override public String key(Object entry) {
            return ProxyOrder.key(written(entry));
        }

        @Override public String label(Object entry) {
            return ProxyOrder.label(written(entry));
        }

        @Override public boolean inUse(Object entry) {
            return TelegramProxies.enabled() && TelegramProxies.current() == entry;
        }
    }
}
