package io.branch.search.internal;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.oa, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3301oa extends Lambda implements Function1<String, CharSequence> {

    /* renamed from: a, reason: collision with root package name */
    public static final C3301oa f65432a = new C3301oa();

    public C3301oa() {
        super(1);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        String it = (String) obj;
        Intrinsics.g(it, "it");
        return it;
    }
}
