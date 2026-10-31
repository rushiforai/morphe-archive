package io.ktor.utils.io;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class o0 implements j0 {

    /* renamed from: b, reason: collision with root package name */
    public final m f66624b;

    /* renamed from: c, reason: collision with root package name */
    public final c0.g0 f66625c;

    public o0(m mVar, c0.g0 g0Var) {
        this.f66624b = mVar;
        this.f66625c = g0Var;
    }

    @Override // io.ktor.utils.io.j0
    public final void a(Throwable th2) {
        this.f66624b.a(th2);
    }

    @Override // io.ktor.utils.io.j0
    public final Throwable b() {
        return this.f66624b.b();
    }

    @Override // io.ktor.utils.io.j0
    public final Object c(ContinuationImpl continuationImpl) {
        return this.f66624b.c(continuationImpl);
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x004c, code lost:
    
        if (r5.f66625c.invoke(r0) == r1) goto L21;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // io.ktor.utils.io.j0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) {
        n0 n0Var;
        if (continuation instanceof n0) {
            n0Var = (n0) continuation;
            int i5 = n0Var.f66620v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                n0Var.f66620v = i5 - Integer.MIN_VALUE;
            } else {
                n0Var = new n0(this, continuation);
            }
        }
        Object obj = n0Var.f66618t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = n0Var.f66620v;
        if (i11 == 0) {
            ResultKt.b(obj);
            n0Var.f66620v = 1;
            if (this.f66624b.d(n0Var) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        ResultKt.b(obj);
        n0Var.f66620v = 2;
    }

    @Override // io.ktor.utils.io.j0
    public final e80.j e() {
        return this.f66624b.e();
    }
}
