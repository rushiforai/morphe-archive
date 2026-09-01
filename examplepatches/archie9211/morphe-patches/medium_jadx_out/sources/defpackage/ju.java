package defpackage;

import java.util.concurrent.CancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ju extends p4d implements x45 {
    public xw b;
    public nya c;
    public int d;
    public final /* synthetic */ ou e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ sfd g;
    public final /* synthetic */ long h;
    public final /* synthetic */ x45 i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ju(ou ouVar, Object obj, sfd sfdVar, long j, x45 x45Var, n92 n92Var) {
        super(1, n92Var);
        this.e = ouVar;
        this.f = obj;
        this.g = sfdVar;
        this.h = j;
        this.i = x45Var;
    }

    @Override // defpackage.kn0
    public final n92 create(n92 n92Var) {
        return new ju(this.e, this.f, this.g, this.h, this.i, n92Var);
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        return ((ju) create((n92) obj)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        xw xwVar;
        nya nyaVar;
        sfd sfdVar = this.g;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.d;
        ou ouVar = this.e;
        try {
            if (i == 0) {
                br7.v(obj);
                ouVar.c.c = (dx) ouVar.a.a.invoke(this.f);
                ouVar.e.setValue(sfdVar.c);
                ouVar.d.setValue(Boolean.TRUE);
                xw xwVar2 = ouVar.c;
                xw xwVar3 = new xw(xwVar2.a, xwVar2.b.getValue(), nk7.m0(xwVar2.c), xwVar2.d, Long.MIN_VALUE, xwVar2.f);
                nya nyaVar2 = new nya();
                long j = this.h;
                iu iuVar = new iu(ouVar, xwVar3, this.i, nyaVar2, 0);
                this.b = xwVar3;
                this.c = nyaVar2;
                this.d = 1;
                if (tr7.j(xwVar3, sfdVar, j, iuVar, this) == tb2Var) {
                    return tb2Var;
                }
                xwVar = xwVar3;
                nyaVar = nyaVar2;
            } else {
                if (i != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                nyaVar = this.c;
                xwVar = this.b;
                br7.v(obj);
            }
            ow owVar = nyaVar.a ? ow.BoundReached : ow.Finished;
            ouVar.c();
            return new uw(xwVar, owVar);
        } catch (CancellationException e) {
            ouVar.c();
            throw e;
        }
    }
}
