package com.amplitude;

import androidx.compose.ui.Modifier$Node;
import java.lang.reflect.Field;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.d1, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0423d1 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public static final C0423d1 f20523a = new C0423d1();

    public C0423d1() {
        super(0);
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        try {
            Field declaredField = Modifier$Node.class.getDeclaredField("kindSet");
            declaredField.setAccessible(true);
            return declaredField;
        } catch (Throwable unused) {
            return null;
        }
    }
}
