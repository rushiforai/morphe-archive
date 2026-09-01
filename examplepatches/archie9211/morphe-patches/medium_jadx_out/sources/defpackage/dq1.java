package defpackage;

import android.app.Application;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.google.android.material.internal.It.KLTXZbnQvj;
import java.io.File;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.security.GeneralSecurityException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Timer;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.chromium.net.impl.JavaCronetProvider;
import org.json.JSONArray;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class dq1 implements dec, mqe, c8, g70, j70, i6d, iwa, e52, r44, srb, vfg, yfg {
    public static w97 h;
    public static dq1 m;
    public final /* synthetic */ int a;
    public static final dq1 b = new dq1(0);
    public static final dq1 c = new dq1(1);
    public static final ay0 d = new ay0(8);
    public static final dq1 e = new dq1(3);
    public static final dq1 f = new dq1(4);
    public static final dq1 g = new dq1(5);
    public static final String[] i = {"", "K", "M", "B"};
    public static final dq1 j = new dq1(7);
    public static final dq1 k = new dq1(8);
    public static final p5f l = new p5f();

    public dq1(rg8 rg8Var, f66 f66Var) {
        this.a = 19;
        f66Var.getClass();
    }

    public static void A(bo1 bo1Var, qn6 qn6Var, qn6 qn6Var2) {
        gx gxVarU0 = bo1Var.u0(qn6Var);
        if (gxVarU0 instanceof p61) {
            p61 p61Var = (p61) gxVarU0;
            if (bo1Var.j(p61Var)) {
                return;
            }
            we8 we8VarQ = bo1Var.q(p61Var);
            we8VarQ.getClass();
            xwd xwdVarT = bo1Var.t(we8VarQ);
            xwdVarT.getClass();
            if (bo1Var.q0(xwdVarT) && bo1Var.M(p61Var) == i61.FOR_SUBTYPING) {
                bo1Var.s0(qn6Var2);
            }
        }
    }

    public static final void B(d34 d34Var, View view, View view2) {
        if (ec2.a.contains(dq1.class)) {
            return;
        }
        try {
            d34Var.getClass();
            String str = d34Var.a;
            zi5 zi5Var = iq1.g;
            Bundle bundleL = zi5.l(d34Var, view, view2);
            b.H(bundleL);
            f94.c().execute(new ho(str, 9, bundleL));
        } catch (Throwable th) {
            ec2.a(dq1.class, th);
        }
    }

    public static void C(String str) {
        wld.a.n(null, str, new Object[0]);
        hy2 hy2Var = g01.y;
        if (hy2Var != null) {
            LinkedHashMap linkedHashMapS = ei7.S(fy3.a, hy2Var.c());
            e87 e87Var = (e87) hy2Var.d.getValue();
            e87Var.getClass();
            e87.b(e87Var, 5, str, null, linkedHashMapS);
        }
    }

    public static h21 D(byte[] bArr) {
        int length = bArr.length;
        dm2.A(bArr.length, 0L, length);
        return new h21(k80.l0(bArr, 0, length));
    }

    public static String E(String str) {
        if (str == null) {
            C("Received a push notification with missing channel");
            return tq7.MEDIUM.getId();
        }
        g04 entries = tq7.getEntries();
        if (entries == null || !entries.isEmpty()) {
            Iterator<E> it2 = entries.iterator();
            while (it2.hasNext()) {
                if (g76.L(((tq7) it2.next()).getId(), str)) {
                    return str;
                }
            }
        }
        C("Received push notification with unknown channel ID: " + str + ", defaulting to MEDIUM");
        return tq7.MEDIUM.getId();
    }

    public static void F() {
        File[] fileArrListFiles;
        if (epe.H()) {
            return;
        }
        File fileU = xz5.U();
        if (fileU == null) {
            fileArrListFiles = new File[0];
        } else {
            fileArrListFiles = fileU.listFiles(new fc2(5));
            if (fileArrListFiles == null) {
                fileArrListFiles = new File[0];
            }
        }
        ArrayList arrayList = new ArrayList(fileArrListFiles.length);
        for (File file : fileArrListFiles) {
            arrayList.add(vv2.Q(file));
        }
        ArrayList arrayList2 = new ArrayList();
        for (Object obj : arrayList) {
            if (((z36) obj).a()) {
                arrayList2.add(obj);
            }
        }
        List listF1 = bu1.f1(arrayList2, new g(2));
        JSONArray jSONArray = new JSONArray();
        Iterator it2 = iq7.W(0, Math.min(listF1.size(), 5)).iterator();
        while (((m46) it2).c) {
            jSONArray.put(listF1.get(((g46) it2).nextInt()));
        }
        xz5.v0("crash_reports", jSONArray, new h(listF1, 1));
    }

    public static String G(Float f2, int i2, int i3) {
        if ((i3 & 2) != 0) {
            i2 = 1;
        }
        Locale locale = Locale.US;
        locale.getClass();
        float fW0 = nk7.w0(f2.floatValue() * ((float) Math.pow(10.0d, r1))) / ((float) Math.pow(10.0d, i2));
        int i4 = (int) fW0;
        return Math.abs(fW0 - ((float) i4)) >= 1.0E-6f ? String.format(locale, ev6.w("%.", i2, "f"), Arrays.copyOf(new Object[]{Float.valueOf(fW0)}, 1)) : String.valueOf(i4);
    }

    public static sj0 I(Application application) {
        x54 x54VarR;
        nec necVar;
        uz5 uz5Var = new uz5();
        ru ruVar = new ru(8);
        try {
            x54VarR = new lig(application).r();
        } catch (IllegalStateException unused) {
            x54VarR = new JavaCronetProvider(application).b().r();
        } catch (UnsatisfiedLinkError unused2) {
            x54VarR = new JavaCronetProvider(application).b().r();
        }
        tag tagVar = new tag(ruVar, x54VarR, Executors.newCachedThreadPool(new t5g("rC", null)));
        eoc eocVar = new eoc(tagVar);
        nec necVar2 = new nec(16, tagVar);
        prf prfVar = new prf();
        ujf ujfVar = new ujf(21, new d2f(prfVar, 18, tagVar));
        ujf ujfVar2 = new ujf(22, tagVar);
        hha hhaVar = new hha(application, 21);
        tag tagVar2 = new tag();
        tagVar2.b = ujfVar;
        tagVar2.c = uz5Var;
        tagVar2.a = hhaVar;
        int i2 = 1;
        if (tag.d == null) {
            Timer timer = new Timer();
            tag.d = timer;
            timer.schedule(new iue(i2, tagVar2), 30000L, 30000L);
        }
        v60 v60Var = new v60(application);
        kbg kbgVar = new kbg(tagVar2, new ibg(application, v60Var), new ef5(2));
        y3b y3bVar = new y3b(28);
        ujf ujfVar3 = new ujf(23, new hha(application, 22));
        d2f d2fVar = new d2f(application);
        e4g e4gVar = new e4g(ujfVar2, d2fVar, uz5Var);
        synchronized (wgf.class) {
            nec necVar3 = wgf.a;
            if (necVar3 == null) {
                Context applicationContext = application.getApplicationContext();
                necVar = new nec(applicationContext != null ? applicationContext : application);
                wgf.a = necVar;
            } else {
                necVar = necVar3;
            }
        }
        xgf xgfVar = (xgf) ((vgf) necVar.b).y();
        nec necVar4 = new nec(14, new sv0());
        wjc wjcVar = new wjc(14);
        l5g l5gVar = new l5g(application, be5.b);
        tag tagVar3 = new tag(new feg(d2fVar, wjcVar, 0), new deg(ujfVar3, wjcVar, "exkbkpfn", 58, 56, 60, 71, arf.B()), new feg(d2fVar, wjcVar, 1));
        d6g d6gVar = new d6g(application, l5gVar, tagVar3);
        xgfVar.getClass();
        vwa vwaVar = new vwa(new zjf(prfVar, 10, tagVar), v60Var, uz5Var, 25);
        d2f d2fVar2 = new d2f(application, 16, l5gVar);
        sj0 sj0Var = new sj0();
        sj0Var.a = application;
        sj0Var.h = e4gVar;
        sj0Var.i = uz5Var;
        sj0Var.b = xgfVar;
        sj0Var.c = necVar4;
        sj0Var.d = tagVar3;
        sj0Var.g = l5gVar;
        sj0Var.e = vwaVar;
        sj0Var.f = d2fVar2;
        nig nigVar = new nig(necVar2, prfVar, tagVar3, uz5Var, v60Var);
        o2b o2bVar = new o2b(prfVar, eocVar, v60Var, uz5Var, 28);
        new u3b(28);
        sj0 sj0Var2 = new sj0();
        sj0Var2.i = uz5Var;
        sj0Var2.a = sj0Var;
        sj0Var2.b = kbgVar;
        sj0Var2.c = y3bVar;
        sj0Var2.h = e4gVar;
        sj0Var2.d = tagVar3;
        sj0Var2.e = nigVar;
        sj0Var2.f = o2bVar;
        sj0Var2.g = d6gVar;
        return sj0Var2;
    }

    public static final boolean h(bo1 bo1Var, hkb hkbVar) {
        if (!bo1Var.S(hkbVar)) {
            if (!(hkbVar instanceof p61)) {
                return false;
            }
            we8 we8VarQ = bo1Var.q((p61) hkbVar);
            we8VarQ.getClass();
            xwd xwdVarT = bo1Var.t(we8VarQ);
            xwdVarT.getClass();
            o3e o3eVarY = bo1Var.Y(xwdVarT);
            if (o3eVarY == null || !bo1Var.S(bo1Var.c0(o3eVarY))) {
                return false;
            }
        }
        return true;
    }

    public static final boolean i(bo1 bo1Var, xvd xvdVar, hkb hkbVar, hkb hkbVar2, boolean z) {
        Collection<qn6> collectionW = bo1Var.W(hkbVar);
        if ((collectionW instanceof Collection) && collectionW.isEmpty()) {
            return false;
        }
        for (qn6 qn6Var : collectionW) {
            qn6Var.getClass();
            if (g76.L(bo1Var.s0(qn6Var), bo1Var.L(hkbVar2))) {
                return true;
            }
            if (z && z(c, xvdVar, hkbVar2, qn6Var)) {
                return true;
            }
        }
        return false;
    }

    public static List j(xvd xvdVar, bo1 bo1Var, hkb hkbVar, awd awdVar) {
        tr7 tr7VarV;
        wvd wvdVar = wvd.f;
        bo1Var.G0(hkbVar, awdVar);
        if (bo1Var.u(awdVar) || !bo1Var.z(hkbVar)) {
            if (!bo1Var.B0(awdVar)) {
                wgc wgcVar = new wgc();
                xvdVar.c();
                bo1 bo1Var2 = xvdVar.c;
                ArrayDeque arrayDeque = xvdVar.f;
                arrayDeque.getClass();
                zgc zgcVar = xvdVar.g;
                zgcVar.getClass();
                arrayDeque.push(hkbVar);
                while (!arrayDeque.isEmpty()) {
                    hkb hkbVar2 = (hkb) arrayDeque.pop();
                    hkbVar2.getClass();
                    if (zgcVar.add(hkbVar2)) {
                        hkb hkbVarR = bo1Var.r(hkbVar2, i61.FOR_SUBTYPING);
                        if (hkbVarR == null) {
                            hkbVarR = hkbVar2;
                        }
                        if (bo1Var.m0(bo1Var.L(hkbVarR), awdVar)) {
                            wgcVar.add(hkbVarR);
                            tr7VarV = wvdVar;
                        } else {
                            tr7VarV = bo1Var.h(hkbVarR) == 0 ? wvd.e : bo1Var2.V(hkbVarR);
                        }
                        if (tr7VarV.equals(wvdVar)) {
                            tr7VarV = null;
                        }
                        if (tr7VarV != null) {
                            Iterator it2 = bo1Var2.I(bo1Var2.L(hkbVar2)).iterator();
                            while (it2.hasNext()) {
                                arrayDeque.add(tr7VarV.x(xvdVar, (qn6) it2.next()));
                            }
                        }
                    }
                }
                xvdVar.a();
                return wgcVar;
            }
            if (bo1Var.m0(bo1Var.L(hkbVar), awdVar)) {
                hec hecVarR = bo1Var.r(hkbVar, i61.FOR_SUBTYPING);
                if (hecVarR != null) {
                    hkbVar = hecVarR;
                }
                return d46.Q(hkbVar);
            }
        }
        return ey3.a;
    }

    public static List k(xvd xvdVar, bo1 bo1Var, hkb hkbVar, awd awdVar) {
        int i2;
        List listJ = j(xvdVar, bo1Var, hkbVar, awdVar);
        if (listJ.size() >= 2) {
            ArrayList arrayList = new ArrayList();
            for (Object obj : listJ) {
                hkb hkbVar2 = (hkb) obj;
                hkbVar2.getClass();
                tvd tvdVarH0 = bo1Var.H0(hkbVar2);
                int iK = bo1Var.k(tvdVarH0);
                while (true) {
                    if (i2 >= iK) {
                        arrayList.add(obj);
                        break;
                    }
                    xwd xwdVarA0 = bo1Var.A0(tvdVarH0, i2);
                    xwdVarA0.getClass();
                    o3e o3eVarY = bo1Var.Y(xwdVarA0);
                    i2 = (o3eVarY != null ? bo1Var.r0(o3eVarY) : null) == null ? i2 + 1 : 0;
                }
            }
            if (!arrayList.isEmpty()) {
                return arrayList;
            }
        }
        return listJ;
    }

    public static h21 m(String str) {
        int i2;
        char cCharAt;
        str.getClass();
        byte[] bArr = a.a;
        int length = str.length();
        while (length > 0 && ((cCharAt = str.charAt(length - 1)) == '=' || cCharAt == '\n' || cCharAt == '\r' || cCharAt == ' ' || cCharAt == '\t')) {
            length--;
        }
        int i3 = (int) ((((long) length) * 6) / 8);
        byte[] bArrCopyOf = new byte[i3];
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        int i7 = 0;
        while (true) {
            if (i4 < length) {
                char cCharAt2 = str.charAt(i4);
                if ('A' <= cCharAt2 && cCharAt2 < '[') {
                    i2 = cCharAt2 - 'A';
                } else if ('a' <= cCharAt2 && cCharAt2 < '{') {
                    i2 = cCharAt2 - 'G';
                } else if ('0' <= cCharAt2 && cCharAt2 < ':') {
                    i2 = cCharAt2 + 4;
                } else if (cCharAt2 != '+' && cCharAt2 != '-') {
                    if (cCharAt2 != '/' && cCharAt2 != '_') {
                        if (cCharAt2 != '\n' && cCharAt2 != '\r' && cCharAt2 != ' ' && cCharAt2 != '\t') {
                            break;
                        }
                        i4++;
                    } else {
                        i2 = 63;
                    }
                } else {
                    i2 = 62;
                }
                i6 = (i6 << 6) | i2;
                i5++;
                if (i5 % 4 == 0) {
                    bArrCopyOf[i7] = (byte) (i6 >> 16);
                    int i8 = i7 + 2;
                    bArrCopyOf[i7 + 1] = (byte) (i6 >> 8);
                    i7 += 3;
                    bArrCopyOf[i8] = (byte) i6;
                }
                i4++;
            } else {
                int i9 = i5 % 4;
                if (i9 != 1) {
                    if (i9 == 2) {
                        bArrCopyOf[i7] = (byte) ((i6 << 12) >> 16);
                        i7++;
                    } else if (i9 == 3) {
                        int i10 = i6 << 6;
                        int i11 = i7 + 1;
                        bArrCopyOf[i7] = (byte) (i10 >> 16);
                        i7 += 2;
                        bArrCopyOf[i11] = (byte) (i10 >> 8);
                    }
                    if (i7 != i3) {
                        bArrCopyOf = Arrays.copyOf(bArrCopyOf, i7);
                    }
                }
            }
        }
        bArrCopyOf = null;
        if (bArrCopyOf != null) {
            return new h21(bArrCopyOf);
        }
        return null;
    }

    public static h21 n(String str) {
        if (str.length() % 2 != 0) {
            ywb.g("Unexpected hex string: ".concat(str));
            return null;
        }
        int length = str.length() / 2;
        byte[] bArr = new byte[length];
        for (int i2 = 0; i2 < length; i2++) {
            int i3 = i2 * 2;
            bArr[i2] = (byte) (xz5.M(str.charAt(i3 + 1)) + (xz5.M(str.charAt(i3)) << 4));
        }
        return new h21(bArr);
    }

    public static h21 o(String str) {
        str.getClass();
        byte[] bytes = str.getBytes(wk1.a);
        bytes.getClass();
        h21 h21Var = new h21(bytes);
        h21Var.c = str;
        return h21Var;
    }

    public static boolean p(xvd xvdVar, qn6 qn6Var, qn6 qn6Var2) {
        rn6 rn6Var = xvdVar.d;
        qn6Var.getClass();
        qn6Var2.getClass();
        bo1 bo1Var = xvdVar.c;
        if (qn6Var == qn6Var2) {
            return true;
        }
        if (x(bo1Var, qn6Var) && x(bo1Var, qn6Var2)) {
            o3e o3eVarA = rn6Var.a((mn6) qn6Var);
            o3e o3eVarA2 = rn6Var.a((mn6) qn6Var2);
            hec hecVarG = bo1Var.G(o3eVarA);
            if (!bo1Var.m0(bo1Var.s0(o3eVarA), bo1Var.s0(o3eVarA2))) {
                return false;
            }
            if (bo1Var.h(hecVarG) == 0) {
                return bo1Var.C(o3eVarA) || bo1Var.C(o3eVarA2) || bo1Var.F0(hecVarG) == bo1Var.F0(bo1Var.G(o3eVarA2));
            }
        }
        dq1 dq1Var = c;
        return z(dq1Var, xvdVar, qn6Var, qn6Var2) && z(dq1Var, xvdVar, qn6Var2, qn6Var);
    }

    public static String q(Integer num) {
        Locale locale = Locale.US;
        locale.getClass();
        String str = new DecimalFormat("#,###", new DecimalFormatSymbols(locale)).format(num);
        str.getClass();
        return str;
    }

    public static String t(String str) {
        Uri uri;
        ArrayList arrayListK;
        if (str == null || (uri = Uri.parse(str)) == null || (arrayListK = ho2.K(uri, d46.R(new x2b("p", y2b.LITERAL), new x2b("(.+)")))) == null) {
            return null;
        }
        return fo7.F((String) ((gj7) ((ij7) arrayListK.get(1)).a()).get(1));
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x0055, code lost:
    
        r7 = r6.s0(r7);
        r7.getClass();
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0060, code lost:
    
        return r6.k0(r7, r2);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.swd u(defpackage.bo1 r6, defpackage.qn6 r7, defpackage.hkb r8) {
        /*
            int r0 = r6.h(r7)
            r1 = 0
            r2 = r1
        L6:
            r3 = 0
            if (r2 >= r0) goto L64
            xwd r4 = r6.C0(r7, r2)
            r4.getClass()
            boolean r5 = r6.q0(r4)
            if (r5 != 0) goto L17
            r3 = r4
        L17:
            if (r3 == 0) goto L61
            o3e r3 = r6.Y(r3)
            if (r3 != 0) goto L20
            goto L61
        L20:
            hec r4 = r6.G(r3)
            boolean r4 = r6.n0(r4)
            if (r4 == 0) goto L36
            hec r4 = r6.G(r8)
            boolean r4 = r6.n0(r4)
            if (r4 == 0) goto L36
            r4 = 1
            goto L37
        L36:
            r4 = r1
        L37:
            boolean r5 = r3.equals(r8)
            if (r5 != 0) goto L55
            if (r4 == 0) goto L4e
            zvd r4 = r6.s0(r3)
            zvd r5 = r6.s0(r8)
            boolean r4 = defpackage.g76.L(r4, r5)
            if (r4 == 0) goto L4e
            goto L55
        L4e:
            swd r3 = u(r6, r3, r8)
            if (r3 == 0) goto L61
            return r3
        L55:
            zvd r7 = r6.s0(r7)
            r7.getClass()
            swd r6 = r6.k0(r7, r2)
            return r6
        L61:
            int r2 = r2 + 1
            goto L6
        L64:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dq1.u(bo1, qn6, hkb):swd");
    }

    public static boolean x(bo1 bo1Var, qn6 qn6Var) {
        qn6Var.getClass();
        zvd zvdVarS0 = bo1Var.s0(qn6Var);
        zvdVarS0.getClass();
        if (!bo1Var.J(zvdVarS0)) {
            return false;
        }
        bo1Var.n(qn6Var);
        return (bo1Var.N(qn6Var) || bo1Var.o0(qn6Var) || bo1Var.D0(qn6Var)) ? false : true;
    }

    public static boolean y(xvd xvdVar, bo1 bo1Var, tvd tvdVar, hkb hkbVar) {
        boolean zP;
        tvdVar.getClass();
        zvd zvdVarL = bo1Var.L(hkbVar);
        int iK = bo1Var.k(tvdVar);
        zvdVarL.getClass();
        int iA0 = bo1Var.a0(zvdVarL);
        if (iK == iA0 && iK == bo1Var.h(hkbVar)) {
            for (int i2 = 0; i2 < iA0; i2++) {
                xwd xwdVarC0 = bo1Var.C0(hkbVar, i2);
                xwdVarC0.getClass();
                o3e o3eVarY = bo1Var.Y(xwdVarC0);
                if (o3eVarY != null) {
                    xwd xwdVarA0 = bo1Var.A0(tvdVar, i2);
                    xwdVarA0.getClass();
                    bo1Var.R(xwdVarA0);
                    pxd pxdVar = pxd.INV;
                    o3e o3eVarY2 = bo1Var.Y(xwdVarA0);
                    o3eVarY2.getClass();
                    pxd pxdVarS = bo1Var.s(bo1Var.k0(zvdVarL, i2));
                    pxd pxdVarR = bo1Var.R(xwdVarC0);
                    pxdVarS.getClass();
                    pxdVarR.getClass();
                    if (pxdVarS == pxdVar) {
                        pxdVarS = pxdVarR;
                    } else if (pxdVarR != pxdVar && pxdVarS != pxdVarR) {
                        pxdVarS = null;
                    }
                    if (pxdVarS == null) {
                        return xvdVar.a;
                    }
                    if (pxdVarS == pxdVar) {
                        A(bo1Var, o3eVarY2, o3eVarY);
                        A(bo1Var, o3eVarY, o3eVarY2);
                    }
                    int i3 = xvdVar.e;
                    if (i3 > 100) {
                        ik4.m("Arguments depth is too high. Some related argument: ", o3eVarY2);
                        return false;
                    }
                    xvdVar.e = i3 + 1;
                    int i4 = x2.a[pxdVarS.ordinal()];
                    if (i4 != 1) {
                        dq1 dq1Var = c;
                        if (i4 == 2) {
                            zP = z(dq1Var, xvdVar, o3eVarY2, o3eVarY);
                        } else {
                            if (i4 != 3) {
                                ygf.a();
                                return false;
                            }
                            zP = z(dq1Var, xvdVar, o3eVarY, o3eVarY2);
                        }
                    } else {
                        zP = p(xvdVar, o3eVarY2, o3eVarY);
                    }
                    xvdVar.e--;
                    if (!zP) {
                    }
                }
            }
            return true;
        }
        return false;
    }

    public static boolean z(dq1 dq1Var, xvd xvdVar, qn6 qn6Var, qn6 qn6Var2) {
        qn6Var.getClass();
        qn6Var2.getClass();
        if (qn6Var == qn6Var2) {
            return true;
        }
        if (!xvdVar.b(qn6Var, qn6Var2)) {
            return false;
        }
        return c.l(xvdVar, xvdVar.c, qn6Var, qn6Var2);
    }

    @Override // defpackage.mqe
    public Object L0(id6 id6Var, float f2) {
        return Integer.valueOf(Math.round(wd6.d(id6Var) * f2));
    }

    @Override // defpackage.vfg
    public gr7 T(nig nigVar) throws GeneralSecurityException {
        if (!((String) nigVar.a).equals("type.googleapis.com/google.crypto.tink.KmsAeadKey")) {
            ay0.e("Wrong type URL in call to LegacyKmsAeadProtoSerialization.parseKey");
            return null;
        }
        try {
            atg atgVarU = atg.u((hsf) nigVar.c, ptf.a);
            if (atgVarU.t() == 0) {
                return k3g.L(new l3g(atgVarU.x().x(), s3g.a((ntg) nigVar.e)), (Integer) nigVar.f);
            }
            throw new GeneralSecurityException("KmsAeadKey are only accepted with version 0, got ".concat(String.valueOf(atgVarU)));
        } catch (zzale e2) {
            throw new GeneralSecurityException("Parsing KmsAeadKey failed: ", e2);
        }
    }

    @Override // defpackage.e52
    public void a() {
    }

    @Override // defpackage.e52
    public void b(b52 b52Var) {
    }

    @Override // defpackage.e52
    public void c(tqd tqdVar) {
    }

    @Override // defpackage.e52
    public tqd d() {
        return tqd.GRANTED;
    }

    @Override // defpackage.e52
    public void e(b52 b52Var) {
    }

    @Override // defpackage.g70, defpackage.j70
    public float f() {
        return 0.0f;
    }

    @Override // defpackage.j70
    public void f0(m73 m73Var, int i2, int[] iArr, int[] iArr2) {
        qb8.P(i2, iArr, iArr2, false);
    }

    @Override // defpackage.c8
    public Object fromJson(fd6 fd6Var, yl2 yl2Var) {
        return Long.valueOf(fd6Var.nextLong());
    }

    @Override // defpackage.iwa
    public mn6 getType() {
        throw new IllegalStateException("This method should not be called");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:133:0x0227  */
    /* JADX WARN: Removed duplicated region for block: B:161:0x0289  */
    /* JADX WARN: Removed duplicated region for block: B:163:0x028f A[EDGE_INSN: B:337:0x028f->B:163:0x028f BREAK  A[LOOP:11: B:154:0x026d->B:338:0x026d]] */
    /* JADX WARN: Removed duplicated region for block: B:172:0x02b3  */
    /* JADX WARN: Removed duplicated region for block: B:211:0x0388  */
    /* JADX WARN: Removed duplicated region for block: B:218:0x03ac  */
    /* JADX WARN: Removed duplicated region for block: B:261:0x0496  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00a2  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0113  */
    /* JADX WARN: Type inference failed for: r19v0, types: [bo1] */
    /* JADX WARN: Type inference failed for: r6v13 */
    /* JADX WARN: Type inference failed for: r6v14 */
    /* JADX WARN: Type inference failed for: r6v3, types: [int] */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean l(defpackage.xvd r18, defpackage.bo1 r19, defpackage.qn6 r20, defpackage.qn6 r21) {
        /*
            Method dump skipped, instruction units count: 1336
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dq1.l(xvd, bo1, qn6, qn6):boolean");
    }

    @Override // defpackage.yfg
    public nig l0(gr7 gr7Var) {
        j1g j1gVar = (j1g) gr7Var;
        nmg nmgVarX = pmg.x();
        wmg wmgVarC = v5g.c(j1gVar.h);
        nmgVarX.c();
        pmg.w((pmg) nmgVarX.b, wmgVarC);
        byte[] bArrB = ((qvg) j1gVar.i.b).b();
        rsf rsfVarP = hsf.p(bArrB, 0, bArrB.length);
        nmgVarX.c();
        pmg.v((pmg) nmgVarX.b, rsfVarP);
        return nig.I("type.googleapis.com/google.crypto.tink.AesEaxKey", ((pmg) nmgVarX.b()).b(), zrg.SYMMETRIC, v5g.b(j1gVar.h.d), j1gVar.k);
    }

    @Override // defpackage.dec
    public void lock() {
    }

    @Override // defpackage.srb
    public void onScrollLimit(int i2, int i3, int i4, boolean z) {
    }

    @Override // defpackage.srb
    public void onScrollProgress(int i2, int i3, int i4, int i5) {
    }

    public String r(String str) {
        i03 i03Var = i03.a;
        Uri.Builder builderBuildUpon = Uri.parse(i03.b).buildUpon();
        String strJ0 = str != null ? muc.j0("/", str) : null;
        if (strJ0 == null) {
            strJ0 = "";
        }
        String string = builderBuildUpon.appendEncodedPath(strJ0).build().toString();
        string.getClass();
        return string;
    }

    public synchronized w97 s(Context context) {
        w97 w97Var;
        if (context == null) {
            try {
                context = f94.a();
            } catch (Throwable th) {
                throw th;
            }
        }
        w97Var = h;
        if (w97Var == null) {
            w97Var = new w97(context, f94.b());
            h = w97Var;
        }
        return w97Var;
    }

    @Override // defpackage.c8
    public void toJson(ae6 ae6Var, yl2 yl2Var, Object obj) {
        long jLongValue = ((Number) obj).longValue();
        yl2Var.getClass();
        ae6Var.t(jLongValue);
    }

    public String toString() {
        switch (this.a) {
            case 12:
                return "Arrangement#SpaceBetween";
            default:
                return super.toString();
        }
    }

    @Override // defpackage.dec
    public void unlock() {
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x007e, code lost:
    
        if (r7 == r12) goto L57;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x00c5, code lost:
    
        if (r7 == r12) goto L57;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00fa, code lost:
    
        if (r7 == r12) goto L57;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x013a, code lost:
    
        if (r7 == r12) goto L57;
     */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object v(defpackage.t7b r8, defpackage.nhc r9, android.content.res.Resources r10, defpackage.k8b r11, defpackage.n92 r12) {
        /*
            Method dump skipped, instruction units count: 339
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dq1.v(t7b, nhc, android.content.res.Resources, k8b, n92):java.lang.Object");
    }

    @Override // defpackage.g70
    public void w(m73 m73Var, int i2, int[] iArr, ip6 ip6Var, int[] iArr2) {
        if (ip6Var == ip6.Ltr) {
            qb8.P(i2, iArr, iArr2, false);
        } else {
            qb8.P(i2, iArr, iArr2, true);
        }
    }

    public static String g(Number number) {
        Locale locale = Locale.US;
        locale.getClass();
        number.getClass();
        double dDoubleValue = number.doubleValue();
        if (dDoubleValue < 1.0d) {
            dDoubleValue = 1.0d;
        }
        int iLog10 = ((int) Math.log10(dDoubleValue)) / 3;
        double dDoubleValue2 = new BigDecimal(String.valueOf(number.doubleValue() / Math.pow(10.0d, iLog10 * 3))).setScale(1, RoundingMode.DOWN).doubleValue();
        return String.format(locale, eoLmc.kYSRWzQ + ((iLog10 == 0 || dDoubleValue2 % 1.0d == 0.0d) ? 0 : 1) + "f" + i[iLog10], Arrays.copyOf(new Object[]{Double.valueOf(dDoubleValue2)}, 1));
    }

    public void H(Bundle bundle) {
        Locale locale;
        String str = KLTXZbnQvj.FhJkyTgshycxcZG;
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            String string = bundle.getString(str);
            if (string != null) {
                double dDoubleValue = 0.0d;
                try {
                    Matcher matcher = Pattern.compile("[-+]*\\d+([.,]\\d+)*([.,]\\d+)?", 8).matcher(string);
                    if (matcher.find()) {
                        String strGroup = matcher.group(0);
                        try {
                            locale = f94.a().getResources().getConfiguration().locale;
                        } catch (Exception unused) {
                            locale = null;
                        }
                        if (locale == null) {
                            locale = Locale.getDefault();
                            locale.getClass();
                        }
                        dDoubleValue = NumberFormat.getNumberInstance(locale).parse(strGroup).doubleValue();
                    }
                } catch (ParseException unused2) {
                }
                bundle.putDouble(str, dDoubleValue);
            }
            bundle.putString("_is_fb_codeless", "1");
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public /* synthetic */ dq1(int i2) {
        this.a = i2;
    }
}
