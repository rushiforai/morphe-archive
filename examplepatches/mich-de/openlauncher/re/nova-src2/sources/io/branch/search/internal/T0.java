package io.branch.search.internal;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class T0 extends Lambda implements Function0<Long> {

    /* renamed from: a, reason: collision with root package name */
    public static final T0 f63364a = new T0();

    public T0() {
        super(0);
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return Long.valueOf(System.currentTimeMillis());
    }
}
