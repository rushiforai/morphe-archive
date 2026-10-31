package com.moloco.sdk.acm;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public static final f f36123a = new f("INITIALIZED", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final f f36124b = new f("INITIALIZING", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final f f36125c = new f("UNINITIALIZED", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ f[] f36126d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f36127e;

    static {
        f[] fVarArrA = a();
        f36126d = fVarArrA;
        f36127e = EnumEntriesKt.a(fVarArrA);
    }

    public f(String str, int i5) {
    }

    public static final /* synthetic */ f[] a() {
        return new f[]{f36123a, f36124b, f36125c};
    }

    @NotNull
    public static EnumEntries<f> b() {
        return f36127e;
    }

    public static f valueOf(String str) {
        return (f) Enum.valueOf(f.class, str);
    }

    public static f[] values() {
        return (f[]) f36126d.clone();
    }
}
