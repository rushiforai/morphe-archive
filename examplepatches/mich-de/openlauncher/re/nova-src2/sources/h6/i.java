package h6;

import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class i extends l0 {

    /* renamed from: m, reason: collision with root package name */
    public bn.i f59377m;

    @Override // h6.j0
    public final void g() {
        t.b bVar = (t.b) this.f59407l.iterator();
        if (bVar.hasNext()) {
            ((Map.Entry) bVar.next()).getValue().getClass();
            throw new ClassCastException();
        }
        bn.i iVar = this.f59377m;
        if (iVar != null) {
            t70.r1 r1Var = (t70.r1) iVar.f18214f;
            Continuation continuation = null;
            if (r1Var != null) {
                r1Var.c(null);
            }
            iVar.f18214f = null;
            if (((t70.r1) iVar.f18213e) != null) {
                return;
            }
            iVar.f18213e = t70.m0.t((y70.d) iVar.f18211c, null, null, new c(iVar, continuation, 0), 3);
        }
    }

    @Override // h6.j0
    public final void h() {
        t.b bVar = (t.b) this.f59407l.iterator();
        if (bVar.hasNext()) {
            ((Map.Entry) bVar.next()).getValue().getClass();
            throw new ClassCastException();
        }
        bn.i iVar = this.f59377m;
        if (iVar != null) {
            if (((t70.r1) iVar.f18214f) != null) {
                throw new IllegalStateException("Cancel call cannot happen without a maybeRun");
            }
            y70.d dVar = (y70.d) iVar.f18211c;
            a80.e eVar = t70.y0.f88884a;
            iVar.f18214f = t70.m0.t(dVar, y70.o.f96819a.f90673f, null, new cv.y(iVar, null, 17), 2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Unit l(ContinuationImpl continuationImpl) {
        h hVar;
        if (continuationImpl instanceof h) {
            hVar = (h) continuationImpl;
            int i5 = hVar.f59369v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hVar.f59369v = i5 - Integer.MIN_VALUE;
            } else {
                hVar = new h(this, continuationImpl);
            }
        }
        Object obj = hVar.f59367t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hVar.f59369v;
        if (i11 != 0 && i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        ResultKt.b(obj);
        return Unit.f71706a;
    }
}
