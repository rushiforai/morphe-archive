package io.github.jordanwoodson.extension.shared.twitch;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.view.View;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Favorite emotes (switch {@code emotes_favorites}): a long press on an emote in Twitch's emote picker adds it to a
 * "Favorites" section at the top of the picker, and a long press on a favorite removes it. Works for Twitch's emotes
 * and the third-party ones the picker lists. Emotes Twitch already gives a long press (its modifier variants) keep
 * Twitch's. The list stays on the phone, in a preferences file of Lurk's own; the emotes are made again from it as
 * Twitch's emote objects, so Twitch draws them, loads their images and inserts their code.
 */
@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class TwitchEmoteFavorites {
    static final String KEY = "emotes_favorites";
    static final String TITLE = "Favorites";
    static final int MAX = 100;
    private static final String PREFERENCES = "lurk_emote_favorites";
    private static final String LIST = "favorites";
    /** The section's stand-in owner: below the services' -1 to -3, an ID no account has. */
    private static final int OWNER_ID = -4;
    /**
     * The section's set ID. The presenter puts the channel's own set first and sorts the others by set ID (a
     * plain String comparison); Twitch's are digits, the services' "lurk..." ones follow them. '!' sorts before
     * both, so Favorites come right after the channel's set.
     */
    private static final String SET_ID = "!lurkfav";

    /** Tests set it; otherwise the application's preferences file. */
    static volatile SharedPreferences preferences;
    private static volatile List<Favorite> cached;
    /** The picker that opened last, its channel and surface, to show a change right away. */
    private static volatile WeakReference<Object> openPresenter;
    private static volatile Object openChannel;
    private static volatile Object openSurface;

    private TwitchEmoteFavorites() {
    }

    /** One favorite: what Twitch's emote object is made of. */
    static final class Favorite {
        final String id;
        final String code;
        final String asset;
        final String type;

        Favorite(String id, String code, String asset, String type) {
            this.id = id;
            this.code = code;
            this.asset = asset;
            this.type = type;
        }

        String line() {
            return id + '\t' + code + '\t' + asset + '\t' + type;
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Injection points

    /**
     * Injection point (the picker's emote item binder): replaces its {@code setOnLongClickListener(listener)} on
     * the emote's view, with the item's model. While the switch is on, a long press on an emote Twitch has nothing
     * to show for adds it to the favorites or, if it is one, removes it; otherwise Twitch's listener runs.
     */
    public static void longClick(View view, View.OnLongClickListener twitch, Object item) {
        if (view == null) return;
        view.setOnLongClickListener(pressed ->
                pressed(pressed.getContext(), item) || twitch != null && twitch.onLongClick(pressed));
    }

    /** A long press on the picker item {@code item}: true when it added or removed a favorite. */
    static boolean pressed(Context context, Object item) {
        try {
            if (!Settings.isEnabled(KEY)) return false;
            Object emote = pickerEmote(item);
            return emote != null && toggle(context, emote);
        } catch (RuntimeException e) {
            Logger.d("emote favorites: long press failed: " + e);
            return false;
        }
    }

    /** Injection point: the picker's presenter opens for {@code channel} (a Tuid) on {@code surface} (chat, whispers). */
    public static void opened(Object presenter, Object channel, Object surface) {
        openPresenter = new WeakReference<>(presenter);
        openChannel = channel;
        openSurface = surface;
    }

    // ---------------------------------------------------------------------------------------------
    // The section

    /**
     * The Favorites set for the picker, made as Twitch's own emote set with a stand-in owner, or null when the
     * switch is off or there are no favorites. {@code channel} is the Tuid the picker is for.
     */
    static Object section(Object channel) {
        if (channel == null || !Settings.isEnabled(KEY)) return null;
        List<Favorite> favorites = favorites();
        if (favorites.isEmpty()) return null;
        try {
            List<Object> emotes = emotes(favorites, channel);
            if (emotes.isEmpty()) return null;
            return TwitchEmotes.ownerSet(OWNER_ID, TITLE, TITLE, null, SET_ID, Collections.unmodifiableList(emotes));
        } catch (ReflectiveOperationException | RuntimeException e) {
            Logger.d("emote favorites: can't make the section: " + e);
            return null;
        }
    }

    /** The favorites as Twitch emote objects owned by {@code channel}. */
    static List<Object> emotes(List<Favorite> favorites, Object channel) throws ReflectiveOperationException {
        Class<?> type = TwitchEmotes.emoteClass();
        if (type == null) return Collections.emptyList();
        Constructor<?> constructor = null;
        for (Constructor<?> candidate : type.getDeclaredConstructors()) {
            Class<?>[] p = candidate.getParameterTypes();
            if (p.length == 6 && p[0] == String.class && p[1] == String.class && p[2].isInstance(channel)
                    && p[3].isEnum() && p[4] == List.class && p[5].isEnum()) {
                constructor = candidate;
            }
        }
        if (constructor == null) return Collections.emptyList();
        constructor.setAccessible(true);
        Class<?>[] p = constructor.getParameterTypes();
        List<Object> emotes = new ArrayList<>(favorites.size());
        for (Favorite favorite : favorites) {
            Object asset = constant(p[3], favorite.asset, "STATIC");
            Object kind = constant(p[5], favorite.type, "OTHER");
            if (asset == null || kind == null) continue;
            emotes.add(constructor.newInstance(favorite.id, favorite.code, channel, asset, Collections.emptyList(), kind));
        }
        return emotes;
    }

    // ---------------------------------------------------------------------------------------------
    // The list

    /** Adds the emote, or removes it if it is a favorite already. True when it was one of Twitch's emote objects. */
    static boolean toggle(Context context, Object emote) {
        String id = emoteId(emote);
        String code = TwitchEmotes.emoteCode(emote);
        Object asset = emoteAsset(emote);
        Object kind = emoteType(emote);
        if (id == null || id.isEmpty() || code == null || code.isEmpty() || !(asset instanceof Enum) || !(kind instanceof Enum)) {
            return false;
        }
        boolean added;
        synchronized (TwitchEmoteFavorites.class) {
            List<Favorite> favorites = new ArrayList<>(favorites());
            int at = indexOf(favorites, id);
            added = at < 0;
            if (added) {
                if (favorites.size() >= MAX) {
                    tell(context, "Favorites are full (" + MAX + "): long-press one to remove it");
                    return true;
                }
                favorites.add(new Favorite(clean(id), clean(code), ((Enum) asset).name(), ((Enum) kind).name()));
            } else {
                favorites.remove(at);
            }
            save(favorites);
        }
        tell(context, (added ? "Added " : "Removed ") + code + (added ? " to " : " from ") + TITLE);
        reload();
        return true;
    }

    private static void tell(Context context, String text) {
        try {
            if (context != null) TwitchContext.toast(context, text, "emote favorites");
        } catch (RuntimeException e) {
            Logger.d("emote favorites: " + text);
        }
    }

    /** The favorites, oldest first. */
    static List<Favorite> favorites() {
        List<Favorite> current = cached;
        if (current != null) return current;
        List<Favorite> read = new ArrayList<>();
        SharedPreferences store = store();
        String raw = store == null ? null : store.getString(LIST, null);
        if (raw != null) {
            for (String line : raw.split("\n")) {
                String[] parts = line.split("\t", -1);
                if (parts.length != 4 || parts[0].isEmpty() || parts[1].isEmpty() || indexOf(read, parts[0]) >= 0) continue;
                read.add(new Favorite(parts[0], parts[1], parts[2], parts[3]));
                if (read.size() >= MAX) break;
            }
        }
        current = Collections.unmodifiableList(read);
        cached = current;
        return current;
    }

    private static void save(List<Favorite> favorites) {
        StringBuilder raw = new StringBuilder();
        for (Favorite favorite : favorites) {
            if (raw.length() > 0) raw.append('\n');
            raw.append(favorite.line());
        }
        cached = Collections.unmodifiableList(new ArrayList<>(favorites));
        SharedPreferences store = store();
        if (store != null) store.edit().putString(LIST, raw.toString()).apply();
    }

    private static SharedPreferences store() {
        SharedPreferences store = preferences;
        if (store != null) return store;
        Context context = TwitchContext.application();
        if (context == null) return null;
        preferences = store = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
        return store;
    }

    private static int indexOf(List<Favorite> favorites, String id) {
        for (int i = 0; i < favorites.size(); i++) {
            if (favorites.get(i).id.equals(id)) return i;
        }
        return -1;
    }

    /** Tabs and line breaks would break the stored lines; emote IDs and codes have none. */
    private static String clean(String value) {
        return value.replace('\t', ' ').replace('\n', ' ');
    }

    /** Forgets the list read, as a new process would. For tests. */
    static void forget() {
        cached = null;
    }

    private static Object constant(Class<?> type, String name, String fallback) {
        for (Object constant : type.getEnumConstants()) {
            if (((Enum<?>) constant).name().equals(name)) return constant;
        }
        for (Object constant : type.getEnumConstants()) {
            if (((Enum<?>) constant).name().equals(fallback)) return constant;
        }
        return null;
    }

    /**
     * Shows the change in the open picker: asks its presenter to load the sets again, which is what Twitch
     * does each time the picker opens.
     */
    private static void reload() {
        WeakReference<Object> reference = openPresenter;
        Object presenter = reference == null ? null : reference.get();
        Object channel = openChannel;
        Object surface = openSurface;
        if (presenter == null || channel == null || surface == null) return;
        Looper main = Looper.getMainLooper();
        if (main == null) return;
        new Handler(main).post(() -> {
            try {
                reloadPicker(presenter, channel, surface);
            } catch (RuntimeException e) {
                Logger.d("emote favorites: picker reload failed: " + e);
            }
        });
    }

    // ---------------------------------------------------------------------------------------------
    // Bridges, filled at patch time

    /**
     * Replaced at patch time: the emote of a picker item's model when it is an unlocked emote without modifier
     * variants (those keep Twitch's long press), else null.
     */
    static Object pickerEmote(Object item) {
        return null;
    }

    /** Replaced at patch time: an emote's ID. */
    static String emoteId(Object emote) {
        return null;
    }

    /** Replaced at patch time: an emote's asset type (an enum: STATIC, ANIMATED). */
    static Object emoteAsset(Object emote) {
        return null;
    }

    /** Replaced at patch time: an emote's type (an enum: OTHER, SUBSCRIPTIONS...). */
    static Object emoteType(Object emote) {
        return null;
    }

    /** Replaced at patch time: the picker presenter's load for a channel and surface. */
    static void reloadPicker(Object presenter, Object channel, Object surface) {
    }
}
