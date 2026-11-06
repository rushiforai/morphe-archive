import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Parcelable;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Version-pinned integration test for Hide chat highlights, Hide player buttons, Hide Home sections,
 * Hide mature content warning and the native Hide Clips Home tabs: the real Twitch 31.8.0 classes
 * from the patched APK, with the production extension, on ART. A switch that is on returns before
 * the original code; a switch that is off reaches the original code, which then fails on the
 * deliberately empty (allocated, never constructed) objects. Most obfuscated names come from the APK's
 * locators, with Twitch 31.7.0's as fallbacks; the ones no patch matches are pinned to Twitch 31.8.0's R8
 * output: the raid highlight j89, notice kinds zs6, callout lambda e8v (presenter m8v, types p8v), the
 * signed-out Home tab source fio and the Following sections p8i, r8i, o8i and q8i.
 */
public final class HighlightsArtProbe {
    private static final Map<String, Boolean> switches = new HashMap<>();
    private static Object unsafe;

    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
    }

    private static void settings() throws Exception {
        SharedPreferences preferences = (SharedPreferences) Proxy.newProxyInstance(
            SharedPreferences.class.getClassLoader(), new Class<?>[]{SharedPreferences.class},
            (proxy, method, values) -> {
                if (method.getName().equals("getBoolean")) return switches.getOrDefault((String) values[0], (Boolean) values[1]);
                throw new UnsupportedOperationException(method.getName());
            });
        Context context = new ContextWrapper(null) {
            @Override public Context getApplicationContext() { return this; }
            @Override public SharedPreferences getSharedPreferences(String name, int mode) { return preferences; }
        };
        Field field = Class.forName("io.github.jordanwoodson.extension.shared.settings.Settings").getDeclaredField("context");
        field.setAccessible(true);
        field.set(null, context);
    }

    private static Object allocate(String name) throws Exception {
        if (unsafe == null) {
            Field field = Class.forName("sun.misc.Unsafe").getDeclaredField("theUnsafe");
            field.setAccessible(true);
            unsafe = field.get(null);
        }
        return unsafe.getClass().getMethod("allocateInstance", Class.class).invoke(unsafe, Class.forName(name));
    }

    private static void set(Object target, Class<?> owner, String name, Object value) throws Exception {
        Field field = owner.getDeclaredField(name);
        field.setAccessible(true);
        field.set(target, value);
    }

    private static Object get(Object target, String name) throws Exception {
        Field field = target.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(target);
    }

    /** Runs a real method: true if it returned, false if it failed inside the original code. */
    private static boolean returns(Method method, Object target, Object... arguments) throws Exception {
        try {
            method.invoke(target, arguments);
            return true;
        } catch (InvocationTargetException failure) {
            if (failure.getCause() instanceof NullPointerException) return false;
            throw failure;
        }
    }

    private static Method method(String owner, String name) throws Exception {
        for (Method method : Class.forName(owner).getDeclaredMethods()) {
            if (method.getName().equals(name)) {
                method.setAccessible(true);
                return method;
            }
        }
        throw new AssertionError("No " + owner + "." + name);
    }

    private static Object staticOfOwnType(String name) throws Exception {
        Class<?> type = Class.forName(name);
        for (Field field : type.getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) && field.getType() == type) {
                field.setAccessible(true);
                return field.get(null);
            }
        }
        throw new AssertionError("No constant in " + name);
    }

    private static Object construct(String name, boolean flag) throws Exception {
        Constructor<?> constructor = Class.forName(name).getDeclaredConstructors()[0];
        Class<?>[] types = constructor.getParameterTypes();
        Object[] arguments = new Object[types.length];
        for (int index = 0; index < types.length; index++) {
            if (types[index] == boolean.class) arguments[index] = flag;
            else if (types[index] == List.class) arguments[index] = Collections.emptyList();
            else if (types[index].getName().length() <= 4 && !types[index].isInterface()) {
                try { arguments[index] = staticOfOwnType(types[index].getName()); } catch (AssertionError none) { }
            }
        }
        constructor.setAccessible(true);
        return constructor.newInstance(arguments);
    }

    private static boolean flag(Object state, String field) throws Exception {
        return (Boolean) get(state, field);
    }

    private static void highlights() throws Exception {
        // Community highlight dispatch: Add events by type id.
        Method dispatch = method(ProbeLocators.type("twitch.match.highlight_presenter", "k89"),
            ProbeLocators.method("twitch.hide_chat_highlights.dispatch", "M2"));
        Object presenter = allocate(ProbeLocators.type("twitch.match.highlight_presenter", "k89"));
        // A highlight's type is a subclass of one base that holds its id; only the id decides. The raid (kept)
        // is Twitch's own instance; its class isn't one the patches match.
        Class<?> typeBase = Class.forName(ProbeLocators.type("twitch.hide_chat_highlights.highlight_id", "m99"));
        String idField = ProbeLocators.field("twitch.hide_chat_highlights.highlight_id", "a");
        Object hypeTrain = Class.forName(ProbeLocators.type("twitch.match.hype_train_highlight_type", "z89")).getDeclaredConstructors()[0].newInstance(3, null, null);
        Object raid = Class.forName("j89").getField("c").get(null);
        Object gift = allocate(ProbeLocators.type("twitch.match.hype_train_highlight_type", "z89"));
        set(gift, typeBase, idField, "gift_sub");
        String modelType = ProbeLocators.fieldType("twitch.hide_chat_highlights.highlight_model", "fa9");
        for (boolean enabled : new boolean[]{true, false}) {
            switches.put("hide_hype_train", enabled);
            switches.put("hide_sub_notices", enabled);
            for (Object type : new Object[]{hypeTrain, gift, raid}) {
                Object model = allocate(modelType);
                set(model, Class.forName(modelType), ProbeLocators.field("twitch.hide_chat_highlights.highlight_type", "b"), type);
                Object add = Class.forName(ProbeLocators.type("twitch.match.add_highlight", "n99")).getConstructors()[0].newInstance(model);
                boolean hidden = enabled && type != raid;
                check(returns(dispatch, presenter, add) == hidden, "Highlight " + type.getClass().getName() + " enabled=" + enabled);
            }
        }

        // Chat notice lines: subscription kinds, gift notices, watch streaks; charity always stays.
        Method notice = method(ProbeLocators.type("twitch.match.chat_notice_line", "ci6"),
            ProbeLocators.method("twitch.match.chat_notice_line", "c"));
        Object mapper = allocate(ProbeLocators.type("twitch.match.chat_notice_line", "ci6"));
        Class<?> kinds = Class.forName("zs6");
        for (boolean enabled : new boolean[]{true, false}) {
            switches.put("hide_sub_notices", enabled);
            switches.put("hide_watch_streaks", enabled);
            for (String kind : new String[]{"Sub", "Resub", "SubGift", "SubMassGift", "ExtendSub", "Charity"}) {
                Object subscription = allocate(ProbeLocators.type("twitch.match.subscription_notice", "lt6"));
                set(subscription, subscription.getClass(), "h", kinds.getField(kind).get(null));
                Object event = allocate(ProbeLocators.type("twitch.match.subscription_notice_event", "th6"));
                set(event, event.getClass(), "c", subscription);
                boolean hidden = enabled && !kind.equals("Charity");
                if (hidden) check(notice.invoke(mapper, event, null) == null, "Hidden " + kind + " notice produced a line");
                else check(!returns(notice, mapper, event, null), kind + " notice skipped the original mapper");
            }
            for (String type : new String[]{ProbeLocators.type("twitch.match.gift_sub_match_notice_event", "lh6"), ProbeLocators.type("twitch.match.reward_gift_notice_event", "sh6"), ProbeLocators.type("twitch.match.viewer_milestone_notice_event", "vh6")}) {
                if (enabled) check(notice.invoke(mapper, allocate(type), null) == null, "Hidden " + type + " produced a line");
                else check(!returns(notice, mapper, allocate(type), null), type + " skipped the original mapper");
            }
        }

        // Private pop-ups: watch streak and Hype Train rewards; others stay.
        Constructor<?> lambda = Class.forName("e8v").getDeclaredConstructors()[0];
        lambda.setAccessible(true);
        Object callout = lambda.newInstance(allocate("m8v"), 0);
        Method invoke = Class.forName("e8v").getMethod("invoke", Object.class);
        Class<?> calloutTypes = Class.forName("p8v");
        for (boolean enabled : new boolean[]{true, false}) {
            switches.put("hide_watch_streaks", enabled);
            switches.put("hide_hype_train", enabled);
            for (String type : new String[]{"WATCH_STREAK_REACHED", "HYPE_TRAIN_REWARD", "MOD_VIEW_AVAILABLE"}) {
                Object model = allocate(ProbeLocators.type("twitch.match.private_callout_model", "c7v"));
                set(model, model.getClass(), "e", calloutTypes.getField(type).get(null));
                boolean hidden = enabled && !type.equals("MOD_VIEW_AVAILABLE");
                check(returns(invoke, callout, model) == hidden, "Callout " + type + " enabled=" + enabled);
            }
        }

        // Real state constructors.
        for (boolean enabled : new boolean[]{true, false}) {
            switches.put("hide_leaderboards", enabled);
            switches.put("hide_pinned_cheers", enabled);
            switches.put("hide_celebrations", enabled);
            switches.put("hide_tipping", enabled);
            Object leaderboard = construct(ProbeLocators.type("twitch.match.leaderboard_settings", "i85"), true);
            check(flag(leaderboard, "b") == !enabled && flag(leaderboard, "c") == !enabled &&
                flag(leaderboard, "d") == !enabled && flag(leaderboard, "f") == !enabled, "Leaderboard settings enabled=" + enabled);
            check(flag(construct(ProbeLocators.type("twitch.match.paid_pinned_chat_loaded", "g2t"), true), "a") == !enabled, "Pinned cheers enabled=" + enabled);
            Object celebration = construct(ProbeLocators.type("twitch.match.celebration_enable_event", "tv4"), true);
            check(flag(celebration, "a") == !enabled && flag(celebration, "b") == true, "Celebrations enabled=" + enabled);
            Object unchanged = construct(ProbeLocators.type("twitch.match.celebration_enable_event", "tv4"), false);
            check(!flag(unchanged, "a") && flag(unchanged, "b") == enabled, "Celebration update enabled=" + enabled);
            Object input = construct(ProbeLocators.type("twitch.match.message_input_config", "k86"), true);
            check(flag(input, "a") && flag(input, "b") == !enabled && flag(input, "c"), "Chat input Bits picker enabled=" + enabled);
        }
        for (boolean enabled : new boolean[]{true, false}) {
            switches.put("hide_clip_button", enabled);
            switches.put("hide_share_button", enabled);
            Object clip = construct(ProbeLocators.type("twitch.match.clip_button_state", "zua"), true);
            check(flag(clip, "a") == !enabled && flag(clip, "b"), "Clip button state enabled=" + enabled);
            Object overlay = construct(ProbeLocators.type("twitch.match.player_overlay_options", "o3u"), true);
            check(flag(overlay, "a") == !enabled && flag(overlay, "b") == !enabled && flag(overlay, "d") && flag(overlay, "e"),
                "Player overlay options enabled=" + enabled);
        }

        // Mature content: every label counts as acknowledged only while the switch is on.
        Method acknowledged = Class.forName(ProbeLocators.type("twitch.match.mature_label_acknowledged", "azo"))
            .getMethod(ProbeLocators.method("twitch.match.mature_label_acknowledged", "p"), String.class);
        Object labels = allocate(ProbeLocators.type("twitch.match.mature_label_acknowledged", "azo"));
        switches.put("hide_mature_warning", true);
        check((Boolean) acknowledged.invoke(labels, "MatureGame"), "Mature label not acknowledged");
        switches.put("hide_mature_warning", false);
        check(!returns(acknowledged, labels, "MatureGame"), "Mature check skipped the original code");
    }

    public static final class Fragment {
        private final Bundle arguments;
        Fragment(Bundle arguments) { this.arguments = arguments; }
        public Bundle getArguments() { return arguments; }
    }

    private static void home() throws Exception {
        Class<?> pageType = Class.forName("tv.twitch.android.models.feed.DiscoveryFeedPage$FeedLocationPage");
        Class<?> location = Class.forName("tv.twitch.android.models.feed.FeedLocation");
        Constructor<?> page = pageType.getConstructor(location);
        Object live = page.newInstance(Class.forName("tv.twitch.android.models.feed.FeedLocation$Live").getField("INSTANCE").get(null));
        Object clips = page.newInstance(Class.forName("tv.twitch.android.models.feed.FeedLocation$Clips").getField("INSTANCE").get(null));
        Object signedOut = Class.forName("fio").getField("a").get(null);
        List<?> stock = (List<?>) Class.forName(ProbeLocators.type("twitch.hide_clips.home_tabs", "lih"))
            .getMethod(ProbeLocators.method("twitch.hide_clips.home_tabs", "b"), boolean.class).invoke(signedOut, false);
        check(stock.equals(Arrays.asList(live, clips)), "Unexpected signed-out Home tabs " + stock);
        Method filter = Class.forName("io.github.jordanwoodson.extension.shared.twitch.TwitchInterface")
            .getMethod("homeTabs", List.class, Object.class);
        Bundle onLive = new Bundle();
        onLive.putParcelable("DiscoveryFeedPage", (Parcelable) live);
        Bundle onClips = new Bundle();
        onClips.putParcelable("DiscoveryFeedPage", (Parcelable) clips);
        for (boolean enabled : new boolean[]{true, false}) {
            switches.put("hide_clips", enabled);
            List<?> expected = enabled ? Collections.singletonList(live) : stock;
            check(filter.invoke(null, stock, live).equals(expected), "Home tabs for Live enabled=" + enabled);
            check(filter.invoke(null, stock, new Fragment(onLive)).equals(expected), "Pager tabs for Live enabled=" + enabled);
            check(filter.invoke(null, stock, Collections.singletonList(live)).equals(expected), "Rebuilt tabs enabled=" + enabled);
            check(filter.invoke(null, stock, clips) == stock, "Clip link lost its Clips tab");
            check(filter.invoke(null, stock, new Fragment(onClips)) == stock, "Clip link pager lost its Clips tab");
            check(filter.invoke(null, stock, stock) == stock, "Rebuild dropped an open Clips tab");
            if (!enabled) check(filter.invoke(null, stock, live) == stock, "Disabled filter must keep the list");
        }

        Method sections = Class.forName("io.github.jordanwoodson.extension.shared.twitch.TwitchHighlights")
            .getMethod("followingSections", List.class);
        List<Object> all = new ArrayList<>();
        for (String type : new String[]{"p8i", "r8i", ProbeLocators.type("twitch.match.resume_watching_section", "gai"), "o8i", "q8i"}) all.add(allocate(type));
        for (boolean enabled : new boolean[]{true, false}) {
            switches.put("hide_home_continue_watching", enabled);
            switches.put("hide_home_offline_channels", enabled);
            switches.put("hide_home_recommended", enabled);
            List<?> shown = (List<?>) sections.invoke(null, all);
            check(enabled ? shown.equals(Arrays.asList(all.get(0), all.get(3))) : shown == all, "Following sections enabled=" + enabled);
        }
        switches.put("hide_home_continue_watching", true);
        switches.put("hide_home_offline_channels", false);
        switches.put("hide_home_recommended", false);
        check(((List<?>) sections.invoke(null, all)).size() == 4, "Continue watching alone");
    }

    public static void main(String[] args) throws Exception {
        if (args.length > 0) ProbeLocators.load(args[0]);
        System.out.println(ProbeLocators.loaded() ? "names from the APK's locators" : "no locators in the APK: 31.7.0 names");
        settings();
        highlights();
        home();
        System.out.println("PASS: real ART highlight dispatch, chat notices, callouts, state constructors, mature check, Home tabs and Following sections, on and off");
    }
}
