package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public static final j f42118a = new j("VAST", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final j f42119b = new j("MRAID", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final j f42120c = new j("STATIC", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final j f42121d = new j("TEMPLATE_VAST", 3);

    /* renamed from: e, reason: collision with root package name */
    public static final j f42122e = new j("TEMPLATE_MRAID", 4);

    /* renamed from: f, reason: collision with root package name */
    public static final j f42123f = new j("TEMPLATE_STATIC", 5);

    /* renamed from: g, reason: collision with root package name */
    public static final j f42124g = new j("UNKNOWN", 6);

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ j[] f42125h;

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f42126i;

    static {
        j[] jVarArrA = a();
        f42125h = jVarArrA;
        f42126i = EnumEntriesKt.a(jVarArrA);
    }

    public j(String str, int i5) {
    }

    public static final /* synthetic */ j[] a() {
        return new j[]{f42118a, f42119b, f42120c, f42121d, f42122e, f42123f, f42124g};
    }

    @NotNull
    public static EnumEntries<j> b() {
        return f42126i;
    }

    public static j valueOf(String str) {
        return (j) Enum.valueOf(j.class, str);
    }

    public static j[] values() {
        return (j[]) f42125h.clone();
    }
}
