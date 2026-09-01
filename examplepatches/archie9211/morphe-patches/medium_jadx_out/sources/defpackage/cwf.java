package defpackage;

import com.google.android.recaptcha.internal.zzfx;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cwf extends p4d implements b55 {
    public final /* synthetic */ int b = 1;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ long e;
    public final /* synthetic */ iwf f;
    public final /* synthetic */ String g;
    public final /* synthetic */ arf h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cwf(long j, iwf iwfVar, String str, arf arfVar, n92 n92Var) {
        super(2, n92Var);
        this.e = j;
        this.f = iwfVar;
        this.g = str;
        this.h = arfVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                cwf cwfVar = new cwf(this.f, this.g, this.h, this.e, n92Var);
                cwfVar.d = obj;
                return cwfVar;
            default:
                cwf cwfVar2 = new cwf(this.e, this.f, this.g, this.h, n92Var);
                cwfVar2.d = obj;
                return cwfVar2;
        }
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((cwf) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((cwf) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws zzfx {
        fdg fdgVar;
        switch (this.b) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i = this.c;
                iwf iwfVar = this.f;
                try {
                } catch (Exception unused) {
                    this.d = null;
                    this.c = 3;
                    obj = iwfVar.c(this.g);
                    if (obj == tb2Var) {
                        return tb2Var;
                    }
                }
                if (i == 0) {
                    br7.v(obj);
                    fdg fdgVar2 = (fdg) this.d;
                    if (!iwfVar.a) {
                        return new bjb(dsf.w());
                    }
                    String str = this.g;
                    arf arfVar = this.h;
                    long j = this.e;
                    this.d = fdgVar2;
                    this.c = 1;
                    wcg wcgVar = new wcg(iwfVar.e(), new cwf(j, iwfVar, str, arfVar, (n92) null), null);
                    if (wcgVar == tb2Var) {
                        return tb2Var;
                    }
                    fdgVar = fdgVar2;
                    obj = wcgVar;
                } else {
                    if (i != 1) {
                        if (i != 2) {
                            br7.v(obj);
                            return new bjb(obj);
                        }
                        br7.v(obj);
                        obj = (dsf) obj;
                        return new bjb(obj);
                    }
                    fdgVar = (fdg) this.d;
                    br7.v(obj);
                }
                this.d = null;
                this.c = 2;
                obj = ((wcg) obj).a(fdgVar, this);
                if (obj == tb2Var) {
                    return tb2Var;
                }
                obj = (dsf) obj;
                return new bjb(obj);
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                try {
                    if (i2 == 0) {
                        br7.v(obj);
                        xbg xbgVar = (xbg) this.d;
                        long j2 = this.e;
                        kyc kycVar = new kyc(xbgVar, this.f, this.g, this.h, (n92) null, 13);
                        this.c = 1;
                        obj = wo7.z(j2, kycVar, this);
                        if (obj == tb2Var2) {
                            return tb2Var2;
                        }
                    } else {
                        if (i2 != 1) {
                            zzfx zzfxVar = (zzfx) this.d;
                            br7.v(obj);
                            throw zzfxVar;
                        }
                        br7.v(obj);
                    }
                    Object obj2 = ((bjb) obj).a;
                    br7.v(obj2);
                    return (dsf) obj2;
                } catch (Exception e) {
                    zzfx zzfxVarH = aq7.H(e, new zzfx(d87.T0, d87.x, e.getMessage(), 8));
                    this.d = zzfxVarH;
                    this.c = 2;
                    if (c1e.a == tb2Var2) {
                        return tb2Var2;
                    }
                    throw zzfxVarH;
                }
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cwf(iwf iwfVar, String str, arf arfVar, long j, n92 n92Var) {
        super(2, n92Var);
        this.f = iwfVar;
        this.g = str;
        this.h = arfVar;
        this.e = j;
    }
}
