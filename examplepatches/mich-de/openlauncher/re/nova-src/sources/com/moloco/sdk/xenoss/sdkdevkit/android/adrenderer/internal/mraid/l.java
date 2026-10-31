package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public static final l f39136a = new l("SkipOrClose", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final l f39137b = new l(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.A, 1);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ l[] f39138c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f39139d;

    static {
        l[] lVarArrA = a();
        f39138c = lVarArrA;
        f39139d = EnumEntriesKt.a(lVarArrA);
    }

    public l(String str, int i5) {
    }

    public static final /* synthetic */ l[] a() {
        return new l[]{f39136a, f39137b};
    }

    @NotNull
    public static EnumEntries<l> b() {
        return f39139d;
    }

    public static l valueOf(String str) {
        return (l) Enum.valueOf(l.class, str);
    }

    public static l[] values() {
        return (l[]) f39138c.clone();
    }
}
