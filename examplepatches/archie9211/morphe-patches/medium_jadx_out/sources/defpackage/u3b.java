package defpackage;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Bundle;
import android.view.Display;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;
import org.json.JSONArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u3b implements yx0, hb2, dz1, um2, fa9, vwd, o92, sy3, w82, r44, e68, m7c, erd, ukg, huf, rhg {
    public static volatile u3b o;
    public final /* synthetic */ int a;
    public static final u3b b = new u3b(0);
    public static final u3b c = new u3b(1);
    public static final /* synthetic */ u3b d = new u3b(2);
    public static final u3b e = new u3b(3);
    public static final u3b f = new u3b(4);
    public static final u3b g = new u3b(5);
    public static final u3b h = new u3b(6);
    public static final ywb i = new ywb(0);
    public static final ywb j = new ywb(1);
    public static final ywb k = new ywb(2);
    public static final ywb l = new ywb(3);
    public static final u3b m = new u3b(8);
    public static final /* synthetic */ u3b n = new u3b(9);
    public static final /* synthetic */ u3b p = new u3b(26);

    public /* synthetic */ u3b(int i2) {
        this.a = i2;
    }

    public static ArrayList h(List list) {
        ArrayList arrayList = new ArrayList();
        for (Object obj : list) {
            if (((c8a) obj) != c8a.HTTP_1_0) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            arrayList2.add(((c8a) it2.next()).toString());
        }
        return arrayList2;
    }

    public static final Bundle i(v3b v3bVar, String str, List list) {
        if (!ec2.a.contains(u3b.class)) {
            try {
                v3bVar.getClass();
                Bundle bundle = new Bundle();
                bundle.putString("event", v3bVar.toString());
                bundle.putString("app_id", str);
                if (v3b.CUSTOM_APP_EVENTS != v3bVar) {
                    return bundle;
                }
                JSONArray jSONArrayJ = b.j(str, list);
                if (jSONArrayJ.length() != 0) {
                    bundle.putString("custom_events", jSONArrayJ.toString());
                    return bundle;
                }
            } catch (Throwable th) {
                ec2.a(u3b.class, th);
                return null;
            }
        }
        return null;
    }

    public static byte[] k(List list) {
        kz0 kz0Var = new kz0();
        for (String str : h(list)) {
            kz0Var.K0(str.length());
            kz0Var.R0(str);
        }
        return kz0Var.U(kz0Var.b);
    }

    @Override // defpackage.sy3
    public void M0(vy3 vy3Var) {
        StringBuilder sb;
        StringBuilder sb2 = new StringBuilder();
        sb2.append((char) 0);
        while (true) {
            boolean zB = vy3Var.b();
            sb = vy3Var.c;
            if (!zB) {
                break;
            }
            sb2.append(vy3Var.a());
            int i2 = vy3Var.d + 1;
            vy3Var.d = i2;
            if (wgf.F(vy3Var.a, i2, 5) != 5) {
                vy3Var.e = 0;
                break;
            }
        }
        int length = sb2.length() - 1;
        int length2 = sb.length() + length + 1;
        vy3Var.c(length2);
        boolean z = vy3Var.f.b - length2 > 0;
        if (vy3Var.b() || z) {
            if (length <= 249) {
                sb2.setCharAt(0, (char) length);
            } else if (length > 1555) {
                ygf.f("Message length not in valid ranges: ".concat(String.valueOf(length)));
                return;
            } else {
                sb2.setCharAt(0, (char) ((length / 250) + 249));
                sb2.insert(1, (char) (length % 250));
            }
        }
        int length3 = sb2.length();
        for (int i3 = 0; i3 < length3; i3++) {
            int length4 = (((sb.length() + 1) * 149) % 255) + 1 + sb2.charAt(i3);
            if (length4 > 255) {
                length4 -= 256;
            }
            vy3Var.d((char) length4);
        }
    }

    @Override // defpackage.m7c
    public bo4 a(uxc uxcVar) {
        return new u50(14, uxcVar);
    }

    @Override // defpackage.vwd
    public swd b(e1b e1bVar) {
        e1bVar.getClass();
        return null;
    }

    @Override // defpackage.huf
    public boolean c(Class cls) {
        return false;
    }

    @Override // defpackage.ukg
    public ing d(ur7 ur7Var) {
        sug sugVar = (sug) ur7Var;
        omg omgVar = ilf.a;
        xqg xqgVarE = zqg.E();
        xqgVarE.c();
        ((zqg) xqgVarE.b).G();
        crg crgVarC = ilf.c(sugVar.i);
        xqgVarE.c();
        ((zqg) xqgVarE.b).H(crgVarC);
        byte[] bArrN = kk7.N((BigInteger) sugVar.j.b);
        omf omfVar = pmf.b;
        omf omfVarC = pmf.C(bArrN, 0, bArrN.length);
        xqgVarE.c();
        ((zqg) xqgVarE.b).I(omfVarC);
        byte[] bArrN2 = kk7.N((BigInteger) sugVar.k.b);
        omf omfVarC2 = pmf.C(bArrN2, 0, bArrN2.length);
        xqgVarE.c();
        ((zqg) xqgVarE.b).J(omfVarC2);
        byte[] bArrN3 = kk7.N((BigInteger) sugVar.l.b);
        omf omfVarC3 = pmf.C(bArrN3, 0, bArrN3.length);
        xqgVarE.c();
        ((zqg) xqgVarE.b).K(omfVarC3);
        byte[] bArrN4 = kk7.N((BigInteger) sugVar.m.b);
        omf omfVarC4 = pmf.C(bArrN4, 0, bArrN4.length);
        xqgVarE.c();
        ((zqg) xqgVarE.b).L(omfVarC4);
        byte[] bArrN5 = kk7.N((BigInteger) sugVar.n.b);
        omf omfVarC5 = pmf.C(bArrN5, 0, bArrN5.length);
        xqgVarE.c();
        ((zqg) xqgVarE.b).M(omfVarC5);
        byte[] bArrN6 = kk7.N((BigInteger) sugVar.o.b);
        omf omfVarC6 = pmf.C(bArrN6, 0, bArrN6.length);
        xqgVarE.c();
        ((zqg) xqgVarE.b).N(omfVarC6);
        omf omfVarC7 = ((zqg) xqgVarE.e()).c();
        d1g d1gVar = d1g.x;
        tug tugVar = sugVar.i;
        return ing.k("type.googleapis.com/google.crypto.tink.RsaSsaPssPrivateKey", omfVarC7, d1gVar, ilf.a(tugVar.i.c), tugVar.l);
    }

    @Override // defpackage.fa9
    public boolean e(y28 y28Var, ga3 ga3Var) {
        y28Var.getClass();
        return !ga3Var.getAnnotations().g(ga9.a);
    }

    @Override // defpackage.dz1
    public Object f(iq1 iq1Var) {
        Object objO = iq1Var.o(new rqa(ps0.class, Executor.class));
        objO.getClass();
        return bgf.y((Executor) objO);
    }

    @Override // defpackage.w82
    public long g(long j2, long j3) {
        float fMax = Math.max(Float.intBitsToFloat((int) (j3 >> 32)) / Float.intBitsToFloat((int) (j2 >> 32)), Float.intBitsToFloat((int) (j3 & 4294967295L)) / Float.intBitsToFloat((int) (j2 & 4294967295L)));
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(fMax)) << 32) | (((long) Float.floatToRawIntBits(fMax)) & 4294967295L);
        int i2 = fqb.a;
        return jFloatToRawIntBits;
    }

    public JSONArray j(String str, List list) {
        Set set = ec2.a;
        if (set.contains(this)) {
            return null;
        }
        try {
            JSONArray jSONArray = new JSONArray();
            ArrayList<i40> arrayList = new ArrayList(list);
            g34.b(arrayList);
            boolean zContains = set.contains(this);
            boolean z = false;
            if (!zContains) {
                try {
                    xe4 xe4VarK = af4.k(str, false);
                    if (xe4VarK != null) {
                        z = xe4VarK.a;
                    }
                } catch (Throwable th) {
                    ec2.a(this, th);
                }
            }
            for (i40 i40Var : arrayList) {
                boolean z2 = i40Var.c;
                if (!z2 || (z2 && z)) {
                    jSONArray.put(i40Var.a);
                }
            }
            return jSONArray;
        } catch (Throwable th2) {
            ec2.a(this, th2);
            return null;
        }
    }

    @Override // defpackage.huf
    public ruf l(Class cls) {
        throw new IllegalStateException("This should never be called.");
    }

    @Override // defpackage.um2
    public Iterable m(Object obj) {
        fj6[] fj6VarArr = oe6.h;
        return ((f41) obj).x0().i();
    }

    @Override // defpackage.o92
    public Object m0(jrg jrgVar) {
        Intent intent = (Intent) ((Bundle) jrgVar.i()).getParcelable("notification_data");
        if (intent != null) {
            return new ip1(intent);
        }
        return null;
    }

    @Override // defpackage.yx0
    public Rect p(Activity activity) {
        int i2;
        Display defaultDisplay = activity.getWindowManager().getDefaultDisplay();
        defaultDisplay.getClass();
        Point point = new Point();
        defaultDisplay.getRealSize(point);
        Rect rect = new Rect();
        int i3 = point.x;
        if (i3 == 0 || (i2 = point.y) == 0) {
            defaultDisplay.getRectSize(rect);
            return rect;
        }
        rect.right = i3;
        rect.bottom = i2;
        return rect;
    }

    @Override // defpackage.rhg
    public bzf r(lig ligVar) throws GeneralSecurityException {
        isg isgVar = (isg) ligVar.c;
        if (!isgVar.B().equals("type.googleapis.com/google.crypto.tink.AesGcmSivKey")) {
            ay0.e(ka1.r("Wrong type URL in call to AesGcmSivProtoSerialization.parseParameters: ", isgVar.B()));
            return null;
        }
        try {
            ong ongVarU = ong.u(isgVar.A(), ptf.a);
            if (ongVarU.w() != 0) {
                ygf.l("Only version 0 parameters are accepted");
                return null;
            }
            d2f d2fVarB = r2g.b();
            d2fVarB.E0(ongVarU.t());
            d2fVarB.c = u6g.a(isgVar.z());
            return d2fVarB.A0();
        } catch (zzale e2) {
            throw new GeneralSecurityException("Parsing AesGcmSivParameters failed: ", e2);
        }
    }

    public String toString() {
        switch (this.a) {
            case 23:
                return "SharingStarted.Lazily";
            default:
                return super.toString();
        }
    }
}
