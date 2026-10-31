package com.google.android.gms.internal.measurement;

import java.lang.reflect.Method;

/* loaded from: classes3.dex */
public abstract class te {

    /* renamed from: a, reason: collision with root package name */
    public static final Method f33085a;

    static {
        Method method = null;
        try {
            try {
                Class<?> cls = Class.forName("android.os.SystemProperties");
                method = cls.getMethod("get", String.class, String.class);
                cls.getMethod("getInt", String.class, Integer.TYPE);
                cls.getMethod("getLong", String.class, Long.TYPE);
                cls.getMethod("getBoolean", String.class, Boolean.TYPE);
            } catch (Exception e3) {
                e3.printStackTrace();
            }
        } finally {
            f33085a = method;
        }
    }
}
