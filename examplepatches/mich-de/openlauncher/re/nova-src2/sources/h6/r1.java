package h6;

import androidx.lifecycle.LifecycleDestroyedException;
import kotlin.Result;
import kotlin.ResultKt;

/* loaded from: classes2.dex */
public final class r1 implements y {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ u f59430a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t70.m f59431b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ cw.y0 f59432c;

    public r1(u uVar, t70.m mVar, cw.y0 y0Var) {
        t tVar = t.f59440a;
        this.f59430a = uVar;
        this.f59431b = mVar;
        this.f59432c = y0Var;
    }

    @Override // h6.y
    public final void d(a0 a0Var, s sVar) {
        Object objA;
        q qVar = s.Companion;
        t tVar = t.f59444e;
        qVar.getClass();
        s sVarB = q.b(tVar);
        t70.m mVar = this.f59431b;
        u uVar = this.f59430a;
        if (sVar != sVarB) {
            if (sVar == s.ON_DESTROY) {
                uVar.c(this);
                int i5 = Result.f71687b;
                mVar.resumeWith(ResultKt.a(new LifecycleDestroyedException()));
                return;
            }
            return;
        }
        uVar.c(this);
        cw.y0 y0Var = this.f59432c;
        try {
            int i11 = Result.f71687b;
            objA = y0Var.invoke();
        } catch (Throwable th2) {
            int i12 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        mVar.resumeWith(objA);
    }
}
