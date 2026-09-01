package defpackage;

import android.app.Application;
import android.content.SharedPreferences;
import android.graphics.Color;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import j$.util.concurrent.ConcurrentHashMap;
import java.lang.reflect.Array;
import java.security.GeneralSecurityException;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rz5 implements bb, mqe, h04, an4, ndf, ln4, j70, b21, r44, iwa, ru2, k9f, f2c, pg2, eof, yfg, rhg {
    public static final rz5 b = new rz5(0);
    public static final rz5 c = new rz5(1);
    public static final rz5 d = new rz5(2);
    public static final rz5 e = new rz5(3);
    public static final rz5 f = new rz5(4);
    public static final rz5 g = new rz5(6);
    public static final rz5 h = new rz5(8);
    public static final rz5 i = new rz5(9);
    public static final rz5 j = new rz5(10);
    public static o2b k;
    public final /* synthetic */ int a;

    public /* synthetic */ rz5(int i2) {
        this.a = i2;
    }

    public static zo7 A(x12 x12Var) {
        return (zo7) ((p65) x12Var).j(kt7.b);
    }

    public static m50 C() {
        return new m50(null, ei7.O(new f09(2, null), new f09(4, null), new f09(9, null), new f09(17, null), new f09(341, null)), ei7.O(new f09(102, null), new f09(190, null), new f09(412, null)), null, null, null);
    }

    public static bu7 D(x12 x12Var) {
        return (bu7) ((p65) x12Var).j(jt7.c);
    }

    public static final void E() {
        if (ec2.a.contains(rz5.class)) {
            return;
        }
        try {
            SharedPreferences sharedPreferences = f94.a().getSharedPreferences("com.facebook.internal.iap.IAP_CACHE_GPBLV2V7", 0);
            long jMax = Math.max(Math.max(sharedPreferences.getLong("TIME_OF_LAST_LOGGED_PURCHASE", 0L), sharedPreferences.getLong("TIME_OF_LAST_LOGGED_SUBSCRIPTION", 0L)), 1736528400000L);
            CopyOnWriteArraySet copyOnWriteArraySet = new CopyOnWriteArraySet();
            SharedPreferences sharedPreferences2 = f94.a().getSharedPreferences("com.facebook.internal.iap.PRODUCT_DETAILS", 0);
            if (sharedPreferences2.contains("PURCHASE_DETAILS_SET")) {
                Collection stringSet = sharedPreferences2.getStringSet("PURCHASE_DETAILS_SET", new HashSet());
                copyOnWriteArraySet.addAll(stringSet == null ? new HashSet() : stringSet);
                Iterator it2 = copyOnWriteArraySet.iterator();
                while (it2.hasNext()) {
                    try {
                        long j2 = Long.parseLong((String) muc.p0((String) it2.next(), new String[]{";"}, 2, 2).get(1)) * 1000;
                        if (Math.abs(String.valueOf(j2).length() - 13) < Math.log10(1000.0d)) {
                            jMax = Math.max(jMax, j2);
                        }
                    } catch (Exception unused) {
                    }
                }
            }
            sharedPreferences.edit().putLong("TIME_OF_LAST_LOGGED_SUBSCRIPTION", jMax).apply();
            sharedPreferences.edit().putLong("TIME_OF_LAST_LOGGED_PURCHASE", jMax).apply();
            y();
        } catch (Throwable th) {
            ec2.a(rz5.class, th);
        }
    }

    public static HashMap F(JSONObject jSONObject) {
        int iOptInt;
        HashSet hashSet;
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("items");
        if (jSONArrayOptJSONArray == null || jSONArrayOptJSONArray.length() == 0) {
            return null;
        }
        HashMap map = new HashMap();
        int length = jSONArrayOptJSONArray.length();
        for (int i2 = 0; i2 < length; i2++) {
            JSONObject jSONObjectOptJSONObject = jSONArrayOptJSONArray.optJSONObject(i2);
            if (jSONObjectOptJSONObject != null && (iOptInt = jSONObjectOptJSONObject.optInt("code")) != 0) {
                JSONArray jSONArrayOptJSONArray2 = jSONObjectOptJSONObject.optJSONArray("subcodes");
                if (jSONArrayOptJSONArray2 == null || jSONArrayOptJSONArray2.length() <= 0) {
                    hashSet = null;
                } else {
                    hashSet = new HashSet();
                    int length2 = jSONArrayOptJSONArray2.length();
                    for (int i3 = 0; i3 < length2; i3++) {
                        int iOptInt2 = jSONArrayOptJSONArray2.optInt(i3);
                        if (iOptInt2 != 0) {
                            hashSet.add(Integer.valueOf(iOptInt2));
                        }
                    }
                }
                map.put(Integer.valueOf(iOptInt), hashSet);
            }
        }
        return map;
    }

    public static byte[][] G(byte[][] bArr) {
        byte[][] bArr2 = (byte[][]) Array.newInstance((Class<?>) Byte.TYPE, bArr[0].length, bArr.length);
        for (int i2 = 0; i2 < bArr.length; i2++) {
            int length = (bArr.length - i2) - 1;
            for (int i3 = 0; i3 < bArr[0].length; i3++) {
                bArr2[i3][length] = bArr[i2][i3];
            }
        }
        return bArr2;
    }

    public static final void H() {
        if (ec2.a.contains(rz5.class)) {
            return;
        }
        try {
            try {
                f94.a().getSharedPreferences("com.facebook.internal.iap.IAP_CACHE_GPBLV2V7", 0).edit().putBoolean("APP_HAS_BEEN_LAUNCHED_KEY", true).apply();
            } catch (Exception unused) {
            }
        } catch (Throwable th) {
            ec2.a(rz5.class, th);
        }
    }

    public static wmb I(c96 c96Var) {
        c96Var.getClass();
        return new wmb((u0b) c96Var);
    }

    public static final void J() {
        if (ec2.a.contains(rz5.class)) {
            return;
        }
        try {
            H();
            try {
                SharedPreferences sharedPreferences = f94.a().getSharedPreferences("com.facebook.internal.iap.IAP_CACHE_GPBLV2V7", 0);
                long jCurrentTimeMillis = System.currentTimeMillis();
                sharedPreferences.edit().putLong("TIME_OF_LAST_LOGGED_SUBSCRIPTION", jCurrentTimeMillis).apply();
                sharedPreferences.edit().putLong("TIME_OF_LAST_LOGGED_PURCHASE", jCurrentTimeMillis).apply();
            } catch (Exception unused) {
            }
        } catch (Throwable th) {
            ec2.a(rz5.class, th);
        }
    }

    public static sr0 u(byte[][] bArr, int i2) {
        int i3 = i2 * 2;
        int length = bArr[0].length + i3;
        int length2 = bArr.length + i3;
        sr0 sr0Var = new sr0(length, length2);
        int[] iArr = sr0Var.d;
        int length3 = iArr.length;
        for (int i4 = 0; i4 < length3; i4++) {
            iArr[i4] = 0;
        }
        int i5 = (length2 - i2) - 1;
        int i6 = 0;
        while (i6 < bArr.length) {
            byte[] bArr2 = bArr[i6];
            for (int i7 = 0; i7 < bArr[0].length; i7++) {
                if (bArr2[i7] == 1) {
                    sr0Var.b(i7 + i2, i5);
                }
            }
            i6++;
            i5--;
        }
        return sr0Var;
    }

    public static xwd w(swd swdVar, v96 v96Var, mya myaVar, mn6 mn6Var) {
        v96Var.getClass();
        if (!v96Var.c) {
            v96Var = v96Var.b(w96.INFLEXIBLE);
        }
        int i2 = usa.a[v96Var.b.ordinal()];
        if (i2 == 1) {
            return new onc(mn6Var, pqe.INVARIANT);
        }
        if (i2 != 2 && i2 != 3) {
            ygf.a();
            return null;
        }
        if (!swdVar.z().getAllowsOutPosition()) {
            return new onc(f93.e(swdVar).n(), pqe.INVARIANT);
        }
        List parameters = mn6Var.j0().getParameters();
        parameters.getClass();
        return !parameters.isEmpty() ? new onc(mn6Var, pqe.OUT_VARIANCE) : nxd.l(swdVar, v96Var);
    }

    public static final void y() {
        if (ec2.a.contains(rz5.class)) {
            return;
        }
        try {
            SharedPreferences sharedPreferences = f94.a().getSharedPreferences("com.facebook.internal.SKU_DETAILS", 0);
            SharedPreferences sharedPreferences2 = f94.a().getSharedPreferences("com.facebook.internal.PURCHASE", 0);
            sharedPreferences.edit().clear().apply();
            sharedPreferences2.edit().clear().apply();
            f94.a().getSharedPreferences("com.facebook.internal.iap.PRODUCT_DETAILS", 0).edit().clear().apply();
        } catch (Throwable th) {
            ec2.a(rz5.class, th);
        }
    }

    public static final void z(ConcurrentHashMap concurrentHashMap, ConcurrentHashMap concurrentHashMap2, boolean z, String str, vz5 vz5Var, boolean z2) {
        Set set = ec2.a;
        if (set.contains(rz5.class)) {
            return;
        }
        try {
            concurrentHashMap.getClass();
            concurrentHashMap2.getClass();
            rz5 rz5Var = b;
            LinkedHashMap linkedHashMapX = rz5Var.x(rz5Var.v(concurrentHashMap, z), concurrentHashMap2, str);
            if (set.contains(rz5Var)) {
                return;
            }
            try {
                for (Map.Entry entry : linkedHashMapX.entrySet()) {
                    wk0.e((String) entry.getKey(), (String) entry.getValue(), z, vz5Var, z2);
                }
            } catch (Throwable th) {
                ec2.a(rz5Var, th);
            }
        } catch (Throwable th2) {
            ec2.a(rz5.class, th2);
        }
    }

    public synchronized m50 B() {
        m50 m50VarC;
        m50VarC = m50.m;
        if (m50VarC == null) {
            m50VarC = C();
            m50.m = m50VarC;
        }
        return m50VarC;
    }

    public Object K(Application application, String str, p92 p92Var) {
        o2b o2bVar;
        sj0 sj0VarI = dq1.I(application);
        synchronized (this) {
            try {
                o2bVar = k;
                if (o2bVar == null) {
                    o2bVar = new o2b(application, sj0VarI);
                }
                if (k == null) {
                    k = o2bVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return vx0.m0(((k92) ((uz5) ((sj0) o2bVar.c).i).c).a, new yxf(o2bVar, fa4.s, str, null), p92Var);
    }

    @Override // defpackage.mqe
    public Object L0(id6 id6Var, float f2) {
        boolean z = id6Var.I() == ed6.BEGIN_ARRAY;
        if (z) {
            id6Var.f();
        }
        double dNextDouble = id6Var.nextDouble();
        double dNextDouble2 = id6Var.nextDouble();
        double dNextDouble3 = id6Var.nextDouble();
        double dNextDouble4 = id6Var.I() == ed6.NUMBER ? id6Var.nextDouble() : 1.0d;
        if (z) {
            id6Var.p();
        }
        if (dNextDouble <= 1.0d && dNextDouble2 <= 1.0d && dNextDouble3 <= 1.0d) {
            dNextDouble *= 255.0d;
            dNextDouble2 *= 255.0d;
            dNextDouble3 *= 255.0d;
            if (dNextDouble4 <= 1.0d) {
                dNextDouble4 *= 255.0d;
            }
        }
        return Integer.valueOf(Color.argb((int) dNextDouble4, (int) dNextDouble, (int) dNextDouble2, (int) dNextDouble3));
    }

    @Override // defpackage.b21
    public byte[] a(byte[] bArr, int i2, int i3) {
        byte[] bArr2 = new byte[i3];
        System.arraycopy(bArr, i2, bArr2, 0, i3);
        return bArr2;
    }

    @Override // defpackage.f2c
    public w1c b(z46 z46Var, JSONObject jSONObject) throws JSONException {
        jSONObject.optInt("settings_version", 0);
        int iOptInt = jSONObject.optInt("cache_duration", NikonType2MakernoteDirectory.TAG_NIKON_SCAN);
        double dOptDouble = jSONObject.optDouble("on_demand_upload_rate_per_minute", 10.0d);
        double dOptDouble2 = jSONObject.optDouble("on_demand_backoff_base", 1.2d);
        int iOptInt2 = jSONObject.optInt("on_demand_backoff_step_duration_seconds", 60);
        int i2 = 6;
        d87 d87Var = jSONObject.has("session") ? new d87(jSONObject.getJSONObject("session").optInt("max_custom_exception_events", 8), i2) : new d87(new JSONObject().optInt("max_custom_exception_events", 8), i2);
        JSONObject jSONObject2 = jSONObject.getJSONObject("features");
        return new w1c(jSONObject.has("expires_at") ? jSONObject.optLong("expires_at") : (((long) iOptInt) * 1000) + System.currentTimeMillis(), d87Var, new u1c(jSONObject2.optBoolean("collect_reports", true), jSONObject2.optBoolean("collect_anrs", false), jSONObject2.optBoolean("collect_build_ids", false)), dOptDouble, dOptDouble2, iOptInt2);
    }

    @Override // defpackage.eof
    public boolean c(Class cls) {
        return false;
    }

    @Override // defpackage.ln4
    public float d() {
        return 0.0f;
    }

    @Override // defpackage.eof
    public rof e(Class cls) {
        throw new IllegalStateException("This should never be called.");
    }

    @Override // defpackage.j70
    public /* synthetic */ float f() {
        return 0.0f;
    }

    @Override // defpackage.j70
    public void f0(m73 m73Var, int i2, int[] iArr, int[] iArr2) {
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

    @Override // defpackage.bb
    public Collection g(y28 y28Var) {
        return ey3.a;
    }

    @Override // defpackage.iwa
    public mn6 getType() {
        throw new IllegalStateException("This method should not be called");
    }

    @Override // defpackage.bb
    public Collection h(y28 y28Var) {
        y28Var.getClass();
        return ey3.a;
    }

    @Override // defpackage.ln4
    public float i(float f2, long j2) {
        return 0.0f;
    }

    @Override // defpackage.bb
    public Collection j(y28 y28Var) {
        return ey3.a;
    }

    @Override // defpackage.ln4
    public float k(float f2, float f3, long j2) {
        return 0.0f;
    }

    /* JADX WARN: Removed duplicated region for block: B:160:0x02eb  */
    /* JADX WARN: Removed duplicated region for block: B:199:0x03f5 A[LOOP:13: B:198:0x03f3->B:199:0x03f5, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:202:0x040e  */
    /* JADX WARN: Removed duplicated region for block: B:203:0x0417  */
    @Override // defpackage.k9f
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.sr0 l(java.lang.String r24, defpackage.xm0 r25, java.util.EnumMap r26) throws com.google.zxing.WriterException {
        /*
            Method dump skipped, instruction units count: 1211
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rz5.l(java.lang.String, xm0, java.util.EnumMap):sr0");
    }

    @Override // defpackage.yfg
    public nig l0(gr7 gr7Var) throws GeneralSecurityException {
        ntg ntgVar;
        z3g z3gVar = (z3g) gr7Var;
        htg htgVarW = itg.w();
        ltg ltgVarB = b4g.b(z3gVar.h);
        htgVarW.c();
        itg.v((itg) htgVarW.b, ltgVarB);
        rsf rsfVarB = ((itg) htgVarW.b()).b();
        zrg zrgVar = zrg.REMOTE;
        d1g d1gVar = z3gVar.h.a;
        if (d1g.n == d1gVar) {
            ntgVar = ntg.TINK;
        } else {
            if (d1g.o != d1gVar) {
                throw new GeneralSecurityException("Unable to serialize variant: ".concat(String.valueOf(d1gVar)));
            }
            ntgVar = ntg.RAW;
        }
        return nig.I("type.googleapis.com/google.crypto.tink.KmsEnvelopeAeadKey", rsfVarB, zrgVar, ntgVar, z3gVar.j);
    }

    @Override // defpackage.ru2
    public boolean m(a34 a34Var, Object obj, u34 u34Var) {
        u34Var.getClass();
        return false;
    }

    @Override // defpackage.bb
    public Collection n(n98 n98Var, y28 y28Var) {
        y28Var.getClass();
        return ey3.a;
    }

    @Override // defpackage.ln4
    public long o(float f2) {
        return 0L;
    }

    @Override // defpackage.ln4
    public float p(float f2, float f3) {
        return 0.0f;
    }

    @Override // defpackage.h04
    public Boolean q() {
        return null;
    }

    @Override // defpackage.rhg
    public bzf r(lig ligVar) throws GeneralSecurityException {
        isg isgVar = (isg) ligVar.c;
        if (!isgVar.B().equals("type.googleapis.com/google.crypto.tink.AesGcmKey")) {
            ay0.e(ka1.r("Wrong type URL in call to AesGcmProtoSerialization.parseParameters: ", isgVar.B()));
            return null;
        }
        try {
            fng fngVarU = fng.u(isgVar.A(), ptf.a);
            if (fngVarU.w() != 0) {
                ygf.l("Only version 0 parameters are accepted");
                return null;
            }
            o2b o2bVarB = g2g.b();
            o2bVarB.W(fngVarU.t());
            o2bVarB.R();
            o2bVarB.Y();
            o2bVarB.e = f6g.a(isgVar.z());
            return o2bVarB.P();
        } catch (zzale e2) {
            throw new GeneralSecurityException("Parsing AesGcmParameters failed: ", e2);
        }
    }

    @Override // defpackage.an4
    public mn6 s(s6a s6aVar, String str, hec hecVar, hec hecVar2) {
        s6aVar.getClass();
        str.getClass();
        hecVar.getClass();
        hecVar2.getClass();
        if (!str.equals("kotlin.jvm.PlatformType")) {
            return l24.c(k24.ERROR_FLEXIBLE_TYPE, str, hecVar.toString(), hecVar2.toString());
        }
        if (!s6aVar.j(gg6.g)) {
            return pwd.K(hecVar, hecVar2);
        }
        wsa wsaVar = new wsa(hecVar, hecVar2);
        on6.a.b(hecVar, hecVar2);
        return wsaVar;
    }

    public void t(float f2, int i2, long j2, x12 x12Var, r28 r28Var) {
        float f3;
        r28 r28Var2;
        p65 p65Var;
        long j3;
        r28 r28Var3;
        float f4;
        long j4;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(910934799);
        int i3 = i2 | 150 | (p65Var2.f(this) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            p65Var2.U();
            if ((i2 & 1) == 0 || p65Var2.z()) {
                long jB = uu1.b(0.12f, ((uu1) p65Var2.j(d82.a)).a);
                r28Var3 = o28.b;
                f4 = 1.0f;
                j4 = jB;
            } else {
                p65Var2.S();
                f4 = f2;
                j4 = j2;
                r28Var3 = r28Var;
            }
            p65Var2.q();
            f49.f(f4, 6, j4, p65Var2, r28Var3);
            long j5 = j4;
            f3 = f4;
            p65Var = p65Var2;
            r28Var2 = r28Var3;
            j3 = j5;
        } else {
            p65Var2.S();
            f3 = f2;
            r28Var2 = r28Var;
            p65Var = p65Var2;
            j3 = j2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new k7d(this, r28Var2, f3, j3, i2, 0);
        }
    }

    public String toString() {
        switch (this.a) {
            case 12:
                return "Arrangement#Top";
            default:
                return super.toString();
        }
    }

    public HashMap v(Map map, boolean z) {
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            SharedPreferences sharedPreferences = f94.a().getSharedPreferences("com.facebook.internal.iap.IAP_CACHE_GPBLV2V7", 0);
            long j2 = z ? sharedPreferences.getLong("TIME_OF_LAST_LOGGED_SUBSCRIPTION", 1736528400000L) : sharedPreferences.getLong("TIME_OF_LAST_LOGGED_PURCHASE", 1736528400000L);
            long jMax = 0;
            for (Map.Entry entry : ei7.W(map).entrySet()) {
                String str = (String) entry.getKey();
                JSONObject jSONObject = (JSONObject) entry.getValue();
                try {
                    if (jSONObject.has("purchaseToken") && jSONObject.has("purchaseTime")) {
                        long j3 = jSONObject.getLong("purchaseTime");
                        if (j3 <= j2) {
                            map.remove(str);
                        }
                        jMax = Math.max(jMax, j3);
                    }
                } catch (Exception unused) {
                }
            }
            if (jMax >= j2) {
                if (z) {
                    sharedPreferences.edit().putLong("TIME_OF_LAST_LOGGED_SUBSCRIPTION", jMax).apply();
                } else {
                    sharedPreferences.edit().putLong("TIME_OF_LAST_LOGGED_PURCHASE", jMax).apply();
                }
            }
            return new HashMap(map);
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }

    public LinkedHashMap x(HashMap map, Map map2, String str) {
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            map.getClass();
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            for (Map.Entry entry : map.entrySet()) {
                String str2 = (String) entry.getKey();
                JSONObject jSONObject = (JSONObject) entry.getValue();
                JSONObject jSONObject2 = (JSONObject) map2.get(str2);
                try {
                    jSONObject.put("packageName", str);
                    if (jSONObject2 != null) {
                        String string = jSONObject.toString();
                        string.getClass();
                        String string2 = jSONObject2.toString();
                        string2.getClass();
                        linkedHashMap.put(string, string2);
                    }
                } catch (Exception unused) {
                }
            }
            return linkedHashMap;
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }
}
