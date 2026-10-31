package io.branch.search.internal;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class Z9 extends Lambda implements Function1<String, CharSequence> {

    /* renamed from: a, reason: collision with root package name */
    public static final Z9 f63829a = new Z9();

    public Z9() {
        super(1);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        String it = (String) obj;
        Intrinsics.g(it, "it");
        return it;
    }
}
