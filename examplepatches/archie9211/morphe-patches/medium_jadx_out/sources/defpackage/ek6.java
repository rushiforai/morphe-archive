package defpackage;

import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ek6 {
    public static final ek6 ADD_TO_LIST_USES_COUNT;
    public static final ek6 CONTINUE_READING_DATA;
    public static final ek6 COOKIE_JAR;
    public static final ek6 CURRENT_USER;
    public static final ek6 CURRENT_USER_DISMISSABLE_FLAGS;
    public static final ek6 FIRST_APP_LAUNCH;
    public static final ek6 FIRST_TIME_APP_LOGIN_EVENT_SENT;
    public static final ek6 FOLLOW_CLICKS_COUNT;
    public static final ek6 HAS_DISMISSED_FIND_YOUR_FRIENDS_DIALOG;
    public static final ek6 HAS_PUBLISHED_A_POST;
    public static final ek6 INSTALL_REFERRER_CALLED;
    public static final ek6 LAST_CONTACTS_SHARED_AT;
    public static final ek6 LAST_FOLLOWED_VIEWED_AT;
    public static final ek6 LAST_HOME_FETCH_TIME_FEATURED;
    public static final ek6 LAST_HOME_FETCH_TIME_RECOMMENDED;
    public static final ek6 LAST_SHOWN_WHATS_NEW_DIALOG_VERSION;
    public static final ek6 LOCAL_VARIANTS;
    public static final ek6 MOBILE_CLIENT_CONFIG;
    public static final ek6 NOTIFICATIONS_PERMISSION_RATIONALE_TIMESTAMP;
    public static final ek6 PREFERRED_VOICES;
    public static final ek6 RESPONSE_DRAFT_ID;
    public static final ek6 RESPONSE_DRAFT_TEXT;
    public static final ek6 RESUBSCRIBE_BANNER_CLOSE_AT;
    public static final ek6 RID_COOKIE;
    public static final ek6 SEARCH_HISTORY;
    public static final ek6 SETTINGS_DARK_MODE;
    public static final ek6 SETTINGS_FONT_FAMILY;
    public static final ek6 SETTINGS_HIGHLIGHTS_FROM_OTHERS;
    public static final ek6 SETTINGS_IMAGE_LOADING_DISABLED;
    public static final ek6 SETTINGS_TEXT_SIZE;

    @z73
    public static final ek6 SHOULD_SHOW_VERIFIED_AUTHOR_INTRO;
    public static final ek6 STAFF_OVERRIDES_VARIANT_FLAGS;
    public static final ek6 STAGE_BRANCH;
    public static final ek6 TEST_KEY;
    public static final /* synthetic */ ek6[] b;
    public static final /* synthetic */ i04 c;
    public final String a;

    public ek6(String str, int i, String str2) {
        this.a = str2;
    }

    public static g04 getEntries() {
        return c;
    }

    public static ek6 valueOf(String str) {
        return (ek6) Enum.valueOf(ek6.class, str);
    }

    public static ek6[] values() {
        return (ek6[]) b.clone();
    }

    public final String asOldPrefixFor(String str) {
        str.getClass();
        return km4.y(this.a, str);
    }

    public final String asPrefixFor(String str) {
        str.getClass();
        return b09.y(asString(), "_", str);
    }

    public final String asString() {
        return name();
    }

    public final String getOldKey() {
        return this.a;
    }

    static {
        ek6 ek6Var = new ek6("TEST_KEY", 0, "testOldKey");
        TEST_KEY = ek6Var;
        ek6 ek6Var2 = new ek6("SETTINGS_DARK_MODE", 1, null);
        SETTINGS_DARK_MODE = ek6Var2;
        ek6 ek6Var3 = new ek6("SETTINGS_TEXT_SIZE", 2, null);
        SETTINGS_TEXT_SIZE = ek6Var3;
        ek6 ek6Var4 = new ek6("SETTINGS_IMAGE_LOADING_DISABLED", 3, null);
        SETTINGS_IMAGE_LOADING_DISABLED = ek6Var4;
        ek6 ek6Var5 = new ek6("SETTINGS_FONT_FAMILY", 4, null);
        SETTINGS_FONT_FAMILY = ek6Var5;
        ek6 ek6Var6 = new ek6("SETTINGS_HIGHLIGHTS_FROM_OTHERS", 5, null);
        SETTINGS_HIGHLIGHTS_FROM_OTHERS = ek6Var6;
        ek6 ek6Var7 = new ek6("SEARCH_HISTORY", 6, null);
        SEARCH_HISTORY = ek6Var7;
        ek6 ek6Var8 = new ek6("ADD_TO_LIST_USES_COUNT", 7, null);
        ADD_TO_LIST_USES_COUNT = ek6Var8;
        ek6 ek6Var9 = new ek6("FOLLOW_CLICKS_COUNT", 8, null);
        FOLLOW_CLICKS_COUNT = ek6Var9;
        ek6 ek6Var10 = new ek6("HAS_PUBLISHED_A_POST", 9, null);
        HAS_PUBLISHED_A_POST = ek6Var10;
        ek6 ek6Var11 = new ek6("RESPONSE_DRAFT_ID", 10, null);
        RESPONSE_DRAFT_ID = ek6Var11;
        ek6 ek6Var12 = new ek6("RESPONSE_DRAFT_TEXT", 11, null);
        RESPONSE_DRAFT_TEXT = ek6Var12;
        ek6 ek6Var13 = new ek6("SHOULD_SHOW_VERIFIED_AUTHOR_INTRO", 12, null);
        SHOULD_SHOW_VERIFIED_AUTHOR_INTRO = ek6Var13;
        ek6 ek6Var14 = new ek6("FIRST_TIME_APP_LOGIN_EVENT_SENT", 13, "FIRST_TIME_APP_LOGIN_EVENT_SENT");
        FIRST_TIME_APP_LOGIN_EVENT_SENT = ek6Var14;
        ek6 ek6Var15 = new ek6("LAST_CONTACTS_SHARED_AT", 14, null);
        LAST_CONTACTS_SHARED_AT = ek6Var15;
        ek6 ek6Var16 = new ek6("HAS_DISMISSED_FIND_YOUR_FRIENDS_DIALOG", 15, null);
        HAS_DISMISSED_FIND_YOUR_FRIENDS_DIALOG = ek6Var16;
        ek6 ek6Var17 = new ek6("CURRENT_USER", 16, null);
        CURRENT_USER = ek6Var17;
        ek6 ek6Var18 = new ek6("MOBILE_CLIENT_CONFIG", 17, "MobileClientConfig");
        MOBILE_CLIENT_CONFIG = ek6Var18;
        ek6 ek6Var19 = new ek6("LAST_HOME_FETCH_TIME_RECOMMENDED", 18, null);
        LAST_HOME_FETCH_TIME_RECOMMENDED = ek6Var19;
        ek6 ek6Var20 = new ek6("LAST_HOME_FETCH_TIME_FEATURED", 19, null);
        LAST_HOME_FETCH_TIME_FEATURED = ek6Var20;
        ek6 ek6Var21 = new ek6("CONTINUE_READING_DATA", 20, null);
        CONTINUE_READING_DATA = ek6Var21;
        ek6 ek6Var22 = new ek6("NOTIFICATIONS_PERMISSION_RATIONALE_TIMESTAMP", 21, "NOTIFICATIONS_PERMISSION_RATIONALE_TIMESTAMP");
        NOTIFICATIONS_PERMISSION_RATIONALE_TIMESTAMP = ek6Var22;
        ek6 ek6Var23 = new ek6("COOKIE_JAR", 22, null);
        COOKIE_JAR = ek6Var23;
        ek6 ek6Var24 = new ek6("RESUBSCRIBE_BANNER_CLOSE_AT", 23, null);
        RESUBSCRIBE_BANNER_CLOSE_AT = ek6Var24;
        ek6 ek6Var25 = new ek6("CURRENT_USER_DISMISSABLE_FLAGS", 24, null);
        CURRENT_USER_DISMISSABLE_FLAGS = ek6Var25;
        ek6 ek6Var26 = new ek6("LAST_FOLLOWED_VIEWED_AT", 25, null);
        LAST_FOLLOWED_VIEWED_AT = ek6Var26;
        ek6 ek6Var27 = new ek6(mBTDfueQiGWRV.pQfitKwbysxTbcW, 26, null);
        RID_COOKIE = ek6Var27;
        ek6 ek6Var28 = new ek6("STAFF_OVERRIDES_VARIANT_FLAGS", 27, "PREF_VARIANT_STAFF_OVERRIDES");
        STAFF_OVERRIDES_VARIANT_FLAGS = ek6Var28;
        ek6 ek6Var29 = new ek6("LOCAL_VARIANTS", 28, null);
        LOCAL_VARIANTS = ek6Var29;
        ek6 ek6Var30 = new ek6("LAST_SHOWN_WHATS_NEW_DIALOG_VERSION", 29, null);
        LAST_SHOWN_WHATS_NEW_DIALOG_VERSION = ek6Var30;
        ek6 ek6Var31 = new ek6("PREFERRED_VOICES", 30, null);
        PREFERRED_VOICES = ek6Var31;
        ek6 ek6Var32 = new ek6("STAGE_BRANCH", 31, null);
        STAGE_BRANCH = ek6Var32;
        ek6 ek6Var33 = new ek6("FIRST_APP_LAUNCH", 32, null);
        FIRST_APP_LAUNCH = ek6Var33;
        ek6 ek6Var34 = new ek6("INSTALL_REFERRER_CALLED", 33, null);
        INSTALL_REFERRER_CALLED = ek6Var34;
        ek6[] ek6VarArr = {ek6Var, ek6Var2, ek6Var3, ek6Var4, ek6Var5, ek6Var6, ek6Var7, ek6Var8, ek6Var9, ek6Var10, ek6Var11, ek6Var12, ek6Var13, ek6Var14, ek6Var15, ek6Var16, ek6Var17, ek6Var18, ek6Var19, ek6Var20, ek6Var21, ek6Var22, ek6Var23, ek6Var24, ek6Var25, ek6Var26, ek6Var27, ek6Var28, ek6Var29, ek6Var30, ek6Var31, ek6Var32, ek6Var33, ek6Var34};
        b = ek6VarArr;
        c = new i04(ek6VarArr);
    }
}
