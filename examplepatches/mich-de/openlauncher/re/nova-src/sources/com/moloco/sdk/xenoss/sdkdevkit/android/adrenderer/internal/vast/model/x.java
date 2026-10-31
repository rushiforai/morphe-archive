package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class x {

    /* renamed from: b, reason: collision with root package name */
    public static final x f40842b = new x("XmlParsing", 0, 100);

    /* renamed from: c, reason: collision with root package name */
    public static final x f40843c = new x(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40334h, 1, 300);

    /* renamed from: d, reason: collision with root package name */
    public static final x f40844d = new x("WrapperTimeout", 2, 301);

    /* renamed from: e, reason: collision with root package name */
    public static final x f40845e = new x("WrapperLimit", 3, 302);

    /* renamed from: f, reason: collision with root package name */
    public static final x f40846f = new x("WrapperNoAds", 4, 303);

    /* renamed from: g, reason: collision with root package name */
    public static final x f40847g = new x(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.f40343s, 5, Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE);

    /* renamed from: h, reason: collision with root package name */
    public static final x f40848h = new x("LinearFileNotFound", 6, TTAdConstant.MATE_IS_NULL_CODE);

    /* renamed from: i, reason: collision with root package name */
    public static final x f40849i = new x("LinearNotSupportedMedia", 7, TTAdConstant.DEEPLINK_UNAVAILABLE_CODE);

    /* renamed from: j, reason: collision with root package name */
    public static final x f40850j = new x(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, 8, 600);

    /* renamed from: k, reason: collision with root package name */
    public static final x f40851k = new x("Undefined", 9, 900);

    /* renamed from: l, reason: collision with root package name */
    public static final /* synthetic */ x[] f40852l;

    /* renamed from: m, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f40853m;

    /* renamed from: a, reason: collision with root package name */
    public final int f40854a;

    static {
        x[] xVarArrA = a();
        f40852l = xVarArrA;
        f40853m = EnumEntriesKt.a(xVarArrA);
    }

    public x(String str, int i5, int i11) {
        this.f40854a = i11;
    }

    public static final /* synthetic */ x[] a() {
        return new x[]{f40842b, f40843c, f40844d, f40845e, f40846f, f40847g, f40848h, f40849i, f40850j, f40851k};
    }

    @NotNull
    public static EnumEntries<x> b() {
        return f40853m;
    }

    public static x valueOf(String str) {
        return (x) Enum.valueOf(x.class, str);
    }

    public static x[] values() {
        return (x[]) f40852l.clone();
    }

    public final int c() {
        return this.f40854a;
    }
}
