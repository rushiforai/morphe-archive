package com.amplitude;

import androidx.compose.ui.Modifier$Node;
import java.lang.reflect.Field;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.h1, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0447h1 extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public static final C0447h1 f20593a = new C0447h1();

    public C0447h1() {
        super(1);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Modifier$Node it = (Modifier$Node) obj;
        Intrinsics.g(it, "it");
        try {
            Field field = (Field) AbstractC0472l1.f20658c.getValue();
            Object obj2 = field != null ? field.get(it) : null;
            if (obj2 instanceof Modifier$Node) {
                return (Modifier$Node) obj2;
            }
        } catch (Throwable unused) {
        }
        return null;
    }
}
