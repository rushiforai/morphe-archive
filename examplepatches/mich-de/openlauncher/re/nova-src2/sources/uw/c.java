package uw;

import java.util.List;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function0;
import t70.q1;
import t70.r1;
import w70.g2;
import w70.m;
import w70.n;
import w70.u1;

/* loaded from: classes4.dex */
public final class c implements g2 {

    /* renamed from: a, reason: collision with root package name */
    public final m f91585a;

    /* renamed from: b, reason: collision with root package name */
    public final Function0 f91586b;

    public c(m mVar, Function0 function0) {
        this.f91585a = mVar;
        this.f91586b = function0;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // w70.m
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object collect(n nVar, Continuation continuation) {
        b bVar;
        r1 r1Var;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f91584w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f91584w = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, continuation);
            }
        }
        Object obj = bVar.f91582u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f91584w;
        if (i11 == 0) {
            ResultKt.b(obj);
            r1 r1Var2 = (r1) bVar.getContext().get(q1.f88853a);
            m mVarK = u1.k(this.f91585a);
            bVar.f91581t = r1Var2;
            bVar.f91584w = 1;
            if (mVarK.collect(nVar, bVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            r1Var = r1Var2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            r1Var = bVar.f91581t;
            ResultKt.b(obj);
        }
        while (true) {
            if (r1Var != null && !r1Var.b()) {
                throw r1Var.h();
            }
        }
    }

    @Override // w70.q1
    public final List getReplayCache() {
        return ul.b.P(this.f91586b.invoke());
    }

    @Override // w70.g2
    public final Object getValue() {
        return this.f91586b.invoke();
    }
}
