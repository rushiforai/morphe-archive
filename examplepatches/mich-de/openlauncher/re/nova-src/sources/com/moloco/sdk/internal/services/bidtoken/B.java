package com.moloco.sdk.internal.services.bidtoken;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class B {

    /* renamed from: a, reason: collision with root package name */
    public static final B f37662a = new B("NEEDS_REFRESH", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final B f37663b = new B("EXPIRING", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final B f37664c = new B("NO_REFRESH_NEEDED", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ B[] f37665d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f37666e;

    static {
        B[] bArrA = a();
        f37665d = bArrA;
        f37666e = EnumEntriesKt.a(bArrA);
    }

    public B(String str, int i5) {
    }

    public static final /* synthetic */ B[] a() {
        return new B[]{f37662a, f37663b, f37664c};
    }

    @NotNull
    public static EnumEntries<B> c() {
        return f37666e;
    }

    public static B valueOf(String str) {
        return (B) Enum.valueOf(B.class, str);
    }

    public static B[] values() {
        return (B[]) f37665d.clone();
    }

    public final boolean b() {
        return this == f37663b || this == f37664c;
    }
}
