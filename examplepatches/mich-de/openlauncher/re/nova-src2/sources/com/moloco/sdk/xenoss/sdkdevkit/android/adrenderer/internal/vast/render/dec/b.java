package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.dec;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public static final b f41615a = new b("DisplayStarted", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final b f41616b = new b(k.A, 1);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ b[] f41617c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f41618d;

    static {
        b[] bVarArrA = a();
        f41617c = bVarArrA;
        f41618d = EnumEntriesKt.a(bVarArrA);
    }

    public b(String str, int i5) {
    }

    public static final /* synthetic */ b[] a() {
        return new b[]{f41615a, f41616b};
    }

    @NotNull
    public static EnumEntries<b> b() {
        return f41618d;
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f41617c.clone();
    }
}
