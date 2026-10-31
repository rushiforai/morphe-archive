package com.amplitude;

import androidx.compose.ui.node.DelegatingNode;
import java.lang.reflect.Field;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.c1, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0393c1 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public static final C0393c1 f20507a = new C0393c1();

    public C0393c1() {
        super(0);
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        try {
            Field declaredField = DelegatingNode.class.getDeclaredField("delegate");
            declaredField.setAccessible(true);
            return declaredField;
        } catch (Throwable unused) {
            return null;
        }
    }
}
