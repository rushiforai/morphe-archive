package com.amplitude;

import java.lang.reflect.Field;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class T0 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public static final T0 f20386a = new T0();

    public T0() {
        super(0);
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        Class cls = (Class) V0.f20401a.getValue();
        if (cls == null) {
            return null;
        }
        try {
            Field declaredField = cls.getDeclaredField("nodes");
            declaredField.setAccessible(true);
            return declaredField;
        } catch (Throwable unused) {
            return null;
        }
    }
}
