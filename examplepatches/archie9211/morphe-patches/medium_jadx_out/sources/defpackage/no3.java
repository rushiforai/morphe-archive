package defpackage;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;
import androidx.datastore.core.CorruptionException;
import androidx.datastore.preferences.protobuf.InvalidProtocolBufferException;
import androidx.datastore.preferences.protobuf.e;
import com.medium.android.common.post.pre.ParagraphEditPreLayout;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.a;
import com.medium.android.donkey.launcher.LauncherActivity;
import java.io.FileInputStream;
import java.security.GeneralSecurityException;
import java.security.KeyPairGenerator;
import java.security.Provider;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class no3 implements y92, ijb, um2, e19, i0c, c8, j70, w82, bo1, s72, u6d, u2a, pg2, hb2, xlf, twf, yfg, thg {
    public static final no3 b = new no3(1);
    public static final no3 c = new no3(2);
    public static final no3 d = new no3(3);
    public static final no3 e = new no3(4);
    public static final no3 f = new no3(5);
    public static final no3 g = new no3(6);
    public static final no3 h = new no3(7);
    public static final no3 i = new no3(8);
    public static final no3 j = new no3(9);
    public final /* synthetic */ int a;

    public /* synthetic */ no3(int i2) {
        this.a = i2;
    }

    public static zl1 E0(String str) {
        zl1 zl1Var = new zl1(str);
        zl1.d.put(str, zl1Var);
        return zl1Var;
    }

    public static Intent L0(Context context, Uri uri, SusiDestination.Post post, String str, int i2) {
        int i3 = LauncherActivity.t;
        if ((i2 & 2) != 0) {
            uri = null;
        }
        if ((i2 & 4) != 0) {
            post = null;
        }
        if ((i2 & 8) != 0) {
            str = null;
        }
        context.getClass();
        Intent intent = new Intent(context, (Class<?>) LauncherActivity.class);
        if (uri != null) {
            intent.putExtra("branch_uri", uri.toString());
        }
        if (post != null) {
            intent.putExtra("susi_destination", post);
        }
        if (str != null) {
            intent.putExtra("referrer_source", str);
        }
        return intent;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0031  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void P0(defpackage.xz0 r7, java.lang.String r8) {
        /*
            r7.getClass()
            r8.getClass()
            java.lang.String[] r0 = defpackage.yz0.h
            r1 = 34
            r7.writeByte(r1)
            int r2 = r8.length()
            r3 = 0
            r4 = r3
        L13:
            if (r3 >= r2) goto L3c
            char r5 = r8.charAt(r3)
            r6 = 128(0x80, float:1.8E-43)
            if (r5 >= r6) goto L22
            r5 = r0[r5]
            if (r5 != 0) goto L2f
            goto L39
        L22:
            r6 = 8232(0x2028, float:1.1535E-41)
            if (r5 != r6) goto L29
            java.lang.String r5 = "\\u2028"
            goto L2f
        L29:
            r6 = 8233(0x2029, float:1.1537E-41)
            if (r5 != r6) goto L39
            java.lang.String r5 = "\\u2029"
        L2f:
            if (r4 >= r3) goto L34
            r7.e0(r4, r3, r8)
        L34:
            r7.Y(r5)
            int r4 = r3 + 1
        L39:
            int r3 = r3 + 1
            goto L13
        L3c:
            if (r4 >= r2) goto L41
            r7.e0(r4, r2, r8)
        L41:
            r7.writeByte(r1)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.no3.P0(xz0, java.lang.String):void");
    }

    public synchronized zl1 A(String str) {
        zl1 zl1Var;
        try {
            str.getClass();
            LinkedHashMap linkedHashMap = zl1.d;
            zl1Var = (zl1) linkedHashMap.get(str);
            if (zl1Var == null) {
                zl1Var = (zl1) linkedHashMap.get(tuc.N(str, "TLS_", false) ? "SSL_".concat(str.substring(4)) : tuc.N(str, "SSL_", false) ? "TLS_".concat(str.substring(4)) : str);
                if (zl1Var == null) {
                    zl1Var = new zl1(str);
                }
                linkedHashMap.put(str, zl1Var);
            }
        } catch (Throwable th) {
            throw th;
        }
        return zl1Var;
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

    @Override // defpackage.u2a
    public void B() {
        Log.d("ProfileInstaller", "DIAGNOSTIC_PROFILE_IS_COMPRESSED");
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

    public qn6 K0(qn6 qn6Var) {
        hec hecVarW0;
        qn6Var.getClass();
        hec hecVarM = k40.M(qn6Var);
        return (hecVarM == null || (hecVarW0 = k40.W0(hecVarM, true)) == null) ? qn6Var : hecVarW0;
    }

    @Override // defpackage.bo1
    public /* bridge */ zvd L(hkb hkbVar) {
        return k40.S0(hkbVar);
    }

    @Override // defpackage.bo1
    public /* bridge */ i61 M(p61 p61Var) {
        return k40.Q(p61Var);
    }

    public jec M0(hkb hkbVar) {
        hec hecVar;
        v33 v33VarI = k40.I(hkbVar);
        return (v33VarI == null || (hecVar = v33VarI.b) == null) ? (jec) hkbVar : hecVar;
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

    public SusiDestination O0(String str) {
        i03 i03Var = i03.a;
        if (str == null) {
            return null;
        }
        if (muc.b0(str)) {
            str = null;
        }
        if (str == null) {
            return null;
        }
        if (muc.l0(tuc.L(str, "https://", ""), "/").equals("medium.com")) {
            str = null;
        }
        if (str == null) {
            return null;
        }
        SusiDestination.Companion.getClass();
        return a.a(str);
    }

    @Override // defpackage.bo1
    public boolean P(hkb hkbVar) {
        hkbVar.getClass();
        return k40.I(hkbVar) != null;
    }

    @Override // defpackage.u2a
    public void Q(int i2, Object obj) {
        String str;
        switch (i2) {
            case 1:
                str = "RESULT_INSTALL_SUCCESS";
                break;
            case 2:
                str = "RESULT_ALREADY_INSTALLED";
                break;
            case 3:
                str = "RESULT_UNSUPPORTED_ART_VERSION";
                break;
            case 4:
                str = "RESULT_NOT_WRITABLE";
                break;
            case 5:
                str = "RESULT_DESIRED_FORMAT_UNSUPPORTED";
                break;
            case 6:
                str = "RESULT_BASELINE_PROFILE_NOT_FOUND";
                break;
            case 7:
                str = "RESULT_IO_EXCEPTION";
                break;
            case 8:
                str = "RESULT_PARSE_EXCEPTION";
                break;
            case 9:
            default:
                str = "";
                break;
            case 10:
                str = "RESULT_INSTALL_SKIP_FILE_SUCCESS";
                break;
            case 11:
                str = "RESULT_DELETE_SKIP_FILE_SUCCESS";
                break;
        }
        if (i2 == 6 || i2 == 7 || i2 == 8) {
            Log.e("ProfileInstaller", str, (Throwable) obj);
        } else {
            Log.d("ProfileInstaller", str);
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

    @Override // defpackage.bo1
    public /* bridge */ p61 U(hec hecVar) {
        return k40.H(this, hecVar);
    }

    @Override // defpackage.bo1
    public /* bridge */ ao1 V(hkb hkbVar) {
        return k40.P0(this, hkbVar);
    }

    @Override // defpackage.bo1
    public /* bridge */ Collection W(hkb hkbVar) {
        return k40.H0(this, hkbVar);
    }

    @Override // defpackage.bo1
    public o3e X(qn6 qn6Var) {
        return k40.F0(qn6Var);
    }

    @Override // defpackage.bo1
    public /* bridge */ o3e Y(xwd xwdVar) {
        return k40.f0(this, xwdVar);
    }

    @Override // defpackage.bo1
    public /* bridge */ void Z(hkb hkbVar) {
        k40.B0(hkbVar);
    }

    @Override // defpackage.bo1
    public /* bridge */ int a0(awd awdVar) {
        return k40.G0(awdVar);
    }

    @Override // defpackage.bo1
    public /* bridge */ boolean b0(swd swdVar, awd awdVar) {
        return k40.j0(swdVar, awdVar);
    }

    @Override // defpackage.u6d
    public t6d c() {
        return new t6d();
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

    @Override // defpackage.xlf
    public /* bridge */ /* synthetic */ Object d(String str, Provider provider) {
        return provider == null ? KeyPairGenerator.getInstance(str) : KeyPairGenerator.getInstance(str, provider);
    }

    @Override // defpackage.bo1
    public /* bridge */ hec d0(hkb hkbVar) {
        return k40.W0(hkbVar, false);
    }

    @Override // defpackage.bo1
    public vm6 e() {
        throw new UnsupportedOperationException("Not supported");
    }

    @Override // defpackage.bo1
    public /* bridge */ hec e0(hkb hkbVar) {
        return k40.W0(hkbVar, true);
    }

    @Override // defpackage.j70
    public /* synthetic */ float f() {
        return 0.0f;
    }

    @Override // defpackage.j70
    public void f0(m73 m73Var, int i2, int[] iArr, int[] iArr2) {
        int i3 = 0;
        int i4 = 0;
        for (int i5 : iArr) {
            i4 += i5;
        }
        int length = iArr.length;
        int i6 = i2 - i4;
        int i7 = 0;
        while (i3 < length) {
            int i8 = iArr[i3];
            iArr2[i7] = i6;
            i6 += i8;
            i3++;
            i7++;
        }
    }

    @Override // defpackage.c8
    public Object fromJson(fd6 fd6Var, yl2 yl2Var) {
        yl2Var.getClass();
        Object objY = d46.Y(fd6Var);
        objY.getClass();
        return objY;
    }

    @Override // defpackage.w82
    public long g(long j2, long j3) {
        if (Float.intBitsToFloat((int) (j2 >> 32)) <= Float.intBitsToFloat((int) (j3 >> 32)) && Float.intBitsToFloat((int) (j2 & 4294967295L)) <= Float.intBitsToFloat((int) (j3 & 4294967295L))) {
            long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(1.0f)) << 32) | (((long) Float.floatToRawIntBits(1.0f)) & 4294967295L);
            int i2 = fqb.a;
            return jFloatToRawIntBits;
        }
        float fM = s42.M(j2, j3);
        long jFloatToRawIntBits2 = (((long) Float.floatToRawIntBits(fM)) << 32) | (((long) Float.floatToRawIntBits(fM)) & 4294967295L);
        int i3 = fqb.a;
        return jFloatToRawIntBits2;
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

    @Override // defpackage.thg
    public lig i(bzf bzfVar) {
        hsg hsgVarT = isg.t();
        hsgVarT.g("type.googleapis.com/google.crypto.tink.ChaCha20Poly1305Key");
        hsgVarT.h(kog.u().b());
        hsgVarT.e(m7g.b(((c3g) bzfVar).a));
        return lig.p0((isg) hsgVarT.b());
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

    @Override // defpackage.i0c
    public Object l() {
        return new b78(true);
    }

    @Override // defpackage.yfg
    public nig l0(gr7 gr7Var) {
        u0g u0gVar = (u0g) gr7Var;
        mlg mlgVarX = olg.x();
        vlg vlgVarW = xlg.w();
        jmg jmgVarV = lmg.v();
        int i2 = u0gVar.h.c;
        jmgVarV.c();
        ((lmg) jmgVarV.b).zze = i2;
        lmg lmgVar = (lmg) jmgVarV.b();
        vlgVarW.c();
        xlg.v((xlg) vlgVarW.b, lmgVar);
        byte[] bArrB = ((qvg) u0gVar.i.b).b();
        rsf rsfVarP = hsf.p(bArrB, 0, bArrB.length);
        vlgVarW.c();
        xlg.u((xlg) vlgVarW.b, rsfVarP);
        xlg xlgVar = (xlg) vlgVarW.b();
        mlgVarX.c();
        olg.v((olg) mlgVarX.b, xlgVar);
        eqg eqgVarX = gqg.x();
        f1g f1gVar = u0gVar.h;
        tqg tqgVarD = n5g.d(f1gVar);
        eqgVarX.c();
        gqg.w((gqg) eqgVarX.b, tqgVarD);
        byte[] bArrB2 = ((qvg) u0gVar.j.b).b();
        rsf rsfVarP2 = hsf.p(bArrB2, 0, bArrB2.length);
        eqgVarX.c();
        gqg.v((gqg) eqgVarX.b, rsfVarP2);
        gqg gqgVar = (gqg) eqgVarX.b();
        mlgVarX.c();
        olg.w((olg) mlgVarX.b, gqgVar);
        return nig.I("type.googleapis.com/google.crypto.tink.AesCtrHmacAeadKey", ((olg) mlgVarX.b()).b(), zrg.SYMMETRIC, n5g.c(f1gVar.e), u0gVar.l);
    }

    @Override // defpackage.um2
    public Iterable m(Object obj) {
        int i2 = vs6.p;
        Collection collectionB = ((y28) obj).n().b();
        collectionB.getClass();
        return new i80(2, szb.N0(new j80(1, collectionB), h06.p));
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
        return (hecVarM != null ? k40.H(this, M0(hecVarM)) : null) != null;
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

    @Override // defpackage.twf
    public Object p(bxf bxfVar, Class cls) throws GeneralSecurityException {
        qvg qvgVarK;
        List arrayList;
        if (cls != lwf.class) {
            ygf.l("AeadConfigurationV1 can only create AEADs");
            return null;
        }
        hpe hpeVar = new hpe(27);
        HashMap map = new HashMap();
        for (int i2 = 0; i2 < bxfVar.b.size(); i2++) {
            byf byfVarF = bxfVar.f(i2);
            if (byfVarF.c == zwf.c) {
                gr7 gr7Var = byfVarF.a;
                if (gr7Var instanceof o0g) {
                    qvgVarK = ((o0g) gr7Var).K();
                } else {
                    if (!(gr7Var instanceof lgg)) {
                        throw new GeneralSecurityException(lv8.r("Cannot get output prefix for key of class ", gr7Var.getClass().getName(), " with parameters ", String.valueOf(gr7Var.H())));
                    }
                    qvgVarK = ((lgg) gr7Var).K();
                }
                p8g p8gVar = new p8g((lwf) hpeVar.z(byfVarF), byfVarF.d);
                byte[] bArr = qvgVarK.a;
                if (bArr.length != 0 && bArr.length != 5) {
                    ygf.l("PrefixMap only supports 0 and 5 byte prefixes");
                    return null;
                }
                if (map.containsKey(qvgVarK)) {
                    arrayList = (List) map.get(qvgVarK);
                } else {
                    arrayList = new ArrayList();
                    map.put(qvgVarK, arrayList);
                }
                arrayList.add(p8gVar);
            }
        }
        bxfVar.h();
        return cls.cast(new t8g(new p8g((lwf) hpeVar.z(bxfVar.n()), bxfVar.n().d), new vhg(map)));
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

    @Override // defpackage.c8
    public void toJson(ae6 ae6Var, yl2 yl2Var, Object obj) {
        yl2Var.getClass();
        obj.getClass();
        f76.R(ae6Var, obj);
    }

    public String toString() {
        switch (this.a) {
            case 11:
                return "Arrangement#Bottom";
            case 17:
                return "EmptyConsumer";
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

    @Override // defpackage.y92
    public Object v(Object obj) {
        return (sbb) obj;
    }

    @Override // defpackage.bo1
    public p61 v0(hkb hkbVar) {
        return k40.H(this, M0(hkbVar));
    }

    @Override // defpackage.i0c
    public Object w(FileInputStream fileInputStream) throws CorruptionException {
        byte[] bArr;
        try {
            ty9 ty9VarO = ty9.o(fileInputStream);
            b78 b78Var = new b78(false);
            oy9[] oy9VarArr = (oy9[]) Arrays.copyOf(new oy9[0], 0);
            b78Var.b();
            if (oy9VarArr.length > 0) {
                oy9 oy9Var = oy9VarArr[0];
                throw null;
            }
            Map mapL = ty9VarO.l();
            mapL.getClass();
            for (Map.Entry entry : mapL.entrySet()) {
                String str = (String) entry.getKey();
                yy9 yy9Var = (yy9) entry.getValue();
                str.getClass();
                yy9Var.getClass();
                xy9 xy9VarU = yy9Var.u();
                switch (xy9VarU == null ? -1 : py9.a[xy9VarU.ordinal()]) {
                    case -1:
                        throw new CorruptionException("Value case is null.", null);
                    case 0:
                    default:
                        ygf.a();
                        return null;
                    case 1:
                        b78Var.d(new ny9(str), Boolean.valueOf(yy9Var.l()));
                        break;
                    case 2:
                        b78Var.d(new ny9(str), Float.valueOf(yy9Var.p()));
                        break;
                    case 3:
                        b78Var.d(new ny9(str), Double.valueOf(yy9Var.o()));
                        break;
                    case 4:
                        b78Var.d(new ny9(str), Integer.valueOf(yy9Var.q()));
                        break;
                    case 5:
                        b78Var.d(new ny9(str), Long.valueOf(yy9Var.r()));
                        break;
                    case 6:
                        ny9 ny9Var = new ny9(str);
                        String strS = yy9Var.s();
                        strS.getClass();
                        b78Var.d(ny9Var, strS);
                        break;
                    case 7:
                        ny9 ny9Var2 = new ny9(str);
                        u56 u56VarN = yy9Var.t().n();
                        u56VarN.getClass();
                        b78Var.d(ny9Var2, bu1.q1(u56VarN));
                        break;
                    case 8:
                        ny9 ny9Var3 = new ny9(str);
                        d21 d21VarM = yy9Var.m();
                        int size = d21VarM.size();
                        if (size == 0) {
                            bArr = x56.b;
                        } else {
                            byte[] bArr2 = new byte[size];
                            d21VarM.m(size, bArr2);
                            bArr = bArr2;
                        }
                        bArr.getClass();
                        b78Var.d(ny9Var3, bArr);
                        break;
                    case 9:
                        throw new CorruptionException("Value not set.", null);
                }
            }
            return new b78(new LinkedHashMap(b78Var.a()), true);
        } catch (InvalidProtocolBufferException e2) {
            throw new CorruptionException("Unable to parse preferences proto.", e2);
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

    /* JADX WARN: Code restructure failed: missing block: B:112:0x0278, code lost:
    
        if (r10 == r0) goto L177;
     */
    /* JADX WARN: Code restructure failed: missing block: B:131:0x02ef, code lost:
    
        if (r10 == r0) goto L177;
     */
    /* JADX WARN: Code restructure failed: missing block: B:149:0x0365, code lost:
    
        if (r10 == r0) goto L177;
     */
    /* JADX WARN: Code restructure failed: missing block: B:167:0x03dd, code lost:
    
        if (r10 == r0) goto L177;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x0102, code lost:
    
        if (r10 == r0) goto L177;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0137, code lost:
    
        if (r10 == r0) goto L177;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x018e, code lost:
    
        if (r10 == r0) goto L177;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x01c6, code lost:
    
        if (r10 == r0) goto L177;
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x01fb, code lost:
    
        if (r10 == r0) goto L177;
     */
    /* JADX WARN: Code restructure failed: missing block: B:98:0x0231, code lost:
    
        if (r10 == r0) goto L177;
     */
    /* JADX WARN: Removed duplicated region for block: B:178:0x041e A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object x0(defpackage.g8e r11, defpackage.nhc r12, android.content.res.Resources r13, defpackage.obe r14, defpackage.n92 r15) {
        /*
            Method dump skipped, instruction units count: 1098
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.no3.x0(g8e, nhc, android.content.res.Resources, obe, n92):java.lang.Object");
    }

    @Override // defpackage.i0c
    public void y(Object obj, jz0 jz0Var) {
        e eVarA;
        Map mapA = ((b78) obj).a();
        ry9 ry9VarN = ty9.n();
        for (Map.Entry entry : mapA.entrySet()) {
            ny9 ny9Var = (ny9) entry.getKey();
            Object value = entry.getValue();
            String str = ny9Var.a;
            if (value instanceof Boolean) {
                wy9 wy9VarV = yy9.v();
                boolean zBooleanValue = ((Boolean) value).booleanValue();
                wy9VarV.c();
                ((yy9) wy9VarV.b).w(zBooleanValue);
                eVarA = wy9VarV.a();
            } else if (value instanceof Float) {
                wy9 wy9VarV2 = yy9.v();
                float fFloatValue = ((Number) value).floatValue();
                wy9VarV2.c();
                ((yy9) wy9VarV2.b).z(fFloatValue);
                eVarA = wy9VarV2.a();
            } else if (value instanceof Double) {
                wy9 wy9VarV3 = yy9.v();
                double dDoubleValue = ((Number) value).doubleValue();
                wy9VarV3.c();
                ((yy9) wy9VarV3.b).y(dDoubleValue);
                eVarA = wy9VarV3.a();
            } else if (value instanceof Integer) {
                wy9 wy9VarV4 = yy9.v();
                int iIntValue = ((Number) value).intValue();
                wy9VarV4.c();
                ((yy9) wy9VarV4.b).A(iIntValue);
                eVarA = wy9VarV4.a();
            } else if (value instanceof Long) {
                wy9 wy9VarV5 = yy9.v();
                long jLongValue = ((Number) value).longValue();
                wy9VarV5.c();
                ((yy9) wy9VarV5.b).B(jLongValue);
                eVarA = wy9VarV5.a();
            } else if (value instanceof String) {
                wy9 wy9VarV6 = yy9.v();
                wy9VarV6.c();
                ((yy9) wy9VarV6.b).C((String) value);
                eVarA = wy9VarV6.a();
            } else if (value instanceof Set) {
                wy9 wy9VarV7 = yy9.v();
                uy9 uy9VarO = vy9.o();
                uy9VarO.c();
                ((vy9) uy9VarO.b).l((Set) value);
                wy9VarV7.c();
                ((yy9) wy9VarV7.b).D((vy9) uy9VarO.a());
                eVarA = wy9VarV7.a();
            } else {
                if (!(value instanceof byte[])) {
                    ygf.f("PreferencesSerializer does not support type: ".concat(value.getClass().getName()));
                    return;
                }
                wy9 wy9VarV8 = yy9.v();
                byte[] bArr = (byte[]) value;
                d21 d21VarF = d21.f(bArr, 0, bArr.length);
                wy9VarV8.c();
                ((yy9) wy9VarV8.b).x(d21VarF);
                eVarA = wy9VarV8.a();
            }
            ry9VarN.getClass();
            str.getClass();
            ry9VarN.c();
            ((ty9) ry9VarN.b).m().put(str, (yy9) eVarA);
        }
        ty9 ty9Var = (ty9) ry9VarN.a();
        int iA = ty9Var.a(null);
        Logger logger = zp1.f;
        if (iA > 4096) {
            iA = 4096;
        }
        zp1 zp1Var = new zp1(jz0Var, iA);
        ty9Var.b(zp1Var);
        if (zp1Var.d > 0) {
            zp1Var.k();
        }
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

    @Override // defpackage.e19
    public void T(y5d y5dVar) {
    }

    @Override // defpackage.u6d
    public void a(Context context) {
    }

    @Override // defpackage.s72
    public void accept(Object obj) {
    }

    @Override // defpackage.e19
    public void b(ParagraphEditPreLayout paragraphEditPreLayout) {
    }

    @Override // defpackage.bo1
    public void G0(hkb hkbVar, awd awdVar) {
    }
}
