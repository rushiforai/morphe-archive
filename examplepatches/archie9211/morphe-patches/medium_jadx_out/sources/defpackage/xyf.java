package defpackage;

import com.google.android.recaptcha.internal.zzfx;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xyf extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ vwa d;
    public final /* synthetic */ osf e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ xyf(vwa vwaVar, osf osfVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = vwaVar;
        this.e = osfVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        osf osfVar = this.e;
        vwa vwaVar = this.d;
        switch (i) {
            case 0:
                return new xyf(vwaVar, osfVar, n92Var, 0);
            default:
                return new xyf(vwaVar, osfVar, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((xyf) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((xyf) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws zzfx {
        int i = this.b;
        osf osfVar = this.e;
        vwa vwaVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                try {
                    if (this.c != 0) {
                        br7.v(obj);
                    } else {
                        br7.v(obj);
                        zjf zjfVar = (zjf) vwaVar.b;
                        this.c = 1;
                        obj = zjfVar.a(osfVar, this);
                        if (obj == tb2Var) {
                            return tb2Var;
                        }
                    }
                    return (qsf) obj;
                } catch (Exception e) {
                    throw vwa.G(vwaVar, e);
                }
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                br7.v(obj);
                if (i2 != 0) {
                    return obj;
                }
                xyf xyfVar = new xyf(vwaVar, osfVar, null, 0);
                this.c = 1;
                wcg wcgVar = new wcg(64, xyfVar, null);
                return wcgVar != tb2Var2 ? wcgVar : tb2Var2;
        }
    }
}
