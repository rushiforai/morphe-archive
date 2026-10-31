package n8;

import ab.e0;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;

/* loaded from: classes.dex */
public final class p implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78005a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ w70.n f78006b;

    public /* synthetic */ p(w70.n nVar, int i5) {
        this.f78005a = i5;
        this.f78006b = nVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0018  */
    @Override // w70.n
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object emit(Object obj, Continuation continuation) {
        o oVar;
        y8.f fVar;
        tz.j jVar;
        switch (this.f78005a) {
            case 0:
                if (continuation instanceof o) {
                    oVar = (o) continuation;
                    int i5 = oVar.f78003u;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        oVar.f78003u = i5 - Integer.MIN_VALUE;
                    } else {
                        oVar = new o(this, continuation);
                    }
                }
                Object obj2 = oVar.f78002t;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = oVar.f78003u;
                if (i11 == 0) {
                    ResultKt.b(obj2);
                    long j11 = ((y3.a) obj).f96596a;
                    int i12 = (int) (3 & j11);
                    int i13 = (((i12 & 2) >> 1) * 3) + ((i12 & 1) << 1);
                    if (((((int) (j11 >> 33)) & ((1 << (i13 + 13)) - 1)) - 1 == 0) || ((((1 << (18 - i13)) - 1) & ((int) (j11 >> (i13 + 46)))) - 1 == 0)) {
                        fVar = null;
                    } else {
                        boolean zD = y3.a.d(j11);
                        v4.a aVar = y8.b.f96840d;
                        v4.a aVar2 = zD ? new y8.a(y3.a.h(j11)) : aVar;
                        if (y3.a.c(j11)) {
                            aVar = new y8.a(y3.a.g(j11));
                        }
                        fVar = new y8.f(aVar2, aVar);
                    }
                    if (fVar != null) {
                        oVar.f78003u = 1;
                        if (this.f78006b.emit(fVar, oVar) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj2);
                }
                return Unit.f71706a;
            default:
                if (continuation instanceof tz.j) {
                    jVar = (tz.j) continuation;
                    int i14 = jVar.f90133u;
                    if ((i14 & Integer.MIN_VALUE) != 0) {
                        jVar.f90133u = i14 - Integer.MIN_VALUE;
                    } else {
                        jVar = new tz.j(this, continuation);
                    }
                }
                Object obj3 = jVar.f90132t;
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i15 = jVar.f90133u;
                if (i15 == 0) {
                    ResultKt.b(obj3);
                    tz.w wVarJ = e0.j((g30.c) obj);
                    jVar.f90133u = 1;
                    if (this.f78006b.emit(wVarJ, jVar) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i15 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj3);
                }
                return Unit.f71706a;
        }
    }
}
