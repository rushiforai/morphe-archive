package h50;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class e1 implements o1 {

    /* renamed from: a, reason: collision with root package name */
    public final Function3 f59179a;

    /* renamed from: b, reason: collision with root package name */
    public final o1 f59180b;

    public e1(Function3 interceptor, o1 o1Var) {
        Intrinsics.g(interceptor, "interceptor");
        this.f59179a = interceptor;
        this.f59180b = o1Var;
    }

    @Override // h50.o1
    public final Object a(k50.c cVar, ContinuationImpl continuationImpl) {
        return this.f59179a.invoke(this.f59180b, cVar, continuationImpl);
    }
}
