package com.moloco.sdk.internal.mediators;

import com.google.ads.mediation.moloco.MolocoMediationAdapter;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f36593a = new a("MAX", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final a f36594b = new a("LevelPlay", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final a f36595c = new a("X3MADS", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final a f36596d = new a(MolocoMediationAdapter.MEDIATION_PLATFORM_NAME, 3);

    /* renamed from: e, reason: collision with root package name */
    public static final a f36597e = new a("Custom_MAX", 4);

    /* renamed from: f, reason: collision with root package name */
    public static final a f36598f = new a("Custom_LevelPlay", 5);

    /* renamed from: g, reason: collision with root package name */
    public static final a f36599g = new a("Custom_AdMob", 6);

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ a[] f36600h;

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f36601i;

    static {
        a[] aVarArrA = a();
        f36600h = aVarArrA;
        f36601i = EnumEntriesKt.a(aVarArrA);
    }

    public a(String str, int i5) {
    }

    public static final /* synthetic */ a[] a() {
        return new a[]{f36593a, f36594b, f36595c, f36596d, f36597e, f36598f, f36599g};
    }

    @NotNull
    public static EnumEntries<a> b() {
        return f36601i;
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f36600h.clone();
    }
}
