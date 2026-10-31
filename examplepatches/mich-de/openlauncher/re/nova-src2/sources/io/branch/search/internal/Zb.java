package io.branch.search.internal;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class Zb extends Lambda implements Function1<Wb, CharSequence> {

    /* renamed from: a, reason: collision with root package name */
    public static final Zb f63830a = new Zb();

    public Zb() {
        super(1);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Wb it = (Wb) obj;
        Intrinsics.g(it, "it");
        return "'" + it + '\'';
    }
}
