package io.branch.search.internal;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.n0, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3274n0 extends Lambda implements Function1<Ta, CharSequence> {

    /* renamed from: a, reason: collision with root package name */
    public static final C3274n0 f65297a = new C3274n0();

    public C3274n0() {
        super(1);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Ta it = (Ta) obj;
        Intrinsics.g(it, "it");
        return it.b();
    }
}
