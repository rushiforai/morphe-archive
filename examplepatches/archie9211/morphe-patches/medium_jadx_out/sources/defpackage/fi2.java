package defpackage;

import android.app.job.JobParameters;
import android.content.Intent;
import android.graphics.Typeface;
import android.os.Bundle;
import android.os.Process;
import android.os.StrictMode;
import android.os.Trace;
import android.util.Log;
import android.util.Pair;
import android.view.View;
import android.widget.EditText;
import androidx.credentials.exceptions.GetCredentialUnsupportedException;
import androidx.credentials.playservices.controllers.identityauth.getsigninintent.CredentialProviderGetSignInIntentController;
import com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;
import java.util.Timer;
import java.util.concurrent.Callable;
import java.util.concurrent.CountDownLatch;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fi2 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ fi2(ArrayList arrayList, blc blcVar, g23 g23Var) {
        this.a = 6;
        this.b = arrayList;
        this.c = blcVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = 6;
        String string = null;
        switch (this.a) {
            case 0:
                CredentialProviderGetSignInIntentController.handleResponse$lambda$3$0((CredentialProviderGetSignInIntentController) this.b, (rya) this.c);
                return;
            case 1:
                CredentialProviderGetSignInIntentController.handleResponse$lambda$2$0((CredentialProviderGetSignInIntentController) this.b, (k95) this.c);
                return;
            case 2:
                CredentialProviderGetSignInIntentController.invokePlayServices$lambda$0$0((CredentialProviderGetSignInIntentController) this.b, (GetCredentialUnsupportedException) this.c);
                return;
            case 3:
                hm2 hm2Var = (hm2) this.b;
                Runnable runnable = (Runnable) this.c;
                Process.setThreadPriority(hm2Var.c);
                StrictMode.ThreadPolicy threadPolicy = hm2Var.d;
                if (threadPolicy != null) {
                    StrictMode.setThreadPolicy(threadPolicy);
                }
                runnable.run();
                return;
            case 4:
                yu2 yu2Var = (yu2) this.b;
                q32 q32Var = (q32) this.c;
                ysb feature = yu2Var.getFeature("rum");
                if (feature == null) {
                    return;
                }
                boolean z = q32Var.f;
                o32 o32Var = q32Var.a;
                feature.a(new m66(z, o32Var.c.getWindowDurationMs$dd_sdk_android_core_release(), o32Var.d.getBaseStepMs$dd_sdk_android_core_release(), false, o32Var.g.getMaxBatchesPerUploadJob()));
                return;
            case 5:
                iv2 iv2Var = (iv2) this.b;
                yu2 yu2Var2 = (yu2) this.c;
                vc8 vc8Var = (vc8) iv2Var.h;
                if (vc8Var != null) {
                    uc6 uc6Var = (uc6) iv2Var.g;
                    String str = vc8Var.d;
                    String str2 = String.format(Locale.US, "NDK crash detected with signal: %s", Arrays.copyOf(new Object[]{str}, 1));
                    if (uc6Var != null) {
                        ysb feature2 = yu2Var2.getFeature("rum");
                        if (feature2 != null) {
                            feature2.a(ei7.Q(new f09("type", "ndk_crash"), new f09("sourceType", (String) iv2Var.e), new f09("timestamp", Long.valueOf(vc8Var.b)), new f09("timeSinceAppStartMs", vc8Var.c), new f09("signalName", str), new f09("stacktrace", vc8Var.f), new f09("message", str2), new f09("lastViewEvent", uc6Var)));
                        } else {
                            f49.K((f66) iv2Var.c, d66.INFO, e66.USER, ot2.r, null, false, 56);
                        }
                    }
                    iv2Var.g = null;
                    iv2Var.h = null;
                    return;
                }
                return;
            case 6:
                ArrayList arrayList = (ArrayList) this.b;
                blc blcVar = (blc) this.c;
                if (arrayList.contains(blcVar)) {
                    arrayList.remove(blcVar);
                    View view = blcVar.c.G;
                    flc flcVar = blcVar.a;
                    view.getClass();
                    flcVar.applyState(view);
                    return;
                }
                return;
            case 7:
                Callable callable = (Callable) this.b;
                k43 k43Var = (k43) ((zm7) this.c).b;
                try {
                    k43Var.k(callable.call());
                    return;
                } catch (Exception e) {
                    k43Var.l(e);
                    return;
                }
            case 8:
                ((ca4) this.b).a((Intent) this.c);
                return;
            case 9:
                ArrayList<Pair> arrayList2 = (ArrayList) this.b;
                hf5 hf5Var = (hf5) this.c;
                for (Pair pair : arrayList2) {
                    bf5 bf5Var = (bf5) pair.first;
                    Object obj = pair.second;
                    obj.getClass();
                    bf5Var.a((if5) obj);
                }
                Iterator it2 = hf5Var.d.iterator();
                while (it2.hasNext()) {
                    ((d4) it2.next()).a.run();
                }
                return;
            case 10:
                ((x51) this.b).D((ei5) this.c);
                return;
            case 11:
                ww5 ww5Var = (ww5) this.b;
                wfd wfdVar = (wfd) this.c;
                try {
                    wfdVar.b(ww5Var.f());
                    return;
                } catch (Exception e2) {
                    wfdVar.a(e2);
                    return;
                }
            case 12:
                String str3 = (String) this.b;
                ha6 ha6Var = (ha6) this.c;
                grb.f("JavaUploadDataSinkBase#executeOnExecutor " + str3 + " running callback");
                try {
                    ha6Var.run();
                    Trace.endSection();
                    return;
                } finally {
                }
            case 13:
                na6 na6Var = (na6) this.b;
                i7e i7eVar = (i7e) this.c;
                n0c n0cVar = na6Var.r;
                String str4 = na6Var.E;
                n0cVar.getClass();
                n0cVar.A(new mt(n0cVar, i7eVar, str4, i), "onRedirectReceived");
                return;
            case 14:
                na6 na6Var2 = (na6) this.b;
                na6Var2.f0(new ha6(na6Var2, (lt) this.c, 0), "read");
                return;
            case 15:
                n0c n0cVar2 = (n0c) this.b;
                mq7 mq7Var = (mq7) this.c;
                na6 na6Var3 = (na6) n0cVar2.e;
                try {
                    ((mse) n0cVar2.b).d.J(na6Var3, mq7Var);
                    break;
                } catch (Exception e3) {
                    na6Var3.h0("onSucceded", e3);
                }
                n0cVar2.W();
                na6Var3.H.z.decrementAndGet();
                return;
            case 16:
                JobInfoSchedulerService jobInfoSchedulerService = (JobInfoSchedulerService) this.b;
                JobParameters jobParameters = (JobParameters) this.c;
                int i2 = JobInfoSchedulerService.a;
                jobInfoSchedulerService.jobFinished(jobParameters, false);
                return;
            case 17:
                w97 w97Var = (w97) this.b;
                Bundle bundle = (Bundle) this.c;
                if (ec2.a.contains(w97.class)) {
                    return;
                }
                try {
                    w97Var.b.s("fb_mobile_login_heartbeat", bundle);
                    return;
                } catch (Throwable th) {
                    ec2.a(w97.class, th);
                    return;
                }
            case 18:
                View view2 = (View) this.b;
                a08 a08Var = (a08) this.c;
                if (ec2.a.contains(a08.class)) {
                    return;
                }
                try {
                    if (view2 instanceof EditText) {
                        a08Var.b(view2);
                        return;
                    }
                    return;
                } catch (Throwable th2) {
                    ec2.a(a08.class, th2);
                    return;
                }
            case 19:
                ((rwb) this.b).g((mr8) this.c, c1e.a);
                return;
            case 20:
                i2a i2aVar = (i2a) this.b;
                h7f h7fVar = (h7f) this.c;
                synchronized (i2aVar.k) {
                    try {
                        Iterator it3 = i2aVar.j.iterator();
                        while (it3.hasNext()) {
                            ((t44) it3.next()).b(h7fVar, false);
                        }
                    } finally {
                    }
                    break;
                }
                return;
            case 21:
                x5b x5bVar = (x5b) this.b;
                CountDownLatch countDownLatch = (CountDownLatch) this.c;
                try {
                    psd.a().d.c(((kk0) x5bVar.h.b).b(z0a.HIGHEST), 1);
                    break;
                } catch (Exception unused) {
                }
                countDownLatch.countDown();
                return;
            case 22:
                ((h30) this.b).w((Typeface) this.c);
                return;
            case 23:
                ((ah2) this.b).onResult((wdc) this.c);
                return;
            case 24:
                ((mya) ((o2b) this.b).c).I((unc) this.c, 3);
                return;
            case 25:
                Runnable runnable2 = (Runnable) this.b;
                s10 s10Var = (s10) this.c;
                try {
                    runnable2.run();
                    return;
                } finally {
                    s10Var.c();
                }
            case 26:
                jue jueVar = (jue) this.b;
                iue iueVar = (iue) this.c;
                try {
                    if (ec2.a.contains(jue.class)) {
                        return;
                    }
                    try {
                        Timer timer = jueVar.c;
                        if (timer != null) {
                            timer.cancel();
                        }
                        jueVar.d = null;
                        Timer timer2 = new Timer();
                        timer2.scheduleAtFixedRate(iueVar, 0L, 1000L);
                        jueVar.c = timer2;
                        return;
                    } catch (Exception e4) {
                        Log.e(jue.e, "Error scheduling indexing job", e4);
                        return;
                    }
                } catch (Throwable th3) {
                    ec2.a(jue.class, th3);
                    return;
                }
            case 27:
                String str5 = (String) this.b;
                jue jueVar2 = (jue) this.c;
                if (ec2.a.contains(jue.class)) {
                    return;
                }
                try {
                    byte[] bytes = str5.getBytes(wk1.a);
                    bytes.getClass();
                    try {
                        MessageDigest messageDigest = MessageDigest.getInstance("MD5");
                        messageDigest.getClass();
                        messageDigest.update(bytes);
                        byte[] bArrDigest = messageDigest.digest();
                        StringBuilder sb = new StringBuilder();
                        bArrDigest.getClass();
                        for (byte b : bArrDigest) {
                            sb.append(Integer.toHexString((b >> 4) & 15));
                            sb.append(Integer.toHexString(b & 15));
                        }
                        string = sb.toString();
                    } catch (NoSuchAlgorithmException unused2) {
                    }
                    Date date = w3.l;
                    w3 w3VarR = wgf.r();
                    if (string == null || !string.equals(jueVar2.d)) {
                        String str6 = jue.e;
                        jueVar2.b(qo7.l(str5, w3VarR, f94.b()), string);
                        return;
                    }
                    return;
                } catch (Throwable th4) {
                    ec2.a(jue.class, th4);
                    return;
                }
            case 28:
                String str7 = (String) this.b;
                String str8 = (String) this.c;
                str8.getClass();
                HashSet hashSet = zue.e;
                wo7.s(str7, str8, new float[0]);
                return;
            default:
                a9f a9fVar = (a9f) this.b;
                wx6 wx6Var = (wx6) this.c;
                if (a9fVar.c) {
                    return;
                }
                a9fVar.d = wx6Var;
                wx6Var.a(a9fVar);
                return;
        }
    }

    public /* synthetic */ fi2(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }
}
