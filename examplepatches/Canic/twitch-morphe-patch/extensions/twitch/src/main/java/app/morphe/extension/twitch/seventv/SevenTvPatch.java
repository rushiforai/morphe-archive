package app.morphe.extension.twitch.seventv;

import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Runtime side of the 7TV chat, picker, autocomplete and zero-width patch. */
@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class SevenTvPatch {
    private static final String GLOBAL_SET_URL = "https://7tv.io/v3/emote-sets/global";
    private static final String CHANNEL_URL = "https://7tv.io/v3/users/twitch/";
    private static final String PERSONAL_URL = "https://7tv.io/v4/gql";
    private static final String TWITCH_EMOTE_URL_MARKER = "/emoticons/v2/";
    private static final String ID_PREFIX = "7TV-";
    private static final String ZERO_WIDTH_PREFIX = "7TV-ZW-";
    private static final Pattern TOKEN_PARTS = Pattern.compile("\\s+|\\S+");
    private static final ExecutorService NETWORK = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "morphe-7tv-loader");
        thread.setDaemon(true);
        return thread;
    });
    private static final Set<String> LOADING = ConcurrentHashMap.newKeySet();
    private static final Map<String, Map<String, Emote>> CHANNEL_EMOTES = new ConcurrentHashMap<>();
    private static final Map<String, Emote> EMOTES_BY_SYNTHETIC_ID = new ConcurrentHashMap<>();
    private static final Object MISSING_AUTOCOMPLETE_VALUE = new Object();
    private static final Map<String, Object> AUTOCOMPLETE_ORIGINALS = new HashMap<>();

    private static volatile Map<String, Emote> globalEmotes = Collections.emptyMap();
    private static volatile Map<String, Emote> personalEmotes = Collections.emptyMap();
    private static volatile boolean globalLoaded;
    private static volatile String currentChannelId = "";
    private static volatile String currentUserId = "";
    private static volatile WeakReference<Object> pickerOwner = new WeakReference<>(null);
    private static volatile List pickerBaseSections = Collections.emptyList();
    private static volatile WeakReference<Object> autocompleteProvider = new WeakReference<>(null);

    private SevenTvPatch() {}

    public static void transformLegacyMessage(String channelId, Object messageInfo) {
        try {
            currentChannelId = channelId;
            ensureLoaded(channelId);
            Field tokensField = messageInfo.getClass().getDeclaredField("e");
            tokensField.setAccessible(true);
            List original = (List) tokensField.get(messageInfo);
            List transformed = transformTokens(original, channelId, "kbn", "hbn");
            replaceList(tokensField, messageInfo, original, transformed);
        } catch (Throwable ignored) {}
    }

    public static void transformPublicMessage(int channelId, Object message) {
        String channel = Integer.toString(channelId);
        try {
            currentChannelId = channel;
            ensureLoaded(channel);
            Method getter = message.getClass().getMethod("getTokens");
            List original = (List) getter.invoke(message);
            List transformed = transformTokens(original, channel,
                "tv.twitch.android.shared.chat.pub.messages.data.MessageToken$TextToken",
                "tv.twitch.android.shared.chat.pub.messages.data.MessageToken$EmoticonToken");
            if (original != transformed) {
                original.clear();
                original.addAll(transformed);
            }
        } catch (Throwable ignored) {}
    }

    private static List transformTokens(List original, String channelId, String textClassName, String emoteClassName)
        throws Exception {
        Map<String, Emote> personal = personalEmotes;
        Map<String, Emote> channel = CHANNEL_EMOTES.getOrDefault(channelId, Collections.emptyMap());
        Map<String, Emote> global = globalEmotes;
        if (original == null || original.isEmpty() || (personal.isEmpty() && channel.isEmpty() && global.isEmpty())) return original;

        ClassLoader loader = original.get(0).getClass().getClassLoader();
        Class<?> textClass = Class.forName(textClassName, false, loader);
        Constructor<?> emoteConstructor = Class.forName(emoteClassName, false, loader)
            .getConstructor(String.class, String.class);
        ArrayList result = new ArrayList(original.size());
        boolean changed = false;
        boolean previousWasEmote = false;
        for (Object token : original) {
            if (!textClass.isInstance(token)) {
                result.add(token);
                previousWasEmote = isEmoteToken(token);
                continue;
            }
            String text = readText(token, !textClassName.contains("."));
            Matcher matcher = TOKEN_PARTS.matcher(text);
            while (matcher.find()) {
                String part = matcher.group();
                Emote emote = personal.get(part);
                if (emote == null) emote = channel.get(part);
                if (emote == null) emote = global.get(part);
                if (emote == null) {
                    result.add(copyTextToken(token, part, !textClassName.contains(".")));
                    if (!part.trim().isEmpty()) previousWasEmote = false;
                    continue;
                }
                boolean overlay = emote.zeroWidth && previousWasEmote && removeTrailingWhitespace(result);
                String syntheticId = syntheticId(emote, overlay);
                EMOTES_BY_SYNTHETIC_ID.put(syntheticId, emote);
                result.add(emoteConstructor.newInstance(part, syntheticId));
                changed = true;
                previousWasEmote = true;
            }
        }
        return changed ? result : original;
    }

    private static boolean removeTrailingWhitespace(ArrayList result) {
        if (result.isEmpty()) return true;
        Object separator = result.get(result.size() - 1);
        try {
            String value = readText(separator, !separator.getClass().getName().contains("."));
            if (!value.trim().isEmpty()) return false;
            result.remove(result.size() - 1);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void replaceList(Field field, Object owner, List original, List transformed) throws Exception {
        if (original == transformed) return;
        try {
            original.clear();
            original.addAll(transformed);
        } catch (UnsupportedOperationException ignored) {
            field.set(owner, transformed);
        }
    }

    private static boolean isEmoteToken(Object token) {
        if (token == null) return false;
        String name = token.getClass().getName();
        return name.equals("ibn") || name.equals("hbn")
            || name.endsWith("MessageToken$GifToken") || name.endsWith("MessageToken$EmoticonToken");
    }

    private static String readText(Object token, boolean legacy) throws Exception {
        if (!legacy) return (String) token.getClass().getMethod("getText").invoke(token);
        return (String) token.getClass().getField("a").get(token);
    }

    private static Object copyTextToken(Object token, String text, boolean legacy) throws Exception {
        if (!legacy) {
            Object flags = token.getClass().getMethod("getFlags").invoke(token);
            return token.getClass().getConstructor(String.class, flags.getClass()).newInstance(text, flags);
        }
        Object flags = token.getClass().getField("b").get(token);
        return token.getClass().getConstructor(String.class, flags.getClass()).newInstance(text, flags);
    }

    /** Replaces Twitch's CDN result while preserving its animation-setting enum. */
    public static Object replaceEmoteUrl(Object original) {
        if (original == null) return null;
        try {
            String originalUrl = (String) original.getClass().getField("a").get(original);
            int idStart = originalUrl.indexOf(TWITCH_EMOTE_URL_MARKER);
            if (idStart < 0) return original;
            idStart += TWITCH_EMOTE_URL_MARKER.length();
            int idEnd = originalUrl.indexOf('/', idStart);
            if (idEnd < 0) return original;
            Emote emote = EMOTES_BY_SYNTHETIC_ID.get(originalUrl.substring(idStart, idEnd));
            if (emote == null) return original;
            Field setting = original.getClass().getField("b");
            return original.getClass().getConstructor(String.class, setting.getType())
                .newInstance(emote.url, setting.get(original));
        } catch (Throwable ignored) {
            return original;
        }
    }

    public static boolean isZeroWidthSpan(Object span) {
        return zeroWidthSpan(span);
    }

    public static float adjustZeroWidthX(Object span, float originalX) {
        try {
            if (!zeroWidthSpan(span)) return originalX;
            Drawable drawable = (Drawable) span.getClass().getMethod("getDrawable").invoke(span);
            return originalX - drawable.getBounds().width();
        } catch (Throwable ignored) {
            return originalX;
        }
    }

    private static boolean zeroWidthSpan(Object span) {
        try {
            Object drawable = span.getClass().getMethod("getDrawable").invoke(span);
            Field url = drawable.getClass().getDeclaredField("a");
            url.setAccessible(true);
            String value = (String) url.get(drawable);
            for (Map.Entry<String, Emote> entry : EMOTES_BY_SYNTHETIC_ID.entrySet()) {
                if (entry.getKey().startsWith(ZERO_WIDTH_PREFIX) && entry.getValue().url.equals(value)) return true;
            }
        } catch (Throwable ignored) {}
        return false;
    }

    public static void setCurrentUserId(int userId) {
        String id = userId <= 0 ? "" : Integer.toString(userId);
        if (id.equals(currentUserId)) return;
        currentUserId = id;
        personalEmotes = Collections.emptyMap();
        if (!id.isEmpty()) loadPersonalEmotes(id);
        refreshConsumers();
    }

    public static void configurePicker(Object fragment) {
        try {
            Bundle arguments = (Bundle) fragment.getClass().getMethod("requireArguments").invoke(fragment);
            Object channel = arguments.getParcelable("EmotePickerFragment_args");
            if (channel != null) {
                currentChannelId = Integer.toString((Integer) channel.getClass().getMethod("getId").invoke(channel));
                ensureLoaded(currentChannelId);
            }
        } catch (Throwable ignored) {}
    }

    public static List augmentPickerSections(Object owner, List sections) {
        try {
            pickerOwner = new WeakReference<>(owner);
            ArrayList base = new ArrayList();
            for (Object section : sections) if (!isSevenTvSection(section)) base.add(section);
            pickerBaseSections = base;
            ArrayList result = new ArrayList(base);
            ClassLoader loader = owner.getClass().getClassLoader();
            addPickerSection(result, loader, "7TV Personal", personalEmotes);
            addPickerSection(result, loader, "7TV Channel", CHANNEL_EMOTES.getOrDefault(currentChannelId, Collections.emptyMap()));
            addPickerSection(result, loader, "7TV Global", globalEmotes);
            return result;
        } catch (Throwable ignored) {
            return sections;
        }
    }

    private static boolean isSevenTvSection(Object section) {
        try {
            Object header = section.getClass().getField("a").get(section);
            if (!header.getClass().getName().equals("iie")) return false;
            Object displayName = header.getClass().getField("d").get(header);
            return displayName instanceof String && ((String) displayName).startsWith("7TV ");
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void addPickerSection(List target, ClassLoader loader, String title, Map<String, Emote> emotes) throws Exception {
        if (emotes.isEmpty()) return;
        Class<?> rie = Class.forName("rie", false, loader);
        Class<?> uie = Class.forName("uie", false, loader);
        Class<?> lie = Class.forName("lie", false, loader);
        Class<?> qie = Class.forName("qie", false, loader);
        Class<?> nie = Class.forName("nie", false, loader);
        Class<?> cau = Class.forName("cau", false, loader);
        Constructor<?> oieCtor = Class.forName("oie", false, loader)
            .getConstructor(String.class, String.class, rie, uie);
        Constructor<?> nieCtor = nie.getConstructor(String.class, String.class, boolean.class);
        Constructor<?> kr6Ctor = Class.forName("kr6", false, loader)
            .getConstructor(qie, nie, Class.forName("oke", false, loader), List.class);
        Constructor<?> bneCtor = Class.forName("bne", false, loader)
            .getConstructor(String.class, cau, rie, lie);
        Object other = enumValue(uie, "OTHER");
        ArrayList models = new ArrayList();
        ArrayList<String> names = new ArrayList<>(emotes.keySet());
        names.sort(String.CASE_INSENSITIVE_ORDER);
        for (String name : names) {
            Emote emote = emotes.get(name);
            String id = syntheticId(emote, false);
            EMOTES_BY_SYNTHETIC_ID.put(id, emote);
            Object asset = enumValue(rie, emote.animated ? "ANIMATED" : "STATIC");
            Object descriptor = enumValue(lie, emote.animated ? "ANIMATED" : "NONE");
            Object item = oieCtor.newInstance(id, name, asset, other);
            Object input = nieCtor.newInstance(name, id, false);
            Object clicked = kr6Ctor.newInstance(item, input, null, Collections.emptyList());
            models.add(bneCtor.newInstance(id, clicked, asset, descriptor));
        }
        Object header = Class.forName("iie", false, loader)
            .getConstructor(String.class, String.class, String.class, boolean.class)
            .newInstance(null, title, null, false);
        Object section = Class.forName("cne", false, loader)
            .getConstructor(Class.forName("kie", false, loader), List.class)
            .newInstance(header, models);
        target.add(section);
    }

    private static Object enumValue(Class<?> type, String name) throws Exception {
        return type.getMethod("valueOf", String.class).invoke(null, name);
    }

    public static void registerAutoCompleteProvider(Object provider) {
        Object previous = autocompleteProvider.get();
        if (previous != provider) AUTOCOMPLETE_ORIGINALS.clear();
        autocompleteProvider = new WeakReference<>(provider);
        updateAutocomplete();
    }

    public static boolean shouldOpenAutocomplete(CharSequence text) {
        if (text == null) return false;
        String value = text.toString();
        int start = Math.max(value.lastIndexOf(' '), value.lastIndexOf('\n')) + 1;
        String token = value.substring(start);
        return token.length() >= 2 && token.charAt(0) != '@';
    }

    public static int getBareAutocompleteStart(CharSequence text) {
        if (!shouldOpenAutocomplete(text)) return -1;
        String value = text.toString();
        int start = Math.max(value.lastIndexOf(' '), value.lastIndexOf('\n')) + 1;
        return start < value.length() && value.charAt(start) == ':' ? start + 1 : start;
    }

    private static void updateAutocomplete() {
        Object provider = autocompleteProvider.get();
        if (provider == null) return;
        try {
            Map map = null;
            for (Field field : provider.getClass().getFields()) {
                Object candidate = field.get(provider);
                if (candidate instanceof LinkedHashMap) { map = (Map) candidate; break; }
            }
            if (map == null) return;
            ClassLoader loader = provider.getClass().getClassLoader();
            Class<?> rie = Class.forName("rie", false, loader);
            Class<?> uie = Class.forName("uie", false, loader);
            Constructor<?> ctor = Class.forName("oie", false, loader)
                .getConstructor(String.class, String.class, rie, uie);
            Object other = enumValue(uie, "OTHER");

            // Restore native entries replaced during the previous refresh before rebuilding the 7TV set.
            for (Map.Entry<String, Object> entry : AUTOCOMPLETE_ORIGINALS.entrySet()) {
                if (entry.getValue() == MISSING_AUTOCOMPLETE_VALUE) map.remove(entry.getKey());
                else map.put(entry.getKey(), entry.getValue());
            }
            AUTOCOMPLETE_ORIGINALS.clear();

            // Populate the complete set. Twitch's filter already limits the visible dropdown to ten rows.
            Map<String, Emote> merged = mergedEmotes();
            for (Map.Entry<String, Emote> entry : merged.entrySet()) {
                String name = entry.getKey();
                Emote emote = entry.getValue();
                String id = syntheticId(emote, false);
                EMOTES_BY_SYNTHETIC_ID.put(id, emote);
                AUTOCOMPLETE_ORIGINALS.put(name,
                    map.containsKey(name) ? map.get(name) : MISSING_AUTOCOMPLETE_VALUE);
                Object asset = enumValue(rie, emote.animated ? "ANIMATED" : "STATIC");
                map.put(name, ctor.newInstance(id, name, asset, other));
            }
        } catch (Throwable ignored) {}
    }

    private static Map<String, Emote> mergedEmotes() {
        HashMap<String, Emote> merged = new HashMap<>();
        merged.putAll(globalEmotes);
        merged.putAll(CHANNEL_EMOTES.getOrDefault(currentChannelId, Collections.emptyMap()));
        merged.putAll(personalEmotes);
        return merged;
    }

    /** Replaces Twitch's failing GraphQL emote card for synthetic 7TV IDs with local information. */
    public static boolean handleSevenTvEmoteCard(Object fragment) {
        try {
            Bundle arguments = (Bundle) fragment.getClass().getMethod("getArguments").invoke(fragment);
            String syntheticId = arguments == null ? null : arguments.getString("emoteId");
            if (!isSevenTvId(syntheticId)) return false;

            Emote emote = EMOTES_BY_SYNTHETIC_ID.get(syntheticId);
            String rawId = rawSevenTvId(syntheticId);
            String title = emote == null ? "7TV Emote" : nameOf(emote);
            StringBuilder message = new StringBuilder("7TV Emote");
            if (emote != null) {
                message.append("\nBereich: ").append(scopeOf(emote));
                message.append("\nTyp: ").append(emote.animated ? "Animiert" : "Statisch");
                if (emote.zeroWidth) message.append(" · Zero-Width");
            }

            Context context = (Context) fragment.getClass().getMethod("requireContext").invoke(fragment);
            try {
                fragment.getClass().getMethod("dismissAllowingStateLoss").invoke(fragment);
            } catch (Throwable ignored) {}

            AlertDialog.Builder dialog = new AlertDialog.Builder(context)
                .setTitle(title)
                .setMessage(message.toString())
                .setPositiveButton("OK", null);
            if (!rawId.isEmpty()) {
                dialog.setNeutralButton("Auf 7TV öffnen", (ignored, which) -> {
                    try {
                        context.startActivity(new Intent(Intent.ACTION_VIEW,
                            Uri.parse("https://7tv.app/emotes/" + rawId)));
                    } catch (Throwable ignoredFailure) {}
                });
            }
            dialog.show();
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean isSevenTvId(String id) {
        return id != null && (id.startsWith(ID_PREFIX) || id.startsWith(ZERO_WIDTH_PREFIX));
    }

    private static String rawSevenTvId(String id) {
        if (id == null) return "";
        if (id.startsWith(ZERO_WIDTH_PREFIX)) return id.substring(ZERO_WIDTH_PREFIX.length());
        if (id.startsWith(ID_PREFIX)) return id.substring(ID_PREFIX.length());
        return "";
    }

    private static String scopeOf(Emote emote) {
        if (personalEmotes.containsValue(emote)) return "Persönlich";
        if (CHANNEL_EMOTES.getOrDefault(currentChannelId, Collections.emptyMap()).containsValue(emote)) return "Kanal";
        if (globalEmotes.containsValue(emote)) return "Global";
        return "7TV";
    }

    private static String nameOf(Emote emote) {
        for (Map.Entry<String, Emote> entry : personalEmotes.entrySet()) {
            if (entry.getValue() == emote) return entry.getKey();
        }
        for (Map.Entry<String, Emote> entry : CHANNEL_EMOTES
            .getOrDefault(currentChannelId, Collections.emptyMap()).entrySet()) {
            if (entry.getValue() == emote) return entry.getKey();
        }
        for (Map.Entry<String, Emote> entry : globalEmotes.entrySet()) {
            if (entry.getValue() == emote) return entry.getKey();
        }
        return "7TV Emote";
    }

    private static void refreshConsumers() {
        Runnable refresh = () -> {
            updateAutocomplete();
            Object owner = pickerOwner.get();
            if (owner == null) return;
            try { owner.getClass().getMethod("e", List.class).invoke(owner, pickerBaseSections); }
            catch (Throwable ignored) {}
        };
        if (Looper.myLooper() == Looper.getMainLooper()) refresh.run();
        else new Handler(Looper.getMainLooper()).post(refresh);
    }

    public static List<PickerEmote> getEmotes(String prefix) {
        String query = prefix == null ? "" : prefix;
        HashMap<String, PickerEmote> merged = new HashMap<>();
        addPickerEmotes(merged, globalEmotes, "Global", query);
        addPickerEmotes(merged, CHANNEL_EMOTES.getOrDefault(currentChannelId, Collections.emptyMap()), "Channel", query);
        addPickerEmotes(merged, personalEmotes, "Personal", query);
        ArrayList<PickerEmote> result = new ArrayList<>(merged.values());
        result.sort((a, b) -> a.name.compareToIgnoreCase(b.name));
        return result.size() > 100 ? new ArrayList<>(result.subList(0, 100)) : result;
    }

    private static void addPickerEmotes(Map<String, PickerEmote> target, Map<String, Emote> source, String scope, String prefix) {
        for (Map.Entry<String, Emote> entry : source.entrySet()) {
            if (!prefix.isEmpty() && !entry.getKey().regionMatches(true, 0, prefix, 0, prefix.length())) continue;
            Emote emote = entry.getValue();
            target.put(entry.getKey(), new PickerEmote(entry.getKey(), emote.url, scope, emote.zeroWidth));
        }
    }

    private static Emote findEmote(String name) {
        Emote emote = personalEmotes.get(name);
        if (emote == null) emote = CHANNEL_EMOTES.getOrDefault(currentChannelId, Collections.emptyMap()).get(name);
        if (emote == null) emote = globalEmotes.get(name);
        return emote;
    }

    private static String syntheticId(Emote emote, boolean overlay) {
        return (overlay ? ZERO_WIDTH_PREFIX : ID_PREFIX) + emote.id;
    }

    private static void ensureLoaded(String channelId) {
        if (!globalLoaded && LOADING.add("global")) NETWORK.execute(() -> {
            try {
                globalEmotes = loadEmoteSet(new JSONObject(download(GLOBAL_SET_URL)));
                globalLoaded = true;
                refreshConsumers();
            } catch (Throwable ignored) { LOADING.remove("global"); }
        });
        if (channelId == null || channelId.isEmpty() || CHANNEL_EMOTES.containsKey(channelId) || !LOADING.add("channel:" + channelId)) return;
        NETWORK.execute(() -> {
            try {
                JSONObject user = new JSONObject(download(CHANNEL_URL + channelId));
                JSONObject set = user.optJSONObject("emote_set");
                CHANNEL_EMOTES.put(channelId, set == null ? Collections.emptyMap() : loadEmoteSet(set));
                refreshConsumers();
            } catch (Throwable ignored) { LOADING.remove("channel:" + channelId); }
        });
    }

    private static void loadPersonalEmotes(String userId) {
        String key = "personal:" + userId;
        if (!LOADING.add(key)) return;
        NETWORK.execute(() -> {
            try {
                String query = "query($id:String!){users{userByConnection(platform:TWITCH,platformId:$id){personalEmoteSet{emotes(perPage:100){items{alias flags{zeroWidth} emote{id defaultName flags{animated defaultZeroWidth} images{url width mime scale frameCount}}}}}}}}";
                JSONObject body = new JSONObject().put("query", query)
                    .put("variables", new JSONObject().put("id", userId));
                JSONObject response = new JSONObject(postJson(PERSONAL_URL, body.toString()));
                JSONObject user = response.optJSONObject("data");
                if (user != null) user = user.optJSONObject("users");
                if (user != null) user = user.optJSONObject("userByConnection");
                JSONObject set = user == null ? null : user.optJSONObject("personalEmoteSet");
                personalEmotes = set == null ? Collections.emptyMap() : loadPersonalV4(set);
                refreshConsumers();
            } catch (Throwable ignored) { LOADING.remove(key); }
        });
    }

    private static Map<String, Emote> loadEmoteSet(JSONObject set) {
        JSONArray emotes = set.optJSONArray("emotes");
        if (emotes == null) return Collections.emptyMap();
        HashMap<String, Emote> result = new HashMap<>();
        for (int i = 0; i < emotes.length(); i++) {
            JSONObject item = emotes.optJSONObject(i);
            if (item == null) continue;
            JSONObject data = item.optJSONObject("data");
            String name = item.optString("name", "");
            String id = item.optString("id", "");
            String url = selectWebp(data == null ? null : data.optJSONObject("host"));
            boolean animated = data != null && data.optBoolean("animated", false);
            boolean zeroWidth = (item.optInt("flags", 0) & 1) != 0
                || (data != null && (data.optInt("flags", 0) & 256) != 0);
            if (!name.isEmpty() && !id.isEmpty() && url != null) result.put(name, new Emote(id, url, zeroWidth, animated));
        }
        return Collections.unmodifiableMap(result);
    }

    private static Map<String, Emote> loadPersonalV4(JSONObject set) {
        JSONObject connection = set.optJSONObject("emotes");
        JSONArray items = connection == null ? null : connection.optJSONArray("items");
        if (items == null) return Collections.emptyMap();
        HashMap<String, Emote> result = new HashMap<>();
        for (int i = 0; i < items.length(); i++) {
            JSONObject entry = items.optJSONObject(i);
            JSONObject emote = entry == null ? null : entry.optJSONObject("emote");
            if (emote == null) continue;
            String name = entry.optString("alias", emote.optString("defaultName", ""));
            String id = emote.optString("id", "");
            JSONObject flags = emote.optJSONObject("flags");
            JSONObject entryFlags = entry.optJSONObject("flags");
            boolean animated = flags != null && flags.optBoolean("animated", false);
            boolean zeroWidth = (entryFlags != null && entryFlags.optBoolean("zeroWidth", false))
                || (flags != null && flags.optBoolean("defaultZeroWidth", false));
            String url = selectV4Image(emote.optJSONArray("images"));
            if (!name.isEmpty() && !id.isEmpty() && url != null) result.put(name, new Emote(id, url, zeroWidth, animated));
        }
        return Collections.unmodifiableMap(result);
    }

    private static String selectWebp(JSONObject host) {
        if (host == null) return null;
        String base = host.optString("url", "");
        JSONArray files = host.optJSONArray("files");
        if (base.isEmpty() || files == null) return null;
        String selected = null;
        for (int i = 0; i < files.length(); i++) {
            JSONObject file = files.optJSONObject(i);
            if (file == null || !"WEBP".equalsIgnoreCase(file.optString("format"))) continue;
            String name = file.optString("name", "");
            if (selected == null || name.startsWith("2x")) selected = name;
            if (name.startsWith("2x")) break;
        }
        if (selected == null || selected.isEmpty()) return null;
        if (base.startsWith("//")) base = "https:" + base;
        return base + "/" + selected;
    }

    private static String selectV4Image(JSONArray images) {
        if (images == null) return null;
        JSONObject best = null;
        for (int i = 0; i < images.length(); i++) {
            JSONObject image = images.optJSONObject(i);
            if (image == null || !image.optString("mime", "").contains("webp")) continue;
            if (best == null || image.optInt("width", 0) > best.optInt("width", 0)) best = image;
        }
        return best == null ? null : best.optString("url", null);
    }

    private static String download(String address) throws Exception {
        HttpURLConnection connection = open(address);
        try { return read(connection); } finally { connection.disconnect(); }
    }

    private static String postJson(String address, String body) throws Exception {
        HttpURLConnection connection = open(address);
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        connection.setRequestProperty("Content-Type", "application/json");
        try (OutputStream output = connection.getOutputStream()) {
            output.write(body.getBytes(StandardCharsets.UTF_8));
        }
        try { return read(connection); } finally { connection.disconnect(); }
    }

    private static HttpURLConnection open(String address) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(address).openConnection();
        connection.setConnectTimeout(5_000);
        connection.setReadTimeout(8_000);
        connection.setRequestProperty("Accept", "application/json");
        connection.setRequestProperty("User-Agent", "Morphe-7TV/2.0");
        return connection;
    }

    private static String read(HttpURLConnection connection) throws Exception {
        int status = connection.getResponseCode();
        if (status < 200 || status >= 300) throw new IllegalStateException("7TV HTTP " + status);
        try (BufferedInputStream input = new BufferedInputStream(connection.getInputStream());
             ByteArrayOutputStream output = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8_192];
            int count;
            while ((count = input.read(buffer)) != -1) output.write(buffer, 0, count);
            return output.toString(StandardCharsets.UTF_8.name());
        }
    }

    private static final class Emote {
        final String id;
        final String url;
        final boolean zeroWidth;
        final boolean animated;
        Emote(String id, String url, boolean zeroWidth, boolean animated) {
            this.id = id; this.url = url; this.zeroWidth = zeroWidth; this.animated = animated;
        }
    }

    public static final class PickerEmote {
        public final String name;
        public final String url;
        public final String scope;
        public final boolean zeroWidth;
        PickerEmote(String name, String url, String scope, boolean zeroWidth) {
            this.name = name; this.url = url; this.scope = scope; this.zeroWidth = zeroWidth;
        }
        @Override public String toString() { return name + " · " + scope + (zeroWidth ? " · ZW" : ""); }
    }
}
