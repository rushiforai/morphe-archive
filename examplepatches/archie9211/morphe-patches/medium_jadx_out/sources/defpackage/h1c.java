package defpackage;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import com.facebook.FacebookException;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.medium.android.common.post.image.ParagraphEditImageLayout;
import j$.util.concurrent.ConcurrentHashMap;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.security.GeneralSecurityException;
import java.security.Provider;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import javax.crypto.KeyAgreement;
import org.json.JSONObject;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class h1c implements yx0, mqe, ap6, c19, bo1, huf, f4, g70, w82, f2c, sy3, u2d, ge8, dpe, r44, xlf, thg, vfg {
    public static final h1c b = new h1c(0);
    public static final long[] c = {300000, 900000, 1800000, 3600000, 21600000, 43200000, 86400000, 172800000, 259200000, 604800000, 1209600000, 1814400000, 2419200000L, 5184000000L, 7776000000L, 10368000000L, 12960000000L, 15552000000L, 31536000000L};
    public static final h1c d = new h1c(1);
    public static final h1c e = new h1c(2);
    public static final h1c f = new h1c(3);
    public static final h1c g = new h1c(4);
    public static final h1c h = new h1c(5);
    public static final h1c i = new h1c(6);
    public static final h1c j = new h1c(7);
    public static final h1c k = new h1c(8);
    public static final h1c l = new h1c(9);
    public final /* synthetic */ int a;

    public h1c() {
        this.a = 12;
        i03 i03Var = i03.a;
    }

    public static w1c R0(z46 z46Var) {
        return new w1c(System.currentTimeMillis() + 3600000, new d87(8, 6), new u1c(true, false, false), 10.0d, 1.2d, 60);
    }

    public static String S0(StringBuilder sb) {
        int length = sb.length();
        if (length == 0) {
            ygf.f("StringBuilder must not be empty");
            return null;
        }
        int iCharAt = (sb.charAt(0) << 18) + ((length >= 2 ? sb.charAt(1) : (char) 0) << '\f') + ((length >= 3 ? sb.charAt(2) : (char) 0) << 6) + (length >= 4 ? sb.charAt(3) : (char) 0);
        char c2 = (char) ((iCharAt >> 16) & 255);
        char c3 = (char) ((iCharAt >> 8) & 255);
        char c4 = (char) (iCharAt & 255);
        StringBuilder sb2 = new StringBuilder(3);
        sb2.append(c2);
        if (length >= 2) {
            sb2.append(c3);
        }
        if (length >= 3) {
            sb2.append(c4);
        }
        return sb2.toString();
    }

    public static final void Z0(Context context, String str, String str2) {
        Set set = ec2.a;
        if (set.contains(h1c.class)) {
            return;
        }
        try {
            context.getClass();
            Bundle bundle = new Bundle();
            bundle.putString("fb_mobile_launch_source", "Unclassified");
            g50 g50Var = new g50(str, str2);
            f94 f94Var = f94.a;
            if (mme.c()) {
                g50Var.d("fb_mobile_activate_app", bundle);
            }
            if (o7f.u() == f50.EXPLICIT_ONLY || set.contains(g50Var)) {
                return;
            }
            try {
                l40.c(xq4.EXPLICIT);
            } catch (Throwable th) {
                ec2.a(g50Var, th);
            }
        } catch (Throwable th2) {
            ec2.a(h1c.class, th2);
        }
    }

    public static final void b1(String str, e8 e8Var, String str2) {
        int i2;
        Set set = ec2.a;
        if (set.contains(h1c.class) || e8Var == null) {
            return;
        }
        try {
            Long l2 = (Long) e8Var.e;
            if (l2 == null) {
                l2 = 0L;
            }
            long jLongValue = l2.longValue();
            h1c h1cVar = b;
            if (jLongValue < 0) {
                h1cVar.a1();
                jLongValue = 0;
            }
            Long l3 = (Long) e8Var.b;
            Long l4 = (Long) e8Var.c;
            long jLongValue2 = l4 == null ? 0L : l4.longValue() - l3.longValue();
            if (jLongValue2 < 0) {
                h1cVar.a1();
                jLongValue2 = 0;
            }
            Bundle bundle = new Bundle();
            bundle.putInt("fb_mobile_app_interruptions", e8Var.a);
            Locale locale = Locale.ROOT;
            if (set.contains(h1c.class)) {
                i2 = 0;
            } else {
                i2 = 0;
                while (true) {
                    try {
                        long[] jArr = c;
                        if (i2 >= 19 || jArr[i2] >= jLongValue) {
                            break;
                        } else {
                            i2++;
                        }
                    } catch (Throwable th) {
                        ec2.a(h1c.class, th);
                        i2 = 0;
                    }
                }
            }
            bundle.putString("fb_mobile_time_between_sessions", String.format(locale, "session_quanta_%d", Arrays.copyOf(new Object[]{Integer.valueOf(i2)}, 1)));
            hlb hlbVar = (hlb) e8Var.f;
            bundle.putString("fb_mobile_launch_source", hlbVar != null ? hlbVar.toString() : "Unclassified");
            Long l5 = (Long) e8Var.c;
            bundle.putLong("_logTime", (l5 != null ? l5.longValue() : 0L) / 1000);
            g50 g50Var = new g50(str, str2);
            double d2 = jLongValue2 / 1000.0d;
            f94 f94Var = f94.a;
            if (!mme.c() || ec2.a.contains(g50Var)) {
                return;
            }
            try {
                g50.f(g50Var, "fb_mobile_deactivate_app", Double.valueOf(d2), bundle, false, u6.b());
            } catch (Throwable th2) {
                ec2.a(g50Var, th2);
            }
        } catch (Throwable th3) {
            ec2.a(h1c.class, th3);
        }
    }

    public static jkc e1(c41 c41Var) {
        while (c41Var instanceof f41) {
            f41 f41Var = (f41) c41Var;
            if (f41Var.j() != e41.FAKE_OVERRIDE) {
                break;
            }
            Collection collectionI = f41Var.i();
            collectionI.getClass();
            c41Var = (f41) bu1.b1(collectionI);
            if (c41Var == null) {
                return null;
            }
        }
        return c41Var.d();
    }

    @Override // defpackage.c19
    public void A(ParagraphEditImageLayout paragraphEditImageLayout, String str) {
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.bo1
    public xwd A0(tvd tvdVar, int i2) {
        tvdVar.getClass();
        if (tvdVar instanceof jec) {
            return k40.Z((qn6) tvdVar, i2);
        }
        if (tvdVar instanceof e70) {
            E e2 = ((e70) tvdVar).get(i2);
            e2.getClass();
            return (xwd) e2;
        }
        StringBuilder sb = new StringBuilder("unknown type argument list type: ");
        sb.append(tvdVar);
        lg8.q(sb, n1b.a.b(tvdVar.getClass()));
        return null;
    }

    @Override // defpackage.dpe
    public void B(FacebookException facebookException) {
        Log.e("s2a", "Got unexpected exception: " + facebookException);
    }

    @Override // defpackage.bo1
    public /* bridge */ boolean B0(awd awdVar) {
        return k40.o0(awdVar);
    }

    @Override // defpackage.bo1
    public boolean C(o3e o3eVar) {
        o3eVar.getClass();
        return k40.u0(G(o3eVar)) != k40.u0(c0(o3eVar));
    }

    @Override // defpackage.bo1
    public /* bridge */ xwd C0(qn6 qn6Var, int i2) {
        return k40.Z(qn6Var, i2);
    }

    @Override // defpackage.bo1
    public xwd D(hkb hkbVar, int i2) {
        if (i2 < 0 || i2 >= k40.F(hkbVar)) {
            return null;
        }
        return k40.Z(hkbVar, i2);
    }

    @Override // defpackage.bo1
    public boolean D0(qn6 qn6Var) {
        qn6Var.getClass();
        return !g76.L(k40.S0(G(qn6Var)), k40.S0(c0(qn6Var)));
    }

    @Override // defpackage.bo1
    public /* bridge */ hec E(zm4 zm4Var) {
        return k40.D0(zm4Var);
    }

    @Override // defpackage.c19
    public void E0(ParagraphEditImageLayout paragraphEditImageLayout) {
    }

    @Override // defpackage.bo1
    public /* bridge */ hec F(zm4 zm4Var) {
        return k40.U0(zm4Var);
    }

    @Override // defpackage.bo1
    public /* bridge */ boolean F0(qn6 qn6Var) {
        return k40.u0(qn6Var);
    }

    @Override // defpackage.bo1
    public hec G(qn6 qn6Var) {
        hec hecVarD0;
        qn6Var.getClass();
        zm4 zm4VarJ = k40.J(qn6Var);
        if (zm4VarJ != null && (hecVarD0 = k40.D0(zm4VarJ)) != null) {
            return hecVarD0;
        }
        hec hecVarM = k40.M(qn6Var);
        hecVarM.getClass();
        return hecVarM;
    }

    @Override // defpackage.bo1
    public void G0(hkb hkbVar, awd awdVar) {
    }

    @Override // defpackage.bo1
    public /* bridge */ o3e H(p61 p61Var) {
        return k40.E0(p61Var);
    }

    @Override // defpackage.bo1
    public /* bridge */ tvd H0(hkb hkbVar) {
        return k40.G(hkbVar);
    }

    @Override // defpackage.bo1
    public /* bridge */ Collection I(awd awdVar) {
        return k40.Q0(awdVar);
    }

    @Override // defpackage.bo1
    public /* bridge */ o3e I0(jec jecVar, jec jecVar2) {
        return k40.V(this, jecVar, jecVar2);
    }

    @Override // defpackage.bo1
    public /* bridge */ boolean J(awd awdVar) {
        return k40.p0(awdVar);
    }

    @Override // defpackage.bo1
    public /* bridge */ qn6 J0(qn6 qn6Var) {
        return k40.V0(this, qn6Var);
    }

    @Override // defpackage.bo1
    public /* bridge */ hec K(zm4 zm4Var) {
        return k40.D0(zm4Var);
    }

    @Override // defpackage.ge8
    public fe8 K0() {
        return new fe8(null, null, null, null, null, null, null, 127);
    }

    @Override // defpackage.bo1
    public /* bridge */ zvd L(hkb hkbVar) {
        return k40.S0(hkbVar);
    }

    @Override // defpackage.mqe
    public Object L0(id6 id6Var, float f2) {
        return Float.valueOf(wd6.d(id6Var) * f2);
    }

    @Override // defpackage.bo1
    public /* bridge */ i61 M(p61 p61Var) {
        return k40.Q(p61Var);
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0051, code lost:
    
        defpackage.wgf.x(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0054, code lost:
    
        throw null;
     */
    @Override // defpackage.sy3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void M0(defpackage.vy3 r11) {
        /*
            Method dump skipped, instruction units count: 236
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.h1c.M0(vy3):void");
    }

    @Override // defpackage.bo1
    public boolean N(qn6 qn6Var) {
        qn6Var.getClass();
        hec hecVarM = k40.M(qn6Var);
        return (hecVarM != null ? k40.I(hecVarM) : null) != null;
    }

    @Override // defpackage.bo1
    public /* bridge */ boolean N0(qn6 qn6Var) {
        return k40.q0(qn6Var);
    }

    @Override // defpackage.bo1
    public /* bridge */ hec O(mn6 mn6Var) {
        return k40.M(mn6Var);
    }

    public boolean O0(yv2 yv2Var, yv2 yv2Var2, boolean z) {
        if ((yv2Var instanceof y28) && (yv2Var2 instanceof y28)) {
            return g76.L(((y28) yv2Var).n(), ((y28) yv2Var2).n());
        }
        if ((yv2Var instanceof swd) && (yv2Var2 instanceof swd)) {
            return P0((swd) yv2Var, (swd) yv2Var2, z, a0.r);
        }
        if (!(yv2Var instanceof c41) || !(yv2Var2 instanceof c41)) {
            return ((yv2Var instanceof wx8) && (yv2Var2 instanceof wx8)) ? g76.L(((xx8) ((wx8) yv2Var)).f, ((xx8) ((wx8) yv2Var2)).f) : g76.L(yv2Var, yv2Var2);
        }
        c41 c41Var = (c41) yv2Var;
        c41 c41Var2 = (c41) yv2Var2;
        int i2 = 1;
        if (!c41Var.equals(c41Var2)) {
            if (g76.L(c41Var.getName(), c41Var2.getName()) && ((!(c41Var instanceof tu7) || !(c41Var2 instanceof tu7) || ((tu7) c41Var).y() == ((tu7) c41Var2).y()) && ((!g76.L(c41Var.h(), c41Var2.h()) || (z && g76.L(e1(c41Var), e1(c41Var2)))) && !d93.n(c41Var) && !d93.n(c41Var2)))) {
                yv2 yv2VarH = c41Var.h();
                yv2 yv2VarH2 = c41Var2.h();
                if (((yv2VarH instanceof f41) || (yv2VarH2 instanceof f41)) ? false : O0(yv2VarH, yv2VarH2, z)) {
                    cx8 cx8Var = new cx8(new o72(c41Var, c41Var2, z, i2));
                    ax8 ax8VarB = cx8Var.m(c41Var, c41Var2, null, true).b();
                    ax8 ax8Var = ax8.OVERRIDABLE;
                    if (ax8VarB != ax8Var || cx8Var.m(c41Var2, c41Var, null, true).b() != ax8Var) {
                    }
                }
            }
            return false;
        }
        return true;
    }

    @Override // defpackage.bo1
    public boolean P(hkb hkbVar) {
        hkbVar.getClass();
        return k40.I(hkbVar) != null;
    }

    public boolean P0(swd swdVar, swd swdVar2, boolean z, b55 b55Var) {
        if (swdVar.equals(swdVar2)) {
            return true;
        }
        if (g76.L(swdVar.h(), swdVar2.h())) {
            return false;
        }
        yv2 yv2VarH = swdVar.h();
        yv2 yv2VarH2 = swdVar2.h();
        return (((yv2VarH instanceof f41) || (yv2VarH2 instanceof f41)) ? ((Boolean) b55Var.invoke(yv2VarH, yv2VarH2)).booleanValue() : O0(yv2VarH, yv2VarH2, z)) && swdVar.getIndex() == swdVar2.getIndex();
    }

    @Override // defpackage.f4
    public String Q() {
        return "refresh_access_token";
    }

    public void Q0(ly lyVar, ly lyVar2) {
        HashSet hashSet = new HashSet();
        Iterator it2 = lyVar.iterator();
        while (it2.hasNext()) {
            hashSet.add(((yx) it2.next()).e());
        }
        Iterator it3 = lyVar2.iterator();
        while (it3.hasNext()) {
            hashSet.contains(((yx) it3.next()).e());
        }
    }

    @Override // defpackage.bo1
    public /* bridge */ pxd R(xwd xwdVar) {
        return k40.h0(xwdVar);
    }

    @Override // defpackage.bo1
    public boolean S(hkb hkbVar) {
        return k40.s0(k40.S0(hkbVar));
    }

    @Override // defpackage.vfg
    public gr7 T(nig nigVar) throws GeneralSecurityException {
        if (!((String) nigVar.a).equals("type.googleapis.com/google.crypto.tink.AesGcmSivKey")) {
            ay0.e("Wrong type URL in call to AesGcmSivProtoSerialization.parseKey");
            return null;
        }
        try {
            jng jngVarU = jng.u((hsf) nigVar.c, ptf.a);
            if (jngVarU.t() != 0) {
                throw new GeneralSecurityException("Only version 0 keys are accepted");
            }
            d2f d2fVarB = r2g.b();
            d2fVarB.E0(jngVarU.x().e());
            d2fVarB.c = u6g.a((ntg) nigVar.e);
            r2g r2gVarA0 = d2fVarB.A0();
            int i2 = 28;
            vwa vwaVar = new vwa(i2, false);
            vwaVar.c = null;
            vwaVar.d = null;
            vwaVar.b = r2gVarA0;
            vwaVar.c = new ujf(i2, qvg.a(jngVarU.x().x()));
            vwaVar.d = (Integer) nigVar.f;
            return vwaVar.J();
        } catch (zzale unused) {
            ygf.l("Parsing AesGcmSivKey failed");
            return null;
        }
    }

    public hec T0(o2b o2bVar, uvd uvdVar, boolean z, int i2, boolean z2) {
        uvd uvdVarI;
        pqe pqeVar = pqe.INVARIANT;
        ha3 ha3Var = (ha3) o2bVar.c;
        xwd xwdVarU0 = U0(new onc(ha3Var.A0(), pqeVar), o2bVar, null, i2);
        mn6 mn6VarB = xwdVarU0.b();
        mn6VarB.getClass();
        hec hecVarR = lk7.r(mn6VarB);
        if (kyd.a0(hecVarR)) {
            return hecVarR;
        }
        xwdVarU0.a();
        Q0(hecVarR.getAnnotations(), py.a(uvdVar));
        if (!kyd.a0(hecVarR)) {
            if (kyd.a0(hecVarR)) {
                uvdVarI = hecVarR.i0();
            } else {
                uvd uvdVarI0 = hecVarR.i0();
                a1a a1aVar = uvd.b;
                uvdVarI0.getClass();
                if (uvdVar.isEmpty() && uvdVarI0.isEmpty()) {
                    uvdVarI = uvdVar;
                } else {
                    ArrayList arrayList = new ArrayList();
                    Collection collectionValues = ((ConcurrentHashMap) a1aVar.b).values();
                    collectionValues.getClass();
                    Iterator it2 = collectionValues.iterator();
                    while (it2.hasNext()) {
                        int iIntValue = ((Number) it2.next()).intValue();
                        oy oyVar = (oy) uvdVar.a.get(iIntValue);
                        oy oyVar2 = (oy) uvdVarI0.a.get(iIntValue);
                        if (oyVar != null) {
                            if (oyVar2 != null) {
                                ly nyVar = oyVar.a;
                                ly lyVar = oyVar2.a;
                                nyVar.getClass();
                                lyVar.getClass();
                                if (nyVar.isEmpty()) {
                                    nyVar = lyVar;
                                } else if (!lyVar.isEmpty()) {
                                    nyVar = new ny(new ly[]{nyVar, lyVar});
                                }
                                oyVar = new oy(nyVar);
                            }
                            oyVar2 = oyVar;
                        } else if (oyVar2 == null) {
                            oyVar2 = null;
                        } else if (oyVar != null) {
                            ly nyVar2 = oyVar2.a;
                            ly lyVar2 = oyVar.a;
                            nyVar2.getClass();
                            lyVar2.getClass();
                            if (nyVar2.isEmpty()) {
                                nyVar2 = lyVar2;
                            } else if (!lyVar2.isEmpty()) {
                                nyVar2 = new ny(new ly[]{nyVar2, lyVar2});
                            }
                            oyVar2 = new oy(nyVar2);
                        }
                        if (oyVar2 != null) {
                            arrayList.add(oyVar2);
                        }
                    }
                    uvdVarI = a1a.i(arrayList);
                }
            }
            hecVarR = lk7.D(hecVarR, null, uvdVarI, 1);
        }
        hec hecVarJ = nxd.j(hecVarR, z);
        if (!z2) {
            return hecVarJ;
        }
        w2 w2Var = ha3Var.i;
        w2Var.getClass();
        return gq7.a0(hecVarJ, pwd.Z(dv7.b, uvdVar, w2Var, (List) o2bVar.d, z));
    }

    @Override // defpackage.bo1
    public /* bridge */ p61 U(hec hecVar) {
        return k40.H(this, hecVar);
    }

    public xwd U0(xwd xwdVar, o2b o2bVar, swd swdVar, int i2) {
        pqe pqeVarZ;
        pqe pqeVar;
        pqe pqeVar2;
        ha3 ha3Var = (ha3) o2bVar.c;
        if (i2 > 100) {
            throw new AssertionError("Too deep recursion while expanding type alias " + ha3Var.getName());
        }
        if (xwdVar.c()) {
            swdVar.getClass();
            return nxd.k(swdVar);
        }
        mn6 mn6VarB = xwdVar.b();
        mn6VarB.getClass();
        zvd zvdVarJ0 = mn6VarB.j0();
        zvdVarJ0.getClass();
        co1 co1VarA = zvdVarJ0.a();
        xwd xwdVar2 = co1VarA instanceof swd ? (xwd) ((Map) o2bVar.e).get(co1VarA) : null;
        int i3 = 0;
        if (xwdVar2 == null) {
            hec hecVarR = lk7.r(xwdVar.b().m0());
            if (!kyd.a0(hecVarR) && nxd.c(hecVarR, zkc.q, null)) {
                zvd zvdVarJ02 = hecVarR.j0();
                co1 co1VarA2 = zvdVarJ02.a();
                zvdVarJ02.getParameters().size();
                hecVarR.h0().size();
                if (!(co1VarA2 instanceof swd)) {
                    if (!(co1VarA2 instanceof ha3)) {
                        hec hecVarF1 = f1(hecVarR, o2bVar, i2);
                        ixd.d(hecVarF1);
                        for (Object obj : hecVarF1.h0()) {
                            int i4 = i3 + 1;
                            if (i3 < 0) {
                                d46.i0();
                                throw null;
                            }
                            xwd xwdVar3 = (xwd) obj;
                            if (!xwdVar3.c()) {
                                mn6 mn6VarB2 = xwdVar3.b();
                                mn6VarB2.getClass();
                                if (!nxd.c(mn6VarB2, zkc.p, null)) {
                                }
                            }
                            i3 = i4;
                        }
                        return new onc(hecVarF1, xwdVar.a());
                    }
                    ha3 ha3Var2 = (ha3) co1VarA2;
                    if (o2bVar.y(ha3Var2)) {
                        pqe pqeVar3 = pqe.INVARIANT;
                        k24 k24Var = k24.RECURSIVE_TYPE_ALIAS;
                        String str = ha3Var2.getName().a;
                        str.getClass();
                        return new onc(l24.c(k24Var, str), pqeVar3);
                    }
                    List listH0 = hecVarR.h0();
                    ArrayList arrayList = new ArrayList(cu1.k0(listH0, 10));
                    for (Object obj2 : listH0) {
                        int i5 = i3 + 1;
                        if (i3 < 0) {
                            d46.i0();
                            throw null;
                        }
                        arrayList.add(U0((xwd) obj2, o2bVar, (swd) zvdVarJ02.getParameters().get(i3), i2 + 1));
                        i3 = i5;
                    }
                    List parameters = ha3Var2.i.getParameters();
                    ArrayList arrayList2 = new ArrayList(cu1.k0(parameters, 10));
                    Iterator it2 = parameters.iterator();
                    while (it2.hasNext()) {
                        arrayList2.add(((swd) it2.next()).x0());
                    }
                    return new onc(gq7.a0(T0(new o2b(o2bVar, ha3Var2, arrayList, ei7.V(bu1.t1(arrayList, arrayList2)), 9), hecVarR.i0(), hecVarR.k0(), i2 + 1, false), f1(hecVarR, o2bVar, i2)), xwdVar.a());
                }
            }
            return xwdVar;
        }
        if (xwdVar2.c()) {
            swdVar.getClass();
            return nxd.k(swdVar);
        }
        o3e o3eVarM0 = xwdVar2.b().m0();
        pqe pqeVarA = xwdVar2.a();
        pqeVarA.getClass();
        pqe pqeVarA2 = xwdVar.a();
        pqeVarA2.getClass();
        if (pqeVarA2 != pqeVarA && pqeVarA2 != (pqeVar2 = pqe.INVARIANT) && pqeVarA == pqeVar2) {
            pqeVarA = pqeVarA2;
        }
        if (swdVar == null || (pqeVarZ = swdVar.z()) == null) {
            pqeVarZ = pqe.INVARIANT;
        }
        if (pqeVarZ != pqeVarA && pqeVarZ != (pqeVar = pqe.INVARIANT) && pqeVarA == pqeVar) {
            pqeVarA = pqeVar;
        }
        Q0(mn6VarB.getAnnotations(), o3eVarM0.getAnnotations());
        hec hecVarJ = nxd.j(lk7.r(o3eVarM0), mn6VarB.k0());
        uvd uvdVarI0 = mn6VarB.i0();
        if (!kyd.a0(hecVarJ)) {
            if (kyd.a0(hecVarJ)) {
                uvdVarI0 = hecVarJ.i0();
            } else {
                uvd uvdVarI02 = hecVarJ.i0();
                uvdVarI0.getClass();
                a1a a1aVar = uvd.b;
                uvdVarI02.getClass();
                if (!uvdVarI0.isEmpty() || !uvdVarI02.isEmpty()) {
                    ArrayList arrayList3 = new ArrayList();
                    Collection collectionValues = ((ConcurrentHashMap) a1aVar.b).values();
                    collectionValues.getClass();
                    Iterator it3 = collectionValues.iterator();
                    while (it3.hasNext()) {
                        int iIntValue = ((Number) it3.next()).intValue();
                        oy oyVar = (oy) uvdVarI0.a.get(iIntValue);
                        oy oyVar2 = (oy) uvdVarI02.a.get(iIntValue);
                        if (oyVar != null) {
                            if (oyVar2 != null) {
                                ly nyVar = oyVar.a;
                                ly lyVar = oyVar2.a;
                                nyVar.getClass();
                                lyVar.getClass();
                                if (nyVar.isEmpty()) {
                                    nyVar = lyVar;
                                } else if (!lyVar.isEmpty()) {
                                    nyVar = new ny(new ly[]{nyVar, lyVar});
                                }
                                oyVar = new oy(nyVar);
                            }
                            oyVar2 = oyVar;
                        } else if (oyVar2 == null) {
                            oyVar2 = null;
                        } else if (oyVar != null) {
                            ly nyVar2 = oyVar2.a;
                            ly lyVar2 = oyVar.a;
                            nyVar2.getClass();
                            lyVar2.getClass();
                            if (nyVar2.isEmpty()) {
                                nyVar2 = lyVar2;
                            } else if (!lyVar2.isEmpty()) {
                                nyVar2 = new ny(new ly[]{nyVar2, lyVar2});
                            }
                            oyVar2 = new oy(nyVar2);
                        }
                        if (oyVar2 != null) {
                            arrayList3.add(oyVar2);
                        }
                    }
                    uvdVarI0 = a1a.i(arrayList3);
                }
            }
            hecVarJ = lk7.D(hecVarJ, null, uvdVarI0, 1);
        }
        return new onc(hecVarJ, pqeVarA);
    }

    @Override // defpackage.bo1
    public /* bridge */ ao1 V(hkb hkbVar) {
        return k40.P0(this, hkbVar);
    }

    public String V0(String str) {
        if (str == null || !Y0(str)) {
            return null;
        }
        Uri uri = Uri.parse(str);
        String queryParameter = uri.getQueryParameter("$android_deeplink_path");
        if (queryParameter != null) {
            return queryParameter;
        }
        String queryParameter2 = uri.getQueryParameter("$fallback_url");
        if (queryParameter2 != null) {
            return queryParameter2;
        }
        String queryParameter3 = uri.getQueryParameter("$canonical_url");
        if (queryParameter3 != null) {
            return queryParameter3;
        }
        String queryParameter4 = uri.getQueryParameter("$ios_deeplink_path");
        if (queryParameter4 != null) {
            return queryParameter4;
        }
        String queryParameter5 = uri.getQueryParameter("$desktop_url");
        if (queryParameter5 != null) {
            return queryParameter5;
        }
        return null;
    }

    @Override // defpackage.bo1
    public /* bridge */ Collection W(hkb hkbVar) {
        return k40.H0(this, hkbVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0040 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x006e -> B:27:0x0071). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object W0(java.io.FileOutputStream r12, defpackage.p92 r13) throws java.io.IOException {
        /*
            r11 = this;
            boolean r0 = r13 instanceof defpackage.k58
            if (r0 == 0) goto L13
            r0 = r13
            k58 r0 = (defpackage.k58) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            k58 r0 = new k58
            r0.<init>(r11, r13)
        L18:
            java.lang.Object r11 = r0.d
            tb2 r13 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r0.f
            r2 = 1
            if (r1 == 0) goto L33
            if (r1 != r2) goto L2c
            long r3 = r0.c
            java.io.FileOutputStream r12 = r0.b
            defpackage.br7.v(r11)
            r11 = r0
            goto L71
        L2c:
            java.lang.String r11 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r11)
            r11 = 0
            return r11
        L33:
            defpackage.br7.v(r11)
            r3 = 10
            r11 = r0
        L39:
            r0 = 60000(0xea60, double:2.9644E-319)
            int r0 = (r3 > r0 ? 1 : (r3 == r0 ? 0 : -1))
            if (r0 > 0) goto L76
            java.nio.channels.FileChannel r5 = r12.getChannel()     // Catch: java.io.IOException -> L54
            r8 = 9223372036854775807(0x7fffffffffffffff, double:NaN)
            r10 = 0
            r6 = 0
            java.nio.channels.FileLock r0 = r5.lock(r6, r8, r10)     // Catch: java.io.IOException -> L54
            r0.getClass()     // Catch: java.io.IOException -> L54
            return r0
        L54:
            r0 = move-exception
            java.lang.String r1 = r0.getMessage()
            if (r1 == 0) goto L75
            java.lang.String r5 = "Resource deadlock would occur"
            r6 = 0
            boolean r1 = defpackage.muc.Q(r1, r5, r6)
            if (r1 != r2) goto L75
            r11.b = r12
            r11.c = r3
            r11.f = r2
            java.lang.Object r0 = defpackage.gsa.X(r3, r11)
            if (r0 != r13) goto L71
            return r13
        L71:
            r0 = 2
            long r3 = r3 * r0
            goto L39
        L75:
            throw r0
        L76:
            java.nio.channels.FileChannel r5 = r12.getChannel()
            r8 = 9223372036854775807(0x7fffffffffffffff, double:NaN)
            r10 = 0
            r6 = 0
            java.nio.channels.FileLock r11 = r5.lock(r6, r8, r10)
            r11.getClass()
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.h1c.W0(java.io.FileOutputStream, p92):java.lang.Object");
    }

    @Override // defpackage.bo1
    public o3e X(qn6 qn6Var) {
        return k40.F0(qn6Var);
    }

    /* JADX WARN: Code restructure failed: missing block: B:103:0x026e, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:118:0x02bf, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:129:0x0304, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:140:0x0343, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:147:0x0377, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:162:0x03c9, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:173:0x040c, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:189:0x046c, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:196:0x049e, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:209:0x04ea, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:218:0x0520, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:231:0x056c, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:254:0x05fb, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:267:0x0647, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:285:0x06b2, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x0131, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x016a, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x01b9, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x01fd, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x023b, code lost:
    
        if (r10 == r0) goto L299;
     */
    /* JADX WARN: Removed duplicated region for block: B:300:0x06f5 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object X0(defpackage.md9 r11, defpackage.nhc r12, android.content.res.Resources r13, defpackage.sh9 r14, defpackage.n92 r15) {
        /*
            Method dump skipped, instruction units count: 1842
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.h1c.X0(md9, nhc, android.content.res.Resources, sh9, n92):java.lang.Object");
    }

    @Override // defpackage.bo1
    public /* bridge */ o3e Y(xwd xwdVar) {
        return k40.f0(this, xwdVar);
    }

    public boolean Y0(String str) {
        str.getClass();
        Locale locale = Locale.ENGLISH;
        locale.getClass();
        String lowerCase = str.toLowerCase(locale);
        lowerCase.getClass();
        i03 i03Var = i03.a;
        List listR = d46.R(i03.d, i03.e, i03.f);
        if (!listR.isEmpty()) {
            Iterator it2 = listR.iterator();
            while (it2.hasNext()) {
                if (muc.Q(lowerCase, (CharSequence) it2.next(), false)) {
                    return true;
                }
            }
        }
        return muc.Q(str, "_branch_referrer", false);
    }

    @Override // defpackage.bo1
    public /* bridge */ void Z(hkb hkbVar) {
        k40.B0(hkbVar);
    }

    @Override // defpackage.ge8
    public void a(Context context) {
    }

    @Override // defpackage.bo1
    public /* bridge */ int a0(awd awdVar) {
        return k40.G0(awdVar);
    }

    public void a1() {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            z46 z46Var = f87.b;
            z46.q(i87.APP_EVENTS, "h1c", "Clock skew detected");
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    @Override // defpackage.f2c
    public w1c b(z46 z46Var, JSONObject jSONObject) {
        return R0(z46Var);
    }

    @Override // defpackage.bo1
    public /* bridge */ boolean b0(swd swdVar, awd awdVar) {
        return k40.j0(swdVar, awdVar);
    }

    @Override // defpackage.huf
    public boolean c(Class cls) {
        return ytf.class.isAssignableFrom(cls);
    }

    @Override // defpackage.bo1
    public hec c0(qn6 qn6Var) {
        hec hecVarU0;
        qn6Var.getClass();
        zm4 zm4VarJ = k40.J(qn6Var);
        if (zm4VarJ != null && (hecVarU0 = k40.U0(zm4VarJ)) != null) {
            return hecVarU0;
        }
        hec hecVarM = k40.M(qn6Var);
        hecVarM.getClass();
        return hecVarM;
    }

    public xvd c1() {
        return bo.J(false, this, null, 24);
    }

    @Override // defpackage.xlf
    public /* bridge */ /* synthetic */ Object d(String str, Provider provider) {
        return provider == null ? KeyAgreement.getInstance(str) : KeyAgreement.getInstance(str, provider);
    }

    @Override // defpackage.bo1
    public /* bridge */ hec d0(hkb hkbVar) {
        return k40.W0(hkbVar, false);
    }

    public jec d1(hkb hkbVar) {
        hec hecVar;
        v33 v33VarI = k40.I(hkbVar);
        return (v33VarI == null || (hecVar = v33VarI.b) == null) ? (jec) hkbVar : hecVar;
    }

    @Override // defpackage.bo1
    public vm6 e() {
        throw new UnsupportedOperationException("Not supported");
    }

    @Override // defpackage.bo1
    public /* bridge */ hec e0(hkb hkbVar) {
        return k40.W0(hkbVar, true);
    }

    @Override // defpackage.g70, defpackage.j70
    public /* synthetic */ float f() {
        return 0.0f;
    }

    @Override // defpackage.ap6
    public Object f0(of5 of5Var, n92 n92Var) {
        long j2 = of5Var.u;
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap((int) (j2 >> 32), (int) (j2 & 4294967295L), Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmapCreateBitmap);
        Canvas canvas2 = qm.a;
        pm pmVar = new pm();
        pmVar.a = canvas;
        of5Var.c(pmVar, null);
        return bitmapCreateBitmap;
    }

    public hec f1(hec hecVar, o2b o2bVar, int i2) {
        zvd zvdVarJ0 = hecVar.j0();
        List listH0 = hecVar.h0();
        ArrayList arrayList = new ArrayList(cu1.k0(listH0, 10));
        int i3 = 0;
        for (Object obj : listH0) {
            int i4 = i3 + 1;
            if (i3 < 0) {
                d46.i0();
                throw null;
            }
            xwd xwdVar = (xwd) obj;
            xwd xwdVarU0 = U0(xwdVar, o2bVar, (swd) zvdVarJ0.getParameters().get(i3), i2 + 1);
            if (!xwdVarU0.c()) {
                xwdVarU0 = new onc(nxd.i(xwdVarU0.b(), xwdVar.b().k0()), xwdVarU0.a());
            }
            arrayList.add(xwdVarU0);
            i3 = i4;
        }
        return lk7.D(hecVar, arrayList, null, 2);
    }

    @Override // defpackage.w82
    public long g(long j2, long j3) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j3 >> 32)) / Float.intBitsToFloat((int) (j2 >> 32));
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(fIntBitsToFloat)) << 32) | (((long) Float.floatToRawIntBits(fIntBitsToFloat)) & 4294967295L);
        int i2 = fqb.a;
        return jFloatToRawIntBits;
    }

    @Override // defpackage.bo1
    public o3e g0(ArrayList arrayList) {
        hec hecVar;
        int size = arrayList.size();
        if (size == 0) {
            ygf.f("Expected some types");
            return null;
        }
        if (size == 1) {
            return (o3e) bu1.Z0(arrayList);
        }
        ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
        Iterator it2 = arrayList.iterator();
        boolean z = false;
        boolean z2 = false;
        while (it2.hasNext()) {
            o3e o3eVar = (o3e) it2.next();
            z = z || kyd.a0(o3eVar);
            if (o3eVar instanceof hec) {
                hecVar = (hec) o3eVar;
            } else {
                if (!(o3eVar instanceof zm4)) {
                    ygf.a();
                    return null;
                }
                hecVar = ((zm4) o3eVar).b;
                z2 = true;
            }
            arrayList2.add(hecVar);
        }
        if (z) {
            return l24.c(k24.INTERSECTION_OF_ERROR_TYPES, arrayList.toString());
        }
        owd owdVar = owd.a;
        if (!z2) {
            return owdVar.b(arrayList2);
        }
        ArrayList arrayList3 = new ArrayList(cu1.k0(arrayList, 10));
        Iterator it3 = arrayList.iterator();
        while (it3.hasNext()) {
            arrayList3.add(f49.X((o3e) it3.next()));
        }
        return pwd.K(owdVar.b(arrayList2), owdVar.b(arrayList3));
    }

    @Override // defpackage.bo1
    public /* bridge */ int h(qn6 qn6Var) {
        return k40.F(qn6Var);
    }

    @Override // defpackage.bo1
    public /* bridge */ onc h0(qn6 qn6Var) {
        return k40.N(qn6Var);
    }

    @Override // defpackage.bo1
    public /* bridge */ hec i0(zm4 zm4Var) {
        return k40.U0(zm4Var);
    }

    @Override // defpackage.bo1
    public boolean j(p61 p61Var) {
        return p61Var instanceof j61;
    }

    @Override // defpackage.bo1
    public /* bridge */ boolean j0(hkb hkbVar, hkb hkbVar2) {
        return k40.k0(hkbVar, hkbVar2);
    }

    @Override // defpackage.bo1
    public int k(tvd tvdVar) {
        tvdVar.getClass();
        if (tvdVar instanceof hkb) {
            return k40.F((qn6) tvdVar);
        }
        if (tvdVar instanceof e70) {
            return ((e70) tvdVar).size();
        }
        StringBuilder sb = new StringBuilder("unknown type argument list type: ");
        sb.append(tvdVar);
        lg8.q(sb, n1b.a.b(tvdVar.getClass()));
        return 0;
    }

    @Override // defpackage.bo1
    public /* bridge */ swd k0(awd awdVar, int i2) {
        return k40.d0(awdVar, i2);
    }

    @Override // defpackage.huf
    public ruf l(Class cls) {
        if (!ytf.class.isAssignableFrom(cls)) {
            ay0.e("Unsupported message type: ".concat(cls.getName()));
            return null;
        }
        try {
            return (ruf) ytf.f(cls.asSubclass(ytf.class)).d(3);
        } catch (Exception e2) {
            lg8.p("Unable to get message info for ".concat(cls.getName()), e2);
            return null;
        }
    }

    @Override // defpackage.ge8
    public void l0(Context context) {
        context.getClass();
    }

    @Override // defpackage.dpe
    public void m(JSONObject jSONObject) {
        String strOptString = jSONObject != null ? jSONObject.optString("id") : null;
        if (strOptString == null) {
            Log.w("s2a", "No user ID returned on Me request");
            return;
        }
        String strOptString2 = jSONObject.optString("link");
        String strOptString3 = jSONObject.optString("profile_picture", null);
        m50.o.T().N(new s2a(strOptString, jSONObject.optString("first_name"), jSONObject.optString("middle_name"), jSONObject.optString("last_name"), jSONObject.optString("name"), strOptString2 != null ? Uri.parse(strOptString2) : null, strOptString3 != null ? Uri.parse(strOptString3) : null), true);
    }

    @Override // defpackage.bo1
    public /* bridge */ boolean m0(awd awdVar, awd awdVar2) {
        return k40.E(awdVar, awdVar2);
    }

    @Override // defpackage.bo1
    public void n(qn6 qn6Var) {
        qn6Var.getClass();
        k40.J(qn6Var);
    }

    @Override // defpackage.bo1
    public boolean n0(hkb hkbVar) {
        hec hecVarM = k40.M(hkbVar);
        return (hecVarM != null ? k40.H(this, d1(hecVarM)) : null) != null;
    }

    @Override // defpackage.bo1
    public /* bridge */ boolean o(awd awdVar) {
        return k40.t0(awdVar);
    }

    @Override // defpackage.bo1
    public boolean o0(qn6 qn6Var) {
        qn6Var.getClass();
        return qn6Var instanceof hi8;
    }

    @Override // defpackage.yx0
    public Rect p(Activity activity) throws Exception {
        Configuration configuration = activity.getResources().getConfiguration();
        try {
            Field declaredField = Configuration.class.getDeclaredField("windowConfiguration");
            declaredField.setAccessible(true);
            Object obj = declaredField.get(configuration);
            Object objInvoke = obj.getClass().getDeclaredMethod("getBounds", null).invoke(obj, null);
            objInvoke.getClass();
            return new Rect((Rect) objInvoke);
        } catch (Exception e2) {
            if (!(e2 instanceof NoSuchFieldException) && !(e2 instanceof NoSuchMethodException) && !(e2 instanceof IllegalAccessException) && !(e2 instanceof InvocationTargetException)) {
                throw e2;
            }
            yx0.U.getClass();
            Log.w(xx0.b, e2);
            return jzb.b.p(activity);
        }
    }

    @Override // defpackage.bo1
    public /* bridge */ void p0(hkb hkbVar) {
        k40.C0(hkbVar);
    }

    @Override // defpackage.bo1
    public /* bridge */ we8 q(p61 p61Var) {
        return k40.R0(p61Var);
    }

    @Override // defpackage.bo1
    public /* bridge */ boolean q0(xwd xwdVar) {
        return k40.A0(xwdVar);
    }

    @Override // defpackage.bo1
    public /* bridge */ hec r(hkb hkbVar, i61 i61Var) {
        return k40.P(hkbVar, i61Var);
    }

    @Override // defpackage.bo1
    public /* bridge */ zm4 r0(qn6 qn6Var) {
        return k40.J(qn6Var);
    }

    @Override // defpackage.bo1
    public pxd s(swd swdVar) {
        pqe pqeVarZ = swdVar.z();
        pqeVarZ.getClass();
        return mk7.n(pqeVarZ);
    }

    @Override // defpackage.bo1
    public zvd s0(qn6 qn6Var) {
        qn6Var.getClass();
        hec hecVarM = k40.M(qn6Var);
        if (hecVarM == null) {
            hecVarM = G(qn6Var);
        }
        return k40.S0(hecVarM);
    }

    @Override // defpackage.bo1
    public /* bridge */ xwd t(m61 m61Var) {
        return k40.I0(m61Var);
    }

    @Override // defpackage.bo1
    public /* bridge */ boolean t0(awd awdVar) {
        return k40.s0(awdVar);
    }

    public String toString() {
        switch (this.a) {
            case 11:
                return "AbsoluteArrangement#Left";
            case 25:
                return "NULL_VALUE";
            default:
                return super.toString();
        }
    }

    @Override // defpackage.bo1
    public /* bridge */ boolean u(awd awdVar) {
        return k40.n0(awdVar);
    }

    @Override // defpackage.bo1
    public /* bridge */ hec u0(qn6 qn6Var) {
        return k40.M(qn6Var);
    }

    @Override // defpackage.f4
    public String v() {
        return "ig_refresh_token";
    }

    @Override // defpackage.bo1
    public p61 v0(hkb hkbVar) {
        return k40.H(this, d1(hkbVar));
    }

    @Override // defpackage.g70
    public void w(m73 m73Var, int i2, int[] iArr, ip6 ip6Var, int[] iArr2) {
        int length = iArr.length;
        int i3 = 0;
        int i4 = 0;
        int i5 = 0;
        while (i3 < length) {
            int i6 = iArr[i3];
            iArr2[i4] = i5;
            i5 += i6;
            i3++;
            i4++;
        }
    }

    @Override // defpackage.bo1
    public /* bridge */ boolean w0(awd awdVar) {
        return k40.m0(awdVar);
    }

    @Override // defpackage.bo1
    public boolean x(hkb hkbVar) {
        hkbVar.getClass();
        return k40.v0(s0(hkbVar)) && !k40.w0(hkbVar);
    }

    @Override // defpackage.c19
    public void x0(y09 y09Var) {
    }

    @Override // defpackage.u2d
    public v2d y(zdc zdcVar) {
        return new f35((Context) zdcVar.c, (String) zdcVar.d, (ad) zdcVar.e, zdcVar.a, zdcVar.b);
    }

    @Override // defpackage.bo1
    public /* bridge */ boolean y0(p61 p61Var) {
        return k40.y0(p61Var);
    }

    @Override // defpackage.bo1
    public boolean z(hkb hkbVar) {
        hkbVar.getClass();
        return k40.n0(k40.S0(hkbVar));
    }

    @Override // defpackage.bo1
    public /* bridge */ boolean z0(awd awdVar) {
        return k40.v0(awdVar);
    }

    @Override // defpackage.thg
    public lig i(bzf bzfVar) {
        f1g f1gVar = (f1g) bzfVar;
        hsg hsgVarT = isg.t();
        hsgVarT.g(fiHTiFJ.hIAXWlDTZnqGU);
        rlg rlgVarT = tlg.t();
        emg emgVarW = fmg.w();
        jmg jmgVarV = lmg.v();
        int i2 = f1gVar.c;
        jmgVarV.c();
        ((lmg) jmgVarV.b).zze = i2;
        lmg lmgVar = (lmg) jmgVarV.b();
        emgVarW.c();
        fmg.v((fmg) emgVarW.b, lmgVar);
        int i3 = f1gVar.a;
        emgVarW.c();
        ((fmg) emgVarW.b).zzg = i3;
        fmg fmgVar = (fmg) emgVarW.b();
        rlgVarT.c();
        tlg.v((tlg) rlgVarT.b, fmgVar);
        lqg lqgVarY = nqg.y();
        tqg tqgVarD = n5g.d(f1gVar);
        lqgVarY.c();
        nqg.w((nqg) lqgVarY.b, tqgVarD);
        int i4 = f1gVar.b;
        lqgVarY.c();
        ((nqg) lqgVarY.b).zzg = i4;
        nqg nqgVar = (nqg) lqgVarY.b();
        rlgVarT.c();
        tlg.w((tlg) rlgVarT.b, nqgVar);
        hsgVarT.h(((tlg) rlgVarT.b()).b());
        hsgVarT.e(n5g.c(f1gVar.e));
        return lig.p0((isg) hsgVarT.b());
    }

    public /* synthetic */ h1c(int i2) {
        this.a = i2;
    }
}
