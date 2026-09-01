package defpackage;

import android.app.Application;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;
import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;
import j$.util.Objects;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class sj0 {
    public Object a;
    public Object b;
    public Object c;
    public Object d;
    public Object e;
    public Object f;
    public Object g;
    public Object h;
    public Object i;

    public sj0(i93 i93Var, p98 p98Var, yv2 yv2Var, wjc wjcVar, kse kseVar, mr0 mr0Var, u93 u93Var, jz1 jz1Var, List list) {
        p98Var.getClass();
        yv2Var.getClass();
        kseVar.getClass();
        mr0Var.getClass();
        list.getClass();
        this.a = i93Var;
        this.b = p98Var;
        this.c = yv2Var;
        this.d = wjcVar;
        this.e = kseVar;
        this.f = mr0Var;
        this.g = u93Var;
        this.h = new jz1(this, jz1Var, list, "Deserializer for \"" + yv2Var.getName() + '\"', u93Var != null ? u93Var.A() : "[container not found]");
        this.i = new yu7(this);
    }

    public sj0 a(yv2 yv2Var, List list, p98 p98Var, wjc wjcVar, kse kseVar, mr0 mr0Var) {
        list.getClass();
        p98Var.getClass();
        kseVar.getClass();
        mr0Var.getClass();
        i93 i93Var = (i93) this.a;
        int i = mr0Var.b;
        if ((i != 1 || mr0Var.c < 4) && i <= 1) {
            kseVar = (kse) this.e;
        }
        return new sj0(i93Var, p98Var, yv2Var, wjcVar, kseVar, mr0Var, (u93) this.g, (jz1) this.h, list);
    }

    public eoc d(boolean z) {
        f17 f17VarB = d46.B();
        f17VarB.add(e(z));
        tz7 tz7Var = new tz7(28, false);
        bvg.a();
        nec necVar = (nec) this.c;
        l5g l5gVar = (l5g) this.g;
        f17VarB.add(new w3g((Application) this.a, (uz5) this.i, tz7Var, (e4g) this.h, necVar, l5gVar));
        d2f d2fVar = (d2f) this.f;
        f17VarB.add(new xzf((Application) d2fVar.b, (l5g) d2fVar.c));
        return new eoc(new nec(13, d46.w(f17VarB)));
    }

    public xzf e(boolean z) {
        Application application = (Application) this.a;
        uz5 uz5Var = (uz5) this.i;
        application.getContentResolver();
        xgf xgfVar = (xgf) this.b;
        l5g l5gVar = (l5g) this.g;
        f17 f17VarB = d46.B();
        f17VarB.add(new m0g(1));
        r0g r0gVar = new r0g();
        r0gVar.a = true;
        f17VarB.add(r0gVar);
        f17VarB.add(new b0g(application.getContentResolver()));
        f17VarB.add(new m0g(0));
        f17VarB.add(new k0g(application, l5gVar));
        if (z) {
            f17VarB.add(new b2g(l5gVar, new x2g(uz5Var, xgfVar)));
        }
        return new xzf(d46.w(f17VarB));
    }

    public x9g f(fa4 fa4Var) {
        d6g d6gVar = (d6g) this.g;
        o2b o2bVar = (o2b) this.f;
        nig nigVar = (nig) this.e;
        tag tagVar = (tag) this.d;
        sj0 sj0Var = (sj0) this.a;
        boolean zL = g76.L(fa4Var, fa4.r);
        uz5 uz5Var = (uz5) this.i;
        return zL ? new m9g(new bh4(uz5Var, sj0Var, tagVar, nigVar, o2bVar, d6gVar)) : new h9g(uz5Var, new bh4(uz5Var, sj0Var, tagVar, nigVar, o2bVar, d6gVar));
    }

    public void c(kk0 kk0Var, int i) {
        byte[] bArr;
        long j;
        qh0 qh0Var;
        String str;
        l70 l70VarH;
        String str2;
        Integer numValueOf;
        sj0 sj0Var;
        final sj0 sj0Var2 = this;
        final kk0 kk0Var2 = kk0Var;
        byte[] bArr2 = kk0Var2.b;
        fnb fnbVar = (fnb) sj0Var2.f;
        msd msdVarA = ((pz7) sj0Var2.b).a(kk0Var2.a);
        if (nm0.OK == null) {
            z72.c("Null status");
            return;
        }
        long jMax = 0;
        while (true) {
            final int i2 = 0;
            if (!((Boolean) fnbVar.I(new v5d(sj0Var2) { // from class: r6e
                public final /* synthetic */ sj0 b;

                {
                    this.b = sj0Var2;
                }

                @Override // defpackage.v5d
                public final Object c() {
                    Boolean bool;
                    int i3 = i2;
                    kk0 kk0Var3 = kk0Var2;
                    sj0 sj0Var3 = this.b;
                    switch (i3) {
                        case 0:
                            fnb fnbVar2 = (fnb) sj0Var3.c;
                            SQLiteDatabase sQLiteDatabaseF = fnbVar2.f();
                            sQLiteDatabaseF.beginTransaction();
                            try {
                                Long lM = fnb.m(sQLiteDatabaseF, kk0Var3);
                                if (lM == null) {
                                    bool = Boolean.FALSE;
                                } else {
                                    Cursor cursorRawQuery = fnbVar2.f().rawQuery("SELECT 1 FROM events WHERE context_id = ? LIMIT 1", new String[]{lM.toString()});
                                    try {
                                        Boolean boolValueOf = Boolean.valueOf(cursorRawQuery.moveToNext());
                                        cursorRawQuery.close();
                                        bool = boolValueOf;
                                    } catch (Throwable th) {
                                        cursorRawQuery.close();
                                        throw th;
                                    }
                                }
                                sQLiteDatabaseF.setTransactionSuccessful();
                                return bool;
                            } finally {
                                sQLiteDatabaseF.endTransaction();
                            }
                        default:
                            fnb fnbVar3 = (fnb) sj0Var3.c;
                            fnbVar3.getClass();
                            return (Iterable) fnbVar3.p(new lt(fnbVar3, 15, kk0Var3));
                    }
                }
            })).booleanValue()) {
                fnbVar.I(new oc2(jMax, sj0Var2, kk0Var2));
                return;
            }
            final int i3 = 1;
            Iterable iterable = (Iterable) fnbVar.I(new v5d(sj0Var2) { // from class: r6e
                public final /* synthetic */ sj0 b;

                {
                    this.b = sj0Var2;
                }

                @Override // defpackage.v5d
                public final Object c() {
                    Boolean bool;
                    int i32 = i3;
                    kk0 kk0Var3 = kk0Var2;
                    sj0 sj0Var3 = this.b;
                    switch (i32) {
                        case 0:
                            fnb fnbVar2 = (fnb) sj0Var3.c;
                            SQLiteDatabase sQLiteDatabaseF = fnbVar2.f();
                            sQLiteDatabaseF.beginTransaction();
                            try {
                                Long lM = fnb.m(sQLiteDatabaseF, kk0Var3);
                                if (lM == null) {
                                    bool = Boolean.FALSE;
                                } else {
                                    Cursor cursorRawQuery = fnbVar2.f().rawQuery("SELECT 1 FROM events WHERE context_id = ? LIMIT 1", new String[]{lM.toString()});
                                    try {
                                        Boolean boolValueOf = Boolean.valueOf(cursorRawQuery.moveToNext());
                                        cursorRawQuery.close();
                                        bool = boolValueOf;
                                    } catch (Throwable th) {
                                        cursorRawQuery.close();
                                        throw th;
                                    }
                                }
                                sQLiteDatabaseF.setTransactionSuccessful();
                                return bool;
                            } finally {
                                sQLiteDatabaseF.endTransaction();
                            }
                        default:
                            fnb fnbVar3 = (fnb) sj0Var3.c;
                            fnbVar3.getClass();
                            return (Iterable) fnbVar3.p(new lt(fnbVar3, 15, kk0Var3));
                    }
                }
            });
            if (!iterable.iterator().hasNext()) {
                return;
            }
            if (msdVarA == null) {
                n01.T(kk0Var2, "Uploader", "Unknown backend for %s, deleting event batch for it...");
                qh0Var = new qh0(nm0.FATAL_ERROR, -1L);
                bArr = bArr2;
                j = jMax;
            } else {
                ArrayList<ij0> arrayList = new ArrayList();
                Iterator it2 = iterable.iterator();
                while (it2.hasNext()) {
                    arrayList.add(((xj0) it2.next()).c);
                }
                if (bArr2 != null) {
                    fnb fnbVar2 = (fnb) sj0Var2.i;
                    Objects.requireNonNull(fnbVar2);
                    yo1 yo1Var = (yo1) fnbVar.I(new p6e(fnbVar2, i2));
                    hj0 hj0Var = new hj0();
                    hj0Var.i = new HashMap();
                    hj0Var.g = Long.valueOf(((dp1) sj0Var2.g).e());
                    hj0Var.h = Long.valueOf(((dp1) sj0Var2.h).e());
                    hj0Var.b = "GDT_CLIENT_METRICS";
                    wy3 wy3Var = new wy3("proto");
                    yo1Var.getClass();
                    z7a z7aVar = l7a.a;
                    z7aVar.getClass();
                    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                    try {
                        z7aVar.a(yo1Var, byteArrayOutputStream);
                    } catch (IOException unused) {
                    }
                    hj0Var.f = new qy3(wy3Var, byteArrayOutputStream.toByteArray());
                    arrayList.add(((nj1) msdVarA).a(hj0Var.b()));
                }
                nj1 nj1Var = (nj1) msdVarA;
                HashMap map = new HashMap();
                for (ij0 ij0Var : arrayList) {
                    String str3 = ij0Var.a;
                    if (map.containsKey(str3)) {
                        ((List) map.get(str3)).add(ij0Var);
                    } else {
                        ArrayList arrayList2 = new ArrayList();
                        arrayList2.add(ij0Var);
                        map.put(str3, arrayList2);
                    }
                }
                ArrayList arrayList3 = new ArrayList();
                for (Map.Entry entry : map.entrySet()) {
                    ij0 ij0Var2 = (ij0) ((List) entry.getValue()).get(0);
                    pqa pqaVar = pqa.DEFAULT;
                    long jE = nj1Var.f.e();
                    long jE2 = nj1Var.e.e();
                    sh0 sh0Var = new sh0(wo1.ANDROID_FIREBASE, new ph0(Integer.valueOf(ij0Var2.b("sdk-version")), ij0Var2.a("model"), ij0Var2.a("hardware"), ij0Var2.a("device"), ij0Var2.a("product"), ij0Var2.a("os-uild"), ij0Var2.a("manufacturer"), ij0Var2.a("fingerprint"), ij0Var2.a("locale"), ij0Var2.a("country"), ij0Var2.a("mcc_mnc"), ij0Var2.a("application_build")));
                    try {
                        numValueOf = Integer.valueOf(Integer.parseInt((String) entry.getKey()));
                        str2 = null;
                    } catch (NumberFormatException unused2) {
                        str2 = (String) entry.getKey();
                        numValueOf = null;
                    }
                    ArrayList arrayList4 = new ArrayList();
                    for (ij0 ij0Var3 : (List) entry.getValue()) {
                        byte[] bArr3 = bArr2;
                        qy3 qy3Var = ij0Var3.c;
                        byte[] bArr4 = ij0Var3.j;
                        wy3 wy3Var2 = qy3Var.a;
                        byte[] bArr5 = qy3Var.b;
                        long j2 = jMax;
                        if (wy3Var2.equals(new wy3("proto"))) {
                            sj0Var = new sj0();
                            sj0Var.f = bArr5;
                        } else if (wy3Var2.equals(new wy3("json"))) {
                            String str4 = new String(bArr5, Charset.forName("UTF-8"));
                            sj0 sj0Var3 = new sj0();
                            sj0Var3.g = str4;
                            sj0Var = sj0Var3;
                        } else {
                            String strZ = n01.Z("CctTransportBackend");
                            if (Log.isLoggable(strZ, 5)) {
                                Log.w(strZ, "Received event of unsupported encoding " + wy3Var2 + ". Skipping...");
                            }
                            bArr2 = bArr3;
                            jMax = j2;
                        }
                        sj0Var.a = Long.valueOf(ij0Var3.d);
                        sj0Var.b = Long.valueOf(ij0Var3.e);
                        String str5 = (String) ij0Var3.f.get("tz-offset");
                        sj0Var.c = Long.valueOf(str5 == null ? 0L : Long.valueOf(str5).longValue());
                        sj0Var.h = new wj0(sd8.forNumber(ij0Var3.b("net-type")), rd8.forNumber(ij0Var3.b("mobile-subtype")));
                        Integer num = ij0Var3.b;
                        if (num != null) {
                            sj0Var.d = num;
                        }
                        Integer num2 = ij0Var3.g;
                        if (num2 != null) {
                            sj0Var.e = new th0(new mj0(new lj0(num2)), dy1.EVENT_OVERRIDE);
                        }
                        byte[] bArr6 = ij0Var3.i;
                        if (bArr6 != null || bArr4 != null) {
                            if (bArr6 == null) {
                                bArr6 = null;
                            }
                            sj0Var.i = new kj0(bArr6, bArr4 != null ? bArr4 : null);
                        }
                        String strConcat = ((Long) sj0Var.a) == null ? " eventTimeMs" : "";
                        if (((Long) sj0Var.b) == null) {
                            strConcat = strConcat.concat(" eventUptimeMs");
                        }
                        if (((Long) sj0Var.c) == null) {
                            strConcat = strConcat.concat(" timezoneOffsetSeconds");
                        }
                        if (!strConcat.isEmpty()) {
                            ygf.f("Missing required properties:".concat(strConcat));
                            return;
                        } else {
                            arrayList4.add(new tj0(((Long) sj0Var.a).longValue(), (Integer) sj0Var.d, (th0) sj0Var.e, ((Long) sj0Var.b).longValue(), (byte[]) sj0Var.f, (String) sj0Var.g, ((Long) sj0Var.c).longValue(), (wj0) sj0Var.h, (kj0) sj0Var.i));
                            bArr2 = bArr3;
                            jMax = j2;
                        }
                    }
                    arrayList3.add(new uj0(jE, jE2, sh0Var, numValueOf, str2, arrayList4, pqaVar));
                }
                bArr = bArr2;
                j = jMax;
                rh0 rh0Var = new rh0(arrayList3);
                URL urlB = nj1Var.d;
                if (bArr != null) {
                    try {
                        j21 j21VarA = j21.a(bArr);
                        str = j21VarA.b;
                        if (str == null) {
                            str = null;
                        }
                        String str6 = j21VarA.a;
                        if (str6 != null) {
                            urlB = nj1.b(str6);
                        }
                    } catch (IllegalArgumentException unused3) {
                        qh0Var = new qh0(nm0.FATAL_ERROR, -1L);
                    }
                } else {
                    str = null;
                }
                try {
                    int i4 = 16;
                    m50 m50Var = new m50(urlB, rh0Var, str, i4);
                    f70 f70Var = new f70(3, nj1Var);
                    int i5 = 5;
                    do {
                        l70VarH = f70Var.h(m50Var);
                        URL url = (URL) l70VarH.a;
                        if (url != null) {
                            n01.T(url, "CctTransportBackend", JWcjNoweKCnTr.Zfz);
                            m50Var = new m50(url, (rh0) m50Var.c, (String) m50Var.d, i4);
                        } else {
                            m50Var = null;
                        }
                        if (m50Var == null) {
                            break;
                        } else {
                            i5--;
                        }
                    } while (i5 >= 1);
                    int i6 = l70VarH.b;
                    qh0Var = i6 == 200 ? new qh0(nm0.OK, l70VarH.c) : (i6 >= 500 || i6 == 404) ? new qh0(nm0.TRANSIENT_ERROR, -1L) : i6 == 400 ? new qh0(nm0.INVALID_PAYLOAD, -1L) : new qh0(nm0.FATAL_ERROR, -1L);
                } catch (IOException e) {
                    n01.U(e, "CctTransportBackend", "Could not make request to the backend");
                    qh0Var = new qh0(nm0.TRANSIENT_ERROR, -1L);
                }
            }
            nm0 nm0Var = nm0.TRANSIENT_ERROR;
            nm0 nm0Var2 = qh0Var.a;
            if (nm0Var2 == nm0Var) {
                fnbVar.I(new e43(this, iterable, kk0Var, j));
                ((ku3) this.d).I(kk0Var, i + 1, true);
                return;
            }
            sj0Var2 = this;
            kk0Var2 = kk0Var;
            jMax = j;
            fnbVar.I(new lt(sj0Var2, 17, iterable));
            if (nm0Var2 == nm0.OK) {
                jMax = Math.max(jMax, qh0Var.b);
                if (bArr != null) {
                    fnbVar.I(new o19(11, sj0Var2));
                }
            } else if (nm0Var2 == nm0.INVALID_PAYLOAD) {
                HashMap map2 = new HashMap();
                Iterator it3 = iterable.iterator();
                while (it3.hasNext()) {
                    String str7 = ((xj0) it3.next()).c.a;
                    if (map2.containsKey(str7)) {
                        map2.put(str7, Integer.valueOf(((Integer) map2.get(str7)).intValue() + 1));
                    } else {
                        map2.put(str7, 1);
                    }
                }
                fnbVar.I(new lt(sj0Var2, 18, map2));
            }
            bArr2 = bArr;
        }
    }
}
