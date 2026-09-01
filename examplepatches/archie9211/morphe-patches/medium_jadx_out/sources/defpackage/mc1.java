package defpackage;

import androidx.work.impl.yX.VrhD;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class mc1 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ id1 d;
    public final /* synthetic */ String e;
    public final /* synthetic */ SourceParameter f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mc1(id1 id1Var, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = id1Var;
        this.e = str;
        this.f = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new mc1(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new mc1(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new mc1(this.d, this.e, this.f, n92Var, 2);
            default:
                return new mc1(this.d, this.e, this.f, n92Var, 3);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((mc1) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        mc1 mc1Var;
        int i = this.b;
        c1e c1eVar = c1e.a;
        String str = VrhD.AUjirQsbOaJRpq;
        id1 id1Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    tl tlVar = id1Var.C;
                    String str2 = id1Var.c;
                    String strG = id1Var.g();
                    this.c = 1;
                    obj = tlVar.f(this, this.f, this.e, str2, strG);
                    if (obj != tb2Var) {
                    }
                    return tb2Var;
                }
                if (i2 != 1) {
                    if (i2 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f(str);
                    return null;
                }
                br7.v(obj);
                r6c r6cVar = id1Var.L;
                pb1 pb1Var = new pb1((xs4) obj);
                this.c = 2;
                if (r6cVar.a(pb1Var, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    tl tlVar2 = id1Var.C;
                    String str3 = id1Var.c;
                    String strG2 = id1Var.g();
                    this.c = 1;
                    obj = tlVar2.t(this, this.f, this.e, str3, strG2);
                    if (obj != tb2Var2) {
                    }
                    return tb2Var2;
                }
                if (i3 != 1) {
                    if (i3 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f(str);
                    return null;
                }
                br7.v(obj);
                r6c r6cVar2 = id1Var.L;
                pb1 pb1Var2 = new pb1((a0e) obj);
                this.c = 2;
                if (r6cVar2.a(pb1Var2, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    tl tlVar3 = id1Var.C;
                    String str4 = id1Var.c;
                    String strG3 = id1Var.g();
                    this.c = 1;
                    obj = tlVar3.v(this, this.f, this.e, str4, strG3);
                    if (obj != tb2Var3) {
                    }
                    return tb2Var3;
                }
                if (i4 != 1) {
                    if (i4 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f(str);
                    return null;
                }
                br7.v(obj);
                r6c r6cVar3 = id1Var.L;
                pb1 pb1Var3 = new pb1((k0e) obj);
                this.c = 2;
                if (r6cVar3.a(pb1Var3, this) != tb2Var3) {
                    return c1eVar;
                }
                return tb2Var3;
            default:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    tl tlVar4 = id1Var.C;
                    String str5 = id1Var.c;
                    String strG4 = id1Var.g();
                    this.c = 1;
                    obj = tlVar4.w(this, this.f, this.e, str5, strG4);
                    mc1Var = this;
                    if (obj != tb2Var4) {
                    }
                    return tb2Var4;
                }
                if (i5 != 1) {
                    if (i5 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f(str);
                    return null;
                }
                br7.v(obj);
                mc1Var = this;
                r6c r6cVar4 = id1Var.L;
                pb1 pb1Var4 = new pb1((t0e) obj);
                mc1Var.c = 2;
                if (r6cVar4.a(pb1Var4, mc1Var) != tb2Var4) {
                    return c1eVar;
                }
                return tb2Var4;
        }
    }
}
