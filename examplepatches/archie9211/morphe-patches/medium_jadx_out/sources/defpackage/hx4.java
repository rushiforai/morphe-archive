package defpackage;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.os.Bundle;
import android.provider.Settings;
import android.util.Log;
import android.view.View;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.medium.android.common.api.Medium2Error;
import gen.model.SourceParameter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hx4 implements cs1, bn1, hvc, nvc, ru2, i41, y51, bo1 {
    public final /* synthetic */ int a;
    public Object b;
    public Object c;

    public hx4(iy6 iy6Var, vue vueVar) {
        this.a = 14;
        this.b = iy6Var;
        vueVar.getClass();
        og2 og2Var = og2.b;
        og2Var.getClass();
        o2b o2bVar = new o2b(vueVar, q57.d, og2Var);
        wg6 wg6VarB = n1b.a.b(q57.class);
        String strD = wg6VarB.d();
        if (strD != null) {
            this.c = (q57) o2bVar.o(wg6VarB, "androidx.lifecycle.ViewModelProvider.DefaultKey:".concat(strD));
        } else {
            ay0.e("Local and anonymous classes can not be ViewModels");
            throw null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x003a A[Catch: IOException -> 0x006d, TryCatch #0 {IOException -> 0x006d, blocks: (B:2:0x0000, B:3:0x000a, B:5:0x000d, B:7:0x001e, B:9:0x0026, B:21:0x0042, B:19:0x003a, B:20:0x003d, B:23:0x0047, B:24:0x004a, B:25:0x005b), top: B:30:0x0000 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.hx4 d1(java.lang.String... r12) {
        /*
            int r0 = r12.length     // Catch: java.io.IOException -> L6d
            h21[] r0 = new defpackage.h21[r0]     // Catch: java.io.IOException -> L6d
            kz0 r1 = new kz0     // Catch: java.io.IOException -> L6d
            r1.<init>()     // Catch: java.io.IOException -> L6d
            r2 = 0
            r3 = r2
        La:
            int r4 = r12.length     // Catch: java.io.IOException -> L6d
            if (r3 >= r4) goto L5b
            r4 = r12[r3]     // Catch: java.io.IOException -> L6d
            java.lang.String[] r5 = defpackage.id6.e     // Catch: java.io.IOException -> L6d
            r6 = 34
            r1.K0(r6)     // Catch: java.io.IOException -> L6d
            int r7 = r4.length()     // Catch: java.io.IOException -> L6d
            r8 = r2
            r9 = r8
        L1c:
            if (r8 >= r7) goto L45
            char r10 = r4.charAt(r8)     // Catch: java.io.IOException -> L6d
            r11 = 128(0x80, float:1.8E-43)
            if (r10 >= r11) goto L2b
            r10 = r5[r10]     // Catch: java.io.IOException -> L6d
            if (r10 != 0) goto L38
            goto L42
        L2b:
            r11 = 8232(0x2028, float:1.1535E-41)
            if (r10 != r11) goto L32
            java.lang.String r10 = "\\u2028"
            goto L38
        L32:
            r11 = 8233(0x2029, float:1.1537E-41)
            if (r10 != r11) goto L42
            java.lang.String r10 = "\\u2029"
        L38:
            if (r9 >= r8) goto L3d
            r1.Q0(r9, r8, r4)     // Catch: java.io.IOException -> L6d
        L3d:
            r1.R0(r10)     // Catch: java.io.IOException -> L6d
            int r9 = r8 + 1
        L42:
            int r8 = r8 + 1
            goto L1c
        L45:
            if (r9 >= r7) goto L4a
            r1.Q0(r9, r7, r4)     // Catch: java.io.IOException -> L6d
        L4a:
            r1.K0(r6)     // Catch: java.io.IOException -> L6d
            r1.readByte()     // Catch: java.io.IOException -> L6d
            long r4 = r1.b     // Catch: java.io.IOException -> L6d
            h21 r4 = r1.r(r4)     // Catch: java.io.IOException -> L6d
            r0[r3] = r4     // Catch: java.io.IOException -> L6d
            int r3 = r3 + 1
            goto La
        L5b:
            hx4 r1 = new hx4     // Catch: java.io.IOException -> L6d
            java.lang.Object r12 = r12.clone()     // Catch: java.io.IOException -> L6d
            java.lang.String[] r12 = (java.lang.String[]) r12     // Catch: java.io.IOException -> L6d
            dw8 r0 = defpackage.mq7.E(r0)     // Catch: java.io.IOException -> L6d
            r2 = 10
            r1.<init>(r12, r2, r0)     // Catch: java.io.IOException -> L6d
            return r1
        L6d:
            r12 = move-exception
            defpackage.ay0.d(r12)
            r12 = 0
            return r12
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hx4.d1(java.lang.String[]):hx4");
    }

    public static void g(List list, String str, String str2, olb olbVar) {
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            sx1 sx1Var = (sx1) it2.next();
            if (sx1Var instanceof nx1) {
                ((ArrayList) olbVar.b).add(sx1Var);
            } else {
                if (!(sx1Var instanceof ox1)) {
                    ygf.a();
                    return;
                }
                ox1 ox1Var = (ox1) sx1Var;
                if (bu1.p0(ox1Var.b, str2) || ox1Var.a.equals(str)) {
                    g(ox1Var.c, str, str2, olbVar);
                }
            }
        }
    }

    @Override // defpackage.cs1
    public void A(SourceParameter sourceParameter, String str, boolean z) {
        throw ho2.J(sourceParameter, str, "Mute a publication is not supported.");
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.bo1
    public xwd A0(tvd tvdVar, int i) {
        tvdVar.getClass();
        if (tvdVar instanceof jec) {
            return k40.Z((qn6) tvdVar, i);
        }
        if (tvdVar instanceof e70) {
            E e = ((e70) tvdVar).get(i);
            e.getClass();
            return (xwd) e;
        }
        StringBuilder sb = new StringBuilder("unknown type argument list type: ");
        sb.append(tvdVar);
        lg8.q(sb, n1b.a.b(tvdVar.getClass()));
        return null;
    }

    @Override // defpackage.cs1
    public void B(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        sx4 sx4Var = (sx4) this.c;
        n92 n92Var = null;
        if (z) {
            vx0.c0(f76.F(sx4Var), null, null, new qx4(sx4Var, str, sourceParameter, n92Var, 0), 3);
        } else {
            vx0.c0(f76.F(sx4Var), null, null, new qx4(sx4Var, str, sourceParameter, n92Var, 1), 3);
        }
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
    public /* bridge */ xwd C0(qn6 qn6Var, int i) {
        return k40.Z(qn6Var, i);
    }

    @Override // defpackage.bo1
    public xwd D(hkb hkbVar, int i) {
        if (i < 0 || i >= k40.F(hkbVar)) {
            return null;
        }
        return k40.Z(hkbVar, i);
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

    public void E0(j15 j15Var, boolean z) {
        f25 f25Var = (f25) this.c;
        j15 j15Var2 = f25Var.x;
        if (j15Var2 != null) {
            j15Var2.m().n.E0(j15Var, true);
        }
        for (s15 s15Var : (CopyOnWriteArrayList) this.b) {
            if (z) {
                s15Var.getClass();
            }
            s15Var.a.onFragmentPaused(f25Var, j15Var);
        }
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

    public void K0(j15 j15Var, boolean z) {
        f25 f25Var = (f25) this.c;
        Context context = f25Var.v.w;
        j15 j15Var2 = f25Var.x;
        if (j15Var2 != null) {
            j15Var2.m().n.K0(j15Var, true);
        }
        for (s15 s15Var : (CopyOnWriteArrayList) this.b) {
            if (z) {
                s15Var.getClass();
            }
            s15Var.a.onFragmentPreAttached(f25Var, j15Var, context);
        }
    }

    @Override // defpackage.bo1
    public /* bridge */ zvd L(hkb hkbVar) {
        return k40.S0(hkbVar);
    }

    public void L0(j15 j15Var, Bundle bundle, boolean z) {
        f25 f25Var = (f25) this.c;
        j15 j15Var2 = f25Var.x;
        if (j15Var2 != null) {
            j15Var2.m().n.L0(j15Var, bundle, true);
        }
        for (s15 s15Var : (CopyOnWriteArrayList) this.b) {
            if (z) {
                s15Var.getClass();
            }
            s15Var.a.onFragmentPreCreated(f25Var, j15Var, bundle);
        }
    }

    @Override // defpackage.bo1
    public /* bridge */ i61 M(p61 p61Var) {
        return k40.Q(p61Var);
    }

    public void M0(j15 j15Var, boolean z) {
        f25 f25Var = (f25) this.c;
        j15 j15Var2 = f25Var.x;
        if (j15Var2 != null) {
            j15Var2.m().n.M0(j15Var, true);
        }
        for (s15 s15Var : (CopyOnWriteArrayList) this.b) {
            if (z) {
                s15Var.getClass();
            }
            s15Var.a.onFragmentResumed(f25Var, j15Var);
        }
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

    public void O0(j15 j15Var, Bundle bundle, boolean z) {
        f25 f25Var = (f25) this.c;
        j15 j15Var2 = f25Var.x;
        if (j15Var2 != null) {
            j15Var2.m().n.O0(j15Var, bundle, true);
        }
        for (s15 s15Var : (CopyOnWriteArrayList) this.b) {
            if (z) {
                s15Var.getClass();
            }
            s15Var.a.onFragmentSaveInstanceState(f25Var, j15Var, bundle);
        }
    }

    @Override // defpackage.bo1
    public boolean P(hkb hkbVar) {
        hkbVar.getClass();
        return k40.I(hkbVar) != null;
    }

    public void P0(j15 j15Var, boolean z) {
        f25 f25Var = (f25) this.c;
        j15 j15Var2 = f25Var.x;
        if (j15Var2 != null) {
            j15Var2.m().n.P0(j15Var, true);
        }
        for (s15 s15Var : (CopyOnWriteArrayList) this.b) {
            if (z) {
                s15Var.getClass();
            }
            s15Var.a.onFragmentStarted(f25Var, j15Var);
        }
    }

    @Override // defpackage.hvc
    public boolean Q() {
        l69 l69Var;
        gq6 gq6VarW0 = W0();
        if (gq6VarW0 == null || (l69Var = gq6VarW0.f) == null) {
            return true;
        }
        return l69Var.c();
    }

    public void Q0(j15 j15Var, boolean z) {
        f25 f25Var = (f25) this.c;
        j15 j15Var2 = f25Var.x;
        if (j15Var2 != null) {
            j15Var2.m().n.Q0(j15Var, true);
        }
        for (s15 s15Var : (CopyOnWriteArrayList) this.b) {
            if (z) {
                s15Var.getClass();
            }
            s15Var.a.onFragmentStopped(f25Var, j15Var);
        }
    }

    @Override // defpackage.bo1
    public /* bridge */ pxd R(xwd xwdVar) {
        return k40.h0(xwdVar);
    }

    public void R0(j15 j15Var, View view, Bundle bundle, boolean z) {
        f25 f25Var = (f25) this.c;
        j15 j15Var2 = f25Var.x;
        if (j15Var2 != null) {
            j15Var2.m().n.R0(j15Var, view, bundle, true);
        }
        for (s15 s15Var : (CopyOnWriteArrayList) this.b) {
            if (z) {
                s15Var.getClass();
            }
            s15Var.a.onFragmentViewCreated(f25Var, j15Var, view, bundle);
        }
    }

    @Override // defpackage.bo1
    public boolean S(hkb hkbVar) {
        return k40.s0(k40.S0(hkbVar));
    }

    public void S0(j15 j15Var, boolean z) {
        f25 f25Var = (f25) this.c;
        j15 j15Var2 = f25Var.x;
        if (j15Var2 != null) {
            j15Var2.m().n.S0(j15Var, true);
        }
        for (s15 s15Var : (CopyOnWriteArrayList) this.b) {
            if (z) {
                s15Var.getClass();
            }
            s15Var.a.onFragmentViewDestroyed(f25Var, j15Var);
        }
    }

    public void T(j15 j15Var, boolean z) {
        f25 f25Var = (f25) this.c;
        Context context = f25Var.v.w;
        j15 j15Var2 = f25Var.x;
        if (j15Var2 != null) {
            j15Var2.m().n.T(j15Var, true);
        }
        for (s15 s15Var : (CopyOnWriteArrayList) this.b) {
            if (z) {
                s15Var.getClass();
            }
            s15Var.a.onFragmentAttached(f25Var, j15Var, context);
        }
    }

    public void T0(String str, PrintWriter printWriter) {
        q57 q57Var = (q57) this.c;
        if (q57Var.b.e() > 0) {
            printWriter.print(str);
            printWriter.println("Loaders:");
            String strConcat = str.concat("    ");
            for (int i = 0; i < q57Var.b.e(); i++) {
                o57 o57Var = (o57) q57Var.b.g(i);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(q57Var.b.c(i));
                printWriter.print(": ");
                printWriter.println(o57Var.toString());
                printWriter.print(strConcat);
                printWriter.print("mId=");
                printWriter.print(0);
                printWriter.print(" mArgs=");
                printWriter.println((Object) null);
                printWriter.print(strConcat);
                printWriter.print("mLoader=");
                printWriter.println(o57Var.l);
                gkf gkfVar = o57Var.l;
                String strConcat2 = strConcat.concat("  ");
                gkfVar.getClass();
                printWriter.print(strConcat2);
                printWriter.print("mId=");
                printWriter.print(0);
                printWriter.print(" mListener=");
                printWriter.println(gkfVar.a);
                if (gkfVar.b || gkfVar.e) {
                    printWriter.print(strConcat2);
                    printWriter.print("mStarted=");
                    printWriter.print(gkfVar.b);
                    printWriter.print(" mContentChanged=");
                    printWriter.print(gkfVar.e);
                    printWriter.print(" mProcessingChange=");
                    printWriter.println(false);
                }
                if (gkfVar.c || gkfVar.d) {
                    printWriter.print(strConcat2);
                    printWriter.print("mAbandoned=");
                    printWriter.print(gkfVar.c);
                    printWriter.print(" mReset=");
                    printWriter.println(gkfVar.d);
                }
                if (gkfVar.g != null) {
                    printWriter.print(strConcat2);
                    printWriter.print("mTask=");
                    printWriter.print(gkfVar.g);
                    printWriter.print(" waiting=");
                    gkfVar.g.getClass();
                    printWriter.println(false);
                }
                if (gkfVar.h != null) {
                    printWriter.print(strConcat2);
                    printWriter.print("mCancellingTask=");
                    printWriter.print(gkfVar.h);
                    printWriter.print(" waiting=");
                    gkfVar.h.getClass();
                    printWriter.println(false);
                }
                if (o57Var.n != null) {
                    printWriter.print(strConcat);
                    printWriter.print("mCallbacks=");
                    printWriter.println(o57Var.n);
                    p57 p57Var = o57Var.n;
                    String strConcat3 = strConcat.concat("  ");
                    p57Var.getClass();
                    printWriter.print(strConcat3);
                    printWriter.print("mDeliveredData=");
                    printWriter.println(p57Var.b);
                }
                printWriter.print(strConcat);
                printWriter.print("mData=");
                gkf gkfVar2 = o57Var.l;
                Object obj = o57Var.e;
                Object obj2 = obj != g57.k ? obj : null;
                gkfVar2.getClass();
                StringBuilder sb = new StringBuilder(64);
                if (obj2 == null) {
                    sb.append("null");
                } else {
                    Class<?> cls = obj2.getClass();
                    sb.append(cls.getSimpleName());
                    sb.append("{");
                    sb.append(Integer.toHexString(System.identityHashCode(cls)));
                    sb.append("}");
                }
                printWriter.println(sb.toString());
                printWriter.print(strConcat);
                printWriter.print("mStarted=");
                printWriter.println(o57Var.c > 0);
            }
        }
    }

    @Override // defpackage.bo1
    public /* bridge */ p61 U(hec hecVar) {
        return k40.H(this, hecVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x003e  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0046  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.google.android.datatransport.cct.CctBackendFactory U0(java.lang.String r14) {
        /*
            Method dump skipped, instruction units count: 269
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hx4.U0(java.lang.String):com.google.android.datatransport.cct.CctBackendFactory");
    }

    @Override // defpackage.bo1
    public /* bridge */ ao1 V(hkb hkbVar) {
        return k40.P0(this, hkbVar);
    }

    public File V0() {
        if (((File) this.b) == null) {
            synchronized (this) {
                try {
                    if (((File) this.b) == null) {
                        String str = "PersistedInstallation." + ((xj4) this.c).f() + ".json";
                        xj4 xj4Var = (xj4) this.c;
                        xj4Var.a();
                        File file = new File(xj4Var.a.getNoBackupFilesDir(), str);
                        this.b = file;
                        if (file.exists()) {
                            return (File) this.b;
                        }
                        xj4 xj4Var2 = (xj4) this.c;
                        xj4Var2.a();
                        File file2 = new File(xj4Var2.a.getFilesDir(), str);
                        if (file2.exists() && !file2.renameTo((File) this.b)) {
                            Log.e("PersistedInstallation", "Unable to move the file from back up to non back up directory", new IOException("Unable to move the file from back up to non back up directory"));
                            return file2;
                        }
                    }
                } finally {
                }
            }
        }
        return (File) this.b;
    }

    @Override // defpackage.bo1
    public /* bridge */ Collection W(hkb hkbVar) {
        return k40.H0(this, hkbVar);
    }

    public gq6 W0() {
        nq6 nq6Var = (nq6) this.b;
        aq6 aq6Var = (aq6) nq6Var.j.g(this.c);
        if (aq6Var != null) {
            return (gq6) nq6Var.f.g(aq6Var);
        }
        return null;
    }

    @Override // defpackage.bo1
    public o3e X(qn6 qn6Var) {
        return k40.F0(qn6Var);
    }

    public void X0(zj0 zj0Var) {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("Fid", zj0Var.a);
            jSONObject.put("Status", zj0Var.b.ordinal());
            jSONObject.put("AuthToken", zj0Var.c);
            jSONObject.put("RefreshToken", zj0Var.d);
            jSONObject.put("TokenCreationEpochInSecs", zj0Var.f);
            jSONObject.put("ExpiresInSecs", zj0Var.e);
            jSONObject.put("FisError", zj0Var.g);
            xj4 xj4Var = (xj4) this.c;
            xj4Var.a();
            File fileCreateTempFile = File.createTempFile("PersistedInstallation", "tmp", xj4Var.a.getFilesDir());
            FileOutputStream fileOutputStream = new FileOutputStream(fileCreateTempFile);
            fileOutputStream.write(jSONObject.toString().getBytes("UTF-8"));
            fileOutputStream.close();
            if (fileCreateTempFile.renameTo(V0())) {
            } else {
                throw new IOException("unable to rename the tmpfile to PersistedInstallation");
            }
        } catch (IOException | JSONException unused) {
        }
    }

    @Override // defpackage.bo1
    public /* bridge */ o3e Y(xwd xwdVar) {
        return k40.f0(this, xwdVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0060, code lost:
    
        if (r6 == r1) goto L24;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object Y0(defpackage.p92 r7) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof defpackage.n95
            if (r0 == 0) goto L13
            r0 = r7
            n95 r0 = (defpackage.n95) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            n95 r0 = new n95
            r0.<init>(r6, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 2
            r5 = 1
            if (r2 == 0) goto L39
            if (r2 == r5) goto L35
            if (r2 != r4) goto L2f
            defpackage.br7.v(r7)
            bjb r7 = (defpackage.bjb) r7
            java.lang.Object r6 = r7.a
            goto L63
        L2f:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r3
        L35:
            defpackage.br7.v(r7)
            goto L4e
        L39:
            defpackage.br7.v(r7)
            java.lang.Object r7 = r6.b
            mya r7 = (defpackage.mya) r7
            r2 = 6
            to4 r7 = defpackage.mya.w(r7, r3, r2)
            r0.d = r5
            java.lang.Object r7 = defpackage.dm2.C(r7, r0)
            if (r7 != r1) goto L4e
            goto L62
        L4e:
            rj2 r7 = (defpackage.rj2) r7
            if (r7 == 0) goto L53
            return r7
        L53:
            java.lang.Object r6 = r6.c
            og3 r6 = (defpackage.og3) r6
            r0.d = r4
            yd4 r7 = defpackage.yd4.NetworkOnly
            r2 = 0
            java.lang.Object r6 = r6.a(r7, r2, r0)
            if (r6 != r1) goto L63
        L62:
            return r1
        L63:
            java.lang.Throwable r7 = defpackage.bjb.b(r6)
            if (r7 != 0) goto L6c
            rj2 r6 = (defpackage.rj2) r6
            return r6
        L6c:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hx4.Y0(p92):java.lang.Object");
    }

    @Override // defpackage.bo1
    public /* bridge */ void Z(hkb hkbVar) {
        k40.B0(hkbVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object Z0(java.lang.String r6, java.lang.String r7, defpackage.p92 r8) {
        /*
            r5 = this;
            boolean r0 = r8 instanceof defpackage.ea5
            if (r0 == 0) goto L13
            r0 = r8
            ea5 r0 = (defpackage.ea5) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ea5 r0 = new ea5
            r0.<init>(r5, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L2e
            if (r2 != r3) goto L28
            defpackage.br7.v(r8)
            goto L3f
        L28:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r4
        L2e:
            defpackage.br7.v(r8)
            ga5 r8 = new ga5
            r8.<init>(r5, r6, r7, r4)
            r0.d = r3
            java.lang.Object r8 = defpackage.o7f.s(r8, r0)
            if (r8 != r1) goto L3f
            return r1
        L3f:
            bjb r8 = (defpackage.bjb) r8
            java.lang.Object r5 = r8.a
            boolean r6 = r5 instanceof defpackage.ajb
            r7 = 0
            if (r6 != 0) goto L54
            r6 = r5
            yf9 r6 = (defpackage.yf9) r6
            uld r6 = defpackage.wld.a
            java.lang.Object[] r8 = new java.lang.Object[r7]
            java.lang.String r0 = "Get post featuring data successful"
            defpackage.km4.I(r6, r4, r0, r8, r0)
        L54:
            java.lang.Throwable r6 = defpackage.bjb.b(r5)
            if (r6 == 0) goto L63
            uld r8 = defpackage.wld.a
            java.lang.Object[] r7 = new java.lang.Object[r7]
            java.lang.String r0 = "Get post featuring data failed"
            r8.e(r6, r0, r7)
        L63:
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hx4.Z0(java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    public void a(String str, Object obj) {
        int length = str.length();
        String strValueOf = String.valueOf(obj);
        ((ArrayList) this.b).add(y30.s(new StringBuilder(length + 1 + strValueOf.length()), str, "=", strValueOf));
    }

    @Override // defpackage.bo1
    public /* bridge */ int a0(awd awdVar) {
        return k40.G0(awdVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object a1(java.lang.String r6, defpackage.p92 r7) {
        /*
            r5 = this;
            boolean r0 = r7 instanceof defpackage.t95
            if (r0 == 0) goto L13
            r0 = r7
            t95 r0 = (defpackage.t95) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            t95 r0 = new t95
            r0.<init>(r5, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 != r4) goto L28
            defpackage.br7.v(r7)
            goto L3f
        L28:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L2e:
            defpackage.br7.v(r7)
            b9 r7 = new b9
            r7.<init>(r3, r5, r6)
            r0.d = r4
            java.lang.Object r7 = defpackage.o7f.s(r7, r0)
            if (r7 != r1) goto L3f
            return r1
        L3f:
            bjb r7 = (defpackage.bjb) r7
            java.lang.Object r5 = r7.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hx4.a1(java.lang.String, p92):java.lang.Object");
    }

    @Override // defpackage.hvc
    public ivc apply() {
        nq6 nq6Var = (nq6) this.b;
        gq6 gq6VarW0 = W0();
        if (gq6VarW0 != null) {
            nq6Var.c(gq6VarW0, false);
        }
        return nq6Var.e(this.c);
    }

    @Override // defpackage.hvc
    public boolean b(lt ltVar) {
        gq6 gq6VarW0 = W0();
        l69 l69Var = gq6VarW0 != null ? gq6VarW0.f : null;
        if (l69Var == null || l69Var.c()) {
            return true;
        }
        oic oicVarA = vn7.A();
        x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
        oic oicVarG = vn7.G(oicVarA);
        try {
            return l69Var.e(ltVar);
        } catch (Throwable th) {
            try {
                gq6VarW0.getClass();
                throw th;
            } finally {
                vn7.T(oicVarA, oicVarG, x45VarE);
            }
        }
    }

    @Override // defpackage.bo1
    public /* bridge */ boolean b0(swd swdVar, awd awdVar) {
        return k40.j0(swdVar, awdVar);
    }

    public Boolean b1() {
        Network activeNetwork;
        NetworkCapabilities networkCapabilities;
        ConnectivityManager connectivityManager = (ConnectivityManager) ((w5d) this.c).getValue();
        boolean z = false;
        if (connectivityManager == null || (activeNetwork = connectivityManager.getActiveNetwork()) == null) {
            networkCapabilities = null;
        } else {
            try {
                networkCapabilities = connectivityManager.getNetworkCapabilities(activeNetwork);
            } catch (SecurityException e) {
                wld.a.e(e, "Failed to get network capabilities", new Object[0]);
                networkCapabilities = null;
            }
        }
        if (networkCapabilities == null) {
            if (Settings.Global.getInt(((Context) this.b).getContentResolver(), "airplane_mode_on", 0) != 0) {
                return Boolean.FALSE;
            }
            return null;
        }
        if (networkCapabilities.hasCapability(12) && networkCapabilities.hasCapability(16)) {
            z = true;
        }
        return Boolean.valueOf(z);
    }

    @Override // defpackage.nvc
    public void c(mvc mvcVar) {
        t68 t68Var = (t68) this.c;
        t68Var.a();
        y68 y68Var = (y68) mvcVar.b;
        Object[] objArr = y68Var.b;
        long[] jArr = y68Var.c;
        int i = y68Var.e;
        while (i != Integer.MAX_VALUE) {
            int i2 = (int) ((jArr[i] >> 31) & 2147483647L);
            Object obj = objArr[i];
            Object objB = ((ut6) this.b).b(obj);
            int iD = t68Var.d(objB);
            int i3 = iD >= 0 ? t68Var.c[iD] : 0;
            if (i3 == 7) {
                mvcVar.remove(obj);
            } else {
                t68Var.g(i3 + 1, objB);
            }
            i = i2;
        }
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
        return new xvd(true, true, this, rn6.a, sn6.a);
    }

    @Override // defpackage.hvc
    public void cancel() {
        switch (this.a) {
            case 11:
                gq6 gq6VarW0 = W0();
                if ((gq6VarW0 != null ? gq6VarW0.f : null) != null) {
                    ((nq6) this.b).g(this.c);
                }
                break;
            default:
                if (!((x90) this.c).compareAndSet(1, 1)) {
                    ((le0) this.b).invoke();
                }
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0078  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.i31 d(java.util.Map r19, java.lang.String r20, java.util.List r21, java.lang.String r22) {
        /*
            Method dump skipped, instruction units count: 311
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hx4.d(java.util.Map, java.lang.String, java.util.List, java.lang.String):i31");
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

    public jec e1(hkb hkbVar) {
        hec hecVar;
        v33 v33VarI = k40.I(hkbVar);
        return (v33VarI == null || (hecVar = v33VarI.b) == null) ? (jec) hkbVar : hecVar;
    }

    @Override // defpackage.i41
    public void f(v31 v31Var, zcb zcbVar) {
        jn7 jn7Var;
        nn7 nn7Var;
        switch (this.a) {
            case 18:
                i41 i41Var = (i41) this.b;
                kn7 kn7Var = (kn7) this.c;
                Object obj = zcbVar.b;
                jn7 jn7Var2 = obj instanceof jn7 ? (jn7) obj : null;
                adb adbVar = zcbVar.a;
                int i = adbVar.d;
                fdb fdbVar = zcbVar.c;
                if (!adbVar.q || jn7Var2 == null) {
                    if (fdbVar == null || fdbVar.f() == 0) {
                        jn7Var = null;
                    } else {
                        try {
                            jn7Var = (jn7) ((y92) kn7Var.c).v(fdbVar);
                        } catch (Exception unused) {
                            jn7Var = null;
                        }
                    }
                    i41Var.w(kn7Var, new Medium2Error(null, i, jn7Var != null ? jn7Var.getError() : null, jn7Var != null ? jn7Var.getErrorInfo() : null, 1));
                } else if (jn7Var2.getSuccess()) {
                    i41Var.f(kn7Var, zcb.a(jn7Var2));
                } else if (jn7Var2.getSuccess() || jn7Var2.getError() == null) {
                    i41Var.w(kn7Var, new Medium2Error(null, 500, null, null, 13));
                } else {
                    i41Var.w(kn7Var, new Medium2Error(null, i, jn7Var2.getError(), jn7Var2.getErrorInfo(), 1));
                }
                break;
            default:
                i41 i41Var2 = (i41) this.b;
                kn7 kn7Var2 = (kn7) this.c;
                Object obj2 = zcbVar.b;
                nn7 nn7Var2 = obj2 instanceof nn7 ? (nn7) obj2 : null;
                adb adbVar2 = zcbVar.a;
                int i2 = adbVar2.d;
                fdb fdbVar2 = zcbVar.c;
                if (!adbVar2.q || nn7Var2 == null) {
                    if (fdbVar2 == null || fdbVar2.f() == 0) {
                        nn7Var = null;
                    } else {
                        try {
                            nn7Var = (nn7) ((y92) kn7Var2.c).v(fdbVar2);
                        } catch (Exception unused2) {
                            nn7Var = null;
                        }
                    }
                    i41Var2.w(kn7Var2, new Medium2Error(null, i2, nn7Var != null ? nn7Var.getError() : null, nn7Var != null ? nn7Var.getErrorInfo() : null, 1));
                } else if (nn7Var2.getSuccess()) {
                    i41Var2.f(kn7Var2, zcb.a(nn7Var2));
                } else if (nn7Var2.getSuccess() || nn7Var2.getError() == null) {
                    i41Var2.w(kn7Var2, new Medium2Error(null, 500, null, null, 13));
                } else {
                    i41Var2.w(kn7Var2, new Medium2Error(null, i2, nn7Var2.getError(), nn7Var2.getErrorInfo(), 1));
                }
                break;
        }
    }

    public void f0(j15 j15Var, Bundle bundle, boolean z) {
        f25 f25Var = (f25) this.c;
        j15 j15Var2 = f25Var.x;
        if (j15Var2 != null) {
            j15Var2.m().n.f0(j15Var, bundle, true);
        }
        for (s15 s15Var : (CopyOnWriteArrayList) this.b) {
            if (z) {
                s15Var.getClass();
            }
            s15Var.a.onFragmentCreated(f25Var, j15Var, bundle);
        }
    }

    public zj0 f1() {
        JSONObject jSONObject;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] bArr = new byte[OlympusMakernoteDirectory.TAG_MAIN_INFO];
        try {
            FileInputStream fileInputStream = new FileInputStream(V0());
            while (true) {
                try {
                    int i = fileInputStream.read(bArr, 0, OlympusMakernoteDirectory.TAG_MAIN_INFO);
                    if (i < 0) {
                        break;
                    }
                    byteArrayOutputStream.write(bArr, 0, i);
                } catch (Throwable th) {
                    try {
                        fileInputStream.close();
                    } catch (Throwable th2) {
                        th.addSuppressed(th2);
                    }
                    throw th;
                }
            }
            jSONObject = new JSONObject(byteArrayOutputStream.toString());
            fileInputStream.close();
        } catch (IOException | JSONException unused) {
            jSONObject = new JSONObject();
        }
        String strOptString = jSONObject.optString("Fid", null);
        g89 g89Var = g89.ATTEMPT_MIGRATION;
        int iOptInt = jSONObject.optInt("Status", g89Var.ordinal());
        String strOptString2 = jSONObject.optString("AuthToken", null);
        String strOptString3 = jSONObject.optString("RefreshToken", null);
        long jOptLong = jSONObject.optLong("TokenCreationEpochInSecs", 0L);
        long jOptLong2 = jSONObject.optLong("ExpiresInSecs", 0L);
        String strOptString4 = jSONObject.optString("FisError", null);
        int i2 = zj0.h;
        yj0 yj0Var = new yj0();
        yj0Var.f = 0L;
        yj0Var.h = (byte) (yj0Var.h | 2);
        yj0Var.b(g89Var);
        yj0Var.e = 0L;
        yj0Var.h = (byte) (yj0Var.h | 1);
        yj0Var.a = strOptString;
        yj0Var.b(g89.values()[iOptInt]);
        yj0Var.c = strOptString2;
        yj0Var.d = strOptString3;
        yj0Var.f = jOptLong;
        byte b = (byte) (yj0Var.h | 2);
        yj0Var.e = jOptLong2;
        yj0Var.h = (byte) (b | 1);
        yj0Var.g = strOptString4;
        return yj0Var.a();
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

    public Object g1(Object obj, nx1 nx1Var, o7f o7fVar, String str) {
        String str2;
        i31 i31Var = null;
        if (o7fVar instanceof rx1) {
            if (obj == null) {
                ygf.f("Check failed.");
                return null;
            }
            o7fVar = ((rx1) o7fVar).u;
        } else if (obj == null) {
            return null;
        }
        if (o7fVar instanceof px1) {
            if (!(obj instanceof List)) {
                ygf.f("Check failed.");
                return null;
            }
            Iterable iterable = (Iterable) obj;
            ArrayList arrayList = new ArrayList(cu1.k0(iterable, 10));
            int i = 0;
            for (Object obj2 : iterable) {
                int i2 = i + 1;
                if (i < 0) {
                    d46.i0();
                    throw null;
                }
                o7f o7fVar2 = ((px1) o7fVar).u;
                String strValueOf = String.valueOf(i);
                if (str != null) {
                    strValueOf = ev6.r('.', str, strValueOf);
                }
                arrayList.add(g1(obj2, nx1Var, o7fVar2, strValueOf));
                i = i2;
            }
            return arrayList;
        }
        if (o7fVar instanceof qx1) {
            qx1 qx1Var = (qx1) o7fVar;
            if ((qx1Var instanceof b1e) || (qx1Var instanceof l56) || (qx1Var instanceof sm8)) {
                if (!(obj instanceof Map)) {
                    ygf.f("Check failed.");
                    return null;
                }
                Map map = (Map) obj;
                o7f o7fVar3 = nx1Var.b;
                qx1 qx1VarH = o7fVar3.H();
                qx1VarH.getClass();
                boolean z = qx1VarH instanceof l56;
                Collection collection = ey3.a;
                if (!z && (qx1VarH instanceof sm8)) {
                    collection = ((sm8) qx1VarH).v;
                }
                if (!collection.isEmpty()) {
                    String strValueOf2 = String.valueOf(map.get("__typename"));
                    ArrayList arrayList2 = new ArrayList(cu1.k0(collection, 10));
                    Iterator it2 = collection.iterator();
                    while (it2.hasNext()) {
                        arrayList2.add(String.valueOf(map.get((String) it2.next())));
                    }
                    i31Var = new i31(strValueOf2, arrayList2);
                }
                if (i31Var != null && (str2 = i31Var.a) != null) {
                    str = str2;
                }
                return d(map, str, nx1Var.f, o7fVar3.H().u);
            }
        }
        return obj;
    }

    @Override // defpackage.bo1
    public /* bridge */ int h(qn6 qn6Var) {
        return k40.F(qn6Var);
    }

    @Override // defpackage.bo1
    public /* bridge */ onc h0(qn6 qn6Var) {
        return k40.N(qn6Var);
    }

    public String h1(Object obj) throws IOException {
        String str;
        u77 u77Var = (u77) obj;
        f66 f66Var = (f66) this.b;
        bv2 bv2Var = (bv2) this.c;
        List<String> listP0 = muc.p0(u77Var.n, new String[]{","}, 0, 6);
        ArrayList arrayList = new ArrayList();
        for (String str2 : listP0) {
            Iterator it2 = bv2Var.b.iterator();
            String str3 = str2;
            while (it2.hasNext()) {
                str3 = str3 == null ? null : (String) ((x45) it2.next()).invoke(str3);
            }
            if (str3 == null) {
                f49.K(bv2Var.a, d66.ERROR, e66.USER, new hm0(str2, 11), null, false, 56);
            } else if (!str3.equals(str2)) {
                f49.K(bv2Var.a, d66.WARN, e66.USER, new cn(str2, 10, str3), null, true, 40);
            }
            if (str3 != null) {
                arrayList.add(str3);
            }
        }
        int size = arrayList.size() - 100;
        if (size > 0) {
            f49.K(bv2Var.a, d66.WARN, e66.USER, new nt2(size), null, false, 56);
        }
        String strF0 = bu1.F0(bu1.g1(arrayList, 100), ",", null, null, null, 62);
        LinkedHashMap linkedHashMapD0 = vv2.d0(bv2Var, u77Var.o, null, null, 14);
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry entry : linkedHashMapD0.entrySet()) {
            if (!muc.b0((String) entry.getKey())) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        s77 s77Var = u77Var.i;
        s77 s77Var2 = s77Var != null ? new s77(s77Var.a, s77Var.b, s77Var.c, s77Var.d, new LinkedHashMap(wz7.s(vv2.d0(bv2Var, s77Var.e, "usr", "user extra information", 8), f66Var))) : null;
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(wz7.s(linkedHashMap, f66Var));
        i77 i77Var = u77Var.a;
        l77 l77Var = u77Var.b;
        o77 o77Var = u77Var.c;
        String str4 = u77Var.d;
        String str5 = u77Var.e;
        String str6 = u77Var.f;
        j77 j77Var = u77Var.g;
        f77 f77Var = u77Var.h;
        k77 k77Var = u77Var.j;
        h77 h77Var = u77Var.k;
        String str7 = u77Var.l;
        String str8 = u77Var.m;
        o77Var.getClass();
        str4.getClass();
        str5.getClass();
        uc6 uc6Var = new uc6();
        uc6 uc6Var2 = new uc6();
        r77 r77Var = i77Var.a;
        if (r77Var != null) {
            str = str8;
            uc6Var2.p("type", r77Var.toJson());
        } else {
            str = str8;
        }
        String str9 = i77Var.b;
        if (str9 != null) {
            uc6Var2.r("name", str9);
        }
        String str10 = i77Var.c;
        if (str10 != null) {
            uc6Var2.r("model", str10);
        }
        String str11 = i77Var.d;
        if (str11 != null) {
            uc6Var2.r("brand", str11);
        }
        String str12 = i77Var.e;
        if (str12 != null) {
            uc6Var2.r("architecture", str12);
        }
        uc6Var2.q(i77Var.f, "logical_cpu_count");
        Number number = i77Var.g;
        if (number != null) {
            uc6Var2.q(number, "total_ram");
        }
        Boolean bool = i77Var.h;
        if (bool != null) {
            uc6Var2.p("is_low_ram", new zc6(bool));
        }
        uc6Var.p("device", uc6Var2);
        uc6 uc6Var3 = new uc6();
        uc6Var3.r("name", l77Var.a);
        uc6Var3.r("version", l77Var.b);
        uc6Var3.r("version_major", l77Var.c);
        uc6Var.p("os", uc6Var3);
        uc6Var.p("status", o77Var.toJson());
        uc6Var.r("service", str4);
        uc6Var.r("message", str5);
        uc6Var.r("date", str6);
        uc6 uc6Var4 = new uc6();
        uc6Var4.r("name", j77Var.a);
        String str13 = j77Var.b;
        if (str13 != null) {
            uc6Var4.r("thread_name", str13);
        }
        uc6Var4.r("version", j77Var.c);
        uc6Var.p("logger", uc6Var4);
        uc6 uc6Var5 = new uc6();
        g77 g77Var = f77Var.a;
        uc6 uc6Var6 = new uc6();
        uc6Var6.r("architecture", g77Var.a);
        uc6Var5.p("device", uc6Var6);
        uc6Var.p("_dd", uc6Var5);
        if (s77Var2 != null) {
            uc6 uc6Var7 = new uc6();
            String str14 = s77Var2.a;
            if (str14 != null) {
                uc6Var7.r("anonymous_id", str14);
            }
            String str15 = s77Var2.b;
            if (str15 != null) {
                uc6Var7.r("id", str15);
            }
            String str16 = s77Var2.c;
            if (str16 != null) {
                uc6Var7.r("name", str16);
            }
            String str17 = s77Var2.d;
            if (str17 != null) {
                uc6Var7.r("email", str17);
            }
            for (Map.Entry entry2 : s77Var2.e.entrySet()) {
                String str18 = (String) entry2.getKey();
                Object value = entry2.getValue();
                if (!k80.d0(str18, s77.f)) {
                    uc6Var7.p(str18, wz7.t(value));
                }
            }
            uc6Var.p("usr", uc6Var7);
        }
        if (k77Var != null) {
            uc6 uc6Var8 = new uc6();
            e77 e77Var = k77Var.a;
            uc6 uc6Var9 = new uc6();
            m77 m77Var = e77Var.a;
            if (m77Var != null) {
                uc6 uc6Var10 = new uc6();
                String str19 = m77Var.a;
                if (str19 != null) {
                    uc6Var10.r("id", str19);
                }
                String str20 = m77Var.b;
                if (str20 != null) {
                    uc6Var10.r("name", str20);
                }
                uc6Var9.p("sim_carrier", uc6Var10);
            }
            String str21 = e77Var.b;
            if (str21 != null) {
                uc6Var9.r("signal_strength", str21);
            }
            String str22 = e77Var.c;
            if (str22 != null) {
                uc6Var9.r("downlink_kbps", str22);
            }
            String str23 = e77Var.d;
            if (str23 != null) {
                uc6Var9.r("uplink_kbps", str23);
            }
            uc6Var9.r("connectivity", e77Var.e);
            uc6Var8.p("client", uc6Var9);
            uc6Var.p("network", uc6Var8);
        }
        if (h77Var != null) {
            uc6 uc6Var11 = new uc6();
            uc6Var11.r("kind", h77Var.a);
            String str24 = h77Var.b;
            if (str24 != null) {
                uc6Var11.r("message", str24);
            }
            uc6Var11.r("stack", h77Var.c);
            String str25 = h77Var.d;
            if (str25 != null) {
                uc6Var11.r("fingerprint", str25);
            }
            ArrayList arrayList2 = h77Var.e;
            if (arrayList2 != null) {
                pb6 pb6Var = new pb6(arrayList2.size());
                Iterator it3 = arrayList2.iterator();
                while (it3.hasNext()) {
                    ((p77) it3.next()).getClass();
                    uc6 uc6Var12 = new uc6();
                    uc6Var12.r("name", null);
                    uc6Var12.p("crashed", new zc6((Boolean) false));
                    uc6Var12.r("stack", null);
                    uc6Var12.r("state", null);
                    pb6Var.p(uc6Var12);
                }
                uc6Var11.p("threads", pb6Var);
            }
            uc6Var.p("error", uc6Var11);
        }
        if (str7 != null) {
            uc6Var.r("build_id", str7);
        }
        if (str != null) {
            uc6Var.r("build_version", str);
        }
        uc6Var.r("ddtags", strF0);
        for (Map.Entry entry3 : linkedHashMap2.entrySet()) {
            String str26 = (String) entry3.getKey();
            Object value2 = entry3.getValue();
            if (!k80.d0(str26, u77.p)) {
                uc6Var.p(str26, wz7.t(value2));
            }
        }
        return uc6Var.toString();
    }

    @Override // defpackage.nvc
    public boolean i(Object obj, Object obj2) {
        ut6 ut6Var = (ut6) this.b;
        return g76.L(ut6Var.b(obj), ut6Var.b(obj2));
    }

    @Override // defpackage.bo1
    public /* bridge */ hec i0(zm4 zm4Var) {
        return k40.U0(zm4Var);
    }

    public bo4 i1() {
        qn7 qn7Var = (qn7) this.b;
        int i = 7;
        return m40.J(new sp4(new zz(qn7Var.G(ek6.STAFF_OVERRIDES_VARIANT_FLAGS, qn7.i, fy3.a), i), new zz(p2.N(qn7Var, ek6.LOCAL_VARIANTS, null, 2, null), i), new rl2(this, null, 3), 0));
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
    public /* bridge */ swd k0(awd awdVar, int i) {
        return k40.d0(awdVar, i);
    }

    @Override // defpackage.bn1
    public an1 l(mn1 mn1Var) {
        mn1Var.getClass();
        zm7 zm7Var = (zm7) this.b;
        w93 w93Var = (w93) this.c;
        w93Var.c().c.getClass();
        h1b h1bVarH0 = flb.h0(zm7Var, mn1Var, zz7.g);
        if (h1bVarH0 == null) {
            return null;
        }
        e0b.a(h1bVarH0.a).equals(mn1Var);
        return w93Var.g(h1bVarH0);
    }

    public void l0(j15 j15Var, boolean z) {
        f25 f25Var = (f25) this.c;
        j15 j15Var2 = f25Var.x;
        if (j15Var2 != null) {
            j15Var2.m().n.l0(j15Var, true);
        }
        for (s15 s15Var : (CopyOnWriteArrayList) this.b) {
            if (z) {
                s15Var.getClass();
            }
            s15Var.a.onFragmentDestroyed(f25Var, j15Var);
        }
    }

    @Override // defpackage.ru2
    public boolean m(a34 a34Var, Object obj, u34 u34Var) {
        byte[] bytes;
        u77 u77Var = (u77) obj;
        u34Var.getClass();
        olb olbVar = (olb) this.b;
        f66 f66Var = (f66) this.c;
        f66Var.getClass();
        boolean zA = false;
        try {
            bytes = ((hx4) olbVar.b).h1(u77Var).getBytes(wk1.a);
            bytes.getClass();
        } catch (Throwable th) {
            f49.L(f66Var, d66.ERROR, d46.R(e66.USER, e66.TELEMETRY), new b18(u77Var), th, 48);
            bytes = null;
        }
        if (bytes != null) {
            synchronized (this) {
                zA = a34Var.a(new qsa(bytes, qsa.c), u34Var);
            }
        }
        return zA;
    }

    @Override // defpackage.bo1
    public boolean m0(awd awdVar, awd awdVar2) {
        awdVar.getClass();
        awdVar2.getClass();
        if (!(awdVar instanceof zvd)) {
            ay0.e("Failed requirement.");
            return false;
        }
        if (!(awdVar2 instanceof zvd)) {
            ay0.e("Failed requirement.");
            return false;
        }
        if (k40.E(awdVar, awdVar2)) {
            return true;
        }
        zvd zvdVar = (zvd) awdVar;
        zvd zvdVar2 = (zvd) awdVar2;
        Map map = (Map) this.b;
        if (((nn6) this.c).e(zvdVar, zvdVar2)) {
            return true;
        }
        if (map != null) {
            zvd zvdVar3 = (zvd) map.get(zvdVar);
            zvd zvdVar4 = (zvd) map.get(zvdVar2);
            if (zvdVar3 != null && zvdVar3.equals(zvdVar2)) {
                return true;
            }
            if (zvdVar4 != null && zvdVar4.equals(zvdVar)) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.bo1
    public void n(qn6 qn6Var) {
        qn6Var.getClass();
        k40.J(qn6Var);
    }

    @Override // defpackage.bo1
    public boolean n0(hkb hkbVar) {
        hec hecVarM = k40.M(hkbVar);
        return (hecVarM != null ? k40.H(this, e1(hecVarM)) : null) != null;
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

    @Override // defpackage.cs1
    public void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        rz2 rz2Var = (rz2) this.b;
        String strU = gp7.u(sourceParameter);
        ay4 ay4Var = (ay4) rz2Var.b;
        ay4Var.getClass();
        ay4Var.a.c(str, strU);
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
            case 14:
                StringBuilder sb = new StringBuilder(128);
                sb.append("LoaderManager{");
                sb.append(Integer.toHexString(System.identityHashCode(this)));
                sb.append(" in ");
                Class<?> cls = ((iy6) this.b).getClass();
                sb.append(cls.getSimpleName());
                sb.append("{");
                sb.append(Integer.toHexString(System.identityHashCode(cls)));
                sb.append("}}");
                return sb.toString();
            case 24:
                StringBuilder sb2 = new StringBuilder(100);
                sb2.append(this.c.getClass().getSimpleName());
                sb2.append('{');
                ArrayList arrayList = (ArrayList) this.b;
                int size = arrayList.size();
                for (int i = 0; i < size; i++) {
                    sb2.append((String) arrayList.get(i));
                    if (i < size - 1) {
                        sb2.append(", ");
                    }
                }
                sb2.append('}');
                return sb2.toString();
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

    public void v(j15 j15Var, Bundle bundle, boolean z) {
        f25 f25Var = (f25) this.c;
        j15 j15Var2 = f25Var.x;
        if (j15Var2 != null) {
            j15Var2.m().n.v(j15Var, bundle, true);
        }
        for (s15 s15Var : (CopyOnWriteArrayList) this.b) {
            if (z) {
                s15Var.getClass();
            }
            s15Var.a.onFragmentActivityCreated(f25Var, j15Var, bundle);
        }
    }

    @Override // defpackage.bo1
    public p61 v0(hkb hkbVar) {
        return k40.H(this, e1(hkbVar));
    }

    @Override // defpackage.i41
    public void w(v31 v31Var, Throwable th) {
        switch (this.a) {
            case 18:
                v31Var.getClass();
                ((i41) this.b).w((kn7) this.c, new Medium2Error(th, 500, th.getMessage(), null, 8));
                break;
            default:
                v31Var.getClass();
                ((i41) this.b).w((kn7) this.c, new Medium2Error(th, 500, th.getMessage(), null, 8));
                break;
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

    public void x0(j15 j15Var, boolean z) {
        f25 f25Var = (f25) this.c;
        j15 j15Var2 = f25Var.x;
        if (j15Var2 != null) {
            j15Var2.m().n.x0(j15Var, true);
        }
        for (s15 s15Var : (CopyOnWriteArrayList) this.b) {
            if (z) {
                s15Var.getClass();
            }
            s15Var.a.onFragmentDetached(f25Var, j15Var);
        }
    }

    @Override // defpackage.cs1
    public void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        sx4 sx4Var = (sx4) this.c;
        if (sx4Var.h.add(str)) {
            sx4Var.e.g(str, sx4Var.c, gp7.u(sourceParameter), sx4Var.i);
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

    public /* synthetic */ hx4(Object obj) {
        this.a = 24;
        this.c = obj;
        this.b = new ArrayList();
    }

    public hx4(qn7 qn7Var, dm4 dm4Var) {
        this.a = 15;
        qn7Var.getClass();
        dm4Var.getClass();
        this.b = qn7Var;
        this.c = dm4Var;
    }

    public hx4(yad yadVar) {
        this.a = 5;
        this.b = yadVar;
        this.c = new my6(26, false);
    }

    public hx4(qcf qcfVar, vr7 vr7Var) {
        this.a = 6;
        vr7Var.getClass();
        this.b = qcfVar;
        this.c = vr7Var;
    }

    public hx4(Context context, int i) {
        this.a = i;
        switch (i) {
            case 21:
                this.c = null;
                this.b = context;
                break;
            default:
                this.b = context;
                this.c = new w5d(new em4(21, this));
                break;
        }
    }

    public hx4(HashMap map, nn6 nn6Var) {
        this.a = 27;
        nn6Var.getClass();
        this.b = map;
        this.c = nn6Var;
    }

    public hx4(f66 f66Var) {
        this.a = 16;
        bv2 bv2Var = new bv2(f66Var);
        f66Var.getClass();
        this.b = f66Var;
        this.c = bv2Var;
    }

    public hx4(olb olbVar, f66 f66Var) {
        this.a = 17;
        f66Var.getClass();
        this.b = olbVar;
        this.c = f66Var;
    }

    public hx4(hb5 hb5Var, cba cbaVar) {
        this.a = 4;
        cbaVar.getClass();
        this.b = hb5Var;
        this.c = cbaVar;
    }

    public hx4(l44 l44Var, String str, y3b y3bVar) {
        this.a = 23;
        str.getClass();
        this.b = l44Var;
        this.c = new LinkedHashMap();
    }

    public hx4() {
        this.a = 25;
        this.b = new AtomicInteger();
        this.c = new AtomicInteger();
    }

    public hx4(elb elbVar) {
        this.a = 7;
        this.b = elbVar;
        Set setNewSetFromMap = Collections.newSetFromMap(new IdentityHashMap());
        setNewSetFromMap.getClass();
        this.c = setNewSetFromMap;
    }

    public hx4(le0 le0Var) {
        this.a = 26;
        this.b = le0Var;
        this.c = new x90(0);
    }

    public /* synthetic */ hx4(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    public hx4(f25 f25Var) {
        this.a = 1;
        this.b = new CopyOnWriteArrayList();
        this.c = f25Var;
    }

    public hx4(xj4 xj4Var) {
        this.a = 28;
        this.c = xj4Var;
    }

    public hx4(ut6 ut6Var) {
        this.a = 12;
        this.b = ut6Var;
        t68 t68Var = om8.a;
        this.c = new t68();
    }

    @Override // defpackage.bo1
    public void G0(hkb hkbVar, awd awdVar) {
    }
}
