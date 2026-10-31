package gy;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class w0 implements g0.l0 {

    /* renamed from: a, reason: collision with root package name */
    public final f1 f58564a;

    /* renamed from: b, reason: collision with root package name */
    public final p1.e1 f58565b = androidx.compose.runtime.d.k(Boolean.FALSE);

    /* renamed from: c, reason: collision with root package name */
    public final f1.w f58566c = new f1.w(this, 2);

    /* renamed from: d, reason: collision with root package name */
    public final e0.j1 f58567d = new e0.j1();

    public w0(f1 f1Var) {
        this.f58564a = f1Var;
    }

    @Override // g0.l0
    public final void a(float f11) {
        this.f58564a.invoke(Float.valueOf(f11));
    }

    @Override // g0.l0
    public final Object b(e0.f1 f1Var, Function2 function2, ContinuationImpl continuationImpl) {
        Object objD = t70.k0.d(new dm.c(this, f1Var, function2, (Continuation) null), continuationImpl);
        return objD == CoroutineSingletons.f71806a ? objD : Unit.f71706a;
    }
}
