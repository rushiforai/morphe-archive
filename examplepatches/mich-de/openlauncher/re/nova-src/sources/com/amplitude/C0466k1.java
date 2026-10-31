package com.amplitude;

import java.lang.reflect.Field;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.k1, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0466k1 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public static final C0466k1 f20649a = new C0466k1();

    public C0466k1() {
        super(0);
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        Class cls = (Class) AbstractC0472l1.f20656a.getValue();
        if (cls == null) {
            return null;
        }
        try {
            Field declaredField = cls.getDeclaredField("head");
            declaredField.setAccessible(true);
            return declaredField;
        } catch (Throwable unused) {
            return null;
        }
    }
}
