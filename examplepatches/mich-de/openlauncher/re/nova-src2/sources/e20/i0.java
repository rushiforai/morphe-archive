package e20;

import cw.x1;
import java.util.Iterator;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import w70.o1;

/* loaded from: classes4.dex */
public final class i0 implements w70.m {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52031a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f52032b;

    public /* synthetic */ i0(Object obj, int i5) {
        this.f52031a = i5;
        this.f52032b = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x002f  */
    @Override // w70.m
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object collect(w70.n nVar, Continuation continuation) throws Throwable {
        w70.o oVar;
        w70.n nVar2;
        Iterator it;
        switch (this.f52031a) {
            case 0:
                Object objCollect = ((o1) this.f52032b).f93973a.collect(new x1(nVar, 3), continuation);
                return objCollect == CoroutineSingletons.f71806a ? objCollect : Unit.f71706a;
            case 1:
                Object objCollect2 = ((hq.p) this.f52032b).collect(new x1(nVar, 7), continuation);
                return objCollect2 == CoroutineSingletons.f71806a ? objCollect2 : Unit.f71706a;
            case 2:
                ((uw.c) this.f52032b).collect(new x1(nVar, 10), continuation);
                return CoroutineSingletons.f71806a;
            case 3:
                Object objCollect3 = ((w70.c) this.f52032b).collect(new x1(nVar, 13), continuation);
                return objCollect3 == CoroutineSingletons.f71806a ? objCollect3 : Unit.f71706a;
            case 4:
                Object objCollect4 = ((w70.f0) this.f52032b).collect(new x1(nVar, 16), continuation);
                return objCollect4 == CoroutineSingletons.f71806a ? objCollect4 : Unit.f71706a;
            case 5:
                Object objCollect5 = ((w70.z) this.f52032b).collect(new x1(nVar, 17), continuation);
                return objCollect5 == CoroutineSingletons.f71806a ? objCollect5 : Unit.f71706a;
            case 6:
                if (continuation instanceof w70.o) {
                    oVar = (w70.o) continuation;
                    int i5 = oVar.f93965u;
                    if ((i5 & Integer.MIN_VALUE) != 0) {
                        oVar.f93965u = i5 - Integer.MIN_VALUE;
                    } else {
                        oVar = new w70.o(this, continuation);
                    }
                }
                Object obj = oVar.f93964t;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = oVar.f93965u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    nVar2 = nVar;
                    it = ((Iterable) this.f52032b).iterator();
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    it = oVar.f93968x;
                    w70.n nVar3 = oVar.f93967w;
                    ResultKt.b(obj);
                    nVar2 = nVar3;
                }
                while (it.hasNext()) {
                    Object next = it.next();
                    oVar.f93967w = nVar2;
                    oVar.f93968x = it;
                    oVar.f93965u = 1;
                    if (nVar2.emit(next, oVar) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                }
                return Unit.f71706a;
            default:
                Object objCollect6 = ((n8.q) this.f52032b).collect(new x1(nVar, 22), continuation);
                return objCollect6 == CoroutineSingletons.f71806a ? objCollect6 : Unit.f71706a;
        }
    }
}
