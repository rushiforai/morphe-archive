import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Third-party emotes in the emote picker and autocomplete, on ART with the real Twitch classes. Signed out,
 * Twitch shows "Login to Chat" instead of the chat input, so neither can be opened in the app; this calls
 * the code behind them instead:
 *
 * <ul>
 *   <li>the picker presenter's function that turns the user's emote sets into sections (the hooked Function3
 *   case), which with the switch on must build a section per service, headed by the service's name, holding
 *   the channel's and the global emotes as picker items, and with it off nothing of Lurk's;</li>
 *   <li>the chat input's autocomplete filter over Twitch's emote source, which must list the services' emotes
 *   for a prefix in Twitch's order, without codes Twitch already has, and nothing for other sources.</li>
 * </ul>
 *
 * The emote lists are put in Lurk's cache as if the services had answered, so nothing is fetched.
 * Obfuscated names come from the APK's locators (31.7.0 names as the fallback).
 */
public final class EmotePickerArtProbe {
    private static final Map<String, Object> settings = new HashMap<>();
    private static final String EMOTES = "io.github.jordanwoodson.extension.shared.twitch.TwitchEmotes";
    private static final int CHANNEL = 12345;
    private static Object unsafe;
    private static int failures;

    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }

    private static void install() throws Exception {
        SharedPreferences preferences = (SharedPreferences) Proxy.newProxyInstance(
            SharedPreferences.class.getClassLoader(), new Class<?>[]{SharedPreferences.class},
            (proxy, method, values) -> {
                Object value = settings.getOrDefault((String) values[0], values[1]);
                if (method.getName().equals("getBoolean") || method.getName().equals("getString")) return value;
                throw new UnsupportedOperationException(method.getName());
            });
        Context context = new ContextWrapper(null) {
            @Override public Context getApplicationContext() { return this; }
            @Override public SharedPreferences getSharedPreferences(String name, int mode) { return preferences; }
        };
        Field field = Class.forName("io.github.jordanwoodson.extension.shared.settings.Settings").getDeclaredField("context");
        field.setAccessible(true);
        field.set(null, context);
        Field theUnsafe = Class.forName("sun.misc.Unsafe").getDeclaredField("theUnsafe");
        theUnsafe.setAccessible(true);
        unsafe = theUnsafe.get(null);
    }

    private static Object allocate(Class<?> type) throws Exception {
        return unsafe.getClass().getMethod("allocateInstance", Class.class).invoke(unsafe, type);
    }

    private static Method method(Class<?> owner, String name, Class<?>... types) throws Exception {
        Method method = owner.getDeclaredMethod(name, types);
        method.setAccessible(true);
        return method;
    }

    /** Puts a provider list into Lurk's cache, as a finished request would. [code, id] pairs. */
    private static void cache(String key, String... pairs) throws Exception {
        Class<?> emote = Class.forName(EMOTES + "$Emote");
        // (code, ID, owner): the owner is only shown by Emote and badge info.
        Constructor<?> make = emote.getDeclaredConstructor(String.class, String.class, String.class);
        make.setAccessible(true);
        Object emotes = Array.newInstance(emote, pairs.length / 2);
        for (int i = 0; i < pairs.length; i += 2) Array.set(emotes, i / 2, make.newInstance(pairs[i], pairs[i + 1], null));
        method(Class.forName(EMOTES), "put", String.class, emotes.getClass(), long.class).invoke(null, key, emotes, 3_600_000L);
    }

    private static Object tuid(int id) throws Exception {
        return Class.forName("tv.twitch.android.models.Tuid").getConstructor(int.class).newInstance(id);
    }

    /** Every String field of [value], in declaration order. */
    private static List<String> strings(Object value) throws Exception {
        List<String> out = new ArrayList<>();
        for (Field field : value.getClass().getDeclaredFields()) {
            if (field.getType() != String.class || Modifier.isStatic(field.getModifiers())) continue;
            field.setAccessible(true);
            out.add((String) field.get(value));
        }
        return out;
    }

    private static Object fieldOf(Object target, Class<?> type) throws Exception {
        for (Field field : target.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) || !type.isAssignableFrom(field.getType())) continue;
            field.setAccessible(true);
            return field.get(target);
        }
        throw new AssertionError("No " + type + " in " + target.getClass());
    }

    private static Object fieldNotOf(Object target, Class<?> type) throws Exception {
        for (Field field : target.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) || type.isAssignableFrom(field.getType())) continue;
            field.setAccessible(true);
            return field.get(target);
        }
        throw new AssertionError("Only " + type + " in " + target.getClass());
    }

    // ---------------------------------------------------------------------------------------------
    // Picker

    private static Method sets;
    private static Constructor<?> setsCase;
    private static int pickerCase = -1;
    private static Object presenter;
    private static Object surface;

    private static void pickerSetup() throws Exception {
        Class<?> picker = Class.forName(ProbeLocators.type("twitch.match.emote_picker", "exf"));
        Method section = null;
        String sectionName = ProbeLocators.method("twitch.emote_picker.section", "G2");
        for (Method candidate : picker.getDeclaredMethods()) {
            if (candidate.getName().equals(sectionName) && candidate.getParameterTypes().length == 3) section = candidate;
        }
        check(section != null, "No section builder " + sectionName);
        surface = enumValue(section.getParameterTypes()[2], "Chat");
        // The emote class's asset type decides whether the presenter asks its animation setting.
        Class<?> emote = Class.forName(ProbeLocators.type("twitch.match.client_emote", "lvf"));
        Class<?> assetType = null;
        for (Constructor<?> constructor : emote.getDeclaredConstructors()) {
            if (constructor.getParameterTypes().length == 6) assetType = constructor.getParameterTypes()[3];
        }
        presenter = allocate(picker);
        // Static emotes only ask the animation helper's type check, so an empty helper is enough.
        for (Field field : picker.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers())) continue;
            for (Method candidate : field.getType().getDeclaredMethods()) {
                if (candidate.getReturnType() == boolean.class && candidate.getParameterTypes().length == 1 &&
                    candidate.getParameterTypes()[0] == assetType) {
                    field.setAccessible(true);
                    field.set(presenter, allocate(field.getType()));
                }
            }
        }
        Class<?> lambda = Class.forName(ProbeLocators.type("twitch.match.emote_picker_sets", "y81"));
        sets = lambda.getMethod("invoke", Object.class, Object.class, Object.class);
        setsCase = lambda.getDeclaredConstructor(int.class, Object.class, Object.class, Object.class);
        setsCase.setAccessible(true);
        // R8 merged the presenter's Function3 into a class with a case number; the one that takes the sets
        // answers the arguments with a Pair, every other one fails on them.
        settings.put("emotes_picker", false);
        List<Integer> found = new ArrayList<>();
        for (int i = 0; i < 64; i++) {
            try {
                Object result = sets.invoke(setsCase.newInstance(i, presenter, tuid(CHANNEL), surface),
                    new ArrayList<>(), optional(), optional());
                if (result != null && result.getClass().getName().equals("kotlin.Pair")) found.add(i);
            } catch (InvocationTargetException | RuntimeException e) {
                // Not this case.
            }
        }
        check(found.size() == 1, "Expected one sets case, found " + found);
        pickerCase = found.get(0);
    }

    private static Object enumValue(Class<?> type, String name) {
        for (Object constant : type.getEnumConstants()) {
            if (((Enum<?>) constant).name().equals(name)) return constant;
        }
        throw new AssertionError("No " + name + " in " + type);
    }

    private static Object optional() throws Exception {
        return allocate(Class.forName("tv.twitch.android.util.Optional"));
    }

    /** The presenter's sections for no sets of the user's own: header strings to item IDs. */
    private static Map<String, List<String>> sections() throws Exception {
        Object pair = sets.invoke(setsCase.newInstance(pickerCase, presenter, tuid(CHANNEL), surface),
            new ArrayList<>(), optional(), optional());
        // kotlin.Pair keeps its two values in two fields, first then second (R8 renamed its getters).
        List<Object> values = new ArrayList<>();
        for (Field field : pair.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers())) continue;
            field.setAccessible(true);
            values.add(field.get(pair));
        }
        List<?> sections = (List<?>) values.get(1);
        Map<String, List<String>> out = new LinkedHashMap<>();
        for (Object section : sections) {
            List<?> items = (List<?>) fieldOf(section, List.class);
            Object header = fieldNotOf(section, List.class);
            List<String> ids = new ArrayList<>();
            for (Object item : items) ids.add(strings(item).get(0));
            // The presenter sorts a section's emotes its own way; compare the contents.
            Collections.sort(ids);
            out.put(String.join("|", strings(header).subList(0, 2)), ids);
        }
        return out;
    }

    private static void picker() throws Exception {
        pickerSetup();
        settings.put("emotes_picker", true);
        Map<String, List<String>> on = sections();
        check(on.equals(Map.of(
            "7TV|7TV", List.of("lurk7s_chan1", "lurk7s_dup", "lurk7s_glob1", "lurk7s_peepo"),
            "BetterTTV|BetterTTV", List.of("lurkbs_laugh"))), "Sections with the switch on: " + on);
        settings.put("emotes_picker", false);
        check(sections().isEmpty(), "The switch off must leave the sets alone");
        settings.put("emotes_picker", true);
        settings.put("emotes_7tv", false);
        settings.put("emotes_bttv", false);
        check(sections().isEmpty(), "No section without a service");
        settings.put("emotes_7tv", true);
        settings.put("emotes_bttv", true);
    }

    // ---------------------------------------------------------------------------------------------
    // Autocomplete

    private static Method filter;
    private static Object kv1;
    private static Field current;
    private static Object twitchSource;

    private static void autocompleteSetup() throws Exception {
        Class<?> filterClass = Class.forName(ProbeLocators.type("twitch.match.autocomplete_filter", "iv1"));
        filter = filterClass.getDeclaredMethod("performFiltering", CharSequence.class);
        filter.setAccessible(true);
        Constructor<?> make = filterClass.getDeclaredConstructors()[0];
        Class<?> adapter = make.getParameterTypes()[0];
        kv1 = allocate(adapter);
        Class<?> sourceType = Class.forName(ProbeLocators.type("twitch.match.emote_autocomplete", "foa"));
        for (Field field : adapter.getDeclaredFields()) {
            if (field.getType().isInterface() && field.getType().isAssignableFrom(sourceType)) current = field;
        }
        check(current != null, "No source field in the autocomplete adapter");
        current.setAccessible(true);
        // Twitch's emote source with one emote of its own: its code-to-emote map, and a sort order that is
        // never asked (a group of one isn't sorted).
        twitchSource = allocate(sourceType);
        Field order = sourceType.getDeclaredField(ProbeLocators.field("twitch.emote_picker.autocomplete_order", "d"));
        order.setAccessible(true);
        order.set(twitchSource, allocate(Class.forName(ProbeLocators.type("twitch.emote_picker.autocomplete_order_type", "mr5"))));
        Class<?> emote = Class.forName(ProbeLocators.type("twitch.match.client_emote", "lvf"));
        Constructor<?> emoteInit = null;
        for (Constructor<?> constructor : emote.getDeclaredConstructors()) {
            if (constructor.getParameterTypes().length == 6) emoteInit = constructor;
        }
        Class<?>[] types = emoteInit.getParameterTypes();
        Object own = emoteInit.newInstance("1001", "peepoTwitch", tuid(CHANNEL), enumValue(types[3], "STATIC"),
            Collections.emptyList(), enumValue(types[5], "OTHER"));
        LinkedHashMap<String, Object> byCode = new LinkedHashMap<>();
        byCode.put("peepoTwitch", own);
        Field map = sourceType.getDeclaredField(ProbeLocators.field("twitch.emote_picker.autocomplete_map", "c"));
        map.setAccessible(true);
        map.set(twitchSource, byCode);
        filterInstance = make.newInstance(kv1);
    }

    private static Object filterInstance;

    private static List<String> complete(Object source, String typed) throws Exception {
        current.set(kv1, source);
        Object results = filter.invoke(filterInstance, typed);
        List<?> values = (List<?>) results.getClass().getField("values").get(results);
        List<String> out = new ArrayList<>();
        if (values == null) return out;
        for (Object value : values) {
            if (value instanceof String) {
                out.add((String) value);
            } else {
                String text = value.toString();
                int token = text.indexOf("token=");
                out.add(text.substring(token + 6, text.indexOf(',', token)));
            }
        }
        return out;
    }

    private static void autocomplete() throws Exception {
        autocompleteSetup();
        settings.put("emotes_picker", true);
        List<String> on = complete(twitchSource, ":pe");
        check(on.equals(List.of("peepoTwitch", "peepoClap", "pepeLaugh", "WidepeepoHappy")),
            "Autocomplete with the switch on: " + on);
        check(complete(twitchSource, "pepel").equals(List.of("pepeLaugh")), "Case-insensitive prefix");
        settings.put("emotes_picker", false);
        check(complete(twitchSource, ":pe").equals(List.of("peepoTwitch")), "The switch off must leave Twitch's answer");
        settings.put("emotes_picker", true);
        // Another source (chatters, commands) keeps its own answer.
        Object users = Proxy.newProxyInstance(current.getType().getClassLoader(), new Class<?>[]{current.getType()},
            (proxy, method, values) -> {
                if (method.getReturnType() == ArrayList.class) return new ArrayList<>(List.of("pepega_viewer"));
                if (method.getReturnType() == boolean.class) return false;
                return null;
            });
        check(complete(users, "pe").equals(List.of("pepega_viewer")), "Other sources must keep their answer");
    }

    private interface Section {
        void run() throws Exception;
    }

    private static void section(String name, Section section) {
        try {
            section.run();
            System.out.println("ok   " + name);
        } catch (Throwable failure) {
            Throwable cause = failure instanceof InvocationTargetException ? failure.getCause() : failure;
            System.out.println("FAIL " + name + ": " + cause);
            if (cause != null) cause.printStackTrace(System.out);
            failures++;
        }
        System.out.flush();
    }

    public static void main(String[] args) throws Exception {
        ProbeLocators.load(args[0]);
        System.out.println(ProbeLocators.loaded() ? "names from the APK's locators" : "no locators in the APK: 31.7.0 names");
        install();
        android.os.Looper.prepare();
        settings.put("emotes_7tv", true);
        settings.put("emotes_bttv", true);
        settings.put("emotes_ffz", false);
        String channel = String.valueOf(CHANNEL);
        // 7TV: the channel's set, then global. "peepoTwitch" is also Twitch's own code in the autocomplete.
        cache("7:" + channel, "chanEmote", "lurk7s_chan1", "peepoClap", "lurk7s_peepo", "peepoTwitch", "lurk7s_dup");
        cache("7:global", "WidepeepoHappy", "lurk7s_glob1");
        cache("b:" + channel, "pepeLaugh", "lurkbs_laugh");
        cache("b:global");
        // The channel whose chat connected, as the chat connect hook reports it.
        Class.forName(EMOTES).getMethod("onChatChannel", Object.class).invoke(null, tuid(CHANNEL));
        section("emote picker: a section per service from Twitch's presenter", EmotePickerArtProbe::picker);
        section("autocomplete: Twitch's emote source lists the services' emotes", EmotePickerArtProbe::autocomplete);
        if (failures > 0) {
            System.out.println("FAILED: " + failures + " section(s)");
            System.exit(1);
        }
        System.out.println("PASS: emote picker and autocomplete with the switch on and off");
    }
}
