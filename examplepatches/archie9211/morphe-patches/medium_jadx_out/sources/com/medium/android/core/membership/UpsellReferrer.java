package com.medium.android.core.membership;

import com.medium.android.explore.ui.vAWg.OphtYB;
import defpackage.g04;
import defpackage.rv8;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0013\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015¨\u0006\u0016"}, d2 = {"Lcom/medium/android/core/membership/UpsellReferrer;", "", "value", "", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getValue", "()Ljava/lang/String;", "CUSTOM_APP_ICON", "DEEPLINK", "LIST", "MEMBER_ONLY_CONTENT_SHEET", "MY_LISTS", "ONBOARDING", "PLAY_STORE", "POST", "PROFILE_PREMIUM", "SETTINGS", "USER_LISTS", "WHATS_NEW_PREMIUM_TIER", "HOME", "PLAN_SWAP_DEEPLINK", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UpsellReferrer {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ UpsellReferrer[] $VALUES;
    private final String value;
    public static final UpsellReferrer CUSTOM_APP_ICON = new UpsellReferrer("CUSTOM_APP_ICON", 0, "alternate_icon_selector");
    public static final UpsellReferrer DEEPLINK = new UpsellReferrer("DEEPLINK", 1, "deeplink");
    public static final UpsellReferrer LIST = new UpsellReferrer("LIST", 2, "list");
    public static final UpsellReferrer MEMBER_ONLY_CONTENT_SHEET = new UpsellReferrer("MEMBER_ONLY_CONTENT_SHEET", 3, "member_only_content_sheet");
    public static final UpsellReferrer MY_LISTS = new UpsellReferrer("MY_LISTS", 4, "my_lists");
    public static final UpsellReferrer ONBOARDING = new UpsellReferrer("ONBOARDING", 5, "onboarding");
    public static final UpsellReferrer PLAY_STORE = new UpsellReferrer("PLAY_STORE", 6, "play_store");
    public static final UpsellReferrer POST = new UpsellReferrer("POST", 7, "post_page");
    public static final UpsellReferrer PROFILE_PREMIUM = new UpsellReferrer("PROFILE_PREMIUM", 8, "profile_premium");
    public static final UpsellReferrer SETTINGS = new UpsellReferrer("SETTINGS", 9, OphtYB.uxSN);
    public static final UpsellReferrer USER_LISTS = new UpsellReferrer("USER_LISTS", 10, "user_lists");
    public static final UpsellReferrer WHATS_NEW_PREMIUM_TIER = new UpsellReferrer("WHATS_NEW_PREMIUM_TIER", 11, "whats_new_premium_tier");
    public static final UpsellReferrer HOME = new UpsellReferrer("HOME", 12, "home");
    public static final UpsellReferrer PLAN_SWAP_DEEPLINK = new UpsellReferrer("PLAN_SWAP_DEEPLINK", 13, "plan_swap_deeplink");

    private static final /* synthetic */ UpsellReferrer[] $values() {
        return new UpsellReferrer[]{CUSTOM_APP_ICON, DEEPLINK, LIST, MEMBER_ONLY_CONTENT_SHEET, MY_LISTS, ONBOARDING, PLAY_STORE, POST, PROFILE_PREMIUM, SETTINGS, USER_LISTS, WHATS_NEW_PREMIUM_TIER, HOME, PLAN_SWAP_DEEPLINK};
    }

    private UpsellReferrer(String str, int i, String str2) {
        this.value = str2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static UpsellReferrer valueOf(String str) {
        return (UpsellReferrer) Enum.valueOf(UpsellReferrer.class, str);
    }

    public static UpsellReferrer[] values() {
        return (UpsellReferrer[]) $VALUES.clone();
    }

    public final String getValue() {
        return this.value;
    }

    static {
        UpsellReferrer[] upsellReferrerArr$values = $values();
        $VALUES = upsellReferrerArr$values;
        $ENTRIES = rv8.x(upsellReferrerArr$values);
    }
}
