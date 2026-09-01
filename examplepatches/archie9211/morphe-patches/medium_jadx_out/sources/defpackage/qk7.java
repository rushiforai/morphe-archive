package defpackage;

import android.content.Context;
import android.database.SQLException;
import android.os.Build;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.zzcy;
import com.datadog.android.core.UploadWorker;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.google.android.gms.internal.p000firebaseauthapi.zzabz;
import com.medium.reader.R;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.UnknownHostException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class qk7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;
    public static final /* synthetic */ int e = 0;
    public static final /* synthetic */ int f = 0;

    public static final void A(Context context, String str, f66 f66Var) {
        str.getClass();
        f66Var.getClass();
        try {
            m7f m7fVarF = m7f.f(context);
            m7fVarF.getClass();
            LinkedHashSet linkedHashSet = new LinkedHashSet();
            te8 te8Var = te8.NOT_ROAMING;
            te8Var.getClass();
            e72 e72Var = new e72(new le8(null), te8Var, false, false, false, false, -1L, -1L, Build.VERSION.SDK_INT >= 24 ? bu1.q1(linkedHashSet) : ny3.a);
            vt8 vt8Var = new vt8(UploadWorker.class);
            vt8Var.c.j = e72Var;
            vt8Var.d.add("DatadogBackgroundUpload/".concat(str));
            vt8 vt8Var2 = (vt8) vt8Var.e(5000L, TimeUnit.MILLISECONDS);
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            linkedHashMap.put("_dd.sdk.instanceName", str);
            dt2 dt2Var = new dt2(linkedHashMap);
            ht2.E0(dt2Var);
            vt8Var2.c.e = dt2Var;
            m7fVarF.d("DatadogUploadWorker", j54.REPLACE, (wt8) vt8Var2.a());
            f49.K(f66Var, d66.INFO, e66.MAINTAINER, b18.t, null, false, 56);
        } catch (Exception e2) {
            f49.L(f66Var, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), b18.u, e2, 48);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final o3e B(o3e o3eVar, mn6 mn6Var) {
        o3eVar.getClass();
        if (o3eVar instanceof qxd) {
            return B(((qxd) o3eVar).f0(), mn6Var);
        }
        if (mn6Var == null || mn6Var.equals(o3eVar)) {
            return o3eVar;
        }
        if (o3eVar instanceof hec) {
            return new lec((hec) o3eVar, mn6Var);
        }
        if (o3eVar instanceof zm4) {
            return new cn4((zm4) o3eVar, mn6Var);
        }
        ygf.a();
        return null;
    }

    public static amg C(pjg pjgVar) {
        ohg ohgVar = new ohg();
        ohgVar.c = new lpg();
        amg amgVar = new amg(ohgVar);
        ohgVar.b = amgVar;
        ohgVar.a = pjgVar.getClass();
        try {
            ohgVar.a = pjgVar.zza(ohgVar);
            return amgVar;
        } catch (Exception e2) {
            s4g s4gVar = new s4g(e2);
            mk7 mk7Var = ggg.f;
            mkg mkgVar = amgVar.b;
            if (mk7Var.O(mkgVar, null, s4gVar)) {
                ggg.d(mkgVar);
            }
            return amgVar;
        }
    }

    public static void D(String str, vnf vnfVar, iof iofVar, xnf xnfVar, o2b o2bVar) {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
            httpURLConnection.setDoOutput(true);
            byte[] bytes = vnfVar.zza().getBytes(Charset.defaultCharset());
            httpURLConnection.setFixedLengthStreamingMode(bytes.length);
            httpURLConnection.setRequestProperty("Content-Type", "application/json");
            httpURLConnection.setConnectTimeout(60000);
            o2bVar.U(httpURLConnection);
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(httpURLConnection.getOutputStream(), bytes.length);
            try {
                bufferedOutputStream.write(bytes, 0, bytes.length);
                bufferedOutputStream.close();
                E(httpURLConnection, iofVar, xnfVar);
            } catch (Throwable th) {
                try {
                    bufferedOutputStream.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
                throw th;
            }
        } catch (NullPointerException e2) {
            e = e2;
            iofVar.mo105a(e.getMessage());
        } catch (SocketTimeoutException unused) {
            iofVar.mo105a("TIMEOUT");
        } catch (UnknownHostException unused2) {
            iofVar.mo105a("<<Network Error>>");
        } catch (IOException e3) {
            e = e3;
            iofVar.mo105a(e.getMessage());
        } catch (JSONException e4) {
            e = e4;
            iofVar.mo105a(e.getMessage());
        }
    }

    public static void E(HttpURLConnection httpURLConnection, iof iofVar, xnf xnfVar) {
        try {
            try {
                int responseCode = httpURLConnection.getResponseCode();
                boolean z = false;
                InputStream inputStream = responseCode >= 200 && responseCode < 300 ? httpURLConnection.getInputStream() : httpURLConnection.getErrorStream();
                StringBuilder sb = new StringBuilder();
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8));
                while (true) {
                    try {
                        String line = bufferedReader.readLine();
                        if (line == null) {
                            break;
                        } else {
                            sb.append(line);
                        }
                    } catch (Throwable th) {
                        try {
                            bufferedReader.close();
                        } catch (Throwable th2) {
                            th.addSuppressed(th2);
                        }
                        throw th;
                    }
                }
                bufferedReader.close();
                String string = sb.toString();
                if (responseCode >= 200 && responseCode < 300) {
                    z = true;
                }
                if (z) {
                    iofVar.h(mk7.J(string, xnfVar));
                } else {
                    iofVar.mo105a(mk7.I(string));
                }
                httpURLConnection.disconnect();
            } catch (Throwable th3) {
                httpURLConnection.disconnect();
                throw th3;
            }
        } catch (zzabz e2) {
            e = e2;
            iofVar.mo105a(e.getMessage());
            httpURLConnection.disconnect();
        } catch (SocketTimeoutException unused) {
            iofVar.mo105a("TIMEOUT");
            httpURLConnection.disconnect();
        } catch (IOException e3) {
            e = e3;
            iofVar.mo105a(e.getMessage());
            httpURLConnection.disconnect();
        }
    }

    public static void F(cbg cbgVar, BillingResult billingResult, d0g d0gVar, int i, int i2) {
        int i3 = zzcy.zza;
        ((zjf) d0gVar).n(zzcy.zzb(cbgVar, i, billingResult, null, lbg.BROADCAST_ACTION_UNSPECIFIED), i2);
    }

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
    public static final void a(jhc jhcVar, r28 r28Var, c55 c55Var, x12 x12Var, int i) {
        jhc jhcVar2 = jhcVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1354335728);
        int i2 = (i & 6) == 0 ? ((i & 8) == 0 ? p65Var.f(jhcVar2) : p65Var.h(jhcVar2) ? 4 : 2) | i : i;
        if ((i & 48) == 0) {
            i2 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.h(c55Var) ? 256 : 128;
        }
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            Object objM = p65Var.M();
            Object obj = objM;
            if (objM == w12.a) {
                m94 m94Var = new m94();
                m94Var.a = new Object();
                m94Var.b = new ArrayList();
                p65Var.j0(m94Var);
                obj = m94Var;
            }
            m94 m94Var2 = (m94) obj;
            p65Var.j(eo.a);
            String string = ((Context) p65Var.j(eo.b)).getResources().getString(R.string.mc2_snackbar_pane_title);
            Object obj2 = m94Var2.a;
            ArrayList arrayList = m94Var2.b;
            if (g76.L(jhcVar2, obj2)) {
                p65Var.Y(95881138);
                p65Var.p(false);
            } else {
                p65Var.Y(93279711);
                m94Var2.a = jhcVar2;
                ArrayList arrayList2 = new ArrayList(arrayList.size());
                int size = arrayList.size();
                for (int i3 = 0; i3 < size; i3++) {
                    arrayList2.add((jhc) ((k94) arrayList.get(i3)).a);
                }
                ArrayList arrayList3 = new ArrayList(arrayList2);
                if (!arrayList3.contains(jhcVar2)) {
                    arrayList3.add(jhcVar2);
                }
                arrayList.clear();
                ArrayList arrayListA = z27.a(arrayList3);
                int size2 = arrayListA.size();
                int i4 = 0;
                while (i4 < size2) {
                    jhc jhcVar3 = (jhc) arrayListA.get(i4);
                    arrayList.add(new k94(jhcVar3, pxf.E(-1032415134, new g91(jhcVar3, jhcVar2, arrayList3, m94Var2, string, 22), p65Var)));
                    i4++;
                    jhcVar2 = jhcVar;
                }
                p65Var.p(false);
            }
            zk7 zk7VarC = dy0.c(z46.d, false);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            m94Var2.c = w2g.t(p65Var);
            p65Var.Y(-1757732554);
            int size3 = arrayList.size();
            for (int i5 = 0; i5 < size3; i5++) {
                k94 k94Var = (k94) arrayList.get(i5);
                jhc jhcVar4 = (jhc) k94Var.a;
                mz1 mz1Var = k94Var.b;
                p65Var.W(-1515535286, jhcVar4);
                mz1Var.f(pxf.E(2017516783, new l6c(c55Var, 3, jhcVar4), p65Var), p65Var, 6);
                p65Var.p(false);
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i, 4, jhcVar, r28Var, c55Var);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:129:0x01e5  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x01fb  */
    /* JADX WARN: Removed duplicated region for block: B:134:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x00c8  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x00e0  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x00f1  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x00f3  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x00fc  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(defpackage.r28 r27, java.lang.String r28, defpackage.m45 r29, defpackage.c55 r30, defpackage.c09 r31, java.lang.String r32, long r33, long r35, defpackage.x12 r37, final int r38, final int r39) {
        /*
            Method dump skipped, instruction units count: 515
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qk7.b(r28, java.lang.String, m45, c55, c09, java.lang.String, long, long, x12, int, int):void");
    }

    public static final void c(mz1 mz1Var, r28 r28Var, m45 m45Var, mz1 mz1Var2, c09 c09Var, String str, long j, long j2, y3f y3fVar, x12 x12Var, int i) {
        int i2;
        m45 m45Var2;
        mz1 mz1Var3;
        c09 c09Var2;
        String str2;
        long j3;
        y3f y3fVar2;
        p65 p65Var;
        long j4;
        c09 c09VarJ;
        String strR;
        long j5;
        long j6;
        y3f y3fVarB;
        int i3;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1480876036);
        if ((i & 6) == 0) {
            i2 = (p65Var2.h(mz1Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(r28Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            m45Var2 = m45Var;
            i2 |= p65Var2.h(m45Var2) ? 256 : 128;
        } else {
            m45Var2 = m45Var;
        }
        if ((i & 3072) == 0) {
            mz1Var3 = mz1Var2;
            i2 |= p65Var2.h(mz1Var3) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        } else {
            mz1Var3 = mz1Var2;
        }
        if ((i & 24576) == 0) {
            i2 |= 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i2 |= 524288;
        }
        if ((12582912 & i) == 0) {
            i2 |= 4194304;
        }
        if ((100663296 & i) == 0) {
            i2 |= 33554432;
        }
        if (p65Var2.P(i2 & 1, (38347923 & i2) != 38347922)) {
            p65Var2.U();
            if ((i & 1) == 0 || p65Var2.z()) {
                c09VarJ = vn7.J(R.drawable.ic_arrow_left_24, 0, p65Var2);
                strR = vo7.R(p65Var2, R.string.common_back);
                sn3 sn3Var = kt7.b;
                j5 = ((zo7) p65Var2.j(sn3Var)).o;
                j6 = ((zo7) p65Var2.j(sn3Var)).a;
                y3fVarB = rod.b(p65Var2);
                i3 = i2 & (-268427265);
            } else {
                p65Var2.S();
                i3 = i2 & (-268427265);
                c09VarJ = c09Var;
                strR = str;
                j5 = j;
                j6 = j2;
                y3fVarB = y3fVar;
            }
            p65Var2.q();
            long j7 = j6;
            c09 c09Var3 = c09VarJ;
            String str3 = strR;
            long j8 = j5;
            y3f y3fVar3 = y3fVarB;
            a10.a(mz1Var, bgf.N(r28Var, "top_app_bar"), pxf.E(-170631837, new vt7(m45Var2, c09Var3, str3, j8, 1), p65Var2), mz1Var3, 0.0f, y3fVar3, rod.c(j7, 0L, p65Var2, 62), p65Var2, (i3 & 7168) | (i3 & 14) | 384);
            c09Var2 = c09Var3;
            y3fVar2 = y3fVar3;
            p65Var = p65Var2;
            str2 = str3;
            j4 = j7;
            j3 = j8;
        } else {
            p65Var2.S();
            c09Var2 = c09Var;
            str2 = str;
            j3 = j;
            y3fVar2 = y3fVar;
            p65Var = p65Var2;
            j4 = j2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new em(mz1Var, r28Var, m45Var, mz1Var2, c09Var2, str2, j3, j4, y3fVar2, i);
        }
    }

    public static final void d(final mz1 mz1Var, r28 r28Var, final mz1 mz1Var2, c09 c09Var, String str, long j, y3f y3fVar, final uod uodVar, x12 x12Var, final int i) {
        final r28 r28Var2;
        final c09 c09Var2;
        final String str2;
        final long j2;
        final y3f y3fVar2;
        int i2;
        c09 c09Var3;
        String str3;
        long j3;
        y3f y3fVarB;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(357674851);
        int i3 = i | 4792752 | (p65Var.f(uodVar) ? 67108864 : 33554432);
        if (p65Var.P(i3 & 1, (38347923 & i3) != 38347922)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                c09 c09VarJ = vn7.J(R.drawable.ic_arrow_left_24, 0, p65Var);
                String strR = vo7.R(p65Var, R.string.common_back);
                i2 = i3 & (-33546241);
                c09Var3 = c09VarJ;
                str3 = strR;
                j3 = ((zo7) p65Var.j(kt7.b)).a;
                y3fVarB = rod.b(p65Var);
                r28Var3 = o28.b;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
                c09Var3 = c09Var;
                str3 = str;
                y3fVarB = y3fVar;
                i2 = i3 & (-33546241);
                j3 = j;
            }
            p65Var.q();
            r28 r28Var4 = r28Var3;
            y3f y3fVar3 = y3fVarB;
            a10.b(pxf.E(-1854452854, new dd(mz1Var, 10), p65Var), r28Var4, pxf.E(49210824, new wn7(c09Var3, str3), p65Var), mz1Var2, 0.0f, 0.0f, y3fVar3, rod.c(j3, j3, p65Var, 60), uodVar, p65Var, 3510 | (234881024 & i2));
            y3fVar2 = y3fVar3;
            str2 = str3;
            j2 = j3;
            r28Var2 = r28Var4;
            c09Var2 = c09Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            c09Var2 = c09Var;
            str2 = str;
            j2 = j;
            y3fVar2 = y3fVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(r28Var2, mz1Var2, c09Var2, str2, j2, y3fVar2, uodVar, i) { // from class: qt7
                public final /* synthetic */ r28 b;
                public final /* synthetic */ mz1 c;
                public final /* synthetic */ c09 d;
                public final /* synthetic */ String e;
                public final /* synthetic */ long f;
                public final /* synthetic */ y3f g;
                public final /* synthetic */ uod h;

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(3079);
                    qk7.d(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, (x12) obj, iY);
                    return c1e.a;
                }
            };
        }
    }

    public static final void e(final mz1 mz1Var, final r28 r28Var, final m45 m45Var, c55 c55Var, c09 c09Var, String str, long j, y3f y3fVar, final uod uodVar, x12 x12Var, final int i) {
        int i2;
        p65 p65Var;
        final c55 c55Var2;
        final c09 c09Var2;
        final String str2;
        final long j2;
        final y3f y3fVar2;
        c09 c09VarJ;
        String strR;
        long j3;
        c55 c55Var3;
        int i3;
        y3f y3fVarB;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1901944893);
        if ((i & 6) == 0) {
            i2 = (p65Var2.h(mz1Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(r28Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.h(m45Var) ? 256 : 128;
        }
        int i4 = i2 | 3072;
        if ((i & 24576) == 0) {
            i4 = i2 | 11264;
        }
        if ((196608 & i) == 0) {
            i4 |= ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i4 |= 524288;
        }
        if ((12582912 & i) == 0) {
            i4 |= 4194304;
        }
        if ((100663296 & i) == 0) {
            i4 |= p65Var2.f(uodVar) ? 67108864 : 33554432;
        }
        int i5 = 0;
        if (p65Var2.P(i4 & 1, (38347923 & i4) != 38347922)) {
            p65Var2.U();
            if ((i & 1) == 0 || p65Var2.z()) {
                mz1 mz1Var2 = nk7.i;
                c09VarJ = vn7.J(R.drawable.ic_arrow_left_24, 0, p65Var2);
                strR = vo7.R(p65Var2, R.string.common_back);
                j3 = ((zo7) p65Var2.j(kt7.b)).a;
                c55Var3 = mz1Var2;
                i3 = i4 & (-33546241);
                y3fVarB = rod.b(p65Var2);
            } else {
                p65Var2.S();
                i3 = i4 & (-33546241);
                c55Var3 = c55Var;
                c09VarJ = c09Var;
                strR = str;
                j3 = j;
                y3fVarB = y3fVar;
            }
            p65Var2.q();
            long j4 = j3;
            p65Var = p65Var2;
            a10.c(pxf.E(1040505162, new dd(mz1Var, 9), p65Var2), bgf.N(r28Var, "medium_top_app_bar"), pxf.E(805231624, new rt7(m45Var, c09VarJ, strR, i5), p65Var2), c55Var3, 0.0f, 0.0f, y3fVarB, rod.c(j4, j3, p65Var2, 60), uodVar, p65Var, (i3 & 7168) | 390 | (i3 & 234881024));
            c09Var2 = c09VarJ;
            str2 = strR;
            c55Var2 = c55Var3;
            y3fVar2 = y3fVarB;
            j2 = j4;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            c55Var2 = c55Var;
            c09Var2 = c09Var;
            str2 = str;
            j2 = j;
            y3fVar2 = y3fVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: st7
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    qk7.e(mz1Var, r28Var, m45Var, c55Var2, c09Var2, str2, j2, y3fVar2, uodVar, (x12) obj, tr7.y(i | 1));
                    return c1e.a;
                }
            };
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x0116  */
    /* JADX WARN: Removed duplicated region for block: B:103:0x011f  */
    /* JADX WARN: Removed duplicated region for block: B:152:0x0232  */
    /* JADX WARN: Removed duplicated region for block: B:155:0x0245  */
    /* JADX WARN: Removed duplicated region for block: B:157:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0043  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0048  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00c8  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x00cf  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x00e5  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x00f1  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x0107  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x0114  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void f(defpackage.mz1 r20, defpackage.r28 r21, defpackage.m45 r22, defpackage.c55 r23, defpackage.c09 r24, java.lang.String r25, long r26, long r28, defpackage.y3f r30, defpackage.x12 r31, int r32, int r33) {
        /*
            Method dump skipped, instruction units count: 593
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qk7.f(mz1, r28, m45, c55, c09, java.lang.String, long, long, y3f, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x0121  */
    /* JADX WARN: Removed duplicated region for block: B:102:0x0123  */
    /* JADX WARN: Removed duplicated region for block: B:105:0x012c  */
    /* JADX WARN: Removed duplicated region for block: B:154:0x023b  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x0251  */
    /* JADX WARN: Removed duplicated region for block: B:159:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x005c  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0067  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x00dc  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x00f4  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x00fe  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x0114  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void g(defpackage.r28 r28, java.lang.String r29, defpackage.m45 r30, defpackage.c55 r31, defpackage.c09 r32, java.lang.String r33, long r34, long r36, defpackage.y3f r38, defpackage.x12 r39, int r40, int r41) {
        /*
            Method dump skipped, instruction units count: 603
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qk7.g(r28, java.lang.String, m45, c55, c09, java.lang.String, long, long, y3f, x12, int, int):void");
    }

    public static final void h(final ml9 ml9Var, final ek8 ek8Var, x12 x12Var, int i) {
        String str = ml9Var.g;
        String str2 = ml9Var.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1489839928);
        int i2 = (p65Var.f(ml9Var) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            String str3 = ml9Var.e;
            boolean z = ml9Var.a;
            kx kxVarW = ho2.w(p65Var, -1512049906);
            String strQ = vo7.Q(R.string.notification_type_post_recommended, new Object[]{str2, str}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, str2, 0, false, 6);
                kxVarW.b(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ, str2.length() + iZ);
                int iZ2 = muc.Z(strQ, str, 0, false, 6);
                mx mxVarC = ka1.c(str, iZ2, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ2);
                p65Var.p(false);
                long j = ml9Var.b;
                Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_clap);
                int i3 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i4 = i2 & 14;
                boolean z2 = (i3 == 32) | (i4 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    objM = new m45() { // from class: nl9
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i5 = i;
                            c1e c1eVar = c1e.a;
                            ml9 ml9Var2 = ml9Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i5) {
                                case 0:
                                    ek8Var2.j(ml9Var2.f, ml9Var2.h);
                                    break;
                                default:
                                    ek8Var2.k(ml9Var2.c, ml9Var2.h);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                int i5 = (i3 == 32 ? 1 : 0) | (i4 == 4 ? 1 : 0);
                Object objM2 = p65Var.M();
                if (i5 != 0 || objM2 == uobVar) {
                    final int i6 = 1;
                    objM2 = new m45() { // from class: nl9
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i52 = i6;
                            c1e c1eVar = c1e.a;
                            ml9 ml9Var2 = ml9Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i52) {
                                case 0:
                                    ek8Var2.j(ml9Var2.f, ml9Var2.h);
                                    break;
                                default:
                                    ek8Var2.k(ml9Var2.c, ml9Var2.h);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.f(z, str3, numValueOf, mxVarC, j, 0, m45Var, (m45) objM2, p65Var, 0, 32);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(ml9Var, ek8Var, i, 9);
        }
    }

    public static final void i(String str, int i, ula ulaVar, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        boolean z;
        o28 o28Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-365995145);
        int i3 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.d(i) ? 32 : 16) | (p65Var.f(ulaVar) ? 256 : 128) | 3072;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i4 = (int) ((j >>> 32) ^ j);
            i89 i89VarL = p65Var.l();
            o28 o28Var2 = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var2);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            boolean z2 = str == null || muc.b0(str);
            if (i == 0) {
                p65Var.Y(-63259771);
                p65Var.p(false);
            } else if (ulaVar instanceof tla) {
                p65Var.Y(-63256911);
                tp7.c(0.0f, 0, 7, 0L, p65Var, null);
                p65Var.p(false);
            } else if (z2) {
                p65Var.Y(-63253816);
                tp7.c(0.0f, 6, 6, 0L, p65Var, w2g.G(o28Var2, 24.0f, 0.0f, 24.0f, 0.0f, 10));
                p65Var.p(false);
            } else {
                p65Var.Y(-63255582);
                tp7.c(10.0f, 384, 3, 0L, p65Var, null);
                p65Var.p(false);
            }
            if (z2) {
                z = false;
                o28Var = o28Var2;
                p65Var.Y(-1967707359);
            } else {
                p65Var.Y(-1960744015);
                o28Var = o28Var2;
                jjd.b(str, bgf.N(w2g.G(o28Var2, 24.0f, 24.0f, 24.0f, 0.0f, 8), "section_title"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).j, p65Var, (i3 & 14) | 48, 0, 131068);
                p65Var = p65Var;
                z = false;
            }
            p65Var.p(z);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(str, i, ulaVar, r28Var2, i2);
        }
    }

    public static final void j(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1348513006);
        int i2 = i | 6;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            r28Var = o28.b;
            r28 r28VarV = m40.V(r28Var, p65Var, 6);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarV);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(-789892714);
            float fZ = ((m73) p65Var.j(z22.h)).z(((bu7) p65Var.j(jt7.c)).j.b.c);
            p65Var.p(false);
            dy0.a(w2g.G(jfc.e(jfc.d(r28Var, 0.5f), fZ), 24.0f, 24.0f, 24.0f, 0.0f, 8), p65Var, 0);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i, 15);
        }
    }

    public static final void k(ohc ohcVar, r28 r28Var, c55 c55Var, x12 x12Var, int i, int i2) {
        int i3;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1351125615);
        if ((i & 6) == 0) {
            i3 = (p65Var.f(ohcVar) ? 4 : 2) | i;
        } else {
            i3 = i;
        }
        int i4 = i3 | 48;
        int i5 = i2 & 4;
        if (i5 != 0) {
            i4 = i3 | 432;
        } else if ((i & 384) == 0) {
            i4 |= p65Var.h(c55Var) ? 256 : 128;
        }
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            if (i5 != 0) {
                c55Var = nk7.j;
            }
            jhc jhcVar = (jhc) ohcVar.b.getValue();
            s4 s4Var = (s4) p65Var.j(z22.a);
            boolean zH = p65Var.h(jhcVar) | p65Var.h(s4Var);
            Object objM = p65Var.M();
            if (zH || objM == w12.a) {
                objM = new eub(jhcVar, s4Var, null, 18);
                p65Var.j0(objM);
            }
            kyd.k(p65Var, (b55) objM, jhcVar);
            jhc jhcVar2 = (jhc) ohcVar.b.getValue();
            int i6 = i4 & PhotoshopDirectory.TAG_CAPTION;
            o28 o28Var = o28.b;
            a(jhcVar2, o28Var, c55Var, p65Var, i6);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        c55 c55Var2 = c55Var;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new oc0(ohcVar, r28Var2, c55Var2, i, i2, 13);
        }
    }

    public static final void l(i8d i8dVar, x45 x45Var, x12 x12Var, int i) {
        float f2;
        mkd mkdVarA;
        i8dVar.getClass();
        String str = i8dVar.b;
        x45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1198100009);
        int i2 = (p65Var.f(i8dVar) ? 4 : 2) | i | (p65Var.h(x45Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            int i3 = i8dVar.c;
            if (i3 != 0) {
                f2 = i3 != 1 ? 56.0f : 40.0f;
            } else {
                f2 = 24.0f;
            }
            if (i3 == 0) {
                p65Var.Y(-322863584);
                mkdVarA = rz5.D(p65Var).j;
                p65Var.p(false);
            } else if (i3 != 1) {
                p65Var.Y(-322860150);
                mkdVarA = mkd.a(rz5.D(p65Var).l, rz5.A(p65Var).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
                p65Var.p(false);
            } else {
                p65Var.Y(-322862080);
                mkdVarA = rz5.D(p65Var).j;
                p65Var.p(false);
            }
            mkd mkdVar = mkdVarA;
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.f(o28Var, 48.0f, 0.0f, 2), 1.0f);
            String strQ = vo7.Q(R.string.tag_directory_cd_see_tag, new Object[]{str}, p65Var);
            vkb vkbVar = new vkb(0);
            int i4 = 14;
            boolean z = ((i2 & 14) == 4) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new nbb(x45Var, i4, i8dVar);
                p65Var.j0(objM);
            }
            r28 r28VarN = bgf.N(hlg.r(r28VarD, false, strQ, vkbVar, (m45) objM, 9), "tag");
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j = p65Var.T;
            int i5 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            jjd.b(str, km4.u(1.0f, w2g.G(o28Var, f2, 0.0f, 0.0f, 0.0f, 14), true), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar, p65Var, 0, 0, 131068);
            p65Var = p65Var;
            qv5.b(vn7.J(R.drawable.ic_chevron_forward, 0, p65Var), null, jfc.l(w2g.F(o28Var, 24.0f, 12.0f, 16.0f, 12.0f), 24.0f), rz5.A(p65Var).o, p65Var, 440, 0);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(i8dVar, x45Var, i, 9);
        }
    }

    public static final void m(nec necVar, rb9 rb9Var, long j) {
        f33 f33Var = (f33) necVar.b;
        tre treVar = (tre) f33Var.c;
        tre treVar2 = (tre) f33Var.b;
        boolean zV = mq7.v(rb9Var);
        long j2 = rb9Var.b;
        if (zV) {
            qt2[] qt2VarArr = treVar2.d;
            k80.o0(0, qt2VarArr.length, null, qt2VarArr);
            treVar2.e = 0;
            qt2[] qt2VarArr2 = treVar.d;
            k80.o0(0, qt2VarArr2.length, null, qt2VarArr2);
            treVar.e = 0;
            f33Var.a = 0L;
        }
        if (!mq7.x(rb9Var)) {
            List list = rb9Var.m;
            if (list == null) {
                list = ey3.a;
            }
            int i = 0;
            for (int size = list.size(); i < size; size = size) {
                un5 un5Var = (un5) list.get(i);
                f33Var.a(un5Var.a, ip8.e(un5Var.e, j));
                i++;
            }
            f33Var.a(j2, ip8.e(rb9Var.n, j));
        }
        if (mq7.x(rb9Var) && j2 - f33Var.a > 40) {
            qt2[] qt2VarArr3 = treVar2.d;
            k80.o0(0, qt2VarArr3.length, null, qt2VarArr3);
            treVar2.e = 0;
            qt2[] qt2VarArr4 = treVar.d;
            k80.o0(0, qt2VarArr4.length, null, qt2VarArr4);
            treVar.e = 0;
            f33Var.a = 0L;
        }
        f33Var.a = j2;
    }

    public static void n(String str) {
        if (str.length() <= 10000) {
            return;
        }
        ay0.f("Number string too large: ", str.substring(0, 30), "...");
    }

    public static final float o(float[] fArr, float[] fArr2) {
        int length = fArr.length;
        float f2 = 0.0f;
        for (int i = 0; i < length; i++) {
            f2 += fArr[i] * fArr2[i];
        }
        return f2;
    }

    public static final float p(gz8 gz8Var) {
        return gz8Var.n().e == hw8.Horizontal ? Float.intBitsToFloat((int) (gz8Var.r() >> 32)) : Float.intBitsToFloat((int) (gz8Var.r() & 4294967295L));
    }

    public static final void q(anb anbVar, String str) {
        anbVar.getClass();
        gnb gnbVarB0 = anbVar.B0(str);
        try {
            gnbVarB0.w0();
            xz5.F(gnbVarB0, null);
        } finally {
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final mn6 r(mn6 mn6Var) {
        mn6Var.getClass();
        if (mn6Var instanceof qxd) {
            return ((qxd) mn6Var).w();
        }
        return null;
    }

    public static final Object s(txb txbVar, iyb iybVar) {
        Object objG = txbVar.a.g(iybVar);
        if (objG == null) {
            return null;
        }
        return objG;
    }

    public static final o3e t(o3e o3eVar, mn6 mn6Var) {
        o3eVar.getClass();
        mn6Var.getClass();
        return B(o3eVar, r(mn6Var));
    }

    public static final boolean u(float[] fArr) {
        return fArr.length >= 16 && fArr[0] == 1.0f && fArr[1] == 0.0f && fArr[2] == 0.0f && fArr[3] == 0.0f && fArr[4] == 0.0f && fArr[5] == 1.0f && fArr[6] == 0.0f && fArr[7] == 0.0f && fArr[8] == 0.0f && fArr[9] == 0.0f && fArr[10] == 1.0f && fArr[11] == 0.0f && fArr[12] == 0.0f && fArr[13] == 0.0f && fArr[14] == 0.0f && fArr[15] == 1.0f;
    }

    public static final boolean v(gz8 gz8Var, float f2) {
        gz8Var.n().getClass();
        return !(((gz8Var.s() ? -f2 : p(gz8Var)) > 0.0f ? 1 : ((gz8Var.s() ? -f2 : p(gz8Var)) == 0.0f ? 0 : -1)) > 0);
    }

    public static BigDecimal w(String str) {
        n(str);
        BigDecimal bigDecimal = new BigDecimal(str);
        if (Math.abs(bigDecimal.scale()) < 10000) {
            return bigDecimal;
        }
        throw new NumberFormatException("Number has unsupported scale: ".concat(str));
    }

    public static final void x(float[] fArr, float[] fArr2, int i, float[] fArr3) {
        if (i == 0) {
            b26.a("At least one point must be provided");
        }
        int i2 = 2 >= i ? i - 1 : 2;
        int i3 = i2 + 1;
        float[][] fArr4 = new float[i3][];
        for (int i4 = 0; i4 < i3; i4++) {
            fArr4[i4] = new float[i];
        }
        for (int i5 = 0; i5 < i; i5++) {
            fArr4[0][i5] = 1.0f;
            for (int i6 = 1; i6 < i3; i6++) {
                fArr4[i6][i5] = fArr4[i6 - 1][i5] * fArr[i5];
            }
        }
        float[][] fArr5 = new float[i3][];
        for (int i7 = 0; i7 < i3; i7++) {
            fArr5[i7] = new float[i];
        }
        float[][] fArr6 = new float[i3][];
        for (int i8 = 0; i8 < i3; i8++) {
            fArr6[i8] = new float[i3];
        }
        int i9 = 0;
        while (i9 < i3) {
            float[] fArr7 = fArr5[i9];
            float[] fArr8 = fArr4[i9];
            fArr8.getClass();
            fArr7.getClass();
            System.arraycopy(fArr8, 0, fArr7, 0, i);
            for (int i10 = 0; i10 < i9; i10++) {
                float[] fArr9 = fArr5[i10];
                float fO = o(fArr7, fArr9);
                for (int i11 = 0; i11 < i; i11++) {
                    fArr7[i11] = fArr7[i11] - (fArr9[i11] * fO);
                }
            }
            float fSqrt = (float) Math.sqrt(o(fArr7, fArr7));
            if (fSqrt < 1.0E-6f) {
                fSqrt = 1.0E-6f;
            }
            float f2 = 1.0f / fSqrt;
            for (int i12 = 0; i12 < i; i12++) {
                fArr7[i12] = fArr7[i12] * f2;
            }
            float[] fArr10 = fArr6[i9];
            int i13 = 0;
            while (i13 < i3) {
                fArr10[i13] = i13 < i9 ? 0.0f : o(fArr7, fArr4[i13]);
                i13++;
            }
            i9++;
        }
        for (int i14 = i2; -1 < i14; i14--) {
            float fO2 = o(fArr5[i14], fArr2);
            float[] fArr11 = fArr6[i14];
            int i15 = i14 + 1;
            if (i15 <= i2) {
                int i16 = i2;
                while (true) {
                    fO2 -= fArr11[i16] * fArr3[i16];
                    if (i16 != i15) {
                        i16--;
                    }
                }
            }
            fArr3[i14] = fO2 / fArr11[i14];
        }
    }

    public static final String y(Reader reader) throws IOException {
        StringWriter stringWriter = new StringWriter();
        char[] cArr = new char[8192];
        int i = reader.read(cArr);
        while (i >= 0) {
            stringWriter.write(cArr, 0, i);
            i = reader.read(cArr);
        }
        String string = stringWriter.toString();
        string.getClass();
        return string;
    }

    public static final void z(int i, String str) {
        throw new SQLException(b09.w(i, "Error code: ") + ", message: ".concat(str));
    }
}
