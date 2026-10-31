package io.branch.search.internal;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class X9 extends Lambda implements Function1<u40.a, CharSequence> {

    /* renamed from: a, reason: collision with root package name */
    public static final X9 f63668a = new X9();

    public X9() {
        super(1);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        u40.a it = (u40.a) obj;
        Intrinsics.g(it, "it");
        return it.toString();
    }
}
