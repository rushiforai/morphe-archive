package defpackage;

import com.apollographql.apollo.exception.ApolloException;
import com.apollographql.apollo.exception.ApolloNetworkException;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.core.models.CatalogName;
import com.medium.android.graphql.fragment.PostPreviewData;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gd1 extends p4d implements c55 {
    public final /* synthetic */ int b;
    public Object c;
    public int d;
    public /* synthetic */ Object e;
    public /* synthetic */ Object f;
    public Object g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gd1(n92 n92Var, String str, odd oddVar) {
        super(3, n92Var);
        this.b = 12;
        this.g = str;
        this.f = oddVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                gd1 gd1Var = new gd1((n92) obj3, (id1) this.f, (String) this.g, 0);
                gd1Var.c = (do4) obj;
                gd1Var.e = obj2;
                return gd1Var.invokeSuspend(c1eVar);
            case 1:
                gd1 gd1Var2 = new gd1((n92) obj3, (g55) this.g, 1);
                gd1Var2.e = (do4) obj;
                gd1Var2.f = (Object[]) obj2;
                return gd1Var2.invokeSuspend(c1eVar);
            case 2:
                gd1 gd1Var3 = new gd1((n92) obj3, (zq5) this.g, 2);
                gd1Var3.e = (do4) obj;
                gd1Var3.f = (Object[]) obj2;
                return gd1Var3.invokeSuspend(c1eVar);
            case 3:
                gd1 gd1Var4 = new gd1((b55) this.g, (n92) obj3, 3);
                gd1Var4.f = (do4) obj;
                gd1Var4.e = obj2;
                return gd1Var4.invokeSuspend(c1eVar);
            case 4:
                gd1 gd1Var5 = new gd1((n92) obj3, (d55) this.g, 4);
                gd1Var5.e = (do4) obj;
                gd1Var5.f = (Object[]) obj2;
                return gd1Var5.invokeSuspend(c1eVar);
            case 5:
                gd1 gd1Var6 = new gd1((n92) obj3, (e55) this.g, 5);
                gd1Var6.e = (do4) obj;
                gd1Var6.f = (Object[]) obj2;
                return gd1Var6.invokeSuspend(c1eVar);
            case 6:
                gd1 gd1Var7 = new gd1((n92) obj3, (f55) this.g, 6);
                gd1Var7.e = (do4) obj;
                gd1Var7.f = (Object[]) obj2;
                return gd1Var7.invokeSuspend(c1eVar);
            case 7:
                gd1 gd1Var8 = new gd1((c55) this.g, (n92) obj3, 7);
                gd1Var8.e = (do4) obj;
                gd1Var8.f = (Object[]) obj2;
                return gd1Var8.invokeSuspend(c1eVar);
            case 8:
                gd1 gd1Var9 = new gd1((hv8) this.f, (ms) this.g, (n92) obj3);
                gd1Var9.c = (do4) obj;
                gd1Var9.e = (Throwable) obj2;
                return gd1Var9.invokeSuspend(c1eVar);
            case 9:
                gd1 gd1Var10 = new gd1((sg7) this.f, (n92) obj3);
                gd1Var10.c = (rj2) obj;
                gd1Var10.e = (Boolean) obj2;
                return gd1Var10.invokeSuspend(c1eVar);
            case 10:
                gd1 gd1Var11 = new gd1((n92) obj3, (nqa) this.f, (wjc) this.g, 10);
                gd1Var11.c = (do4) obj;
                gd1Var11.e = obj2;
                return gd1Var11.invokeSuspend(c1eVar);
            case 11:
                gd1 gd1Var12 = new gd1((n92) obj3, (zsc) this.f, (hx4) this.g, 11);
                gd1Var12.c = (do4) obj;
                gd1Var12.e = obj2;
                return gd1Var12.invokeSuspend(c1eVar);
            case 12:
                gd1 gd1Var13 = new gd1((n92) obj3, (String) this.g, (odd) this.f);
                gd1Var13.c = (do4) obj;
                gd1Var13.e = (Object[]) obj2;
                return gd1Var13.invokeSuspend(c1eVar);
            default:
                gd1 gd1Var14 = new gd1((n92) obj3, (ref) this.f, (String) this.g, 13);
                gd1Var14.c = (do4) obj;
                gd1Var14.e = obj2;
                return gd1Var14.invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        n92 n92Var;
        bo4 u50Var;
        Object obj2;
        Object objE;
        Object obj3;
        Object objQ;
        Object obj4;
        Object objInvoke;
        Object obj5;
        Object objK;
        Object obj6;
        Object objS;
        Object obj7;
        Object objP;
        Object obj8;
        Object objF;
        String str;
        Object objA;
        ucd ucdVar;
        Object obj9;
        Object wcdVar;
        Object obj10;
        to4 to4VarQ;
        gd1 gd1Var = this;
        int i = gd1Var.b;
        int i2 = 16;
        int i3 = 3;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                id1 id1Var = (id1) gd1Var.f;
                do4 do4Var = (do4) gd1Var.c;
                Object obj11 = gd1Var.e;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i4 = gd1Var.d;
                if (i4 != 0) {
                    if (i4 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                if (((Boolean) obj11).booleanValue()) {
                    bo4 bo4VarJ = m40.J(r40.B(((ep8) id1Var.y.c).a, new String[]{"offline_post"}, new hb8(i2)));
                    qi1 qi1Var = id1Var.d;
                    String str2 = (String) gd1Var.g;
                    qi1Var.getClass();
                    str2.getClass();
                    eo8 eo8Var = qi1Var.d;
                    int i5 = 0;
                    n92Var = null;
                    u50Var = new sp4(bo4VarJ, m40.J(new zz(m40.J(r40.B(eo8Var.a, new String[]{"offline_catalog"}, new co8(str2, eo8Var, 1))), i3)), new hd1(i3, i5, n92Var), i5);
                } else {
                    n92Var = null;
                    u50Var = new u50(7, n92Var);
                }
                gd1Var.c = n92Var;
                gd1Var.e = n92Var;
                gd1Var.d = 1;
                return wgf.l(do4Var, u50Var, gd1Var) == tb2Var ? tb2Var : c1eVar;
            case 1:
                do4 do4Var2 = (do4) gd1Var.e;
                Object[] objArr = (Object[]) gd1Var.f;
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i6 = gd1Var.d;
                if (i6 == 0) {
                    br7.v(obj);
                    g55 g55Var = (g55) gd1Var.g;
                    Object obj12 = objArr[0];
                    Object obj13 = objArr[1];
                    Object obj14 = objArr[2];
                    Object obj15 = objArr[3];
                    Object obj16 = objArr[4];
                    Object obj17 = objArr[5];
                    obj2 = null;
                    gd1Var.e = null;
                    gd1Var.f = null;
                    gd1Var.c = do4Var2;
                    gd1Var.d = 1;
                    objE = g55Var.e(obj12, obj13, obj14, obj15, obj16, obj17, gd1Var);
                    gd1Var = gd1Var;
                    if (objE != tb2Var2) {
                    }
                    return tb2Var2;
                }
                if (i6 != 1) {
                    if (i6 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                do4Var2 = (do4) gd1Var.c;
                br7.v(obj);
                objE = obj;
                obj2 = null;
                gd1Var.e = obj2;
                gd1Var.f = obj2;
                gd1Var.c = obj2;
                gd1Var.d = 2;
                if (do4Var2.a(objE, gd1Var) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
            case 2:
                do4 do4Var3 = (do4) gd1Var.e;
                Object[] objArr2 = (Object[]) gd1Var.f;
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i7 = gd1Var.d;
                if (i7 == 0) {
                    br7.v(obj);
                    zq5 zq5Var = (zq5) gd1Var.g;
                    Object obj18 = objArr2[0];
                    Object obj19 = objArr2[1];
                    Object obj20 = objArr2[2];
                    Object obj21 = objArr2[3];
                    Object obj22 = objArr2[4];
                    Object obj23 = objArr2[5];
                    Object obj24 = objArr2[6];
                    obj3 = null;
                    gd1Var.e = null;
                    gd1Var.f = null;
                    gd1Var.c = do4Var3;
                    gd1Var.d = 1;
                    objQ = zq5Var.q(obj18, obj19, obj20, obj21, obj22, obj23, obj24, gd1Var);
                    gd1Var = gd1Var;
                    if (objQ != tb2Var3) {
                    }
                    return tb2Var3;
                }
                if (i7 != 1) {
                    if (i7 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                do4Var3 = (do4) gd1Var.c;
                br7.v(obj);
                objQ = obj;
                obj3 = null;
                gd1Var.e = obj3;
                gd1Var.f = obj3;
                gd1Var.c = obj3;
                gd1Var.d = 2;
                if (do4Var3.a(objQ, gd1Var) != tb2Var3) {
                    return c1eVar;
                }
                return tb2Var3;
            case 3:
                do4 do4Var4 = (do4) gd1Var.f;
                Object obj25 = gd1Var.e;
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i8 = gd1Var.d;
                if (i8 == 0) {
                    br7.v(obj);
                    b55 b55Var = (b55) gd1Var.g;
                    obj4 = null;
                    gd1Var.f = null;
                    gd1Var.e = null;
                    gd1Var.c = do4Var4;
                    gd1Var.d = 1;
                    objInvoke = b55Var.invoke(obj25, gd1Var);
                    if (objInvoke != tb2Var4) {
                    }
                    return tb2Var4;
                }
                if (i8 != 1) {
                    if (i8 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                do4Var4 = (do4) gd1Var.c;
                br7.v(obj);
                objInvoke = obj;
                obj4 = null;
                gd1Var.f = obj4;
                gd1Var.e = obj4;
                gd1Var.c = obj4;
                gd1Var.d = 2;
                if (do4Var4.a(objInvoke, gd1Var) != tb2Var4) {
                    return c1eVar;
                }
                return tb2Var4;
            case 4:
                do4 do4Var5 = (do4) gd1Var.e;
                Object[] objArr3 = (Object[]) gd1Var.f;
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i9 = gd1Var.d;
                if (i9 == 0) {
                    br7.v(obj);
                    d55 d55Var = (d55) gd1Var.g;
                    Object obj26 = objArr3[0];
                    Object obj27 = objArr3[1];
                    Object obj28 = objArr3[2];
                    obj5 = null;
                    gd1Var.e = null;
                    gd1Var.f = null;
                    gd1Var.c = do4Var5;
                    gd1Var.d = 1;
                    objK = d55Var.k(obj26, obj27, obj28, gd1Var);
                    if (objK != tb2Var5) {
                    }
                    return tb2Var5;
                }
                if (i9 != 1) {
                    if (i9 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                do4Var5 = (do4) gd1Var.c;
                br7.v(obj);
                objK = obj;
                obj5 = null;
                gd1Var.e = obj5;
                gd1Var.f = obj5;
                gd1Var.c = obj5;
                gd1Var.d = 2;
                if (do4Var5.a(objK, gd1Var) != tb2Var5) {
                    return c1eVar;
                }
                return tb2Var5;
            case 5:
                do4 do4Var6 = (do4) gd1Var.e;
                Object[] objArr4 = (Object[]) gd1Var.f;
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i10 = gd1Var.d;
                if (i10 == 0) {
                    br7.v(obj);
                    e55 e55Var = (e55) gd1Var.g;
                    Object obj29 = objArr4[0];
                    Object obj30 = objArr4[1];
                    Object obj31 = objArr4[2];
                    Object obj32 = objArr4[3];
                    obj6 = null;
                    gd1Var.e = null;
                    gd1Var.f = null;
                    gd1Var.c = do4Var6;
                    gd1Var.d = 1;
                    objS = e55Var.s(obj29, obj30, obj31, obj32, gd1Var);
                    if (objS != tb2Var6) {
                    }
                    return tb2Var6;
                }
                if (i10 != 1) {
                    if (i10 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                do4Var6 = (do4) gd1Var.c;
                br7.v(obj);
                objS = obj;
                obj6 = null;
                gd1Var.e = obj6;
                gd1Var.f = obj6;
                gd1Var.c = obj6;
                gd1Var.d = 2;
                if (do4Var6.a(objS, gd1Var) != tb2Var6) {
                    return c1eVar;
                }
                return tb2Var6;
            case 6:
                do4 do4Var7 = (do4) gd1Var.e;
                Object[] objArr5 = (Object[]) gd1Var.f;
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i11 = gd1Var.d;
                if (i11 == 0) {
                    br7.v(obj);
                    f55 f55Var = (f55) gd1Var.g;
                    Object obj33 = objArr5[0];
                    Object obj34 = objArr5[1];
                    Object obj35 = objArr5[2];
                    Object obj36 = objArr5[3];
                    Object obj37 = objArr5[4];
                    obj7 = null;
                    gd1Var.e = null;
                    gd1Var.f = null;
                    gd1Var.c = do4Var7;
                    gd1Var.d = 1;
                    objP = f55Var.p(obj33, obj34, obj35, obj36, obj37, gd1Var);
                    gd1Var = gd1Var;
                    if (objP != tb2Var7) {
                    }
                    return tb2Var7;
                }
                if (i11 != 1) {
                    if (i11 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                do4Var7 = (do4) gd1Var.c;
                br7.v(obj);
                objP = obj;
                obj7 = null;
                gd1Var.e = obj7;
                gd1Var.f = obj7;
                gd1Var.c = obj7;
                gd1Var.d = 2;
                if (do4Var7.a(objP, gd1Var) != tb2Var7) {
                    return c1eVar;
                }
                return tb2Var7;
            case 7:
                do4 do4Var8 = (do4) gd1Var.e;
                Object[] objArr6 = (Object[]) gd1Var.f;
                tb2 tb2Var8 = tb2.COROUTINE_SUSPENDED;
                int i12 = gd1Var.d;
                if (i12 == 0) {
                    br7.v(obj);
                    c55 c55Var = (c55) gd1Var.g;
                    Object obj38 = objArr6[0];
                    Object obj39 = objArr6[1];
                    obj8 = null;
                    gd1Var.e = null;
                    gd1Var.f = null;
                    gd1Var.c = do4Var8;
                    gd1Var.d = 1;
                    objF = c55Var.f(obj38, obj39, gd1Var);
                    if (objF != tb2Var8) {
                    }
                    return tb2Var8;
                }
                if (i12 != 1) {
                    if (i12 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                do4Var8 = (do4) gd1Var.c;
                br7.v(obj);
                objF = obj;
                obj8 = null;
                gd1Var.e = obj8;
                gd1Var.f = obj8;
                gd1Var.c = obj8;
                gd1Var.d = 2;
                if (do4Var8.a(objF, gd1Var) != tb2Var8) {
                    return c1eVar;
                }
                return tb2Var8;
            case 8:
                tb2 tb2Var9 = tb2.COROUTINE_SUSPENDED;
                int i13 = gd1Var.d;
                if (i13 != 0) {
                    if (i13 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                do4 do4Var9 = (do4) gd1Var.c;
                Throwable th = (Throwable) gd1Var.e;
                hv8 hv8Var = (hv8) gd1Var.f;
                UUID uuidRandomUUID = UUID.randomUUID();
                uuidRandomUUID.getClass();
                j00 j00Var = new j00(uuidRandomUUID, hv8Var, null, null, th instanceof ApolloException ? (ApolloException) th : new ApolloNetworkException("Error while reading response", th), fy3.a, by3.a, false);
                gd1Var.c = null;
                gd1Var.d = 1;
                return do4Var9.a(j00Var, gd1Var) == tb2Var9 ? tb2Var9 : c1eVar;
            case 9:
                rj2 rj2Var = (rj2) gd1Var.c;
                Boolean bool = (Boolean) gd1Var.e;
                tb2 tb2Var10 = tb2.COROUTINE_SUSPENDED;
                int i14 = gd1Var.d;
                if (i14 != 0) {
                    if (i14 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    str = (String) gd1Var.g;
                    br7.v(obj);
                    objA = obj;
                    return new mf7(str, ((Boolean) objA).booleanValue());
                }
                br7.v(obj);
                if (rj2Var != null && g76.L(bool, Boolean.FALSE) && rj2Var.i == zw7.REGULAR) {
                    str = rj2Var.d;
                    zxc zxcVar = ((sg7) gd1Var.f).o;
                    gd1Var.c = null;
                    gd1Var.e = null;
                    gd1Var.g = str;
                    gd1Var.d = 1;
                    objA = zxcVar.a(gd1Var);
                    if (objA == tb2Var10) {
                        return tb2Var10;
                    }
                    return new mf7(str, ((Boolean) objA).booleanValue());
                }
                return null;
            case 10:
                nqa nqaVar = (nqa) gd1Var.f;
                do4 do4Var10 = (do4) gd1Var.c;
                Object obj40 = gd1Var.e;
                tb2 tb2Var11 = tb2.COROUTINE_SUSPENDED;
                int i15 = gd1Var.d;
                if (i15 != 0) {
                    if (i15 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                pc1 pc1VarT = k40.T(nqaVar.f, wjc.i((wjc) gd1Var.g), nqaVar.h, new mqa(0, null, nqaVar));
                gd1Var.c = null;
                gd1Var.e = null;
                gd1Var.d = 1;
                return wgf.l(do4Var10, pc1VarT, gd1Var) == tb2Var11 ? tb2Var11 : c1eVar;
            case 11:
                do4 do4Var11 = (do4) gd1Var.c;
                Object obj41 = gd1Var.e;
                tb2 tb2Var12 = tb2.COROUTINE_SUSPENDED;
                int i16 = gd1Var.d;
                if (i16 != 0) {
                    if (i16 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                xqc xqcVar = (xqc) obj41;
                zsc zscVar = (zsc) gd1Var.f;
                gsc gscVar = zscVar.e;
                String str3 = zscVar.b;
                wsc wscVar = new wsc(zscVar, null);
                gscVar.getClass();
                str3.getClass();
                xqcVar.getClass();
                to4 to4VarQ2 = gscVar.b.Q(new fsc(gscVar, wscVar, str3, xqcVar, null));
                hx4 hx4Var = (hx4) gd1Var.g;
                gd1Var.c = null;
                gd1Var.e = null;
                gd1Var.d = 1;
                hlg.A(do4Var11);
                Object objB = to4VarQ2.b(new eh9(do4Var11, hx4Var, xqcVar, i2), gd1Var);
                if (objB != tb2Var12) {
                    objB = c1eVar;
                }
                if (objB != tb2Var12) {
                    objB = c1eVar;
                }
                return objB == tb2Var12 ? tb2Var12 : c1eVar;
            case 12:
                odd oddVar = (odd) gd1Var.f;
                do4 do4Var12 = (do4) gd1Var.c;
                Object[] objArr7 = (Object[]) gd1Var.e;
                tb2 tb2Var13 = tb2.COROUTINE_SUSPENDED;
                int i17 = gd1Var.d;
                if (i17 != 0) {
                    if (i17 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Object obj42 = objArr7[0];
                obj42.getClass();
                qz8 qz8Var = (qz8) obj42;
                Object obj43 = objArr7[1];
                obj43.getClass();
                Object obj44 = ((bjb) obj43).a;
                Object obj45 = objArr7[2];
                obj45.getClass();
                qz8 qz8Var2 = (qz8) obj45;
                Object obj46 = objArr7[3];
                obj46.getClass();
                qz8 qz8Var3 = (qz8) obj46;
                if ((qz8Var instanceof nz8) && (obj44 instanceof ajb) && (qz8Var2 instanceof nz8) && (qz8Var3 instanceof nz8)) {
                    wcdVar = new scd(m4.I(((nz8) qz8Var).a));
                    obj9 = null;
                } else {
                    oz8 oz8Var = qz8Var instanceof oz8 ? (oz8) qz8Var : null;
                    if (obj44 instanceof ajb) {
                        obj44 = null;
                    }
                    d8d d8dVar = (d8d) obj44;
                    oz8 oz8Var2 = qz8Var2 instanceof oz8 ? (oz8) qz8Var2 : null;
                    oz8 oz8Var3 = qz8Var3 instanceof oz8 ? (oz8) qz8Var3 : null;
                    List list = oz8Var != null ? oz8Var.a : null;
                    List list2 = ey3.a;
                    if (list == null) {
                        list = list2;
                    }
                    HashSet hashSet = new HashSet();
                    ArrayList arrayList = new ArrayList();
                    for (Object obj47 : list) {
                        if (hashSet.add(((dr9) obj47).a)) {
                            arrayList.add(obj47);
                        }
                    }
                    vcd vcdVar = new vcd(arrayList, oz8Var != null ? oz8Var.b : false, oz8Var != null ? oz8Var.c : false);
                    List list3 = oz8Var2 != null ? oz8Var2.a : null;
                    if (list3 == null) {
                        list3 = list2;
                    }
                    HashSet hashSet2 = new HashSet();
                    ArrayList arrayList2 = new ArrayList();
                    for (Object obj48 : list3) {
                        if (hashSet2.add(((dr9) obj48).a)) {
                            arrayList2.add(obj48);
                        }
                    }
                    vcd vcdVar2 = new vcd(arrayList2, oz8Var2 != null ? oz8Var2.b : false, oz8Var2 != null ? oz8Var2.c : false);
                    if (d8dVar != null) {
                        String str4 = d8dVar.a;
                        CatalogName catalogName = d8dVar.b;
                        String str5 = d8dVar.c;
                        String str6 = d8dVar.d;
                        ArrayList arrayList3 = d8dVar.e;
                        ArrayList arrayList4 = new ArrayList(cu1.k0(arrayList3, 10));
                        Iterator it2 = arrayList3.iterator();
                        int i18 = 0;
                        while (it2.hasNext()) {
                            Object next = it2.next();
                            int i19 = i18 + 1;
                            if (i18 < 0) {
                                d46.i0();
                                throw null;
                            }
                            String str7 = str4;
                            Iterator it3 = it2;
                            fr9 fr9Var = oddVar.x;
                            PostPreviewData postPreviewData = ((q8d) next).a;
                            String str8 = oddVar.c;
                            SourceParameter sourceParameterF = oddVar.f();
                            arrayList4.add(fr9.a(fr9Var, postPreviewData, new g08(sourceParameterF.copy(((-9) & 1) != 0 ? sourceParameterF.name : null, ((-9) & 2) != 0 ? sourceParameterF.user_id : null, ((-9) & 4) != 0 ? sourceParameterF.timestamp : null, ((-9) & 8) != 0 ? sourceParameterF.dimension : "curated_list", ((-9) & 16) != 0 ? sourceParameterF.collection_id : null, ((-9) & 32) != 0 ? sourceParameterF.post_id : null, ((-9) & 64) != 0 ? sourceParameterF.tag_slug : null, ((-9) & 128) != 0 ? sourceParameterF.promo_id : null, ((-9) & 256) != 0 ? sourceParameterF.index : new Integer(i18), ((-9) & 512) != 0 ? sourceParameterF.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameterF.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameterF.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameterF.author_id : null, ((-9) & 8192) != 0 ? sourceParameterF.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameterF.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameterF.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameterF.rss_type : null, ((-9) & 131072) != 0 ? sourceParameterF.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameterF.post_source : null, ((-9) & 524288) != 0 ? sourceParameterF.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameterF.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameterF.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameterF.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameterF.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameterF.section_type : null, ((-9) & 33554432) != 0 ? sourceParameterF.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameterF.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameterF.email_id : null, ((-9) & 268435456) != 0 ? sourceParameterF.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameterF.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameterF.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameterF.notification_type : null, (8191 & 1) != 0 ? sourceParameterF.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameterF.local_date_sent : null, (8191 & 4) != 0 ? sourceParameterF.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameterF.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameterF.email_location : null, (8191 & 32) != 0 ? sourceParameterF.book_id : null, (8191 & 64) != 0 ? sourceParameterF.edition_id : null, (8191 & 128) != 0 ? sourceParameterF.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameterF.collection_section_id : null, (8191 & 512) != 0 ? sourceParameterF.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameterF.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameterF.item_type : null, (8191 & 4096) != 0 ? sourceParameterF.unknownFields() : null), str8, oddVar.P), null, false, false, null, false, null, null, null, -132));
                            it2 = it3;
                            catalogName = catalogName;
                            i18 = i19;
                            str4 = str7;
                        }
                        ucdVar = new ucd(str4, catalogName, str5, str6, arrayList4, oddVar.e());
                    } else {
                        ucdVar = null;
                    }
                    List list4 = oz8Var3 != null ? oz8Var3.a : null;
                    if (list4 != null) {
                        list2 = list4;
                    }
                    obj9 = null;
                    wcdVar = new wcd(vcdVar, vcdVar2, ucdVar, new vcd(list2, false, false), (String) gd1Var.g, oddVar.e());
                }
                gd1Var.c = obj9;
                gd1Var.e = obj9;
                gd1Var.d = 1;
                return do4Var12.a(wcdVar, gd1Var) == tb2Var13 ? tb2Var13 : c1eVar;
            default:
                String str9 = (String) gd1Var.g;
                ref refVar = (ref) gd1Var.f;
                do4 do4Var13 = (do4) gd1Var.c;
                Object obj49 = gd1Var.e;
                tb2 tb2Var14 = tb2.COROUTINE_SUSPENDED;
                int i20 = gd1Var.d;
                if (i20 == 0) {
                    br7.v(obj);
                    int i21 = bef.a[((wdf) obj49).ordinal()];
                    n92 n92Var2 = null;
                    if (i21 == 1) {
                        cw4 cw4Var = refVar.f;
                        yk ykVar = new yk(refVar, str9, n92Var2, 23);
                        cw4Var.getClass();
                        str9.getClass();
                        obj10 = null;
                        to4VarQ = cw4Var.b.Q(new yj2(cw4Var, str9, ykVar, n92Var2, 2));
                    } else if (i21 == 2) {
                        to4VarQ = refVar.g.b(str9, new oef(refVar, str9, null));
                        obj10 = null;
                    } else {
                        ygf.a();
                    }
                    gd1Var.c = obj10;
                    gd1Var.e = obj10;
                    gd1Var.d = 1;
                    return wgf.l(do4Var13, to4VarQ, gd1Var) == tb2Var14 ? tb2Var14 : c1eVar;
                }
                if (i20 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gd1(n92 n92Var, que queVar, Object obj, int i) {
        super(3, n92Var);
        this.b = i;
        this.f = queVar;
        this.g = obj;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gd1(n92 n92Var, j55 j55Var, int i) {
        super(3, n92Var);
        this.b = i;
        this.g = j55Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gd1(j55 j55Var, n92 n92Var, int i) {
        super(3, n92Var);
        this.b = i;
        this.g = j55Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gd1(sg7 sg7Var, n92 n92Var) {
        super(3, n92Var);
        this.b = 9;
        this.f = sg7Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gd1(hv8 hv8Var, ms msVar, n92 n92Var) {
        super(3, n92Var);
        this.b = 8;
        this.f = hv8Var;
        this.g = msVar;
    }
}
