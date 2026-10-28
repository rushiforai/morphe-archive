package io.github.jordanwoodson.extension.shared.twitch;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.os.SystemClock;
import android.util.Base64;
import android.util.JsonReader;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Third-party chat badges (FrankerFaceZ, Chatterino) and pronouns (pronouns.alejo.io) on native chat lines,
 * each opt-in. FrankerFaceZ and Chatterino publish one list of all their badge holders, which is downloaded in
 * the background, kept in memory for an hour and looked up locally. Pronouns need a lookup per chatter; see
 * {@link TwitchPronouns}.
 */
@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class TwitchBadges {
    static final String KEY_FFZ = "badges_ffz";
    static final String KEY_CHATTERINO = "badges_chatterino";

    private static final long TTL_MS = 60 * 60_000L;
    private static final long RETRY_MS = 2 * 60_000L;
    private static final int MAX_IMAGE_BYTES = 256 * 1024;
    private static final String TUID = "tv.twitch.android.models.Tuid";
    private static final Badge[] NONE = new Badge[0];

    private static final Provider FFZ = new Provider("FrankerFaceZ", KEY_FFZ);
    private static final Provider CHATTERINO = new Provider("Chatterino", KEY_CHATTERINO);

    static final String KEY_PRONOUNS = "badges_pronouns";

    private static final Map<String, Badge> PRONOUN_MODELS = new java.util.concurrent.ConcurrentHashMap<>();
    private static volatile Field userIdField;
    private static volatile Class<?> userClass;
    private static volatile Field loginField;
    private static volatile Class<?> loginClass;
    private static volatile Constructor<?> badgeConstructor;

    private TwitchBadges() {
    }

    /**
     * Injection point: the badges of one chat line, as Twitch's (name, image URL) view models of
     * {@code badgeClass}, and the line's sender. Returns {@code badges} itself unless a switched-on provider
     * has a badge for the sender, in which case its badges follow Twitch's.
     */
    public static List badges(List badges, Object user, Class<?> badgeClass) {
        if (badges == null || user == null || badgeClass == null) return badges;
        try {
            boolean ffz = Settings.isEnabled(KEY_FFZ);
            boolean chatterino = Settings.isEnabled(KEY_CHATTERINO);
            boolean pronouns = Settings.isEnabled(KEY_PRONOUNS);
            if (!ffz && !chatterino && !pronouns) return badges;
            if (ffz) FFZ.ensure(TwitchBadges::loadFfz);
            if (chatterino) CHATTERINO.ensure(TwitchBadges::loadChatterino);
            List out = null;
            long id = ffz || chatterino ? userId(user) : 0;
            if (id > 0) {
                if (ffz) out = add(out, badges, FFZ.badges, id, badgeClass);
                if (chatterino) out = add(out, badges, CHATTERINO.badges, id, badgeClass);
            }
            if (pronouns) {
                String[] pronoun = TwitchPronouns.badge(login(user));
                if (pronoun != null) {
                    if (out == null) out = new ArrayList(badges);
                    out.add(pronounModel(pronoun[0], pronoun[1], badgeClass));
                }
            }
            return out == null ? badges : out;
        } catch (ReflectiveOperationException | RuntimeException e) {
            Logger.d("badges: failed: " + e);
            return badges;
        }
    }

    /** Explicit RN scheduling, separated from the passive cache read below. */
    static void requestRn(java.util.function.BooleanSupplier wanted) {
        if (wanted == null || !wanted.getAsBoolean()) return;
        if (Settings.isRegistered(KEY_FFZ) && Settings.isEnabled(KEY_FFZ)) FFZ.ensure(TwitchBadges::loadFfz,wanted);
        if (Settings.isRegistered(KEY_CHATTERINO) && Settings.isEnabled(KEY_CHATTERINO)) CHATTERINO.ensure(TwitchBadges::loadChatterino,wanted);
    }

    static List<String[]> cachedRn(String userId) {
        List<String[]> out = new ArrayList<>();
        long id;
        try { id = Long.parseLong(userId); } catch (NumberFormatException e) { return out; }
        if (id <= 0) return out;
        for (Provider provider : new Provider[]{FFZ,CHATTERINO}) {
            if (!Settings.isRegistered(provider.setting) || !Settings.isEnabled(provider.setting)) continue;
            for (Badge badge : provider.badges) {
                if (Arrays.binarySearch(badge.users,id) >= 0 && out.size() < 32) out.add(new String[]{badge.name,badge.url});
            }
        }
        return out;
    }

    /**
     * Emote and badge info: { what it is ("FrankerFaceZ badge", ...), title } of the third-party badge or pronoun
     * whose image URL is {@code url}, from the lists already loaded, or null for any other URL.
     */
    static String[] describe(String url) {
        if (url == null) return null;
        for (Provider provider : new Provider[]{FFZ, CHATTERINO}) {
            for (Badge badge : provider.badges) {
                if (badge.url.equals(url)) return new String[]{provider.name + " badge", badge.title};
            }
        }
        for (Badge badge : PRONOUN_MODELS.values()) {
            if (badge.url.equals(url)) return new String[]{"Pronouns from pronouns.alejo.io", badge.title};
        }
        return null;
    }

    private static List add(List out, List badges, Badge[] provider, long id, Class<?> badgeClass)
            throws ReflectiveOperationException {
        for (Badge badge : provider) {
            if (Arrays.binarySearch(badge.users, id) < 0) continue;
            if (out == null) out = new ArrayList(badges);
            out.add(badge.model(badgeClass));
        }
        return out;
    }

    private static Object pronounModel(String label, String image, Class<?> badgeClass) throws ReflectiveOperationException {
        Badge badge = PRONOUN_MODELS.get(label);
        if (badge == null || !badge.url.equals(image)) {
            badge = new Badge(label, image, new long[0]);
            PRONOUN_MODELS.put(label, badge);
        }
        return badge.model(badgeClass);
    }

    /**
     * The sender's login (username). Its field is found from the sender's toString, "...username=<login>,
     * displayName=...", once a sender makes that unambiguous.
     */
    private static String login(Object user) throws ReflectiveOperationException {
        Field field = loginField;
        if (field == null || loginClass != user.getClass()) {
            String described = user.toString();
            Field found = null;
            for (Field candidate : user.getClass().getDeclaredFields()) {
                if (candidate.getType() != String.class) continue;
                candidate.setAccessible(true);
                Object value = candidate.get(user);
                if (value instanceof String && !((String) value).isEmpty() && described.contains("username=" + value + ",")) {
                    if (found != null) return (String) value; // Same as the display name: right this time, ambiguous later.
                    found = candidate;
                }
            }
            if (found == null) return null;
            loginClass = user.getClass();
            loginField = field = found;
        }
        Object login = field.get(user);
        return login instanceof String ? (String) login : null;
    }

    /** The sender's Twitch user ID, or 0. IDs are 64-bit: current ones are above 1e9 and still growing. */
    private static long userId(Object user) throws ReflectiveOperationException {
        Field field = userIdField;
        if (field == null || userClass != user.getClass()) {
            field = null;
            for (Field candidate : user.getClass().getDeclaredFields()) {
                if (candidate.getType().getName().equals(TUID)) field = candidate;
            }
            if (field == null) return 0;
            field.setAccessible(true);
            userClass = user.getClass();
            userIdField = field;
        }
        Object tuid = field.get(user);
        if (tuid == null) return 0;
        try {
            return Long.parseLong(tuid.toString());
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Loading

    /**
     * FrankerFaceZ v1 /badges/ids: { "badges": [ { "id", "name", "title", "color", "urls": { "1", "2", "4" } } ],
     * "users": { "<badge id>": [ <twitch user id>, ... ] } }. Its badge images are white glyphs that
     * FrankerFaceZ draws on the badge color, so they are composed here.
     */
    private static Badge[] loadFfz() throws IOException {
        Map<String, String[]> meta = new HashMap<>();
        Map<String, long[]> users = new HashMap<>();
        TwitchThirdParty.getJson("https://api.frankerfacez.com/v1/badges/ids", reader -> {
            if (!TwitchThirdParty.beginObject(reader)) return null;
            while (reader.hasNext()) {
                String name = reader.nextName();
                if ("badges".equals(name)) {
                    if (!TwitchThirdParty.beginArray(reader)) continue;
                    while (reader.hasNext()) {
                        String[] badge = parseFfzBadge(reader);
                        if (badge != null) meta.put(badge[0], badge);
                    }
                    reader.endArray();
                } else if ("users".equals(name)) {
                    if (!TwitchThirdParty.beginObject(reader)) continue;
                    while (reader.hasNext()) {
                        String badge = reader.nextName();
                        users.put(badge, parseIds(reader));
                    }
                    reader.endObject();
                } else {
                    reader.skipValue();
                }
            }
            reader.endObject();
            return null;
        }, null);
        List<Badge> out = new ArrayList<>();
        for (Map.Entry<String, long[]> entry : users.entrySet()) {
            String[] badge = meta.get(entry.getKey());
            if (badge == null || badge[3] == null || entry.getValue().length == 0) continue;
            String image = composeFfz(badge[3], badge[2]);
            if (image != null) out.add(new Badge("ffz-" + badge[1], image, entry.getValue(), badge[4]));
        }
        return out.toArray(NONE);
    }

    /** { id, name, color, image URL, title } of one FrankerFaceZ badge, or null. */
    private static String[] parseFfzBadge(JsonReader reader) throws IOException {
        if (!TwitchThirdParty.beginObject(reader)) return null;
        String[] badge = new String[5];
        String small = null;
        while (reader.hasNext()) {
            switch (reader.nextName()) {
                case "id":
                    badge[0] = TwitchThirdParty.string(reader);
                    break;
                case "name":
                    badge[1] = TwitchThirdParty.string(reader);
                    break;
                case "color":
                    badge[2] = TwitchThirdParty.string(reader);
                    break;
                case "title":
                    badge[4] = TwitchThirdParty.string(reader);
                    break;
                case "urls":
                    if (!TwitchThirdParty.beginObject(reader)) break;
                    while (reader.hasNext()) {
                        String scale = reader.nextName();
                        String url = TwitchThirdParty.string(reader);
                        if ("4".equals(scale)) badge[3] = url;
                        else if ("2".equals(scale)) small = url;
                    }
                    reader.endObject();
                    break;
                default:
                    reader.skipValue();
            }
        }
        reader.endObject();
        if (badge[3] == null) badge[3] = small;
        return badge[0] == null || badge[1] == null || !isHttps(badge[3]) ? null : badge;
    }

    /** Chatterino /badges: { "badges": [ { "tooltip", "image1", "image2", "image3", "users": [ "<id>" ] } ] }. */
    private static Badge[] loadChatterino() throws IOException {
        List<Badge> out = new ArrayList<>();
        TwitchThirdParty.getJson("https://api.chatterino.com/badges", reader -> {
            if (!TwitchThirdParty.beginObject(reader)) return null;
            while (reader.hasNext()) {
                if (!"badges".equals(reader.nextName())) {
                    reader.skipValue();
                    continue;
                }
                if (!TwitchThirdParty.beginArray(reader)) continue;
                while (reader.hasNext()) {
                    if (!TwitchThirdParty.beginObject(reader)) continue;
                    String tooltip = null;
                    String image = null;
                    String fallback = null;
                    long[] users = new long[0];
                    while (reader.hasNext()) {
                        switch (reader.nextName()) {
                            case "tooltip":
                                tooltip = TwitchThirdParty.string(reader);
                                break;
                            case "image3":
                                image = TwitchThirdParty.string(reader);
                                break;
                            case "image2":
                                fallback = TwitchThirdParty.string(reader);
                                break;
                            case "users":
                                users = parseIds(reader);
                                break;
                            default:
                                reader.skipValue();
                        }
                    }
                    reader.endObject();
                    if (!isHttps(image)) image = fallback;
                    if (tooltip != null && isHttps(image) && users.length > 0) {
                        out.add(new Badge(tooltip.toLowerCase(java.util.Locale.ROOT).replace(' ', '-'), image, users,
                                tooltip));
                    }
                }
                reader.endArray();
            }
            reader.endObject();
            return null;
        }, null);
        return out.toArray(NONE);
    }

    /** A JSON array of user IDs (numbers or strings) as a sorted array. */
    private static long[] parseIds(JsonReader reader) throws IOException {
        if (!TwitchThirdParty.beginArray(reader)) return new long[0];
        long[] ids = new long[64];
        int count = 0;
        while (reader.hasNext()) {
            String id = TwitchThirdParty.string(reader);
            if (id == null) continue;
            try {
                long value = Long.parseLong(id);
                if (count == ids.length) ids = Arrays.copyOf(ids, count * 2);
                ids[count++] = value;
            } catch (NumberFormatException ignored) {
                // Not a Twitch user ID.
            }
        }
        reader.endArray();
        ids = Arrays.copyOf(ids, count);
        Arrays.sort(ids);
        return ids;
    }

    /** The badge glyph at {@code url} drawn on {@code color}, as a PNG data URI Glide can load. */
    private static String composeFfz(String url, String color) {
        try {
            byte[] png = TwitchThirdParty.getBytes(url, MAX_IMAGE_BYTES);
            Bitmap glyph = BitmapFactory.decodeByteArray(png, 0, png.length);
            if (glyph == null) return null;
            int size = Math.max(glyph.getWidth(), glyph.getHeight());
            Bitmap badge = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(badge);
            if (color != null) {
                Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
                paint.setColor(Color.parseColor(color));
                float radius = size * 0.15f;
                canvas.drawRoundRect(0, 0, size, size, radius, radius, paint);
            }
            canvas.drawBitmap(glyph, (size - glyph.getWidth()) / 2f, (size - glyph.getHeight()) / 2f, null);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            badge.compress(Bitmap.CompressFormat.PNG, 100, out);
            glyph.recycle();
            badge.recycle();
            return "data:image/png;base64," + Base64.encodeToString(out.toByteArray(), Base64.NO_WRAP);
        } catch (IOException | RuntimeException e) {
            Logger.d("badges: FrankerFaceZ image " + url + " unavailable: " + e);
            return null;
        }
    }

    private static boolean isHttps(String url) {
        return url != null && url.startsWith("https://");
    }

    // ---------------------------------------------------------------------------------------------
    // Types

    private interface Loader {
        Badge[] load() throws IOException;
    }

    /** One provider's badge list with its expiry. */
    private static final class Provider {
        final String name;
        final String setting;
        volatile Badge[] badges = NONE;
        volatile long expires;
        TwitchThirdParty.Demand pending;

        Provider(String name, String setting) {
            this.name = name;
            this.setting = setting;
        }

        void ensure(Loader loader) { ensure(loader,null); }

        synchronized void ensure(Loader loader, java.util.function.BooleanSupplier wanted) {
            if (expires != 0 && SystemClock.elapsedRealtime() < expires) return;
            if (pending != null) { pending.add(wanted); return; }
            pending = new TwitchThirdParty.Demand(); pending.add(wanted);
            TwitchThirdParty.Demand demand = pending;
            TwitchThirdParty.run(name + " badges", () -> Settings.isEnabled(setting) && demand.getAsBoolean(), () -> {
                try {
                    badges = loader.load();
                    TwitchThirdParty.catalogChanged();
                    expires = SystemClock.elapsedRealtime() + TTL_MS;
                    Logger.d("badges: " + name + ": " + badges.length);
                } catch (IOException | RuntimeException e) {
                    expires = SystemClock.elapsedRealtime() + RETRY_MS;
                    Logger.d("badges: " + name + " unavailable: " + e);
                }
            }, () -> { synchronized (this) { pending = null; } });
        }
    }

    /** A badge: Twitch-style name, image URL, its holders' user IDs (sorted) and the title its service gives it. */
    private static final class Badge {
        final String name;
        final String url;
        final long[] users;
        final String title;
        private volatile Object model;
        private volatile Class<?> modelClass;

        Badge(String name, String url, long[] users) {
            this(name, url, users, name);
        }

        Badge(String name, String url, long[] users, String title) {
            this.name = name;
            this.url = url;
            this.users = users;
            this.title = title != null && !title.isEmpty() ? title : name;
        }

        Object model(Class<?> type) throws ReflectiveOperationException {
            Object cached = model;
            if (cached != null && modelClass == type) return cached;
            Constructor<?> constructor = badgeConstructor;
            if (constructor == null || constructor.getDeclaringClass() != type) {
                constructor = type.getDeclaredConstructor(String.class, String.class);
                constructor.setAccessible(true);
                badgeConstructor = constructor;
            }
            Object made = constructor.newInstance(name, url);
            modelClass = type;
            model = made;
            return made;
        }
    }
}
