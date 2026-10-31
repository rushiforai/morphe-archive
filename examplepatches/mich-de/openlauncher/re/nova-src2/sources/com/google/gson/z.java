package com.google.gson;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class z {

    /* renamed from: a, reason: collision with root package name */
    public static final z f34800a;

    /* renamed from: b, reason: collision with root package name */
    public static final z f34801b;

    /* renamed from: c, reason: collision with root package name */
    public static final z f34802c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ z[] f34803d;

    static {
        z zVar = new z("LENIENT", 0);
        f34800a = zVar;
        z zVar2 = new z("LEGACY_STRICT", 1);
        f34801b = zVar2;
        z zVar3 = new z("STRICT", 2);
        f34802c = zVar3;
        f34803d = new z[]{zVar, zVar2, zVar3};
    }

    public static z valueOf(String str) {
        return (z) Enum.valueOf(z.class, str);
    }

    public static z[] values() {
        return (z[]) f34803d.clone();
    }
}
