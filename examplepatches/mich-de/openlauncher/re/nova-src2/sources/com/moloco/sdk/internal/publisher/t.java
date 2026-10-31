package com.moloco.sdk.internal.publisher;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class t {

    /* renamed from: a, reason: collision with root package name */
    public static final t f37458a = new t("BANNER", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final t f37459b = new t("BANNER_TABLET", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final t f37460c = new t("MREC", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final t f37461d = new t("INLINE_ADAPTIVE_BANNER", 3);

    /* renamed from: e, reason: collision with root package name */
    public static final t f37462e = new t("ANCHORED_ADAPTIVE_BANNER", 4);

    /* renamed from: f, reason: collision with root package name */
    public static final t f37463f = new t("NATIVE_AD_MEDIATION", 5);

    /* renamed from: g, reason: collision with root package name */
    public static final t f37464g = new t("NATIVE_BANNER", 6);

    /* renamed from: h, reason: collision with root package name */
    public static final t f37465h = new t("INTERSTITIAL", 7);

    /* renamed from: i, reason: collision with root package name */
    public static final t f37466i = new t("REWARDED", 8);

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ t[] f37467j;

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f37468k;

    static {
        t[] tVarArrA = a();
        f37467j = tVarArrA;
        f37468k = EnumEntriesKt.a(tVarArrA);
    }

    public t(String str, int i5) {
    }

    public static final /* synthetic */ t[] a() {
        return new t[]{f37458a, f37459b, f37460c, f37461d, f37462e, f37463f, f37464g, f37465h, f37466i};
    }

    @NotNull
    public static EnumEntries<t> b() {
        return f37468k;
    }

    public static t valueOf(String str) {
        return (t) Enum.valueOf(t.class, str);
    }

    public static t[] values() {
        return (t[]) f37467j.clone();
    }
}
