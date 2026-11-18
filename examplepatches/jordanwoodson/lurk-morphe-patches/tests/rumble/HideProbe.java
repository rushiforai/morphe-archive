import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.List;

/**
 * Hide Shorts, Hide Premium upsells and Hide tipping and Rants: runs the DTO getters and parsers they change,
 * the composables they empty (called with a null Composer: a hooked composable returns before touching it,
 * Rumble's own code fails on it) and the action button filter, with each switch on and off.
 */
public final class HideProbe {
    private static final String DTO = "com.rumble.network.dto.";
    private static final String INTERFACE = "io.github.jordanwoodson.extension.shared.rumble.RumbleInterface";

    public static void main(String[] args) {
        ProbeSupport.run("Shorts, Premium upsells and tipping hidden while on, Rumble's own while off", HideProbe::run);
    }

    private static void run() throws Exception {
        shorts();
        upsells();
        tipping();
        if (ProbeSupport.registered("hide_comments")) commentsAndRelated();
        if (ProbeSupport.registered("hide_premium_only")) premiumOnly();
    }

    private static void premiumOnly() throws Exception {
        Class<?> videoType = Class.forName(DTO + "video.Video");
        Object free = ProbeSupport.allocate(videoType);
        ProbeSupport.set(free, "availability", "public");
        Object locked = ProbeSupport.allocate(videoType);
        ProbeSupport.set(locked, "availability", "premium");
        Object unlocked = ProbeSupport.allocate(videoType);
        ProbeSupport.set(unlocked, "availability", "premium");
        ProbeSupport.set(unlocked, "hasAccessToPremium", true);
        List<Object> videos = Arrays.asList(free, locked, unlocked);
        Object section = ProbeSupport.allocate(Class.forName(DTO + "home.HomeSectionDto"));
        ProbeSupport.set(section, "videos", videos);
        Method sectionVideos = getterOf(section, "videos");

        ProbeSupport.setting("block_ads", "false");
        ProbeSupport.check(sectionVideos.invoke(section) == videos, "off: premium-only videos stay");
        ProbeSupport.setting("hide_premium_only", "true");
        ProbeSupport.check(sectionVideos.invoke(section).equals(Arrays.asList(free, unlocked)),
                "on: locked premium-only videos are left out, ones you can watch stay");
        ProbeSupport.setting("hide_premium_only", "false");
        ProbeSupport.setting("block_ads", "true");
    }

    private static void commentsAndRelated() throws Exception {
        Object video = ProbeSupport.allocate(Class.forName(DTO + "video.Video"));
        ProbeSupport.set(video, "areCommentsDisabled", Boolean.FALSE);
        Method commentsDisabled = getterOf(video, "areCommentsDisabled");
        List<Object> related = Arrays.asList(ProbeSupport.allocate(video.getClass()));
        Object relatedData = ProbeSupport.allocate(Class.forName(DTO + "video.RelatedVideoData"));
        ProbeSupport.set(relatedData, "videos", related);
        Method relatedVideos = getterOf(relatedData, "videos");

        ProbeSupport.check(Boolean.FALSE.equals(commentsDisabled.invoke(video)), "off: comments follow the server");
        ProbeSupport.check(relatedVideos.invoke(relatedData) == related, "off: related videos stay");
        ProbeSupport.setting("hide_comments", "true");
        ProbeSupport.setting("hide_related_videos", "true");
        ProbeSupport.check(Boolean.TRUE.equals(commentsDisabled.invoke(video)), "on: comments read as turned off");
        ProbeSupport.check(((List<?>) relatedVideos.invoke(relatedData)).isEmpty(), "on: no related videos");
        ProbeSupport.setting("hide_comments", "false");
        ProbeSupport.setting("hide_related_videos", "false");
    }

