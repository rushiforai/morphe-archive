import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.os.Bundle;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** Version-pinned integration test: real Twitch enum/constructors and production helper on ART. */
public final class InterfaceArtProbe {
    private static final Map<String, Boolean> switches = new HashMap<>();
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
    private static List<String> names(List<?> values) {
        List<String> names = new ArrayList<>();
        for (Object value : values) names.add(((Enum<?>) value).name());
        return names;
    }
    private static boolean flag(Object state, String field) throws Exception {
        Field member = state.getClass().getDeclaredField(field);
        member.setAccessible(true);
        return member.getBoolean(state);
    }
    private static Object state(String name, boolean stockFlag) throws Exception {
        Constructor<?> constructor = Class.forName(name).getConstructors()[0];
        Class<?>[] types = constructor.getParameterTypes();
        Object[] arguments = new Object[types.length];
        for (int index = 0; index < types.length; index++) {
            if (types[index] == boolean.class) arguments[index] = stockFlag;
            else if (types[index].isEnum()) arguments[index] = types[index].getEnumConstants()[0];
            else if (types[index].getName().equals("fa9")) arguments[index] = Class.forName("ea9").getField("a").get(null);
        }
        return constructor.newInstance(arguments);
    }
    /**
     * The chat header's buttons (issue 45: "Get Bits" and "Gift A Sub" beside the extensions): the real buttons
     * state, built with the given inputs, and Twitch's own mapper from it to the buttons, as its toString
     * ("Visible(buttons=[GiftASubButton, BitsButton], isViewerFollowing=true)" or "Hidden").
     */
    private static String chatHeader(boolean following, String subscription, boolean bits, boolean upgrade) throws Exception {
        // The stock control has no locators, so the fallback is Twitch 32.1.0's name (ax5 in 31.9.0).
        Class<?> stateType = Class.forName(ProbeLocators.type("twitch.match.chat_header_buttons_state", "fv5"));
        Constructor<?> constructor = stateType.getConstructors()[0];
        Class<?>[] types = constructor.getParameterTypes();
        check(types.length == 5 && types[1].isEnum() && types[3] == boolean.class && types[4] == boolean.class,
            "Unexpected chat header buttons state constructor");
        Class<?> notifications = Class.forName("tv.twitch.android.models.NotificationsSettingsState$Never");
        Object never = notifications.getField("INSTANCE").get(null);
        Object tuid = Class.forName("tv.twitch.android.models.Tuid").getConstructor(String.class).newInstance("12826");
        Object follow = null;
        for (Constructor<?> candidate : types[0].getConstructors()) {
            if (candidate.getParameterCount() == 5 && candidate.getParameterTypes()[0] == boolean.class)
                follow = candidate.newInstance(true, following, false, never, tuid);
        }
        check(follow != null, "No chat header follow state constructor");
        @SuppressWarnings({"unchecked", "rawtypes"})
        Object state = Enum.valueOf((Class) types[1], subscription);
        // R8 names are Twitch 32.1.0's: hv5 is the promo discount NoDiscount, wo5(11) the buttons mapper.
        Object noDiscount = Class.forName("hv5").getField("a").get(null);
        check(noDiscount.toString().equals("NoDiscount") && types[2].isInstance(noDiscount), "hv5 is not NoDiscount");
        Object eligibility = constructor.newInstance(follow, state, noDiscount, bits, upgrade);
        check(eligibility.toString().startsWith("ButtonsEligibilityState(followState="), "Not the chat header buttons state");
        Object mapper = Class.forName("wo5").getConstructor(int.class).newInstance(11);
        return String.valueOf(mapper.getClass().getMethod("invoke", Object.class).invoke(mapper, eligibility));
    }
    private static void chatHeaders(boolean stock) throws Exception {
        String reporter = "Visible(buttons=[GiftASubButton, BitsButton], isViewerFollowing=true)";
        String newViewer = "Visible(buttons=[FollowButton, SubscribeButton, BitsIconButton], isViewerFollowing=false)";
        String upgrade = "Visible(buttons=[GiftASubButton, UpgradeSubButton, BitsIconButton], isViewerFollowing=true)";
        for (boolean tipping : new boolean[]{false, true}) {
            for (boolean upsells : new boolean[]{false, true}) {
                switches.put("hide_tipping", tipping);
                switches.put("hide_subscription_upsells", upsells);
                boolean bits = stock || !tipping, offers = stock || !upsells;
                // A follower who subscribes (the issue's screenshot): Gift A Sub and Get Bits.
                String expected = bits && offers ? reporter : bits ? "Visible(buttons=[BitsButton], isViewerFollowing=true)"
                    : offers ? "Visible(buttons=[GiftASubButton], isViewerFollowing=true)" : "Hidden";
                check(chatHeader(true, "GIFTING_ENABLED", true, false).equals(expected), "Subscriber's chat header: " + tipping + "/" + upsells);
                // Neither following nor subscribed: Follow always stays.
                expected = bits && offers ? newViewer : bits ? "Visible(buttons=[FollowButton, BitsButton], isViewerFollowing=false)"
                    : offers ? "Visible(buttons=[FollowButton, SubscribeButton], isViewerFollowing=false)"
                    : "Visible(buttons=[FollowButton], isViewerFollowing=false)";
                check(chatHeader(false, "NOT_SUBSCRIBED", true, false).equals(expected), "New viewer's chat header: " + tipping + "/" + upsells);
                // A subscriber who could upgrade their tier.
                expected = bits && offers ? upgrade : bits ? "Visible(buttons=[BitsButton], isViewerFollowing=true)"
                    : offers ? "Visible(buttons=[GiftASubButton, UpgradeSubButton], isViewerFollowing=true)" : "Hidden";
                check(chatHeader(true, "GIFTING_ENABLED", true, true).equals(expected), "Upgrade chat header: " + tipping + "/" + upsells);
                // Without Bits for sale (signed out, no Play billing) the switches change nothing Bits-wise.
                check(chatHeader(false, "DISABLED", false, false).equals("Visible(buttons=[FollowButton], isViewerFollowing=false)"), "Signed-out chat header");
            }
        }
        switches.remove("hide_subscription_upsells");
    }
    /**
     * The row under the stream title (issue 92: Gift a Sub and Subscribe beside Follow and notifications): Twitch's own
     * builder from the follow state, a discount, the subscription state and the Upgrade flag, as its buttons
     * ("[SubscribeButton, GiftASubButton, NoneNotificationsIconButton, UnfollowIconButton]").
     */
    private static String streamInfo(boolean following, String subscription, boolean upgrade) throws Exception {
        // The stock control has no locators, so the fallbacks are Twitch 32.1.0's names: xt0 the builder (its case
        // 3), m55 the follow state, mtp NoDiscount, j770 the subscription state.
        Class<?> builderType = Class.forName(ProbeLocators.type("twitch.hide_subscription_upsells.stream_info_buttons", "xt0"));
        Object never = Class.forName("tv.twitch.android.models.NotificationsSettingsState$Never").getField("INSTANCE").get(null);
        Object tuid = Class.forName("tv.twitch.android.models.Tuid").getConstructor(String.class).newInstance("12826");
        Object follow = null;
        for (Constructor<?> candidate : Class.forName("m55").getConstructors()) {
            if (candidate.getParameterCount() == 5 && candidate.getParameterTypes()[0] == boolean.class)
                follow = candidate.newInstance(true, following, false, never, tuid);
        }
        check(follow != null, "No stream info follow state constructor");
        Object noDiscount = Class.forName("mtp").getField("a").get(null);
        check(noDiscount.toString().equals("NoDiscount"), "mtp is not NoDiscount");
        Object pair = Class.forName("kotlin.Pair").getConstructor(Object.class, Object.class).newInstance(follow, noDiscount);
        @SuppressWarnings({"unchecked", "rawtypes"})
        Object state = Enum.valueOf((Class) Class.forName("j770"), subscription);
        Object empty = Class.forName("tv.twitch.android.util.Optional").getConstructor(Object.class).newInstance((Object) null);
        // The builder only stores its presenter (in the result's notification callback).
        Object builder = builderType.getConstructor(Object.class, int.class).newInstance(null, 3);
        Method build = builderType.getMethod("k", Object.class, Object.class, Object.class, Object.class);
        String row = String.valueOf(build.invoke(builder, pair, state, empty, upgrade));
        check(row.startsWith("Visible(buttons=[") && row.contains("], onNotificationSettingSelected="), "Not the stream info row: " + row);
        return row.substring("Visible(buttons=".length(), row.indexOf(", onNotificationSettingSelected="));
    }
    private static void streamInfoRows(boolean stock) throws Exception {
        String[] upsells = {"SubscribeButton", "GiftASubButton", "UpgradeSubButton"};
        for (boolean hide : new boolean[]{false, true}) {
            switches.put("hide_subscription_upsells", hide);
            boolean offers = stock || !hide;
            // The reporter's row: a follower, not subscribed.
            String reporter = streamInfo(true, "NOT_SUBSCRIBED", false);
            check(reporter.contains("UnfollowIconButton"), "Follower's row lost Unfollow: " + reporter);
            check(reporter.contains("SubscribeButton") == offers && reporter.contains("GiftASubButton") == offers, "Follower's row: " + hide + " " + reporter);
            // A new viewer keeps Follow.
            String viewer = streamInfo(false, "NOT_SUBSCRIBED", false);
            check(viewer.startsWith("[FollowButton"), "New viewer's row lost Follow: " + viewer);
            check(viewer.contains("SubscribeButton") == offers, "New viewer's row: " + hide + " " + viewer);
            // A subscriber who could upgrade: Twitch shows the subscription details button only without Upgrade.
            String subscriber = streamInfo(true, "GIFTING_ENABLED", true);
            check(subscriber.contains("UpgradeSubButton") == offers && subscriber.contains("GiftASubButton") == offers, "Subscriber's row: " + hide + " " + subscriber);
            check(subscriber.contains("SubscriptionDetailsIconButton") == !offers, "Subscriber's details button: " + hide + " " + subscriber);
            if (!offers) for (String upsell : upsells) {
                check(!reporter.contains(upsell) && !viewer.contains(upsell) && !subscriber.contains(upsell), "Upsell left: " + upsell);
            }
        }
        switches.remove("hide_subscription_upsells");
    }
    /** Twitch's Turbo offer ("Try Ad-Free"): the Visible state turboIngress gets, and the hidden one it hands back. */
    private static void turboOffer() throws Exception {
        Class<?> visibleType = Class.forName(ProbeLocators.type("twitch.match.turbo_ingress_visible", "t550"));
        Constructor<?> constructor = visibleType.getConstructors()[0];
        check(constructor.getParameterCount() == 1 && constructor.getParameterTypes()[0].isEnum(), "Unexpected Turbo offer constructor");
        Object visible = constructor.newInstance(constructor.getParameterTypes()[0].getEnumConstants()[0]);
        check(visible.toString().startsWith("Visible(ingressType="), "Not the Turbo offer: " + visible);
        Method swap = Class.forName("io.github.jordanwoodson.extension.shared.twitch.TwitchInterface").getMethod("turboIngress", Object.class);
        switches.put("hide_subscription_upsells", false);
        check(swap.invoke(null, visible) == visible, "Turbo offer changed with the switch off");
        switches.put("hide_subscription_upsells", true);
        Object hidden = swap.invoke(null, visible);
        check(hidden != null && !visibleType.isInstance(hidden) && visibleType.getSuperclass().isInstance(hidden), "Turbo offer not hidden: " + hidden);
        boolean singleton = false;
        for (Field field : hidden.getClass().getDeclaredFields()) {
            if (java.lang.reflect.Modifier.isStatic(field.getModifiers()) && field.getType() == hidden.getClass()) {
                field.setAccessible(true);
                singleton |= field.get(null) == hidden;
            }
        }
        check(singleton, "Hidden Turbo offer isn't Twitch's own instance");
        switches.remove("hide_subscription_upsells");
    }
    public static void main(String[] args) throws Exception {
        boolean stock = args.length > 0 && args[0].equals("stock");
        if (args.length > 1) ProbeLocators.load(args[1]);
        if (!stock) settings();
        chatHeaders(stock);
        streamInfoRows(stock);
        if (!stock) turboOffer();
        // R8 names are Twitch 32.1.0's: profile tabs shv, chat toolbar state kr70, one-chat state l5s.
        Class<?> tabType = Class.forName("shv");
        Object entries = tabType.getMethod("getEntries").invoke(null);
        List<String> original = Arrays.asList("HOME", "ABOUT", "CLIPS", "VIDEOS", "SCHEDULE", "CHAT");
        check(names((List<?>) entries).equals(original), "Unexpected stock profile tab list");
        if (!stock) {
            Method filter = Class.forName("io.github.jordanwoodson.extension.shared.twitch.TwitchInterface").getMethod("clipTabs", Object.class);
            Method contextualFilter = filter.getDeclaringClass().getMethod("clipTabs", Object.class, Bundle.class);
            Class<?> marker = Class.forName("kotlin.enums.EnumEntries");
            for (boolean enabled : new boolean[]{false, true, false}) {
                switches.put("hide_clips", enabled);
                Object output = filter.invoke(null, entries);
                check(marker.isInstance(output), "Result lost Twitch's EnumEntries runtime ABI");
                check(names((List<?>) output).equals(enabled ? Arrays.asList("HOME", "ABOUT", "VIDEOS", "SCHEDULE", "CHAT") : original), "Incorrect filtered tab order");
                check(names((List<?>) entries).equals(original), "Global enum entries changed");
                if (!enabled) check(output == entries, "Disabled filter must preserve identity");
                else {
                    List<?> tabs = (List<?>) output;
                    check(tabs.indexOf(tabType.getField("VIDEOS").get(null)) == 2, "Pager index does not match visible tabs");
                    check(tabs.toArray().length == 5, "EnumEntries array bridge failed");
                    try { tabs.clear(); throw new AssertionError("Filtered entries are mutable"); }
                    catch (UnsupportedOperationException expected) { }
                }
                // Issue 93: Keep Clips on channel pages leaves the tab list as it is.
                switches.put("hide_clips_keep_channel", true);
                check(filter.invoke(null, entries) == entries, "Keep Clips on channel pages must keep the Clips tab");
                switches.remove("hide_clips_keep_channel");
                for (String key : new String[]{"clipId", "contentType", "profileScope", "profileScopeLower"}) {
                    Bundle explicit = new Bundle();
                    explicit.putString(key.equals("profileScopeLower") ? "profileScope" : key, key.equals("clipId") ? "shared-clip" : key.equals("contentType") ? "clips_content" : key.equals("profileScopeLower") ? "clips" : "CLIPS");
                    check(contextualFilter.invoke(null, entries, explicit) == entries, "Explicit clip profile must preserve full enum: " + key);
                }
            }
        }
        for (boolean enabled : new boolean[]{false, true, false}) {
            switches.put("hide_tipping", enabled);
            for (boolean initial : new boolean[]{false, true}) {
                boolean expected = initial && (stock || !enabled);
                Object toolbar = state("kr70", initial);
                check(flag(toolbar, "k") == expected && flag(toolbar, "m") == expected, "Native chat Bits button/tray flags differ");
                check(flag(toolbar, "n") == initial && flag(toolbar, "p") == initial, "Typed cheer/shared chat state changed");
                Object oneChat = state("l5s", initial);
                check(flag(oneChat, "e") == expected && flag(oneChat, "k") == expected, "Native OneChat Bits/one-tap flags differ");
                // isVisible and isMessageInputVisible (31.9.0 dropped isOneChatIngressEnabled).
                check(flag(oneChat, "a") == initial && flag(oneChat, "b") == initial, "Ordinary chat visibility changed");
            }
        }
        System.out.println(stock ? "PASS: original ART enum, chat flag, chat header and stream info negative controls" : "PASS: real ART EnumEntries ABI/order/immutability/off identity, Keep Clips on channel pages, native Bits constructors on/off without chat changes, chat header and stream info buttons through Twitch's builders, and the Turbo offer swap");
    }
}
