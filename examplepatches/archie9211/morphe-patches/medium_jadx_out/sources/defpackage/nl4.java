package defpackage;

import androidx.work.impl.yX.VrhD;
import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import java.util.LinkedHashMap;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nl4 {
    public static final nl4 CAN_VIEW_UNFILTERED_SEARCH;
    public static final ml4 Companion;
    public static final nl4 DISABLE_LOGIN_APPLE;
    public static final nl4 DISABLE_LOGIN_EMAIL;
    public static final nl4 DISABLE_LOGIN_FACEBOOK;
    public static final nl4 DISABLE_LOGIN_GOOGLE;
    public static final nl4 DISABLE_LOGIN_X;
    public static final nl4 ENABLE_MOBILE_FETCH_BACKEND_DRIVEN_DISCOUNTS;
    public static final nl4 ENABLE_MOBILE_REGISTER_PURCHASE_BACKEND_DRIVEN_DISCOUNTS;
    public static final nl4 ENABLE_POSTS_PREFETCH;
    public static final nl4 ENABLE_POST_PAGE_COMPOSE;
    public static final nl4 ENABLE_RECAPTCHA_ENTERPRISE;
    public static final nl4 ENABLE_SPRIG;
    public static final nl4 ENABLE_SPRIG_EVENT_FEED_SCROLLED;
    public static final nl4 ENABLE_SPRIG_EVENT_FOLLOW_CREATED;
    public static final nl4 ENABLE_SPRIG_EVENT_PROFILE_VIEWED;
    public static final nl4 ENABLE_SPRIG_EVENT_RESPONSE_CREATED;
    public static final nl4 ENABLE_SPRIG_EVENT_SEARCH_EXECUTED;
    public static final nl4 ENABLE_SPRIG_EVENT_USER_POST_CLIENT_READ;
    public static final nl4 ENABLE_SPRIG_EVENT_USER_SETTINGS_VIEWED;
    public static final nl4 ENABLE_SPRIG_EVENT_WRITER_PUBLISHED_STORY;
    public static final nl4 ENABLE_SPRIG_EVENT_WRITER_STATS_VIEWED;
    public static final nl4 INTRODUCTORY_OFFERS;
    public static final nl4 SEE_ACTIVE_VARIANTS;
    public static final LinkedHashMap d;
    public static final /* synthetic */ nl4[] e;
    public static final /* synthetic */ i04 f;
    public final String a;
    public final String b;
    public final qj6 c;

    public nl4(int i, String str, String str2, String str3) {
        qj6 qj6VarA = n1b.a(Boolean.TYPE);
        this.a = str2;
        this.b = str3;
        this.c = qj6VarA;
    }

    public static g04 getEntries() {
        return f;
    }

    public static nl4 valueOf(String str) {
        return (nl4) Enum.valueOf(nl4.class, str);
    }

    public static nl4[] values() {
        return (nl4[]) e.clone();
    }

    public final String getExperimentDesc() {
        return this.b;
    }

    public String getServerId() {
        return this.a;
    }

    public String getSharedPreferencesKey() {
        return ka1.r("variants_", getServerId());
    }

    public final qj6 getType() {
        return this.c;
    }

    static {
        nl4 nl4Var = new nl4(0, "SEE_ACTIVE_VARIANTS", "android_see_active_variants", "enables the Admin menu, accessible through Settings");
        SEE_ACTIVE_VARIANTS = nl4Var;
        nl4 nl4Var2 = new nl4(1, "CAN_VIEW_UNFILTERED_SEARCH", "can_view_unfiltered_search", "people search will show all matching users instead of just \"high quality\" ones");
        CAN_VIEW_UNFILTERED_SEARCH = nl4Var2;
        nl4 nl4Var3 = new nl4(2, "DISABLE_LOGIN_APPLE", "disable_login_apple", "Disables Apple login (sign IN and sign UP) in the case of an outage. (Kill switch)");
        DISABLE_LOGIN_APPLE = nl4Var3;
        nl4 nl4Var4 = new nl4(3, "DISABLE_LOGIN_EMAIL", "disable_login_email", "Disables email login (sign IN and sign UP) in the case of an outage. (Kill switch)");
        DISABLE_LOGIN_EMAIL = nl4Var4;
        nl4 nl4Var5 = new nl4(4, "DISABLE_LOGIN_FACEBOOK", "disable_login_facebook", "Disables facebook login (sign IN and sign UP) in the case of an outage. (Kill switch)");
        DISABLE_LOGIN_FACEBOOK = nl4Var5;
        nl4 nl4Var6 = new nl4(5, "DISABLE_LOGIN_GOOGLE", "disable_login_google", "Disables google login (sign IN and sign UP) in the case of an outage. (Kill switch)");
        DISABLE_LOGIN_GOOGLE = nl4Var6;
        nl4 nl4Var7 = new nl4(6, "DISABLE_LOGIN_X", "disable_login_twitter", "Disables X login (sign IN) in the case of an outage. (Kill switch)");
        DISABLE_LOGIN_X = nl4Var7;
        nl4 nl4Var8 = new nl4(7, uvlZTF.VlqXB, "enable_recaptcha_enterprise", "Enable recaptcha enterprise on signup with email flow");
        ENABLE_RECAPTCHA_ENTERPRISE = nl4Var8;
        nl4 nl4Var9 = new nl4(8, "ENABLE_SPRIG", "enable_sprig_in_apps", "Enable Sprig");
        ENABLE_SPRIG = nl4Var9;
        nl4 nl4Var10 = new nl4(9, "ENABLE_SPRIG_EVENT_FEED_SCROLLED", "enable_sprig_event_feed_scrolled", "Enables the Sprig user.feedScrolled event");
        ENABLE_SPRIG_EVENT_FEED_SCROLLED = nl4Var10;
        nl4 nl4Var11 = new nl4(10, "ENABLE_SPRIG_EVENT_FOLLOW_CREATED", "enable_sprig_event_follow_created", "Enables the Sprig user.followCreated event");
        ENABLE_SPRIG_EVENT_FOLLOW_CREATED = nl4Var11;
        nl4 nl4Var12 = new nl4(11, "ENABLE_SPRIG_EVENT_PROFILE_VIEWED", "enable_sprig_event_profile_viewed", "Enables the Sprig user.otherProfileViewed event");
        ENABLE_SPRIG_EVENT_PROFILE_VIEWED = nl4Var12;
        nl4 nl4Var13 = new nl4(12, "ENABLE_SPRIG_EVENT_RESPONSE_CREATED", "enable_sprig_event_response_created", "Enables the Sprig user.responseCreated event");
        ENABLE_SPRIG_EVENT_RESPONSE_CREATED = nl4Var13;
        nl4 nl4Var14 = new nl4(13, "ENABLE_SPRIG_EVENT_SEARCH_EXECUTED", "enable_sprig_event_search_executed", "Enables the Sprig user.searchExecuted event");
        ENABLE_SPRIG_EVENT_SEARCH_EXECUTED = nl4Var14;
        nl4 nl4Var15 = new nl4(14, "ENABLE_SPRIG_EVENT_USER_POST_CLIENT_READ", "enable_sprig_event_user_post_client_read", "Enables the Sprig user.postClientRead event");
        ENABLE_SPRIG_EVENT_USER_POST_CLIENT_READ = nl4Var15;
        nl4 nl4Var16 = new nl4(15, "ENABLE_SPRIG_EVENT_USER_SETTINGS_VIEWED", "enable_sprig_event_user_settings_viewed", "Enables the Sprig user.settingsViewed event");
        ENABLE_SPRIG_EVENT_USER_SETTINGS_VIEWED = nl4Var16;
        nl4 nl4Var17 = new nl4(16, "ENABLE_SPRIG_EVENT_WRITER_PUBLISHED_STORY", "enable_sprig_event_writer_published_story", "Enables the Sprig writer.storyPublished event");
        ENABLE_SPRIG_EVENT_WRITER_PUBLISHED_STORY = nl4Var17;
        nl4 nl4Var18 = new nl4(17, "ENABLE_SPRIG_EVENT_WRITER_STATS_VIEWED", "enable_sprig_event_writer_stats_viewed", HrUBqHumRuLe.MNeFI);
        ENABLE_SPRIG_EVENT_WRITER_STATS_VIEWED = nl4Var18;
        nl4 nl4Var19 = new nl4(18, "ENABLE_POST_PAGE_COMPOSE", "android_enable_post_page_in_compose", "Enables the new Compose-based PostFragment2 instead of the XML-based PostFragment");
        ENABLE_POST_PAGE_COMPOSE = nl4Var19;
        nl4 nl4Var20 = new nl4(19, "ENABLE_POSTS_PREFETCH", "android_enable_posts_prefetch", "Prefetches full post data into the Apollo in-memory cache when posts are presented on Home feeds");
        ENABLE_POSTS_PREFETCH = nl4Var20;
        nl4 nl4Var21 = new nl4(20, "INTRODUCTORY_OFFERS", "enable_android_introductory_offer", "A/B test for introductory subscription pricing.\n            Enabled: shows introductory offer pricing ($3.49/month for the first 6 months,\n            $39.99/year for the first year) on regular membership plans.\n            Control: shows regular subscription pricing.");
        INTRODUCTORY_OFFERS = nl4Var21;
        nl4 nl4Var22 = new nl4(21, VrhD.AENTl, "enable_mobile_fetch_backend_driven_discounts", "Enables fetching discount offers from the backend for mobile purchase flows");
        ENABLE_MOBILE_FETCH_BACKEND_DRIVEN_DISCOUNTS = nl4Var22;
        nl4 nl4Var23 = new nl4(22, "ENABLE_MOBILE_REGISTER_PURCHASE_BACKEND_DRIVEN_DISCOUNTS", "enable_mobile_register_purchase_backend_driven_discounts", "Enables registering new mobile membership purchases through the\n            `registerMobileMembershipPurchase` GraphQL mutation instead of the legacy Medium2\n            `addMembership` REST endpoint. Also enables sending backend-driven discount codes\n            when registering a purchase.");
        ENABLE_MOBILE_REGISTER_PURCHASE_BACKEND_DRIVEN_DISCOUNTS = nl4Var23;
        nl4[] nl4VarArr = {nl4Var, nl4Var2, nl4Var3, nl4Var4, nl4Var5, nl4Var6, nl4Var7, nl4Var8, nl4Var9, nl4Var10, nl4Var11, nl4Var12, nl4Var13, nl4Var14, nl4Var15, nl4Var16, nl4Var17, nl4Var18, nl4Var19, nl4Var20, nl4Var21, nl4Var22, nl4Var23};
        e = nl4VarArr;
        f = new i04(nl4VarArr);
        Companion = new ml4();
        g04 entries = getEntries();
        int iP = ei7.P(cu1.k0(entries, 10));
        LinkedHashMap linkedHashMap = new LinkedHashMap(iP < 16 ? 16 : iP);
        for (Object obj : entries) {
            linkedHashMap.put(((nl4) obj).getServerId(), obj);
        }
        d = linkedHashMap;
    }
}
