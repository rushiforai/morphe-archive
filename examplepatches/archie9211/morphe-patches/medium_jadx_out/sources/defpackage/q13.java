package defpackage;

import android.content.Context;
import android.util.Log;
import androidx.work.impl.WorkDatabase;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicMarkableReference;
import java.util.logging.Logger;
import org.json.JSONObject;
import sprig.b.g;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class q13 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ q13(Object obj, Object obj2, Object obj3, Object obj4, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        String strE;
        BufferedWriter bufferedWriter;
        String[] strArrF;
        int i = this.a;
        BufferedWriter bufferedWriter2 = null;
        int i2 = 1;
        Object obj = this.e;
        Object obj2 = this.d;
        Object obj3 = this.c;
        Object obj4 = this.b;
        int i3 = 0;
        switch (i) {
            case 0:
                s13 s13Var = (s13) obj4;
                kk0 kk0Var = (kk0) obj3;
                String str = kk0Var.a;
                qsd qsdVar = (qsd) obj2;
                ij0 ij0Var = (ij0) obj;
                s13Var.getClass();
                Logger logger = s13.f;
                try {
                    msd msdVarA = s13Var.c.a(str);
                    if (msdVarA == null) {
                        String str2 = "Transport backend '" + str + "' is not registered";
                        logger.warning(str2);
                        qsdVar.a(new IllegalArgumentException(str2));
                    } else {
                        s13Var.e.I(new mt(s13Var, kk0Var, ((nj1) msdVarA).a(ij0Var), 3));
                        qsdVar.a(null);
                    }
                    return;
                } catch (Exception e) {
                    logger.warning("Error scheduling event " + e.getMessage());
                    qsdVar.a(e);
                    return;
                }
            case 1:
                nz5 nz5Var = (nz5) obj4;
                Runnable runnable = (Runnable) obj3;
                wz5 wz5Var = (wz5) obj2;
                ArrayList arrayList = (ArrayList) obj;
                if (ec2.a.contains(nz5.class)) {
                    return;
                }
                try {
                    Class cls = nz5Var.e;
                    wz5Var.getClass();
                    xz5.a0(nz5Var.b, nz5Var.g(), nz5Var.i, nz5Var.k.i(wz5Var, arrayList), Proxy.newProxyInstance(cls.getClassLoader(), new Class[]{cls}, new mz5(nz5Var, runnable, i3)));
                    return;
                } catch (Throwable th) {
                    ec2.a(nz5.class, th);
                    return;
                }
            case 2:
                oz5 oz5Var = (oz5) obj4;
                Runnable runnable2 = (Runnable) obj3;
                wz5 wz5Var2 = (wz5) obj2;
                ArrayList arrayList2 = (ArrayList) obj;
                if (ec2.a.contains(oz5.class)) {
                    return;
                }
                try {
                    Class cls2 = oz5Var.n;
                    Object objNewProxyInstance = Proxy.newProxyInstance(cls2.getClassLoader(), new Class[]{cls2}, new mz5(oz5Var, new Object[]{runnable2}, i2));
                    Object objF = oz5Var.f(wz5Var2, arrayList2);
                    if (objF != null) {
                        xz5.a0(oz5Var.b, oz5Var.d(), oz5Var.v, objF, objNewProxyInstance);
                        return;
                    }
                    return;
                } catch (Throwable th2) {
                    ec2.a(oz5.class, th2);
                    return;
                }
            case 3:
                List list = (List) obj4;
                h7f h7fVar = (h7f) obj3;
                r32 r32Var = (r32) obj2;
                WorkDatabase workDatabase = (WorkDatabase) obj;
                Iterator it2 = list.iterator();
                while (it2.hasNext()) {
                    ((pqb) it2.next()).d(h7fVar.a);
                }
                zqb.b(r32Var, workDatabase, list);
                return;
            case 4:
                lod lodVar = (lod) obj4;
                String str3 = (String) obj3;
                Map map = (Map) obj2;
                List list2 = (List) obj;
                oz7 oz7Var = (oz7) lodVar.a;
                AtomicMarkableReference atomicMarkableReference = (AtomicMarkableReference) lodVar.g;
                if (((String) atomicMarkableReference.getReference()) != null) {
                    oz7Var.i(str3, (String) atomicMarkableReference.getReference());
                }
                if (!map.isEmpty()) {
                    oz7Var.h(str3, map, false);
                }
                if (list2.isEmpty()) {
                    return;
                }
                File fileB = oz7Var.a.b(str3, "rollouts-state");
                if (list2.isEmpty()) {
                    oz7.g(fileB, "Rollout state is empty for session: " + str3);
                    return;
                }
                try {
                    try {
                        strE = oz7.e(list2);
                        bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileB), oz7.b));
                    } catch (Exception e2) {
                        e = e2;
                    }
                } catch (Throwable th3) {
                    th = th3;
                }
                try {
                    bufferedWriter.write(strE);
                    bufferedWriter.flush();
                    gx1.D(bufferedWriter, "Failed to close rollouts state file.");
                    return;
                } catch (Exception e3) {
                    e = e3;
                    bufferedWriter2 = bufferedWriter;
                    Log.w("FirebaseCrashlytics", "Error serializing rollouts state.", e);
                    oz7.f(fileB);
                    gx1.D(bufferedWriter2, "Failed to close rollouts state file.");
                    return;
                } catch (Throwable th4) {
                    th = th4;
                    bufferedWriter2 = bufferedWriter;
                    gx1.D(bufferedWriter2, "Failed to close rollouts state file.");
                    throw th;
                }
            case 5:
                JSONObject jSONObject = (JSONObject) obj4;
                String str4 = (String) obj3;
                zue zueVar = (zue) obj2;
                String str5 = (String) obj;
                if (ec2.a.contains(zue.class)) {
                    return;
                }
                try {
                    str4.getClass();
                    try {
                        String lowerCase = epe.u(f94.a()).toLowerCase();
                        lowerCase.getClass();
                        float[] fArrU = fa4.u(lowerCase, jSONObject);
                        String strY = fa4.y(str4, zueVar.d, lowerCase);
                        if (fArrU != null && (strArrF = k28.f(h28.MTML_APP_EVENT_PREDICTION, new float[][]{fArrU}, new String[]{strY})) != null) {
                            String str6 = strArrF[0];
                            hy9.a(str5, str6);
                            if (g76.L(str6, "other")) {
                                return;
                            }
                            HashSet hashSet = zue.e;
                            wo7.s(str6, str4, fArrU);
                            return;
                        }
                        return;
                    } catch (Exception unused) {
                        return;
                    }
                } catch (Throwable th5) {
                    ec2.a(zue.class, th5);
                    return;
                }
            default:
                g.a((Context) obj4, (String) obj3, (Map) obj2, (m15) obj);
                return;
        }
    }
}
