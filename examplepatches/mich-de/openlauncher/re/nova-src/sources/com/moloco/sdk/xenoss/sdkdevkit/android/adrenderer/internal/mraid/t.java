package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid;

import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class t {

    /* renamed from: b, reason: collision with root package name */
    public static final t f39195b = new t("Loading", 0, "loading");

    /* renamed from: c, reason: collision with root package name */
    public static final t f39196c = new t("Default", 1, CarrierConfigurator.APN_TYPE);

    /* renamed from: d, reason: collision with root package name */
    public static final t f39197d = new t("Resized", 2, "resized");

    /* renamed from: e, reason: collision with root package name */
    public static final t f39198e = new t("Expanded", 3, "expanded");

    /* renamed from: f, reason: collision with root package name */
    public static final t f39199f = new t("Hidden", 4, "hidden");

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ t[] f39200g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f39201h;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f39202a;

    static {
        t[] tVarArrA = a();
        f39200g = tVarArrA;
        f39201h = EnumEntriesKt.a(tVarArrA);
    }

    public t(String str, int i5, String str2) {
        this.f39202a = str2;
    }

    public static final /* synthetic */ t[] a() {
        return new t[]{f39195b, f39196c, f39197d, f39198e, f39199f};
    }

    @NotNull
    public static EnumEntries<t> b() {
        return f39201h;
    }

    public static t valueOf(String str) {
        return (t) Enum.valueOf(t.class, str);
    }

    public static t[] values() {
        return (t[]) f39200g.clone();
    }

    @NotNull
    public final String c() {
        return this.f39202a;
    }
}
