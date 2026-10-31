package t0;

import androidx.compose.ui.text.input.ImeOptions;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;

/* loaded from: classes.dex */
public final class x implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f88265a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f88266b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f88267c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f88268d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f88269e;

    public /* synthetic */ x(Object obj, Object obj2, Object obj3, Object obj4, int i5) {
        this.f88265a = i5;
        this.f88266b = obj;
        this.f88267c = obj2;
        this.f88268d = obj3;
        this.f88269e = obj4;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(w70.m mVar, Continuation continuation) {
        x70.e eVar;
        x xVar;
        if (continuation instanceof x70.e) {
            eVar = (x70.e) continuation;
            int i5 = eVar.f95226x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f95226x = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new x70.e(this, continuation);
            }
        }
        Object obj = eVar.f95224v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f95226x;
        if (i11 == 0) {
            ResultKt.b(obj);
            t70.r1 r1Var = (t70.r1) this.f88266b;
            if (r1Var != null && !r1Var.b()) {
                throw r1Var.h();
            }
            c80.j jVar = (c80.j) this.f88267c;
            eVar.f95222t = this;
            eVar.f95223u = mVar;
            eVar.f95226x = 1;
            if (jVar.a(eVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            xVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            mVar = eVar.f95223u;
            xVar = eVar.f95222t;
            ResultKt.b(obj);
        }
        t70.m0.t((v70.x) xVar.f88268d, null, null, new b0.b0(mVar, (x70.y) xVar.f88269e, (c80.j) xVar.f88267c, (Continuation) null, 26), 3);
        return Unit.f71706a;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        switch (this.f88265a) {
            case 0:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                e1.a1 a1Var = (e1.a1) this.f88268d;
                y0 y0Var = (y0) this.f88266b;
                if (zBooleanValue && y0Var.b()) {
                    t0.s((r3.a0) this.f88267c, y0Var, a1Var.o(), (ImeOptions) this.f88269e, a1Var.f51230b);
                } else {
                    t0.q(y0Var);
                }
                return Unit.f71706a;
            default:
                return a((w70.m) obj, continuation);
        }
    }
}
