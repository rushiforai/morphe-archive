package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class r {

    /* renamed from: b, reason: collision with root package name */
    public static final r f39180b = new r("Inline", 0, "inline");

    /* renamed from: c, reason: collision with root package name */
    public static final r f39181c = new r("Interstitial", 1, "interstitial");

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ r[] f39182d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f39183e;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f39184a;

    static {
        r[] rVarArrA = a();
        f39182d = rVarArrA;
        f39183e = EnumEntriesKt.a(rVarArrA);
    }

    public r(String str, int i5, String str2) {
        this.f39184a = str2;
    }

    public static final /* synthetic */ r[] a() {
        return new r[]{f39180b, f39181c};
    }

    @NotNull
    public static EnumEntries<r> b() {
        return f39183e;
    }

    public static r valueOf(String str) {
        return (r) Enum.valueOf(r.class, str);
    }

    public static r[] values() {
        return (r[]) f39182d.clone();
    }

    @NotNull
    public final String c() {
        return this.f39184a;
    }
}
