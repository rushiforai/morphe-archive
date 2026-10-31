package s10;

import android.content.Context;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import mx.g0;
import r10.q0;

/* loaded from: classes4.dex */
public final class f implements q0 {

    /* renamed from: a, reason: collision with root package name */
    public boolean f86595a;

    /* renamed from: b, reason: collision with root package name */
    public final d0 f86596b;

    public f() {
        Context context = g0.f77088a;
        this.f86596b = g0.d();
    }

    @Override // r10.q0
    public final Object a(String str, Continuation continuation) {
        return this.f86596b.d(str, new i(1), (ContinuationImpl) continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // r10.q0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(a7.f fVar, Continuation continuation) {
        e eVar;
        f fVar2;
        if (continuation instanceof e) {
            eVar = (e) continuation;
            int i5 = eVar.f86594w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f86594w = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(this, (ContinuationImpl) continuation);
            }
        }
        Object objE = eVar.f86592u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f86594w;
        if (i11 == 0) {
            ResultKt.b(objE);
            eVar.f86591t = this;
            eVar.f86594w = 1;
            objE = this.f86596b.e(eVar);
            if (objE == coroutineSingletons) {
                return coroutineSingletons;
            }
            fVar2 = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            fVar2 = eVar.f86591t;
            ResultKt.b(objE);
        }
        fVar2.f86595a = ((Boolean) objE).booleanValue();
        return Unit.f71706a;
    }

    @Override // r10.q0
    public final boolean d() {
        return false;
    }

    @Override // r10.q0
    public final boolean e() {
        return false;
    }

    @Override // r10.q0
    public final int f() {
        return 8;
    }

    @Override // r10.q0
    public final String getName() {
        return "BranchAppStore";
    }

    @Override // r10.q0
    public final boolean isReady() {
        return this.f86595a;
    }
}
