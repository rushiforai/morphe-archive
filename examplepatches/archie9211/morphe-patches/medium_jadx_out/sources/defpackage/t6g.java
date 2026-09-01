package defpackage;

import com.google.android.recaptcha.internal.zzfx;
import java.util.Iterator;
import java.util.List;
import kotlinx.coroutines.TimeoutCancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t6g extends p4d implements b55 {
    public final /* synthetic */ int b = 1;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ long e;
    public final /* synthetic */ bh4 f;
    public final /* synthetic */ jrf g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t6g(long j, bh4 bh4Var, jrf jrfVar, n92 n92Var) {
        super(2, n92Var);
        this.e = j;
        this.f = bh4Var;
        this.g = jrfVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                t6g t6gVar = new t6g(this.f, this.g, this.e, n92Var);
                t6gVar.d = obj;
                return t6gVar;
            default:
                t6g t6gVar2 = new t6g(this.e, this.f, this.g, n92Var);
                t6gVar2.d = obj;
                return t6gVar2;
        }
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        fdg fdgVar = (fdg) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((t6g) create(fdgVar, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws zzfx {
        fdg fdgVar;
        vyf vyfVarD;
        Object objB;
        int i = this.b;
        Object obj2 = c1e.a;
        switch (i) {
            case 0:
                bh4 bh4Var = this.f;
                uz5 uz5Var = (uz5) bh4Var.g;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                try {
                } catch (zzfx e) {
                    va6 va6Var = (va6) ((k92) uz5Var.b).a.o0(cd7.g);
                    if (va6Var != null) {
                        Iterator it2 = va6Var.B().iterator();
                        while (it2.hasNext()) {
                            ((va6) it2.next()).m(null);
                        }
                    }
                    List listO0 = szb.O0(bo.S(((k92) uz5Var.b).a).B());
                    this.d = e;
                    this.c = 3;
                    if (g76.X(listO0, this) != tb2Var) {
                        throw e;
                    }
                }
                if (i2 == 0) {
                    br7.v(obj);
                    fdgVar = (fdg) this.d;
                    sj0 sj0Var = (sj0) bh4Var.a;
                    jrf jrfVar = this.g;
                    if (jrfVar.F()) {
                        eoc eocVarD = sj0Var.d(false);
                        nec necVar = new nec(13, d46.Q(sj0Var.e(true)));
                        tag tagVar = (tag) sj0Var.d;
                        vyfVarD = new nig(eocVarD, necVar, (deg) tagVar.b, (vwa) sj0Var.e, (uz5) sj0Var.i);
                    } else {
                        vyfVarD = sj0Var.d(true);
                    }
                    bh4Var.f = vyfVarD;
                    long j = this.e;
                    this.d = fdgVar;
                    this.c = 1;
                    objB = vyfVarD.b(j, jrfVar);
                    if (objB != tb2Var) {
                    }
                    return tb2Var;
                }
                if (i2 != 1) {
                    if (i2 == 2) {
                        br7.v(obj);
                        return obj2;
                    }
                    zzfx zzfxVar = (zzfx) this.d;
                    br7.v(obj);
                    throw zzfxVar;
                }
                fdg fdgVar2 = (fdg) this.d;
                br7.v(obj);
                fdgVar = fdgVar2;
                objB = obj;
                this.d = null;
                this.c = 2;
                if (((wcg) objB).a(fdgVar, this) != tb2Var) {
                    return obj2;
                }
                return tb2Var;
            default:
                d87 d87Var = d87.T0;
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                try {
                    if (this.c != 0) {
                        br7.v(obj);
                    } else {
                        br7.v(obj);
                        fdg fdgVar3 = (fdg) this.d;
                        long j2 = this.e;
                        j82 j82Var = new j82(fdgVar3, this.f, this.g, j2, (n92) null, 6);
                        this.c = 1;
                        if (wo7.z(j2, j82Var, this) == tb2Var2) {
                            obj2 = tb2Var2;
                        }
                    }
                    return obj2;
                } catch (zzfx e2) {
                    throw e2;
                } catch (TimeoutCancellationException e3) {
                    throw new zzfx(d87Var, d87.f, e3.getMessage(), 8);
                } catch (Exception e4) {
                    throw new zzfx(d87Var, d87.D, e4.getMessage(), 8);
                }
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t6g(bh4 bh4Var, jrf jrfVar, long j, n92 n92Var) {
        super(2, n92Var);
        this.f = bh4Var;
        this.g = jrfVar;
        this.e = j;
    }
}
