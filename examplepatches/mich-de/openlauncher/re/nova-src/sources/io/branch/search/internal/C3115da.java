package io.branch.search.internal;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.da, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3115da extends Lambda implements Function1<u40.a, CharSequence> {

    /* renamed from: a, reason: collision with root package name */
    public static final C3115da f64291a = new C3115da();

    public C3115da() {
        super(1);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        u40.a it = (u40.a) obj;
        Intrinsics.g(it, "it");
        return it.toString();
    }
}
