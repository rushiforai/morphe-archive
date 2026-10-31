package io.branch.search.internal;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class O2 extends Lambda implements Function0<String> {

    /* renamed from: a, reason: collision with root package name */
    public static final O2 f63004a = new O2();

    public O2() {
        super(0);
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return b.c0.j("randomUUID().toString()");
    }
}
