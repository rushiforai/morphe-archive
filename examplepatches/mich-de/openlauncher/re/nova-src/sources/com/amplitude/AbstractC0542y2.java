package com.amplitude;

import java.lang.reflect.Method;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.y2, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public abstract class AbstractC0542y2 {
    public static Method a(Class cls, Class... paramTypes) {
        Intrinsics.g(cls, "<this>");
        Intrinsics.g(paramTypes, "paramTypes");
        try {
            Method declaredMethod = cls.getDeclaredMethod("getRoot", (Class[]) Arrays.copyOf(paramTypes, paramTypes.length));
            declaredMethod.setAccessible(true);
            return declaredMethod;
        } catch (Throwable unused) {
            return null;
        }
    }
}
