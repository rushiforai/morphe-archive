package com.moloco.sdk.internal.services;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class z {

    /* renamed from: a, reason: collision with root package name */
    public static final z f38176a = new z("SILENT", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final z f38177b = new z("VIBRATE", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final z f38178c = new z("NORMAL", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ z[] f38179d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f38180e;

    static {
        z[] zVarArrA = a();
        f38179d = zVarArrA;
        f38180e = EnumEntriesKt.a(zVarArrA);
    }

    public z(String str, int i5) {
    }

    public static final /* synthetic */ z[] a() {
        return new z[]{f38176a, f38177b, f38178c};
    }

    @NotNull
    public static EnumEntries<z> b() {
        return f38180e;
    }

    public static z valueOf(String str) {
        return (z) Enum.valueOf(z.class, str);
    }

    public static z[] values() {
        return (z[]) f38179d.clone();
    }
}