    private static void shorts() throws Exception {
        Method shortsList = ProbeSupport.method("rumble.hide_shorts.shorts_list_view",
                "LNb/f1;->o(Lt1/o;Lu0/Z;Ls5/b;ZZZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;"
                        + "Lai/o;Lai/n;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;LZ0/r;III)V");
        Class<?> kindType = Class.forName(DTO + "home.HomeSectionKind");
        Object companion = kindType.getField("Companion").get(null);
        Method parse = ProbeSupport.bySignature(companion.getClass(), kindType, String.class);
        Object creator = ProbeSupport.allocate(Class.forName(DTO + "creator.Creator"));
        List<String> channelTabs = Arrays.asList("all", "shorts", "live");
        ProbeSupport.set(creator, "tabs", channelTabs);
        Method tabs = getterOf(creator, "tabs");
        // My Feed's filter pills (since 3.22.0), each a Gson DTO with its id.
        Class<?> pillType = Class.forName(DTO + "video.FollowingFeedPillItem");
        Object all = pill(pillType, "all");
        Object shortsPill = pill(pillType, "shorts");
        Object live = pill(pillType, "live");
        List<Object> feedPills = Arrays.asList(all, shortsPill, live);
        Object pillsData = ProbeSupport.allocate(Class.forName(DTO + "video.FollowingFeedPillsData"));
        ProbeSupport.set(pillsData, "items", feedPills);
        Method pills = getterOf(pillsData, "items");

        // Off (the default): Rumble's own.
        ProbeSupport.check(composable(shortsList) instanceof Throwable, "off: ShortsListView draws");
        ProbeSupport.check("SHORTS".equals(ProbeSupport.name(parse.invoke(companion, "shorts"))), "off: Shorts sections load");
        ProbeSupport.check(tabs.invoke(creator) == channelTabs, "off: channel tabs are Rumble's");
        ProbeSupport.check(pills.invoke(pillsData) == feedPills, "off: My Feed's pills are Rumble's");

        ProbeSupport.setting("hide_shorts", "true");
        ProbeSupport.check(composable(shortsList) == null, "on: ShortsListView returns at once");
        ProbeSupport.check("HIDE".equals(ProbeSupport.name(parse.invoke(companion, "shorts"))), "on: Shorts sections hidden");
        ProbeSupport.check("VIDEOS".equals(ProbeSupport.name(parse.invoke(companion, "videos"))), "on: other sections stay");
        ProbeSupport.check(tabs.invoke(creator).equals(Arrays.asList("all", "live")), "on: the shorts tab is gone");
        List<String> onlyShorts = Arrays.asList("shorts");
        ProbeSupport.set(creator, "tabs", onlyShorts);
        ProbeSupport.check(tabs.invoke(creator).equals(onlyShorts), "on: a channel's only tab stays");
        List<?> shownPills = (List<?>) pills.invoke(pillsData);
        ProbeSupport.check(shownPills.size() == 2 && shownPills.get(0) == all && shownPills.get(1) == live,
                "on: My Feed has no Shorts pill");
        List<Object> withoutShorts = Arrays.asList(all, live);
        ProbeSupport.set(pillsData, "items", withoutShorts);
        ProbeSupport.check(pills.invoke(pillsData) == withoutShorts, "on: pills without Shorts are Rumble's list");
    }

    private static Object pill(Class<?> type, String id) throws Exception {
        Object pill = ProbeSupport.allocate(type);
        ProbeSupport.set(pill, "id", id);
        ProbeSupport.set(pill, "title", id);
        return pill;
    }

