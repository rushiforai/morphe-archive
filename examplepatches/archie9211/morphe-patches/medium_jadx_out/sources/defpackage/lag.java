package defpackage;

import com.google.android.recaptcha.internal.zzfx;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lag extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ o2b d;
    public final /* synthetic */ jsf e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ lag(o2b o2bVar, jsf jsfVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = o2bVar;
        this.e = jsfVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        jsf jsfVar = this.e;
        o2b o2bVar = this.d;
        switch (i) {
            case 0:
                return new lag(o2bVar, jsfVar, n92Var, 0);
            default:
                return new lag(o2bVar, jsfVar, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((lag) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((lag) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws zzfx {
        int i = this.b;
        jsf jsfVar = this.e;
        o2b o2bVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                try {
                    if (this.c != 0) {
                        br7.v(obj);
                    } else {
                        br7.v(obj);
                        eoc eocVar = (eoc) o2bVar.c;
                        prf prfVar = (prf) o2bVar.b;
                        this.c = 1;
                        obj = eocVar.f(prfVar, jsfVar, this);
                        if (obj == tb2Var) {
                            return tb2Var;
                        }
                    }
                    return (ksf) obj;
                } catch (Exception e) {
                    throw o2b.V(o2bVar, e);
                }
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                br7.v(obj);
                if (i2 != 0) {
                    return obj;
                }
                lag lagVar = new lag(o2bVar, jsfVar, null, 0);
                this.c = 1;
                wcg wcgVar = new wcg(48, lagVar, null);
                return wcgVar != tb2Var2 ? wcgVar : tb2Var2;
        }
    }
}
