package defpackage;

import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.Trace;
import android.util.Log;
import android.view.ActionMode;
import android.view.View;
import com.facebook.FacebookException;
import com.facebook.FacebookServiceException;
import com.google.firebase.messaging.FirebaseMessagingService;
import com.medium.android.admin.stagebranch.uG.peNPu;
import com.userleap.EventPayload;
import com.userleap.SurveyState;
import java.io.IOException;
import java.lang.reflect.Proxy;
import java.net.URI;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import org.chromium.net.CronetException;
import org.chromium.net.impl.CallbackExceptionImpl;
import sprig.b.g;
import sprig.graphics.k;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class ss implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ ss(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }

    private final void b() {
        mya myaVar = (mya) this.b;
        unc uncVar = (unc) this.c;
        vwa vwaVar = (vwa) this.d;
        i2a i2aVar = (i2a) myaVar.b;
        i2aVar.getClass();
        h7f h7fVar = uncVar.a;
        String str = h7fVar.a;
        ArrayList arrayList = new ArrayList();
        int i = 1;
        c8f c8fVar = (c8f) i2aVar.e.p(new i5b(9, new h43(i2aVar, arrayList, str, i)));
        if (c8fVar == null) {
            d87.h().l(i2a.l, "Didn't find WorkSpec for id " + h7fVar);
            i2aVar.h(h7fVar);
            return;
        }
        synchronized (i2aVar.k) {
            try {
                if (i2aVar.f(str)) {
                    Set set = (Set) i2aVar.h.get(str);
                    if (((unc) set.iterator().next()).a.b == h7fVar.b) {
                        set.add(uncVar);
                        d87.h().d(i2a.l, "Work " + h7fVar + " is already enqueued for processing");
                    } else {
                        i2aVar.h(h7fVar);
                    }
                    return;
                }
                if (c8fVar.t != h7fVar.b) {
                    i2aVar.h(h7fVar);
                    return;
                }
                iv2 iv2Var = new iv2(i2aVar.b, i2aVar.c, i2aVar.d, i2aVar, i2aVar.e, c8fVar, arrayList);
                if (vwaVar != null) {
                    iv2Var.h = vwaVar;
                }
                u8f u8fVar = new u8f(iv2Var);
                kb2 kb2Var = u8fVar.e.b;
                wa6 wa6VarQ = bo.q();
                kb2Var.getClass();
                t41 t41VarP = gx1.P(flb.p0(kb2Var, wa6VarQ), new s8f(u8fVar, null, i));
                t41VarP.b.a(new ss(i2aVar, t41VarP, u8fVar, 16), i2aVar.d.d);
                i2aVar.g.put(str, u8fVar);
                HashSet hashSet = new HashSet();
                hashSet.add(uncVar);
                i2aVar.h.put(str, hashSet);
                d87.h().d(i2a.l, i2a.class.getSimpleName() + ": processing " + h7fVar);
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = 1;
        switch (this.a) {
            case 0:
                ts tsVar = (ts) this.b;
                qs qsVar = (qs) this.c;
                rs rsVar = (rs) this.d;
                ActionMode actionModeStartActionMode = tsVar.a.startActionMode(new yn4(qsVar), 1);
                g76.L(tsVar.h, actionModeStartActionMode);
                if (actionModeStartActionMode == null) {
                    rsVar.close();
                    return;
                }
                return;
            case 1:
                ((dz0) this.b).e((Context) this.c, (Intent) this.d);
                return;
            case 2:
                nc2 nc2Var = (nc2) this.b;
                String str = (String) this.c;
                String str2 = (String) this.d;
                jc2 jc2Var = nc2Var.g;
                jc2Var.getClass();
                try {
                    ((zf3) jc2Var.d.d).p(str, str2);
                    return;
                } catch (IllegalArgumentException e) {
                    Context context = jc2Var.a;
                    if (context != null && (context.getApplicationInfo().flags & 2) != 0) {
                        throw e;
                    }
                    Log.e("FirebaseCrashlytics", "Attempting to set custom attribute with null key, ignoring.", null);
                    return;
                }
            case 3:
                am2 am2Var = (am2) this.b;
                m87 m87Var = (m87) this.c;
                Bundle bundle = (Bundle) this.d;
                try {
                    am2Var.i(m87Var, bundle);
                    am2Var.s(m87Var, bundle, null);
                    return;
                } catch (FacebookException e2) {
                    am2Var.s(m87Var, null, e2);
                    return;
                }
            case 4:
                lig ligVar = (lig) this.b;
                i41 i41Var = (i41) this.c;
                zcb zcbVar = (zcb) this.d;
                kn7 kn7Var = (kn7) ligVar.c;
                if (kn7Var.b.m()) {
                    i41Var.w(kn7Var, new IOException("Canceled"));
                    return;
                } else {
                    i41Var.f(kn7Var, zcbVar);
                    return;
                }
            case 5:
                ((i41) this.c).w((kn7) ((lig) this.b).c, (Throwable) this.d);
                return;
            case 6:
                g23 g23Var = (g23) this.b;
                View view = (View) this.c;
                c23 c23Var = (c23) this.d;
                g23Var.a.endViewTransition(view);
                c23Var.d();
                return;
            case 7:
                mp mpVar = (mp) this.b;
                ht2 ht2Var = (ht2) this.c;
                ThreadPoolExecutor threadPoolExecutor = (ThreadPoolExecutor) this.d;
                try {
                    nz4 nz4VarP = op8.P(mpVar.a);
                    if (nz4VarP == null) {
                        throw new RuntimeException("EmojiCompat font provider not available on this device.");
                    }
                    mz4 mz4Var = (mz4) ((xw3) nz4VarP.b);
                    synchronized (mz4Var.c) {
                        mz4Var.e = threadPoolExecutor;
                        break;
                    }
                    ((xw3) nz4VarP.b).a(new ax3(ht2Var, threadPoolExecutor));
                    return;
                } catch (Throwable th) {
                    ht2Var.x0(th);
                    threadPoolExecutor.shutdown();
                    return;
                }
            case 8:
                FirebaseMessagingService firebaseMessagingService = (FirebaseMessagingService) this.b;
                Intent intent = (Intent) this.c;
                wfd wfdVar = (wfd) this.d;
                try {
                    firebaseMessagingService.b(intent);
                    return;
                } finally {
                    wfdVar.b(null);
                }
            case 9:
                rya ryaVar = (rya) this.b;
                vz5 vz5Var = (vz5) this.c;
                Context context2 = (Context) this.d;
                if (ec2.a.contains(hz5.class)) {
                    return;
                }
                try {
                    ((iz5) ryaVar.a).a(wz5.SUBS, new gz5(vz5Var, context2, 1));
                    return;
                } catch (Throwable th2) {
                    ec2.a(hz5.class, th2);
                    return;
                }
            case 10:
                nz5 nz5Var = (nz5) this.b;
                wz5 wz5Var = (wz5) this.c;
                Runnable runnable = (Runnable) this.d;
                if (ec2.a.contains(nz5.class)) {
                    return;
                }
                try {
                    Class cls = nz5Var.f;
                    wz5Var.getClass();
                    xz5.a0(nz5Var.b, nz5Var.g(), nz5Var.j, wz5Var.getType(), Proxy.newProxyInstance(cls.getClassLoader(), new Class[]{cls}, new kz5(nz5Var, wz5Var, runnable)));
                    return;
                } catch (Throwable th3) {
                    ec2.a(nz5.class, th3);
                    return;
                }
            case 11:
                oz5 oz5Var = (oz5) this.b;
                wz5 wz5Var2 = (wz5) this.c;
                Runnable runnable2 = (Runnable) this.d;
                if (ec2.a.contains(oz5.class)) {
                    return;
                }
                try {
                    Class cls2 = oz5Var.o;
                    wz5Var2.getClass();
                    xz5.a0(oz5Var.b, oz5Var.d(), oz5Var.q, oz5Var.g(wz5Var2), Proxy.newProxyInstance(cls2.getClassLoader(), new Class[]{cls2}, new mz5(oz5Var, new Object[]{wz5Var2, runnable2}, i)));
                    return;
                } catch (Throwable th4) {
                    ec2.a(oz5.class, th4);
                    return;
                }
            case 12:
                la6 la6Var = (la6) this.b;
                String str3 = (String) this.c;
                oa6 oa6Var = (oa6) this.d;
                grb.f("Cronet JavaUploadDataSinkBase#executeOnUploadExecutor " + str3 + " running callback");
                try {
                    na6 na6Var = la6Var.p;
                    try {
                        oa6Var.run();
                        break;
                    } catch (Throwable th5) {
                        na6Var.e0(new CallbackExceptionImpl("Exception received from UploadDataProvider", th5));
                        break;
                    }
                    Trace.endSection();
                    return;
                } catch (Throwable th6) {
                    try {
                        Trace.endSection();
                        break;
                    } catch (Throwable th7) {
                        th6.addSuppressed(th7);
                    }
                    throw th6;
                }
            case 13:
                na6 na6Var2 = (na6) this.b;
                String str4 = (String) this.c;
                i7e i7eVar = (i7e) this.d;
                String string = URI.create(na6Var2.B).resolve(str4).toString();
                na6Var2.E = string;
                na6Var2.v.add(string);
                na6Var2.j0(2, 3, new fi2(na6Var2, 13, i7eVar));
                return;
            case 14:
                n0c n0cVar = (n0c) this.b;
                mq7 mq7Var = (mq7) this.c;
                CronetException cronetException = (CronetException) this.d;
                na6 na6Var3 = (na6) n0cVar.e;
                try {
                    ((mse) n0cVar.b).d.F(na6Var3, mq7Var, cronetException);
                    break;
                } catch (Exception e3) {
                    na6Var3.h0("onFailed", e3);
                }
                n0cVar.W();
                na6Var3.H.z.decrementAndGet();
                return;
            case 15:
                v98 v98Var = (v98) this.b;
                m87 m87Var2 = (m87) this.c;
                Bundle bundle2 = (Bundle) this.d;
                try {
                    v98Var.i(m87Var2, bundle2);
                    v98Var.r(m87Var2, bundle2);
                    return;
                } catch (FacebookServiceException e4) {
                    b94 b94Var = e4.b;
                    v98Var.q(m87Var2, b94Var.d, b94Var.a(), String.valueOf(b94Var.b));
                    return;
                } catch (FacebookException e5) {
                    v98Var.q(m87Var2, null, e5.getMessage(), null);
                    return;
                }
            case 16:
                a();
                return;
            case 17:
                ysb ysbVar = (ysb) this.b;
                Set set = (Set) this.c;
                b55 b55Var = (b55) this.d;
                if (ysbVar.a.e.get()) {
                    vu2 vu2VarB = ysbVar.b.b(set);
                    b55Var.invoke(vu2VarB, ysbVar.g.k(vu2VarB));
                    return;
                }
                return;
            case 18:
                b();
                return;
            case 19:
                g.a((EventPayload) this.b, (String) this.c, (SurveyState) this.d);
                return;
            default:
                k.a((b55) this.b, (Bitmap) this.c, (List) this.d);
                return;
        }
    }

    private final void a() {
        boolean zBooleanValue;
        i2a i2aVar = (i2a) this.b;
        t41 t41Var = (t41) this.c;
        u8f u8fVar = (u8f) this.d;
        i2aVar.getClass();
        try {
            zBooleanValue = ((Boolean) t41Var.b.get()).booleanValue();
        } catch (InterruptedException | ExecutionException unused) {
            zBooleanValue = true;
        }
        synchronized (i2aVar.k) {
            try {
                h7f h7fVarW = il7.w(u8fVar.a);
                String str = h7fVarW.a;
                if (i2aVar.d(str) == u8fVar) {
                    i2aVar.b(str);
                }
                d87.h().d(i2a.l, i2a.class.getSimpleName() + " " + str + peNPu.AAfqyrPdqDIFS + zBooleanValue);
                Iterator it2 = i2aVar.j.iterator();
                while (it2.hasNext()) {
                    ((t44) it2.next()).b(h7fVarW, zBooleanValue);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