    private static void upsells() throws Exception {
        String composer = "LZ0/r;";
        Method[] views = {
                ProbeSupport.method("rumble.hide_premium_upsells.premium_banner_view",
                        "Lac/e2;->d(Lcom/rumble/battles/landing/c;Lt1/o;Lkotlin/jvm/functions/Function0;"
                                + "Lkotlin/jvm/functions/Function0;" + composer + "II)V"),
                ProbeSupport.method("rumble.hide_premium_upsells.premium_offer_banner",
                        "Lzc/g;->c(Lt1/o;Lef/f;Lkotlin/jvm/functions/Function1;" + composer + "II)V"),
                ProbeSupport.method("rumble.hide_premium_upsells.downloads_upsell_view",
                        "LPb/n;->b(Lcom/rumble/battles/landing/c;LPb/l;" + composer + "I)V"),
        };
        Method promo = ProbeSupport.method("rumble.hide_premium_upsells.promo_check", "Lgf/s;->a(LQh/c;)Ljava/lang/Object;");
        Object promoCheck = ProbeSupport.allocate(promo.getDeclaringClass());
        Object config = ProbeSupport.allocate(Class.forName(DTO + "livechat.LiveChatConfig"));
        ProbeSupport.set(config, "giftList", ProbeSupport.allocate(Class.forName(DTO + "livechat.PremiumGiftList")));
        ProbeSupport.setting("hide_premium_upsells", "false");
        Method gifts = getterOf(config, "giftList");
        ProbeSupport.setting("hide_premium_upsells", "true");

        // On (the default).
        for (Method view : views) ProbeSupport.check(composable(view) == null, "on: " + view.getName() + " is empty");
        ProbeSupport.check(Boolean.FALSE.equals(ProbeSupport.outcome(promo, promoCheck, (Object) null)),
                "on: the Premium sheet is never due");
        ProbeSupport.check(gifts.invoke(config) == null, "on: no Premium gifts in live chat");

        ProbeSupport.setting("hide_premium_upsells", "false");
        for (Method view : views) ProbeSupport.check(composable(view) instanceof Throwable, "off: " + view.getName() + " draws");
        ProbeSupport.check(ProbeSupport.outcome(promo, promoCheck, (Object) null) instanceof Throwable,
                "off: Rumble decides the Premium sheet");
        ProbeSupport.check(gifts.invoke(config) != null, "off: Premium gifts stay");
        ProbeSupport.setting("hide_premium_upsells", "true");
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private static void tipping() throws Exception {
        Class buttonType = ProbeSupport.type("rumble.hide_tipping.button_type", "Lxb/a;");
        Object follow = Enum.valueOf(buttonType, "Follow");
        Object join = Enum.valueOf(buttonType, "Join");
        Object tip = Enum.valueOf(buttonType, "Tip");
        Object shop = Enum.valueOf(buttonType, "Shop");
        Method buttons = Class.forName(INTERFACE).getMethod("actionButtons", List.class, Object.class, Object.class,
                Object.class);
        List<Object> all = Arrays.asList(follow, join, tip, shop);

        Object creator = ProbeSupport.allocate(Class.forName(DTO + "creator.Creator"));
        ProbeSupport.set(creator, "tipsInfo", ProbeSupport.allocate(Class.forName(DTO + "creator.TipsInfo")));
        Method tipsInfo = getterOf(creator, "tipsInfo");
        Object source = ProbeSupport.allocate(Class.forName(DTO + "video.VideoSource"));
        ProbeSupport.set(source, "wallet", ProbeSupport.allocate(Class.forName(DTO + "creator.Wallet")));
        Method wallet = getterOf(source, "wallet");
        Object rant = ProbeSupport.allocate(Class.forName(DTO + "livechat.LiveChatConfigRant"));
        ProbeSupport.set(rant, "enable", Boolean.TRUE);
        ProbeSupport.set(rant, "walletEnabled", true);
        Method enable = getterOf(rant, "enable");
        Method walletEnabled = getterOf(rant, "walletEnabled");

        // Off (the default).
        ProbeSupport.check(buttons.invoke(null, all, tip, join, shop) == all, "off: every button stays");
        ProbeSupport.check(tipsInfo.invoke(creator) != null && wallet.invoke(source) != null, "off: tip data stays");
        ProbeSupport.check(Boolean.TRUE.equals(enable.invoke(rant)) && (boolean) walletEnabled.invoke(rant), "off: Rants");

        ProbeSupport.setting("hide_tipping", "true");
        List<?> withoutTip = (List<?>) buttons.invoke(null, all, tip, join, shop);
        ProbeSupport.check(withoutTip.equals(Arrays.asList(follow, join, shop)), "on: Tip is gone, got " + withoutTip);
        ProbeSupport.check(buttons.invoke(null, all, tip, join, shop) == withoutTip, "on: the same list for the same list");
        List<Object> noTip = Arrays.asList(follow, join);
        ProbeSupport.check(buttons.invoke(null, noTip, tip, join, shop) == noTip, "on: a list without Tip is Rumble's");
        ProbeSupport.check(tipsInfo.invoke(creator) == null && wallet.invoke(source) == null, "on: no tip data");
        ProbeSupport.check(Boolean.FALSE.equals(enable.invoke(rant)) && !(boolean) walletEnabled.invoke(rant),
                "on: no Rants and no Rumble Wallet");
        ProbeSupport.setting("hide_tipping", "false");

        // Hide Join and Shop buttons, through the same list.
        if (ProbeSupport.registered("hide_join_button")) {
            ProbeSupport.check(buttons.invoke(null, all, tip, join, shop) == all, "Join and Shop stay while off");
            ProbeSupport.setting("hide_join_button", "true");
            ProbeSupport.check(buttons.invoke(null, all, tip, join, shop).equals(Arrays.asList(follow, tip, shop)),
                    "Join hidden");
            ProbeSupport.setting("hide_shop_button", "true");
            ProbeSupport.setting("hide_tipping", "true");
            ProbeSupport.check(buttons.invoke(null, all, tip, join, shop).equals(Arrays.asList(follow)),
                    "Join, Tip and Shop hidden together");
            ProbeSupport.setting("hide_join_button", "false");
            ProbeSupport.setting("hide_shop_button", "false");
            ProbeSupport.setting("hide_tipping", "false");
        }
    }

    /** Calls a composable with nulls: null when it returned at once, else what Rumble's code threw. */
    private static Object composable(Method view) throws Exception {
        return ProbeSupport.outcome(view, null, ProbeSupport.defaults(view));
    }

    /** The no-argument getter of a DTO field: the one method returning the field's value. */
    private static Method getterOf(Object dto, String field) throws Exception {
        Class<?> type = ProbeSupport.field(dto.getClass(), field).getType();
        Method found = null;
        for (Method m : dto.getClass().getDeclaredMethods()) {
            if (m.getParameterTypes().length != 0 || m.getReturnType() != type || Modifier.isStatic(m.getModifiers())
                    || m.getName().equals("toString") || m.getName().equals("hashCode")) {
                continue;
            }
            // Of the getters with the field's type, the one returning this field's (unique) value.
            Object original = ProbeSupport.get(dto, field);
            if (original != null && m.invoke(dto) == original) {
                if (found != null) throw new AssertionError("several getters for " + field);
                found = m;
            } else if (original != null && type == boolean.class && m.invoke(dto).equals(original)) {
                if (found != null) throw new AssertionError("several getters for " + field);
                found = m;
            }
        }
        if (found == null) throw new AssertionError("no getter for " + field + " in " + dto.getClass());
        found.setAccessible(true);
        return found;
    }
}
