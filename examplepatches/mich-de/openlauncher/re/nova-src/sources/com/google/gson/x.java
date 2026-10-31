package com.google.gson;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public abstract class x {

    /* renamed from: a, reason: collision with root package name */
    public static final v f34798a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ x[] f34799b;

    static {
        v vVar = new v();
        f34798a = vVar;
        f34799b = new x[]{vVar, new x() { // from class: com.google.gson.w
        }};
    }

    public static x valueOf(String str) {
        return (x) Enum.valueOf(x.class, str);
    }

    public static x[] values() {
        return (x[]) f34799b.clone();
    }
}
