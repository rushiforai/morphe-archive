package n8;

import b0.b0;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import t70.h2;
import w70.n1;

/* loaded from: classes.dex */
public final class q implements w70.m {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78007a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f78008b;

    public /* synthetic */ q(Object obj, int i5) {
        this.f78007a = i5;
        this.f78008b = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0049  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0096  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:29:0x0091 -> B:31:0x0094). Please report as a decompilation issue!!! */
    @Override // w70.m
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object collect(w70.n nVar, Continuation continuation) {
        w70.p pVar;
        int i5;
        w70.n nVar2;
        int length;
        q qVar;
        switch (this.f78007a) {
            case 0:
                Object objCollect = ((w70.m) this.f78008b).collect(new p(nVar, 0), continuation);
                return objCollect == CoroutineSingletons.f71806a ? objCollect : Unit.f71706a;
            case 1:
                Object objCollect2 = ((n1) this.f78008b).f93963a.collect(new p(nVar, 1), continuation);
                return objCollect2 == CoroutineSingletons.f71806a ? objCollect2 : Unit.f71706a;
            case 2:
                if (continuation instanceof w70.p) {
                    pVar = (w70.p) continuation;
                    int i11 = pVar.f93975u;
                    if ((i11 & Integer.MIN_VALUE) != 0) {
                        pVar.f93975u = i11 - Integer.MIN_VALUE;
                    } else {
                        pVar = new w70.p(this, continuation);
                    }
                }
                Object obj = pVar.f93974t;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i12 = pVar.f93975u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    i5 = 0;
                    nVar2 = nVar;
                    length = ((Object[]) this.f78008b).length;
                    qVar = this;
                    if (i5 < length) {
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    length = pVar.f93980z;
                    i5 = pVar.f93979y;
                    w70.n nVar3 = pVar.f93978x;
                    qVar = pVar.f93977w;
                    ResultKt.b(obj);
                    nVar2 = nVar3;
                    i5++;
                    if (i5 < length) {
                        Object obj2 = ((Object[]) qVar.f78008b)[i5];
                        pVar.f93977w = qVar;
                        pVar.f93978x = nVar2;
                        pVar.f93979y = i5;
                        pVar.f93980z = length;
                        pVar.f93975u = 1;
                        if (nVar2.emit(obj2, pVar) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        i5++;
                        if (i5 < length) {
                            return Unit.f71706a;
                        }
                    }
                }
            case 3:
                Object objEmit = nVar.emit(this.f78008b, continuation);
                return objEmit == CoroutineSingletons.f71806a ? objEmit : Unit.f71706a;
            default:
                b0 b0Var = new b0((w70.u) this.f78008b, nVar, (Continuation) null, 28);
                h2 h2Var = new h2(continuation.getContext(), continuation, 1);
                Object objR = w20.e.r(h2Var, true, h2Var, b0Var);
                return objR == CoroutineSingletons.f71806a ? objR : Unit.f71706a;
        }
    }
}
