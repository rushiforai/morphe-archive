package com.moloco.sdk.internal.ilrd.model;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f36551a = new a("MAX", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final a f36552b = new a("LEVELPLAY", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ a[] f36553c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f36554d;

    static {
        a[] aVarArrA = a();
        f36553c = aVarArrA;
        f36554d = EnumEntriesKt.a(aVarArrA);
    }

    public a(String str, int i5) {
    }

    public static final /* synthetic */ a[] a() {
        return new a[]{f36551a, f36552b};
    }

    @NotNull
    public static EnumEntries<a> b() {
        return f36554d;
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f36553c.clone();
    }
}
