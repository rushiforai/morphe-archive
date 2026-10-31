package com.amplitude;

import java.util.concurrent.atomic.AtomicInteger;
import kotlin.Lazy;
import kotlin.LazyKt;

/* renamed from: com.amplitude.n1, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public abstract class AbstractC0484n1 {

    /* renamed from: a, reason: collision with root package name */
    public static final Lazy f20679a = LazyKt.a(C0478m1.f20666a);

    public static int a() {
        return ((AtomicInteger) f20679a.getValue()).incrementAndGet();
    }
}
