package io.github.jordanwoodson.extension.shared.twitch;

import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.util.JsonReader;

import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.AbstractSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * Third-party emotes (7TV, BetterTTV, FrankerFaceZ) in Twitch chat. Each provider is opt-in.
 *
 * <p>Twitch already matches whole words against a set of emotes it parsed on the client; the live chat
 * hook adds the providers' emotes to that set as Twitch's own emote objects, with synthetic IDs
 * ({@code lurk<provider><a|s>_<id>}). Twitch then builds its usual emote URL from the ID, and the URL hook
 * points it at the provider's CDN. VOD chat replay gets the same treatment on its message tokens, and
 * React Native chat on the emote tags of the chat lines it receives.
 * Emote lists are fetched in the background per channel and cached in memory; until they arrive, or if a
 * request fails, emote codes stay plain text.
 */
@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class TwitchEmotes {
    static final String KEY_7TV = "emotes_7tv";
    static final String KEY_BTTV = "emotes_bttv";
    static final String KEY_FFZ = "emotes_ffz";
    static final String KEY_PICKER = "emotes_picker";

    private static final int SEVENTV = 0;
    private static final int BTTV = 1;
    private static final int FFZ = 2;
    private static final String[] KEYS = {KEY_7TV, KEY_BTTV, KEY_FFZ};
    private static final char[] TAGS = {'7', 'b', 'f'};
    private static final String[] NAMES = {"7TV", "BetterTTV", "FrankerFaceZ"};

    private static final String TWITCH_EMOTE_URL = "https://static-cdn.jtvnw.net/emoticons/v2/";
    private static final String ID_PREFIX = "lurk";
    private static final String CDN_7TV = "https://cdn.7tv.app/emote/";
    private static final String CDN_BTTV = "https://cdn.betterttv.net/emote/";
    private static final String CDN_FFZ = "https://cdn.frankerfacez.com/emote/";

    private static final String GLOBAL = "global";
    private static final long CHANNEL_TTL_MS = 10 * 60_000L;
    private static final long GLOBAL_TTL_MS = 60 * 60_000L;
    private static final long RETRY_MS = 60_000L;
    private static final int MAX_CHANNELS = 12;

    private static final Emote[] NONE = new Emote[0];
    private static final String TEXT_TOKEN = "tv.twitch.android.shared.chat.pub.messages.data.MessageToken$TextToken";
    private static final String EMOTE_TOKEN = "tv.twitch.android.shared.chat.pub.messages.data.MessageToken$EmoticonToken";

    /** provider:scope -> the provider's emotes for a channel ID or "global". */
    private static final ConcurrentHashMap<String, Entry> SETS = new ConcurrentHashMap<>();
    private static final Set<String> LOADING = ConcurrentHashMap.newKeySet();
    /** tag + provider emote ID -> width / height, for emotes that aren't square. */
    private static final Map<String, Float> RATIOS = Collections.synchronizedMap(new LinkedHashMap<String, Float>() {
        @Override protected boolean removeEldestEntry(Map.Entry<String, Float> eldest) { return size() > 8192; }
    });
    /** Exact image URL (for instance a generated badge's data URI) -> width / height. */
    private static final ConcurrentHashMap<String, Float> URL_RATIOS = new ConcurrentHashMap<>();
    /** Bumped whenever a list changes, so cached views are rebuilt. */
    private static final AtomicInteger GENERATION = new AtomicInteger();
    private static final ConcurrentHashMap<String, Resolved> RESOLVED = new ConcurrentHashMap<>();
    private static final Map<String, TwitchThirdParty.Demand> RN_REQUESTS = new HashMap<>();
    private static volatile Union union;
    private static volatile TokenTypes tokenTypes;
    /** The channel (a Tuid) whose chat connected last: the one the chat input and its autocomplete belong to. */
    private static volatile Object chatChannel;

    private TwitchEmotes() {
    }

    // ---------------------------------------------------------------------------------------------
    // Injection points

    /** Injection point: chat starts connecting to {@code channel} (a Tuid). Starts loading its emotes early. */
    public static void onChatChannel(Object channel) {
        try {
            if (channel != null) chatChannel = channel;
            int mask = enabledMask();
            if (mask != 0 && channel != null) ensure(String.valueOf(channel), mask);
        } catch (RuntimeException e) {
            Logger.d("emotes: prefetch failed: " + e);
        }
    }

    /**
     * Injection point (live chat, chat history, shared chat): Twitch's whole-word emote set for a message.
     * Returns it unchanged while every provider is off; otherwise a view with Twitch's own emotes first (so
     * they win) followed by third-party emotes, made as instances of {@code ownerClass}, Twitch's emote class.
     */
    public static Set clientEmotes(Set stock, Class<?> ownerClass, Object channel) {
        if (stock == null || ownerClass == null || channel == null) return stock;
        try {
            int mask = enabledMask();
            if (mask == 0) return stock;
            Resolved resolved = resolve(String.valueOf(channel), mask);
            if (resolved.byCode.isEmpty()) return stock;
            Union last = union;
            if (last != null && last.stock == stock && last.resolved == resolved && last.ownerClass == ownerClass) {
                return last.result;
            }
            Object[] owners = resolved.owners(ownerClass, channel);
            if (owners.length == 0) return stock;
            Union next = new Union(stock, resolved, ownerClass, new UnionSet(stock, owners));
            union = next;
            return next.result;
        } catch (RuntimeException e) {
            Logger.d("emotes: live chat failed: " + e);
            return stock;
        }
    }

    /**
     * Injection point (VOD chat replay): splits text tokens at third-party emote codes into Twitch's own
     * emote tokens. Returns {@code tokens} itself when nothing matches.
     */
    public static List messageTokens(List tokens, Object channel) {
        if (tokens == null || tokens.isEmpty() || channel == null) return tokens;
        try {
            int mask = enabledMask();
            if (mask == 0) return tokens;
            Resolved resolved = resolve(String.valueOf(channel), mask);
            if (resolved.byCode.isEmpty()) return tokens;
            TokenTypes types = tokenTypes();
            if (types == null) return tokens;
            ArrayList out = null;
            for (int i = 0; i < tokens.size(); i++) {
                Object token = tokens.get(i);
                List split = types.text.isInstance(token) ? split(types, token, resolved.byCode) : null;
                if (split != null && out == null) out = new ArrayList(tokens.subList(0, i));
                if (out != null) {
                    if (split != null) out.addAll(split);
                    else out.add(token);
                }
            }
            return out == null ? tokens : out;
        } catch (ReflectiveOperationException | RuntimeException e) {
            Logger.d("emotes: replay failed: " + e);
            return tokens;
        }
    }

    /**
     * Injection point (native emote URLs, and every React Native image source): the emote image URL Twitch
     * built for an emote ID. URLs of synthetic third-party IDs go to the provider's CDN: GIF for animated
     * emotes (the format both chats animate), PNG otherwise, and PNG when Twitch's own animated-emotes setting
     * asks for the static variant. Every other URL is returned as it is.
     */
    public static String url(String url) {
        if (url == null || !url.startsWith(TWITCH_EMOTE_URL + ID_PREFIX)) return url;
        int idStart = TWITCH_EMOTE_URL.length();
        int idEnd = url.indexOf('/', idStart);
        if (idEnd < 0) return url;
        int variantEnd = url.indexOf('/', idEnd + 1);
        String variant = variantEnd < 0 ? "" : url.substring(idEnd + 1, variantEnd);
        float scale = 2f;
        try {
            scale = Float.parseFloat(url.substring(url.lastIndexOf('/') + 1));
        } catch (NumberFormatException ignored) {
            // Twitch's chat scale.
        }
        String mapped = cdnUrl(url.substring(idStart, idEnd), !"static".equals(variant), scale);
        return mapped != null ? mapped : url;
    }

    /** Injection point: whether an emote ID is one of ours, so Twitch doesn't open its emote card for it. */
    public static boolean isThirdParty(String id) {
        return id != null && id.length() > 7 && id.startsWith(ID_PREFIX) && id.charAt(6) == '_';
    }

    /**
     * Injection point: chat is about to load an emote or badge image into {@code placeholder}. Twitch fits
     * every emote in a square; a wide third-party emote would shrink to a sliver. For those the placeholder
     * gets the emote's width before the line is laid out, and the image is sized by height (keeping its
     * aspect ratio) instead. Everything else keeps Twitch's {@code stock} setting.
     */
    public static boolean sizeEmote(boolean stock, Drawable placeholder, String url) {
        if (stock || url == null || placeholder == null) return stock;
        Float ratio = ratio(url);
        if (ratio == null) return false;
        Rect bounds = placeholder.getBounds();
        int height = bounds.height();
        if (height > 0) placeholder.setBounds(0, 0, Math.max(1, Math.round(height * ratio)), height);
        return true;
    }

    /**
     * Injection point (React Native chat, used for live channels when Twitch's Ultralight experiment is on):
     * one text frame received on a React Native WebSocket. In Twitch chat (IRC) frames, PRIVMSG and
     * USERNOTICE lines get third-party emote words added to their {@code emotes} tag with synthetic IDs, which
     * the chat renders like Twitch emotes. Every other frame is returned unchanged, and quickly.
     */
    public static String rnFrame(String frame) {
        if (frame == null || frame.length() < 2 || (frame.charAt(0) != '@' && !frame.contains("\n@"))) return frame;
        try {
            int mask = enabledMask();
            if (mask == 0) return frame;
            StringBuilder out = null;
            int length = frame.length();
            int start = 0;
            while (start < length) {
                int newline = frame.indexOf('\n', start);
                int next = newline < 0 ? length : newline + 1;
                int end = newline < 0 ? length : newline > start && frame.charAt(newline - 1) == '\r' ? newline - 1 : newline;
                String line = frame.substring(start, end);
                String rewritten = rewriteIrcLine(line, mask);
                if (rewritten != line && out == null) {
                    out = new StringBuilder(length + 64);
                    out.append(frame, 0, start);
                }
                if (out != null) out.append(rewritten).append(frame, end, next);
                start = next;
            }
            return out == null ? frame : out.toString();
        } catch (RuntimeException e) {
            Logger.d("emotes: chat frame failed: " + e);
            return frame;
        }
    }

    private static String rewriteIrcLine(String line, int mask) {
        if (line.isEmpty() || line.charAt(0) != '@') return line;
        int tagsEnd = line.indexOf(' ');
        if (tagsEnd < 0) return line;
        String tags = line.substring(1, tagsEnd);
        String room = tag(tags, "source-room-id");
        if (room == null || room.isEmpty()) room = tag(tags, "room-id");
        if (!isTwitchId(room)) return line;
        // RN row effects own requests. Socket ingress only consumes the shared cache, so
        // queued work cannot outlive RN navigation by being mistaken for a native caller.
        Map<String, String> byCode = cached(room, mask).byCode;
        return byCode.isEmpty() ? line : addEmotes(line, byCode);
    }

    /**
     * Adds whole words of an IRC PRIVMSG or USERNOTICE line found in {@code byCode} to its {@code emotes} tag,
     * as code point ranges of the message text (the text inside an ACTION), the way Twitch sends its own.
     * Words Twitch already marked keep Twitch's emote. Other lines are returned as they are.
     */
    static String addEmotes(String line, Map<String, String> byCode) {
        int tagsEnd = line.indexOf(' ');
        if (line.isEmpty() || line.charAt(0) != '@' || tagsEnd < 0) return line;
        int at = tagsEnd + 1;
        if (at < line.length() && line.charAt(at) == ':') {
            at = line.indexOf(' ', at) + 1;
            if (at <= 0) return line;
        }
        int commandEnd = line.indexOf(' ', at);
        if (commandEnd < 0) return line;
        String command = line.substring(at, commandEnd);
        if (!"PRIVMSG".equals(command) && !"USERNOTICE".equals(command)) return line;
        int trailing = line.indexOf(" :", commandEnd);
        if (trailing < 0) return line;
        int textStart = trailing + 2;
        int textEnd = line.length();
        if (line.startsWith("\u0001ACTION ", textStart) && textEnd > textStart + 8 && line.charAt(textEnd - 1) == '\u0001') {
            textStart += 8;
            textEnd--;
        }
        String tags = line.substring(1, tagsEnd);
        String emotes = tag(tags, "emotes");
        List<int[]> taken = ranges(emotes);
        LinkedHashMap<String, StringBuilder> added = null;
        int codePoint = 0;
        int index = textStart;
        while (index <= textEnd) {
            int space = line.indexOf(' ', index);
            if (space < 0 || space > textEnd) space = textEnd;
            int width = line.codePointCount(index, space);
            if (width > 0) {
                String id = byCode.get(line.substring(index, space));
                if (id != null && !overlaps(taken, codePoint, codePoint + width - 1)) {
                    if (added == null) added = new LinkedHashMap<>();
                    StringBuilder positions = added.get(id);
                    if (positions == null) added.put(id, positions = new StringBuilder());
                    else positions.append(',');
                    positions.append(codePoint).append('-').append(codePoint + width - 1);
                }
            }
            codePoint += width + 1;
            index = space + 1;
        }
        if (added == null) return line;
        StringBuilder value = new StringBuilder(emotes == null ? "" : emotes);
        for (Map.Entry<String, StringBuilder> emote : added.entrySet()) {
            if (value.length() > 0) value.append('/');
            value.append(emote.getKey()).append(':').append(emote.getValue());
        }
        return "@" + setTag(tags, "emotes", value.toString()) + line.substring(tagsEnd);
    }

    /** An IRC tag's raw value, or null. */
    private static String tag(String tags, String key) {
        int start = 0;
        while (start <= tags.length()) {
            int end = tags.indexOf(';', start);
            if (end < 0) end = tags.length();
            if (tags.startsWith(key, start) && start + key.length() < end && tags.charAt(start + key.length()) == '=') {
                return tags.substring(start + key.length() + 1, end);
            }
            if (tags.startsWith(key, start) && start + key.length() == end) return "";
            start = end + 1;
        }
        return null;
    }

    private static String setTag(String tags, String key, String value) {
        int start = 0;
        while (start <= tags.length()) {
            int end = tags.indexOf(';', start);
            if (end < 0) end = tags.length();
            if (tags.startsWith(key, start) && (start + key.length() == end || tags.charAt(start + key.length()) == '=')) {
                return tags.substring(0, start) + key + "=" + value + tags.substring(end);
            }
            start = end + 1;
        }
        return tags + ";" + key + "=" + value;
    }

    /** Twitch emote ranges ("id:0-4,6-10/id2:12-15") as [start, end] pairs. */
    private static List<int[]> ranges(String emotes) {
        List<int[]> out = new ArrayList<>();
        if (emotes == null || emotes.isEmpty()) return out;
        for (String emote : emotes.split("/")) {
            int colon = emote.lastIndexOf(':');
            if (colon < 0) continue;
            for (String range : emote.substring(colon + 1).split(",")) {
                int dash = range.indexOf('-');
                if (dash <= 0) continue;
                try {
                    out.add(new int[]{Integer.parseInt(range.substring(0, dash)), Integer.parseInt(range.substring(dash + 1))});
                } catch (NumberFormatException ignored) {
                    // Not a range.
                }
            }
        }
        return out;
    }

    private static boolean overlaps(List<int[]> ranges, int start, int end) {
        for (int[] range : ranges) {
            if (start <= range[1] && end >= range[0]) return true;
        }
        return false;
    }

    // ---------------------------------------------------------------------------------------------
    // Emote picker and autocomplete

    /**
     * Injection point (emote picker): the user's emote sets, as the picker's presenter receives them for
     * {@code channel} (a Tuid; null outside a channel). While "Emotes in the picker" and a service are on,
     * returns a copy with one set per service appended. Each is owned by a stand-in owner named after the
     * service (a negative ID no account has), so the picker builds a section with that name as its header.
     * Otherwise {@code sets} itself.
     */
    public static List pickerSets(List sets, Object channel) {
        if (sets == null || channel == null || !Settings.isEnabled(KEY_PICKER)) return sets;
        try {
            chatChannel = channel;
            Picked picked = picked(channel);
            if (picked == null) return sets;
            ArrayList out = null;
            for (int provider = 0; provider < KEYS.length; provider++) {
                List<Object> emotes = picked.byProvider.get(provider);
                if (emotes.isEmpty()) continue;
                Object set = ownerSet(-(provider + 1), NAMES[provider], NAMES[provider], null,
                        ID_PREFIX + TAGS[provider], Collections.unmodifiableList(emotes));
                if (set == null) continue;
                if (out == null) out = new ArrayList(sets);
                out.add(set);
            }
            return out == null ? sets : out;
        } catch (RuntimeException e) {
            Logger.d("emotes: picker failed: " + e);
            return sets;
        }
    }

    /**
     * Injection point (chat input autocomplete): replaces the filter's call to its current source and makes
     * that call. When the source is Twitch's emote one and "Emotes in the picker" is on, the third-party emotes
     * of the channel whose chat connected last are merged in, in Twitch's order: codes that start with the
     * typed text (after an optional ':'), then codes that contain it, Twitch's own first in each group. Codes
     * Twitch already has are left out. Everything else is the source's own answer.
     */
    public static ArrayList autocomplete(Object source, CharSequence typed) {
        ArrayList found = sourceMatches(source, typed);
        if (found == null || typed == null || !Settings.isEnabled(KEY_PICKER)) return found;
        try {
            Object channel = chatChannel;
            if (channel == null || !isEmoteSource(source)) return found;
            String text = typed.toString();
            if (text.startsWith(":")) text = text.substring(1);
            if (text.isEmpty()) return found;
            Picked picked = picked(channel);
            if (picked == null) return found;
            String lower = text.toLowerCase(Locale.ROOT);
            ArrayList<Object> ownStart = new ArrayList<>();
            ArrayList<Object> ownRest = new ArrayList<>();
            for (int i = 0; i < picked.codes.length; i++) {
                String code = picked.codes[i].toLowerCase(Locale.ROOT);
                boolean start = code.startsWith(lower);
                if (!start && !code.contains(lower)) continue;
                if (sourceHas(source, picked.codes[i])) continue;
                (start ? ownStart : ownRest).add(picked.emotes[i]);
            }
            if (ownStart.isEmpty() && ownRest.isEmpty()) return found;
            ArrayList out = new ArrayList(found.size() + ownStart.size() + ownRest.size());
            int split = 0;
            while (split < found.size()) {
                String code = emoteCode(found.get(split));
                if (code == null || !code.toLowerCase(Locale.ROOT).startsWith(lower)) break;
                split++;
            }
            out.addAll(found.subList(0, split));
            out.addAll(ownStart);
            out.addAll(found.subList(split, found.size()));
            out.addAll(ownRest);
            return out;
        } catch (RuntimeException e) {
            Logger.d("emotes: autocomplete failed: " + e);
            return found;
        }
    }

    /** The channel's third-party emotes as Twitch emote objects, with their codes, or null when there are none. */
    private static Picked picked(Object channel) {
        int mask = enabledMask();
        if (mask == 0) return null;
        Resolved resolved = resolve(String.valueOf(channel), mask);
        if (resolved.byCode.isEmpty()) return null;
        Picked picked = resolved.picked;
        if (picked != null) return picked;
        Class<?> type = emoteClass();
        Object[] owners = type == null ? null : resolved.owners(type, channel);
        if (owners == null || owners.length != resolved.byCode.size()) return null;
        String[] codes = new String[owners.length];
        List<List<Object>> byProvider = new ArrayList<>();
        for (int provider = 0; provider < KEYS.length; provider++) byProvider.add(new ArrayList<>());
        int i = 0;
        for (Map.Entry<String, String> emote : resolved.byCode.entrySet()) {
            codes[i] = emote.getKey();
            int provider = providerOf(emote.getValue().charAt(4));
            if (provider >= 0) byProvider.get(provider).add(owners[i]);
            i++;
        }
        resolved.picked = picked = new Picked(codes, owners, byProvider);
        return picked;
    }

    private static int providerOf(char tag) {
        for (int provider = 0; provider < TAGS.length; provider++) {
            if (TAGS[provider] == tag) return provider;
        }
        return -1;
    }

    /** Replaced at patch time: Twitch's emote class, the one chat's matcher and the picker use. */
    private static Class emoteClass() {
        return null;
    }

    /**
     * Replaced at patch time: an emote set Twitch's picker shows as a section headed by its owner's name. The
     * owner is a Tuid of {@code ownerId} with that login, display name and avatar URL.
     */
    private static Object ownerSet(int ownerId, String login, String displayName, String avatar, String setId,
                                   List emotes) {
        return null;
    }

    /** Replaced at patch time: the autocomplete source's own matches for the typed text (the call it replaced). */
    private static ArrayList sourceMatches(Object source, CharSequence typed) {
        return null;
    }

    /** Replaced at patch time: whether the autocomplete source has an emote of exactly this code. */
    private static boolean sourceHas(Object source, String code) {
        return false;
    }

    /** Replaced at patch time: whether the autocomplete source is Twitch's emote one. */
    private static boolean isEmoteSource(Object source) {
        return false;
    }

    /** Replaced at patch time: the code (the text chat inserts) of one of Twitch's emote objects. */
    private static String emoteCode(Object emote) {
        return null;
    }

    // ---------------------------------------------------------------------------------------------
    // Matching

    private static List split(TokenTypes types, Object token, Map<String, String> byCode)
            throws ReflectiveOperationException {
        String text = (String) types.getText.invoke(token);
        if (text == null || text.isEmpty()) return null;
        Object flags = types.getFlags.invoke(token);
        ArrayList out = null;
        int pending = 0;
        int length = text.length();
        int start = 0;
        while (start <= length) {
            int end = text.indexOf(' ', start);
            if (end < 0) end = length;
            if (end > start) {
                String id = byCode.get(text.substring(start, end));
                if (id != null) {
                    if (out == null) out = new ArrayList();
                    if (start > pending) out.add(types.newText.newInstance(text.substring(pending, start), flags));
                    out.add(types.newEmote.newInstance(text.substring(start, end), id));
                    pending = end;
                }
            }
            start = end + 1;
        }
        if (out == null) return null;
        if (pending < length) out.add(types.newText.newInstance(text.substring(pending), flags));
        return out;
    }

    private static TokenTypes tokenTypes() throws ReflectiveOperationException {
        TokenTypes types = tokenTypes;
        if (types == null) {
            ClassLoader loader = TwitchEmotes.class.getClassLoader();
            Class<?> text = Class.forName(TEXT_TOKEN, false, loader);
            Class<?> emote = Class.forName(EMOTE_TOKEN, false, loader);
            Method getFlags = text.getMethod("getFlags");
            tokenTypes = types = new TokenTypes(text, text.getMethod("getText"), getFlags,
                    text.getConstructor(String.class, getFlags.getReturnType()),
                    emote.getConstructor(String.class, String.class));
        }
        return types;
    }

    private static int enabledMask() {
        int mask = 0;
        for (int provider = 0; provider < KEYS.length; provider++) {
            if (Settings.isEnabled(KEYS[provider])) mask |= 1 << provider;
        }
        return mask;
    }

    /** The emotes for {@code channel} under {@code mask}: channel sets first, then global, first code wins. */
    private static Resolved resolve(String channel, int mask) {
        ensure(channel, mask);
        return cached(channel, mask);
    }

    /** Passive RN read: missing/expired entries do not schedule requests. */
    static Map<String, String> cachedRn(String channel) {
        return cached(channel, enabledMask()).byCode;
    }

    static int rnRevision() { return GENERATION.get() * 8 + enabledMask(); }

    static void requestRn(String channel, java.util.function.BooleanSupplier wanted) {
        if (!isTwitchId(channel) || wanted == null || !wanted.getAsBoolean()) return;
        int mask = enabledMask();
        for (int provider = 0; provider < KEYS.length; provider++) {
            if ((mask & (1 << provider)) == 0 || !Settings.isRegistered(KEYS[provider])) continue;
            ensure(provider,channel,wanted); ensure(provider,GLOBAL,wanted);
        }
    }

    private static Resolved cached(String channel, int mask) {
        int generation = GENERATION.get();
        Resolved resolved = RESOLVED.get(channel);
        if (resolved != null && resolved.mask == mask && resolved.generation == generation) return resolved;
        LinkedHashMap<String, String> byCode = new LinkedHashMap<>();
        for (int scope = 0; scope < 2; scope++) {
            for (int provider = 0; provider < KEYS.length; provider++) {
                if ((mask & (1 << provider)) == 0) continue;
                Entry entry = SETS.get(key(provider, scope == 0 ? channel : GLOBAL));
                if (entry == null) continue;
                for (Emote emote : entry.emotes) {
                    if (!byCode.containsKey(emote.code)) byCode.put(emote.code, emote.id);
                }
            }
        }
        resolved = new Resolved(mask, generation, byCode);
        if (RESOLVED.size() >= MAX_CHANNELS) RESOLVED.clear();
        RESOLVED.put(channel, resolved);
        return resolved;
    }

    // ---------------------------------------------------------------------------------------------
    // Loading

    private static String key(int provider, String scope) {
        return TAGS[provider] + ":" + scope;
    }

    private static void ensure(String channel, int mask) {
        if (!isTwitchId(channel)) return;
        for (int provider = 0; provider < KEYS.length; provider++) {
            if ((mask & (1 << provider)) == 0) continue;
            ensure(provider, channel);
            ensure(provider, GLOBAL);
        }
    }

    private static void ensure(int provider, String scope) { ensure(provider,scope,null); }

    private static void ensure(int provider, String scope, java.util.function.BooleanSupplier wanted) {
        String key = key(provider, scope);
        TwitchThirdParty.Demand demand;
        synchronized (RN_REQUESTS) {
            Entry entry = SETS.get(key);
            if (entry != null && SystemClock.elapsedRealtime() < entry.expires) return;
            demand = RN_REQUESTS.get(key);
            if (demand != null) { demand.add(wanted); return; }
            demand = new TwitchThirdParty.Demand(); demand.add(wanted);
            RN_REQUESTS.put(key,demand); LOADING.add(key);
        }
        TwitchThirdParty.Demand pending = demand;
        TwitchThirdParty.run(key, () -> Settings.isEnabled(KEYS[provider]) && pending.getAsBoolean(),
            () -> load(provider, scope, key), () -> {
                synchronized (RN_REQUESTS) { RN_REQUESTS.remove(key); LOADING.remove(key); }
            });
    }

    private static void load(int provider, String scope, String key) {
        boolean global = GLOBAL.equals(scope);
        try {
            Emote[] emotes = fetch(provider, global ? null : scope);
            put(key, emotes, global ? GLOBAL_TTL_MS : CHANNEL_TTL_MS);
            Logger.d("emotes: " + NAMES[provider] + " " + scope + ": " + emotes.length);
        } catch (IOException | RuntimeException e) {
            Entry old = SETS.get(key);
            put(key, old != null ? old.emotes : NONE, RETRY_MS);
            // Always written, since the emotes then stay text and a bug report needs the reason; without the
            // channel's ID. At most once a minute per list: the next try waits RETRY_MS.
            String reason = global ? String.valueOf(e) : String.valueOf(e).replace(scope, "<channel>");
            Logger.w("emotes: " + NAMES[provider] + (global ? " global" : " channel") + " list unavailable: " + reason);
        }
    }

    private static synchronized void put(String key, Emote[] emotes, long ttl) {
        long now = SystemClock.elapsedRealtime();
        int limit = (MAX_CHANNELS + 1) * KEYS.length;
        while (!SETS.containsKey(key) && SETS.size() >= limit) {
            String oldest = null; long expiry = Long.MAX_VALUE;
            for (Map.Entry<String,Entry> entry : SETS.entrySet()) {
                if (!entry.getKey().endsWith(":" + GLOBAL) && entry.getValue().expires <= expiry) {
                    oldest = entry.getKey(); expiry = entry.getValue().expires;
                }
            }
            if (oldest == null) break;
            SETS.remove(oldest);
        }
        SETS.put(key, new Entry(emotes, now + ttl));
        GENERATION.incrementAndGet();
    }

    private static boolean isTwitchId(String id) {
        if (id == null || id.isEmpty() || id.length() > 12 || "0".equals(id)) return false;
        for (int i = 0; i < id.length(); i++) {
            if (id.charAt(i) < '0' || id.charAt(i) > '9') return false;
        }
        return true;
    }

    /** One provider's emotes for a channel, or its global emotes when {@code channel} is null. */
    static Emote[] fetch(int provider, String channel) throws IOException {
        switch (provider) {
            case SEVENTV:
                return channel == null
                        ? TwitchThirdParty.getJson("https://7tv.io/v3/emote-sets/global", TwitchEmotes::parse7tvSet, NONE)
                        : TwitchThirdParty.getJson("https://7tv.io/v3/users/twitch/" + channel, TwitchEmotes::parse7tvUser, NONE);
            case BTTV:
                return channel == null
                        ? TwitchThirdParty.getJson("https://api.betterttv.net/3/cached/emotes/global", TwitchEmotes::parseBttvList, NONE)
                        : TwitchThirdParty.getJson("https://api.betterttv.net/3/cached/users/twitch/" + channel, TwitchEmotes::parseBttvUser, NONE);
            case FFZ:
                return channel == null
                        ? TwitchThirdParty.getJson("https://api.frankerfacez.com/v1/set/global", TwitchEmotes::parseFfz, NONE)
                        : TwitchThirdParty.getJson("https://api.frankerfacez.com/v1/room/id/" + channel, TwitchEmotes::parseFfz, NONE);
            default:
                return NONE;
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Provider formats, streamed (a busy channel's 7TV set is a few MB of JSON)

    /** 7TV v3 /users/twitch/{id}: { ..., "emote_set": { "emotes": [...] } }. */
    static Emote[] parse7tvUser(JsonReader reader) throws IOException {
        Emote[] emotes = NONE;
        if (!TwitchThirdParty.beginObject(reader)) return NONE;
        while (reader.hasNext()) {
            if ("emote_set".equals(reader.nextName())) emotes = parse7tvSet(reader);
            else reader.skipValue();
        }
        reader.endObject();
        return emotes;
    }

    /** 7TV v3 emote set: { "emotes": [ { "id", "name", "data": { "animated", "host": { "files": [...] } } } ] }. */
    static Emote[] parse7tvSet(JsonReader reader) throws IOException {
        List<Emote> out = new ArrayList<>();
        if (!TwitchThirdParty.beginObject(reader)) return NONE;
        while (reader.hasNext()) {
            if (!"emotes".equals(reader.nextName())) {
                reader.skipValue();
                continue;
            }
            if (!TwitchThirdParty.beginArray(reader)) continue;
            while (reader.hasNext()) {
                if (!TwitchThirdParty.beginObject(reader)) continue;
                String id = null;
                String code = null;
                // data.animated and the first file's size, as { animated, ratio }, and data.owner's name.
                float[] data = {0, 0};
                String[] owner = {null};
                while (reader.hasNext()) {
                    switch (reader.nextName()) {
                        case "id":
                            id = TwitchThirdParty.string(reader);
                            break;
                        case "name":
                            code = TwitchThirdParty.string(reader);
                            break;
                        case "data":
                            parse7tvData(reader, data, owner);
                            break;
                        default:
                            reader.skipValue();
                    }
                }
                reader.endObject();
                add(out, SEVENTV, id, code, data[0] != 0, data[1], owner[0]);
            }
            reader.endArray();
        }
        reader.endObject();
        return out.toArray(NONE);
    }

    /**
     * 7TV emote data: { "animated", "owner": { "display_name" }, "host": { "files": [ { "width", "height" } ] } }.
     */
    private static void parse7tvData(JsonReader reader, float[] data, String[] owner) throws IOException {
        if (!TwitchThirdParty.beginObject(reader)) return;
        while (reader.hasNext()) {
            String name = reader.nextName();
            if ("animated".equals(name)) {
                data[0] = TwitchThirdParty.bool(reader) ? 1 : 0;
            } else if ("owner".equals(name)) {
                owner[0] = displayName(reader, "display_name");
            } else if ("host".equals(name)) {
                if (!TwitchThirdParty.beginObject(reader)) continue;
                while (reader.hasNext()) {
                    if (!"files".equals(reader.nextName())) {
                        reader.skipValue();
                        continue;
                    }
                    if (!TwitchThirdParty.beginArray(reader)) continue;
                    while (reader.hasNext()) {
                        float ratio = parseSize(reader);
                        if (data[1] == 0) data[1] = ratio;
                    }
                    reader.endArray();
                }
                reader.endObject();
            } else {
                reader.skipValue();
            }
        }
        reader.endObject();
    }

    /** { "width", "height", ... } -> width / height, or 0. */
    private static float parseSize(JsonReader reader) throws IOException {
        if (!TwitchThirdParty.beginObject(reader)) return 0;
        long width = 0;
        long height = 0;
        while (reader.hasNext()) {
            String name = reader.nextName();
            if ("width".equals(name)) width = TwitchThirdParty.number(reader, 0);
            else if ("height".equals(name)) height = TwitchThirdParty.number(reader, 0);
            else reader.skipValue();
        }
        reader.endObject();
        return width > 0 && height > 0 ? (float) width / height : 0;
    }

    /** BetterTTV cached v3 /users/twitch/{id}: { "channelEmotes": [...], "sharedEmotes": [...] }. */
    static Emote[] parseBttvUser(JsonReader reader) throws IOException {
        List<Emote> out = new ArrayList<>();
        if (!TwitchThirdParty.beginObject(reader)) return NONE;
        while (reader.hasNext()) {
            String name = reader.nextName();
            if ("channelEmotes".equals(name) || "sharedEmotes".equals(name)) parseBttvEmotes(reader, out);
            else reader.skipValue();
        }
        reader.endObject();
        return out.toArray(NONE);
    }

    /** BetterTTV cached v3 /emotes/global: [ { "id", "code", "animated", "modifier" } ]. */
    static Emote[] parseBttvList(JsonReader reader) throws IOException {
        List<Emote> out = new ArrayList<>();
        parseBttvEmotes(reader, out);
        return out.toArray(NONE);
    }

    private static void parseBttvEmotes(JsonReader reader, List<Emote> out) throws IOException {
        if (!TwitchThirdParty.beginArray(reader)) return;
        while (reader.hasNext()) {
            if (!TwitchThirdParty.beginObject(reader)) continue;
            String id = null;
            String code = null;
            String owner = null;
            boolean animated = false;
            boolean modifier = false;
            while (reader.hasNext()) {
                switch (reader.nextName()) {
                    case "id":
                        id = TwitchThirdParty.string(reader);
                        break;
                    case "code":
                        code = TwitchThirdParty.string(reader);
                        break;
                    case "animated":
                        animated = TwitchThirdParty.bool(reader);
                        break;
                    case "modifier":
                        modifier = TwitchThirdParty.bool(reader);
                        break;
                    case "user":
                        // Shared emotes: who uploaded it. A channel's own emotes have no user.
                        owner = displayName(reader, "displayName");
                        break;
                    default:
                        reader.skipValue();
                }
            }
            reader.endObject();
            // Modifiers (w!, h!, ...) change the emote next to them in BetterTTV's own client; skip them.
            if (!modifier) add(out, BTTV, id, code, animated, 0, owner);
        }
        reader.endArray();
    }

    /**
     * FrankerFaceZ v1 /set/global ({ "default_sets": [...], "sets": {...} }) and /room/id/{id}
     * ({ "room": {...}, "sets": {...} }). Sets: { "id": { "emoticons": [ { "id", "name", "width", "height",
     * "animated": {...}|null, "modifier" } ] } }. Global lists only use the default sets.
     */
    static Emote[] parseFfz(JsonReader reader) throws IOException {
        Map<String, List<Emote>> sets = new LinkedHashMap<>();
        List<String> defaults = null;
        if (!TwitchThirdParty.beginObject(reader)) return NONE;
        while (reader.hasNext()) {
            String name = reader.nextName();
            if ("default_sets".equals(name)) {
                if (!TwitchThirdParty.beginArray(reader)) continue;
                defaults = new ArrayList<>();
                while (reader.hasNext()) {
                    String set = TwitchThirdParty.string(reader);
                    if (set != null) defaults.add(set);
                }
                reader.endArray();
            } else if ("sets".equals(name)) {
                if (!TwitchThirdParty.beginObject(reader)) continue;
                while (reader.hasNext()) {
                    String set = reader.nextName();
                    List<Emote> emotes = new ArrayList<>();
                    parseFfzSet(reader, emotes);
                    sets.put(set, emotes);
                }
                reader.endObject();
            } else {
                reader.skipValue();
            }
        }
        reader.endObject();
        List<Emote> out = new ArrayList<>();
        for (Map.Entry<String, List<Emote>> set : sets.entrySet()) {
            if (defaults == null || defaults.contains(set.getKey())) out.addAll(set.getValue());
        }
        return out.toArray(NONE);
    }

    private static void parseFfzSet(JsonReader reader, List<Emote> out) throws IOException {
        if (!TwitchThirdParty.beginObject(reader)) return;
        while (reader.hasNext()) {
            if (!"emoticons".equals(reader.nextName())) {
                reader.skipValue();
                continue;
            }
            if (!TwitchThirdParty.beginArray(reader)) continue;
            while (reader.hasNext()) {
                if (!TwitchThirdParty.beginObject(reader)) continue;
                String id = null;
                String code = null;
                String owner = null;
                boolean animated = false;
                boolean modifier = false;
                long width = 0;
                long height = 0;
                while (reader.hasNext()) {
                    switch (reader.nextName()) {
                        case "id":
                            id = TwitchThirdParty.string(reader);
                            break;
                        case "name":
                            code = TwitchThirdParty.string(reader);
                            break;
                        case "owner":
                            owner = displayName(reader, "display_name");
                            break;
                        case "width":
                            width = TwitchThirdParty.number(reader, 0);
                            break;
                        case "height":
                            height = TwitchThirdParty.number(reader, 0);
                            break;
                        case "animated":
                            animated = reader.peek() == android.util.JsonToken.BEGIN_OBJECT;
                            reader.skipValue();
                            break;
                        case "modifier":
                            modifier = TwitchThirdParty.bool(reader);
                            break;
                        default:
                            reader.skipValue();
                    }
                }
                reader.endObject();
                if (!modifier) add(out, FFZ, id, code, animated, width > 0 && height > 0 ? (float) width / height : 0, owner);
            }
            reader.endArray();
        }
        reader.endObject();
    }

    /** An object's {@code field} string (a display name), or null; skips anything that isn't an object. */
    private static String displayName(JsonReader reader, String field) throws IOException {
        if (!TwitchThirdParty.beginObject(reader)) return null;
        String name = null;
        while (reader.hasNext()) {
            if (field.equals(reader.nextName())) name = TwitchThirdParty.string(reader);
            else reader.skipValue();
        }
        reader.endObject();
        return name == null || name.isEmpty() || name.length() > 64 ? null : name;
    }

    private static void add(List<Emote> out, int provider, String id, String code, boolean animated, float ratio,
                            String owner) {
        if (id == null || code == null || id.isEmpty() || id.length() > 64 || code.isEmpty() || code.length() > 100) return;
        for (int i = 0; i < id.length(); i++) {
            char c = id.charAt(i);
            if (!(c >= '0' && c <= '9' || c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z')) return;
        }
        for (int i = 0; i < code.length(); i++) {
            if (Character.isWhitespace(code.charAt(i))) return;
        }
        char tag = TAGS[provider];
        out.add(new Emote(code, ID_PREFIX + tag + (animated ? 'a' : 's') + '_' + id, owner));
        if (ratio > 0 && (ratio < 0.95f || ratio > 1.05f)) RATIOS.put(tag + id, ratio);
    }

    /**
     * Emote and badge info: { service name, "channel" or "global" (null if no list holds it now), owner's name or
     * null } of the third-party emote whose image URL (as {@link #url} made it) is {@code url}, or null for any
     * other URL. The channel whose chat connected last is preferred, then any channel, then the global list.
     */
    static String[] describe(String url) {
        if (url == null) return null;
        int provider;
        String cdn;
        if (url.startsWith(CDN_7TV)) {
            provider = SEVENTV;
            cdn = CDN_7TV;
        } else if (url.startsWith(CDN_BTTV)) {
            provider = BTTV;
            cdn = CDN_BTTV;
        } else if (url.startsWith(CDN_FFZ)) {
            provider = FFZ;
            cdn = CDN_FFZ;
        } else {
            return null;
        }
        int end = url.indexOf('/', cdn.length());
        if (end <= cdn.length()) return null;
        String suffix = "_" + url.substring(cdn.length(), end);
        Object current = chatChannel;
        String preferred = current == null ? null : key(provider, String.valueOf(current));
        String[] found = null;
        int rank = 0;
        for (Map.Entry<String, Entry> entry : SETS.entrySet()) {
            String key = entry.getKey();
            if (key.charAt(0) != TAGS[provider]) continue;
            int candidate = key.equals(preferred) ? 3 : key.endsWith(":" + GLOBAL) ? 1 : 2;
            if (candidate <= rank) continue;
            for (Emote emote : entry.getValue().emotes) {
                if (emote.id.endsWith(suffix) && emote.id.length() == ID_PREFIX.length() + 2 + suffix.length()) {
                    found = new String[]{NAMES[provider], candidate == 1 ? "global" : "channel", emote.owner};
                    rank = candidate;
                    break;
                }
            }
        }
        return found != null ? found : new String[]{NAMES[provider], null, null};
    }

    // ---------------------------------------------------------------------------------------------
    // URLs

    /** The provider CDN URL for a synthetic ID, or null if it isn't one. */
    static String cdnUrl(String id, boolean allowAnimated, float scale) {
        if (!isThirdParty(id)) return null;
        char tag = id.charAt(4);
        boolean animatedEmote = id.charAt(5) == 'a';
        boolean animated = animatedEmote && allowAnimated;
        String raw = id.substring(7);
        // Larger GIFs run to megabytes; 2x already fills chat's 24 dp emote box at any screen density.
        if (animated) scale = Math.min(scale, 2f);
        switch (tag) {
            case '7': {
                String size = scale <= 1 ? "1x" : scale <= 2 ? "2x" : scale <= 3 ? "3x" : "4x";
                return CDN_7TV + raw + "/" + size + (animated ? ".gif" : animatedEmote ? "_static.png" : ".png");
            }
            case 'b': {
                String size = scale <= 1 ? "1x" : scale <= 2 ? "2x" : "3x";
                return CDN_BTTV + raw + "/" + size + (animated ? ".gif" : ".png");
            }
            case 'f': {
                String size = scale <= 1 ? "1" : scale <= 2 ? "2" : "4";
                return CDN_FFZ + raw + (animated ? "/animated/" + size + ".gif" : "/" + size);
            }
            default:
                return null;
        }
    }

    /** width / height of a third-party emote image URL that isn't square, else null. */
    static Float ratio(String url) {
        char tag;
        int start;
        if (url.startsWith("data:")) {
            return URL_RATIOS.get(url);
        } else if (url.startsWith(CDN_7TV)) {
            tag = '7';
            start = CDN_7TV.length();
        } else if (url.startsWith(CDN_BTTV)) {
            tag = 'b';
            start = CDN_BTTV.length();
        } else if (url.startsWith(CDN_FFZ)) {
            tag = 'f';
            start = CDN_FFZ.length();
        } else {
            return null;
        }
        int end = url.indexOf('/', start);
        return end < 0 ? null : RATIOS.get(tag + url.substring(start, end));
    }

    /** Marks a chat image Lurk generated as wide, so chat sizes it by height (see {@link #sizeEmote}). */
    static void registerWide(String url, float ratio) {
        if (URL_RATIOS.size() > 256) URL_RATIOS.clear();
        URL_RATIOS.put(url, ratio);
    }

    // ---------------------------------------------------------------------------------------------
    // Types

    static final class Emote {
        final String code;
        final String id;
        /** The display name of who made or added it, when the service's list says; else null. */
        final String owner;

        Emote(String code, String id, String owner) {
            this.code = code;
            this.id = id;
            this.owner = owner;
        }
    }

    private static final class Entry {
        final Emote[] emotes;
        final long expires;

        Entry(Emote[] emotes, long expires) {
            this.emotes = emotes;
            this.expires = expires;
        }
    }

    /** One channel's emotes under one set of switches, by code. */
    private static final class Resolved {
        final int mask;
        final int generation;
        final Map<String, String> byCode;
        private volatile Object[] owners;
        private volatile Class<?> ownerClass;
        /** The emotes for the picker and autocomplete, made once per resolution. */
        volatile Picked picked;

        Resolved(int mask, int generation, Map<String, String> byCode) {
            this.mask = mask;
            this.generation = generation;
            this.byCode = java.util.Collections.unmodifiableMap(byCode);
        }

        /** The emotes as Twitch emote objects of {@code type}, owned by {@code channel}. */
        Object[] owners(Class<?> type, Object channel) {
            Object[] cached = owners;
            if (cached != null && ownerClass == type) return cached;
            Object[] made = makeOwners(type, channel);
            ownerClass = type;
            owners = made;
            return made;
        }

        private Object[] makeOwners(Class<?> type, Object channel) {
            try {
                Constructor<?> constructor = null;
                for (Constructor<?> candidate : type.getDeclaredConstructors()) {
                    Class<?>[] p = candidate.getParameterTypes();
                    if (p.length == 6 && p[0] == String.class && p[1] == String.class && p[2].isInstance(channel)
                            && p[3].isEnum() && p[4] == List.class && p[5].isEnum()) {
                        constructor = candidate;
                    }
                }
                if (constructor == null) {
                    Logger.d("emotes: no emote constructor in " + type);
                    return new Object[0];
                }
                constructor.setAccessible(true);
                Class<?>[] p = constructor.getParameterTypes();
                Object animated = enumValue(p[3], "ANIMATED");
                Object still = enumValue(p[3], "STATIC");
                Object other = enumValue(p[5], "OTHER");
                Object[] made = new Object[byCode.size()];
                int i = 0;
                for (Map.Entry<String, String> emote : byCode.entrySet()) {
                    String id = emote.getValue();
                    made[i++] = constructor.newInstance(id, emote.getKey(), channel,
                            id.charAt(5) == 'a' ? animated : still, Collections.emptyList(), other);
                }
                return made;
            } catch (ReflectiveOperationException | RuntimeException e) {
                Logger.d("emotes: can't make emotes: " + e);
                return new Object[0];
            }
        }
    }

    /** One channel's emotes as Twitch emote objects: codes and emotes in matching order, and by provider. */
    private static final class Picked {
        final String[] codes;
        final Object[] emotes;
        final List<List<Object>> byProvider;

        Picked(String[] codes, Object[] emotes, List<List<Object>> byProvider) {
            this.codes = codes;
            this.emotes = emotes;
            this.byProvider = byProvider;
        }
    }

    private static Object enumValue(Class type, String name) {
        return Enum.valueOf(type, name);
    }

    private static final class Union {
        final Set stock;
        final Resolved resolved;
        final Class<?> ownerClass;
        final Set result;

        Union(Set stock, Resolved resolved, Class<?> ownerClass, Set result) {
            this.stock = stock;
            this.resolved = resolved;
            this.ownerClass = ownerClass;
            this.result = result;
        }
    }

    /** Twitch's set followed by ours, without copying Twitch's (it is only iterated). */
    private static final class UnionSet extends AbstractSet<Object> {
        private final Set<?> first;
        private final Object[] rest;

        UnionSet(Set<?> first, Object[] rest) {
            this.first = first;
            this.rest = rest;
        }

        @Override
        public Iterator<Object> iterator() {
            Iterator<?> head = first.iterator();
            return new Iterator<Object>() {
                private int index;

                @Override
                public boolean hasNext() {
                    return head.hasNext() || index < rest.length;
                }

                @Override
                public Object next() {
                    if (head.hasNext()) return head.next();
                    if (index < rest.length) return rest[index++];
                    throw new NoSuchElementException();
                }
            };
        }

        @Override
        public int size() {
            return first.size() + rest.length;
        }
    }

    private static final class TokenTypes {
        final Class<?> text;
        final Method getText;
        final Method getFlags;
        final Constructor<?> newText;
        final Constructor<?> newEmote;

        TokenTypes(Class<?> text, Method getText, Method getFlags, Constructor<?> newText, Constructor<?> newEmote) {
            this.text = text;
            this.getText = getText;
            this.getFlags = getFlags;
            this.newText = newText;
            this.newEmote = newEmote;
        }
    }
}
