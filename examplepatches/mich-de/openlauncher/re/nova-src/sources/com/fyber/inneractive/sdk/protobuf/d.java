package com.fyber.inneractive.sdk.protobuf;

/* loaded from: classes.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final Class f30780a;

    /* renamed from: b, reason: collision with root package name */
    public static final boolean f30781b;

    static {
        Class<?> cls;
        Class<?> cls2 = null;
        try {
            cls = Class.forName("libcore.io.Memory");
        } catch (Throwable unused) {
            cls = null;
        }
        f30780a = cls;
        try {
            cls2 = Class.forName("org.robolectric.Robolectric");
        } catch (Throwable unused2) {
        }
        f30781b = cls2 != null;
    }

    public static boolean a() {
        return (f30780a == null || f30781b) ? false : true;
    }
}
