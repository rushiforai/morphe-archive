package s10;

import android.content.Context;
import java.io.Serializable;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import mx.g0;
import t70.q0;

/* loaded from: classes4.dex */
public final class m implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f86614a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f86615b;

    /* renamed from: c, reason: collision with root package name */
    public final d0 f86616c;

    public m(int i5) {
        this.f86614a = i5;
        switch (i5) {
            case 1:
                Context context = g0.f77088a;
                this.f86616c = g0.d();
                break;
            default:
                Context context2 = g0.f77088a;
                this.f86616c = g0.d();
                break;
        }
    }

    @Override // r10.q0
    public final Object a(String str, Continuation continuation) {
        switch (this.f86614a) {
        }
        return ps.v.x(this, str, (SuspendLambda) continuation);
    }

    @Override // s10.f0
    public final Serializable b(q0 q0Var, SuspendLambda suspendLambda) {
        switch (this.f86614a) {
            case 0:
                return this.f86616c.f(q0Var, ul.b.P("related_apps"), new i(2), suspendLambda);
            default:
                return this.f86616c.f(q0Var, ul.b.P("search_more"), new i(2), suspendLambda);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0067  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0018  */
    @Override // r10.q0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(a7.f fVar, Continuation continuation) {
        l lVar;
        m mVar;
        n nVar;
        m mVar2;
        switch (this.f86614a) {
            case 0:
                if (continuation instanceof l) {
                    lVar = (l) continuation;
                    int i5 = lVar.f86613w;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        lVar.f86613w = i5 - Integer.MIN_VALUE;
                    } else {
                        lVar = new l(this, (ContinuationImpl) continuation);
                    }
                }
                Object objE = lVar.f86611u;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = lVar.f86613w;
                if (i11 == 0) {
                    ResultKt.b(objE);
                    lVar.f86610t = this;
                    lVar.f86613w = 1;
                    objE = this.f86616c.e(lVar);
                    if (objE == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    mVar = this;
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    mVar = lVar.f86610t;
                    ResultKt.b(objE);
                }
                mVar.f86615b = ((Boolean) objE).booleanValue();
                return Unit.f71706a;
            default:
                if (continuation instanceof n) {
                    nVar = (n) continuation;
                    int i12 = nVar.f86620w;
                    if ((i12 & Integer.MIN_VALUE) != 0) {
                        nVar.f86620w = i12 - Integer.MIN_VALUE;
                    } else {
                        nVar = new n(this, (ContinuationImpl) continuation);
                    }
                }
                Object objE2 = nVar.f86618u;
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i13 = nVar.f86620w;
                if (i13 == 0) {
                    ResultKt.b(objE2);
                    nVar.f86617t = this;
                    nVar.f86620w = 1;
                    objE2 = this.f86616c.e(nVar);
                    if (objE2 == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                    mVar2 = this;
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    mVar2 = nVar.f86617t;
                    ResultKt.b(objE2);
                }
                mVar2.f86615b = ((Boolean) objE2).booleanValue();
                return Unit.f71706a;
        }
    }

    @Override // r10.q0
    public final boolean d() {
        switch (this.f86614a) {
        }
        return false;
    }

    @Override // r10.q0
    public final boolean e() {
        switch (this.f86614a) {
        }
        return false;
    }

    @Override // r10.q0
    public final int f() {
        switch (this.f86614a) {
            case 0:
                return 9;
            default:
                return 10;
        }
    }

    @Override // r10.q0
    public final String getName() {
        switch (this.f86614a) {
            case 0:
                return "BranchRelatedApps";
            default:
                return "BranchSearchMore";
        }
    }

    @Override // r10.q0
    public final boolean isReady() {
        switch (this.f86614a) {
        }
        return this.f86615b;
    }
}
