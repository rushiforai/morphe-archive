package defpackage;

import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class qu6 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ int d;
    public final /* synthetic */ Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ qu6(Object obj, int i, n92 n92Var, int i2) {
        super(2, n92Var);
        this.b = i2;
        this.e = obj;
        this.d = i;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        int i2 = this.d;
        Object obj2 = this.e;
        switch (i) {
            case 0:
                return new qu6((ru6) obj2, i2, n92Var, 0);
            case 1:
                return new qu6((sw9) obj2, i2, n92Var, 1);
            case 2:
                return new qu6((osb) obj2, i2, n92Var, 2);
            case 3:
                return new qu6((psb) obj2, i2, n92Var, 3);
            default:
                return new qu6((tag) obj2, i2, n92Var, 4);
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
        return ((qu6) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        List listP;
        switch (this.b) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i = this.c;
                if (i == 0) {
                    br7.v(obj);
                    ku6 ku6Var = ((ru6) this.e).p;
                    int i2 = this.d;
                    this.c = 1;
                    if (ku6Var.f(i2, this) == tb2Var) {
                        return tb2Var;
                    }
                } else {
                    if (i != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                return c1e.a;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    r6c r6cVar = ((sw9) this.e).x0;
                    zt9 zt9Var = new zt9(this.d);
                    this.c = 1;
                    if (r6cVar.a(zt9Var, this) == tb2Var2) {
                        return tb2Var2;
                    }
                } else {
                    if (i3 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                return c1e.a;
            case 2:
                c1e c1eVar = c1e.a;
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    yrb yrbVar = ((osb) this.e).a;
                    int i5 = this.d;
                    cud cudVar = ns7.a;
                    this.c = 1;
                    Object objG = gq7.g(yrbVar, i5 - yrbVar.a.g(), cudVar, this);
                    if (objG != tb2Var3) {
                        objG = c1eVar;
                    }
                    if (objG == tb2Var3) {
                        return tb2Var3;
                    }
                } else {
                    if (i4 != 1) {
                        ygf.f(HrUBqHumRuLe.bEmyl);
                        return null;
                    }
                    br7.v(obj);
                }
                return c1eVar;
            case 3:
                c1e c1eVar2 = c1e.a;
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    yrb yrbVar2 = ((psb) this.e).a;
                    int i7 = this.d;
                    cud cudVar2 = qs7.a;
                    this.c = 1;
                    Object objG2 = gq7.g(yrbVar2, i7 - yrbVar2.a.g(), cudVar2, this);
                    if (objG2 != tb2Var4) {
                        objG2 = c1eVar2;
                    }
                    if (objG2 == tb2Var4) {
                        return tb2Var4;
                    }
                } else {
                    if (i6 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                return c1eVar2;
            default:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                try {
                    if (this.c != 0) {
                        br7.v(obj);
                    } else {
                        br7.v(obj);
                        tag tagVar = (tag) this.e;
                        hha hhaVar = (hha) tagVar.a;
                        synchronized (obg.class) {
                            try {
                                try {
                                    obg obgVar = (obg) hhaVar.a;
                                    listP = obgVar != null ? obgVar.p() : ey3.a;
                                } catch (Exception unused) {
                                    listP = ey3.a;
                                }
                            } finally {
                            }
                            break;
                        }
                        if (listP.size() >= this.d) {
                            ((hha) tagVar.a).z(listP);
                            this.c = 1;
                            if (tagVar.n(listP, this) == tb2Var5) {
                                return tb2Var5;
                            }
                        }
                    }
                } catch (Exception unused2) {
                }
                return c1e.a;
        }
    }
}
