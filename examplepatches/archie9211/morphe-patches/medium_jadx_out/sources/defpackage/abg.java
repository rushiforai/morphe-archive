package defpackage;

import com.google.android.recaptcha.internal.zzfx;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class abg extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ nig d;
    public final /* synthetic */ ntf e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ abg(nig nigVar, ntf ntfVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = nigVar;
        this.e = ntfVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        ntf ntfVar = this.e;
        nig nigVar = this.d;
        switch (i) {
            case 0:
                return new abg(nigVar, ntfVar, n92Var, 0);
            default:
                return new abg(nigVar, ntfVar, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((abg) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((abg) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws zzfx {
        int i = this.b;
        ntf ntfVar = this.e;
        nig nigVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                br7.v(obj);
                if (i2 == 0) {
                    nec necVar = (nec) nigVar.a;
                    String str = ((prf) nigVar.b).a;
                    this.c = 1;
                    obj = necVar.h(str, ntfVar, this);
                    if (obj == tb2Var) {
                        return tb2Var;
                    }
                }
                return (jrf) obj;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                br7.v(obj);
                if (i3 != 0) {
                    return obj;
                }
                abg abgVar = new abg(nigVar, ntfVar, null, 0);
                this.c = 1;
                ycg ycgVar = new ycg(abgVar);
                return ycgVar != tb2Var2 ? ycgVar : tb2Var2;
        }
    }
}
