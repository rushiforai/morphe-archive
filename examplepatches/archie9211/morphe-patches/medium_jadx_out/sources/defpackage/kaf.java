package defpackage;

import android.app.Application;
import com.google.android.play.core.integrity.StandardIntegrityException;
import com.google.android.recaptcha.internal.zzfx;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kaf extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ Object d;
    public Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ kaf(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
        this.d = obj2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.d;
        switch (i) {
            case 0:
                return new kaf((bo4) this.e, (kbf) obj2, n92Var, 0);
            case 1:
                return new kaf((qlb) this.e, (kbf) obj2, n92Var, 1);
            case 2:
                return new kaf((gz8) this.e, (ubf) obj2, n92Var, 2);
            case 3:
                return new kaf((gz8) this.e, (cff) obj2, n92Var, 3);
            case 4:
                return new kaf((kv6) this.e, (sff) obj2, n92Var, 4);
            case 5:
                return new kaf((x2g) obj2, n92Var, 5);
            case 6:
                return new kaf((e4g) obj2, n92Var, 6);
            case 7:
                return new kaf((x7g) this.e, (awa) obj2, n92Var, 7);
            case 8:
                return new kaf((Application) this.e, (String) obj2, n92Var, 8);
            default:
                kaf kafVar = new kaf((veg) obj2, n92Var, 9);
                kafVar.e = obj;
                return kafVar;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((kaf) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((kaf) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((kaf) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 3:
                return ((kaf) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 4:
                return ((kaf) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 5:
                return ((kaf) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 6:
                return ((kaf) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 7:
                return ((kaf) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 8:
                return ((kaf) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((kaf) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws zzfx {
        rya ryaVar;
        Object objI;
        Object objC;
        fdg fdgVar;
        Object wcgVar;
        Object objA;
        int i = this.b;
        int i2 = 8;
        c1e c1eVar = c1e.a;
        Object[] objArr = 0;
        Object obj2 = this.d;
        int i3 = 1;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 != 0) {
                    if (i4 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                bo4 bo4Var = (bo4) this.e;
                jaf jafVar = new jaf((kbf) obj2, 0);
                this.c = 1;
                return bo4Var.b(jafVar, this) == tb2Var ? tb2Var : c1eVar;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    uua uuaVar = ((ex1) ((qlb) this.e).a).c;
                    jaf jafVar2 = new jaf((kbf) obj2, i3);
                    this.c = 1;
                    if (uuaVar.a.b(jafVar2, this) == tb2Var2) {
                        return tb2Var2;
                    }
                } else {
                    if (i5 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                z72.b();
                return null;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 != 0) {
                    if (i6 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                gz8 gz8Var = (gz8) this.e;
                int i7 = ((ubf) obj2).m;
                this.c = 1;
                return gz8Var.f(i7, f76.P(0.0f, 0.0f, null, 7), this) == tb2Var3 ? tb2Var3 : c1eVar;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 != 0) {
                    if (i8 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                gz8 gz8Var2 = (gz8) this.e;
                int i9 = ((cff) obj2).c;
                this.c = 1;
                return gz8Var2.f(i9, f76.P(0.0f, 0.0f, null, 7), this) == tb2Var4 ? tb2Var4 : c1eVar;
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i10 = this.c;
                if (i10 != 0) {
                    if (i10 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                kv6 kv6Var = (kv6) this.e;
                iaf iafVar = new iaf(0, (sff) obj2, sff.class, "loadMore", "loadMore()V", 0, 17);
                this.c = 1;
                return nk7.r0(kv6Var, null, iafVar, this, 3) == tb2Var5 ? tb2Var5 : c1eVar;
            case 5:
                d87 d87Var = d87.e;
                x2g x2gVar = (x2g) obj2;
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                if (this.c != 0) {
                    ryaVar = (rya) this.e;
                    try {
                        br7.v(obj);
                        return c1eVar;
                    } catch (Exception e) {
                        e = e;
                    }
                } else {
                    rya ryaVarP = ev6.p(obj);
                    try {
                        h2g h2gVar = new h2g(x2gVar, ryaVarP, null);
                        this.e = ryaVarP;
                        this.c = 1;
                        return wo7.z(60000L, h2gVar, this) == tb2Var6 ? tb2Var6 : c1eVar;
                    } catch (Exception e2) {
                        e = e2;
                        ryaVar = ryaVarP;
                    }
                }
                vx1 vx1Var = x2gVar.f;
                vx1 vx1Var2 = vx1Var != null ? vx1Var : null;
                Throwable th = (Throwable) ryaVar.a;
                if (th == null) {
                    th = e;
                }
                vx1Var2.i0(th);
                x2gVar.b = zi5.i;
                d87 d87Var2 = d87.T0;
                Throwable th2 = (Throwable) ryaVar.a;
                if (th2 == null) {
                    th2 = e;
                }
                if (th2 instanceof StandardIntegrityException) {
                    int i11 = ((StandardIntegrityException) th2).a.a;
                    if (i11 == -100) {
                        d87Var = d87.w0;
                    } else if (i11 == -12) {
                        d87Var = d87.p0;
                    } else if (i11 == -3) {
                        d87Var = d87.Y;
                    } else if (i11 == -2) {
                        d87Var = d87.X;
                    } else if (i11 != -1) {
                        switch (i11) {
                            case -19:
                                d87Var = d87.v0;
                                break;
                            case -18:
                                d87Var = d87.u0;
                                break;
                            case -17:
                                d87Var = d87.t0;
                                break;
                            case -16:
                                d87Var = d87.s0;
                                break;
                            case -15:
                                d87Var = d87.r0;
                                break;
                            case -14:
                                d87Var = d87.q0;
                                break;
                            default:
                                switch (i11) {
                                    case -9:
                                        d87Var = d87.o0;
                                        break;
                                    case -8:
                                        d87Var = d87.n0;
                                        break;
                                    case -7:
                                        d87Var = d87.m0;
                                        break;
                                    case -6:
                                        d87Var = d87.l0;
                                        break;
                                    case -5:
                                        d87Var = d87.Z;
                                        break;
                                }
                                break;
                        }
                    } else {
                        d87Var = d87.S;
                    }
                }
                throw new zzfx(d87Var2, d87Var, e.getMessage(), i2);
            case 6:
                e4g e4gVar = (e4g) obj2;
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i12 = this.c;
                if (i12 == 0) {
                    br7.v(obj);
                    ujf ujfVar = e4gVar.c;
                    this.c = 1;
                    objI = ujfVar.i(this);
                    if (objI == tb2Var7) {
                        return tb2Var7;
                    }
                } else {
                    if (i12 != 1) {
                        String str = (String) this.e;
                        br7.v(obj);
                        return str;
                    }
                    br7.v(obj);
                    objI = obj;
                }
                String str2 = (String) objI;
                d2f d2fVar = e4gVar.a;
                this.e = str2;
                this.c = 2;
                return d2fVar.Q("ovk", str2, this) != tb2Var7 ? str2 : tb2Var7;
            case 7:
                Object obj3 = tb2.COROUTINE_SUSPENDED;
                int i13 = this.c;
                br7.v(obj);
                if (i13 == 0) {
                    this.c = 1;
                    objC = ((x7g) this.e).c((awa) obj2, 10000L, this);
                    if (objC != obj3) {
                    }
                    return obj3;
                }
                objC = ((bjb) obj).a;
                obj3 = objC;
                br7.v(obj3);
                return obj3;
            case 8:
                tb2 tb2Var8 = tb2.COROUTINE_SUSPENDED;
                int i14 = this.c;
                br7.v(obj);
                if (i14 != 0) {
                    return obj;
                }
                rz5 rz5Var = rz5.j;
                this.c = 1;
                Object objK = rz5Var.K((Application) this.e, (String) obj2, this);
                return objK == tb2Var8 ? tb2Var8 : objK;
            default:
                tb2 tb2Var9 = tb2.COROUTINE_SUSPENDED;
                int i15 = this.c;
                try {
                    if (i15 == 0) {
                        br7.v(obj);
                        fdgVar = (fdg) this.e;
                        veg vegVar = (veg) obj2;
                        int i16 = vegVar.f;
                        ezf ezfVar = new ezf(vegVar, objArr == true ? 1 : 0, i2);
                        this.e = fdgVar;
                        this.c = 1;
                        wcgVar = new wcg(i16, ezfVar, null);
                        if (wcgVar != tb2Var9) {
                        }
                        return tb2Var9;
                    }
                    if (i15 != 1) {
                        br7.v(obj);
                        objA = obj;
                        return (emf) objA;
                    }
                    fdg fdgVar2 = (fdg) this.e;
                    br7.v(obj);
                    fdgVar = fdgVar2;
                    wcgVar = obj;
                    this.e = null;
                    this.c = 2;
                    objA = ((wcg) wcgVar).a(fdgVar, this);
                    if (objA == tb2Var9) {
                        return tb2Var9;
                    }
                    return (emf) objA;
                } catch (Exception unused) {
                    return null;
                }
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ kaf(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
    }
}
