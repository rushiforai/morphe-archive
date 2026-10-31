package com.moloco.sdk.internal.services.init;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public static final b f38007a = new b("RequestTimeout", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final b f38008b = new b("UnknownHostHttpError", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final b f38009c = new b("HttpSocketError", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final b f38010d = new b("HttpSslError", 3);

    /* renamed from: e, reason: collision with root package name */
    public static final b f38011e = new b("PersistentHttpUnavailableError", 4);

    /* renamed from: f, reason: collision with root package name */
    public static final b f38012f = new b("Unknown", 5);

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ b[] f38013g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f38014h;

    static {
        b[] bVarArrA = a();
        f38013g = bVarArrA;
        f38014h = EnumEntriesKt.a(bVarArrA);
    }

    public b(String str, int i5) {
    }

    public static final /* synthetic */ b[] a() {
        return new b[]{f38007a, f38008b, f38009c, f38010d, f38011e, f38012f};
    }

    @NotNull
    public static EnumEntries<b> b() {
        return f38014h;
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f38013g.clone();
    }
}
