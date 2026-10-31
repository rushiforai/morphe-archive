package com.bytedance.sdk.component.utils;

import android.content.Context;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public class av {
    private static final HashMap<Class<?>, Class<?>> sya;
    public static final Class<?>[] ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static Map<String, Method> f24098zb = new HashMap();

    static {
        HashMap<Class<?>, Class<?>> map = new HashMap<>();
        sya = map;
        map.put(Boolean.TYPE, Boolean.class);
        map.put(Byte.TYPE, Byte.class);
        map.put(Character.TYPE, Character.class);
        map.put(Short.TYPE, Short.class);
        map.put(Integer.TYPE, Integer.class);
        map.put(Long.TYPE, Long.class);
        map.put(Double.TYPE, Double.class);
        map.put(Float.TYPE, Float.class);
        map.put(Void.TYPE, Void.class);
        ycx = new Class[0];
    }

    public static int ycx(Context context, float f11) {
        return (int) ((f11 * context.getResources().getDisplayMetrics().density) + 0.5f);
    }

    public static int ycx(Context context) {
        return context.getResources().getDisplayMetrics().widthPixels;
    }
}
