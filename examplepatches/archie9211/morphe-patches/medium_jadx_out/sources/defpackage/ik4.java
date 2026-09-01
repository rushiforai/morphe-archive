package defpackage;

import android.os.Bundle;
import android.util.Log;
import com.google.android.gms.tasks.RuntimeExecutionException;
import com.google.firebase.installations.FirebaseInstallationsRegistrar;
import com.google.firebase.sessions.FirebaseSessionsRegistrar;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ik4 implements dz1, o92, ha4 {
    public final /* synthetic */ int a;

    public /* synthetic */ ik4(nig nigVar) {
        this.a = 8;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ void b(int i, Object obj, String str) {
        throw new IllegalArgumentException((str + obj + ((char) i)).toString());
    }

    public static /* synthetic */ void d(int i, String str) {
        throw new IllegalArgumentException(str + i);
    }

    public static /* synthetic */ void e(int i, StringBuilder sb) {
        sb.append(i);
        throw new IndexOutOfBoundsException(sb.toString());
    }

    public static /* synthetic */ void g(String str) throws IOException {
        throw new IOException(str);
    }

    public static /* synthetic */ void h(String str, Object obj) {
        throw new IllegalArgumentException(str + obj);
    }

    public static /* synthetic */ void i(String str, Object obj, Object obj2) {
        throw new IllegalArgumentException(str + obj + obj2);
    }

    public static /* synthetic */ void j(Throwable th) {
        throw new RuntimeException(th);
    }

    public static /* synthetic */ void k(String str) {
        throw new UnsupportedOperationException(str);
    }

    public static /* synthetic */ void l(String str, Object obj) throws IOException {
        throw new IOException(str + obj);
    }

    public static /* synthetic */ void m(String str, Object obj) {
        throw new IllegalStateException((str + obj).toString());
    }

    public static /* synthetic */ void o(String str, Object obj) {
        throw new IllegalStateException(str + obj);
    }

    private final void p(boolean z) {
        File[] fileArrListFiles;
        if (z) {
            synchronized (dc2.b) {
                try {
                    f94 f94Var = f94.a;
                    if (mme.c()) {
                        dq1.F();
                    }
                    if (dc2.c != null) {
                        Log.w("dc2", "Already enabled!");
                    } else {
                        dc2 dc2Var = new dc2(Thread.getDefaultUncaughtExceptionHandler());
                        dc2.c = dc2Var;
                        Thread.setDefaultUncaughtExceptionHandler(dc2Var);
                    }
                } catch (Throwable th) {
                    throw th;
                }
            }
            if (na4.b(ka4.CrashShield)) {
                flb.n = true;
                if (mme.c() && !epe.H()) {
                    File fileU = xz5.U();
                    if (fileU == null) {
                        fileArrListFiles = new File[0];
                    } else {
                        fileArrListFiles = fileU.listFiles(new fc2(7));
                        if (fileArrListFiles == null) {
                            fileArrListFiles = new File[0];
                        }
                    }
                    ArrayList arrayList = new ArrayList();
                    for (File file : fileArrListFiles) {
                        z36 z36VarQ = vv2.Q(file);
                        if (z36VarQ.a()) {
                            JSONObject jSONObject = new JSONObject();
                            try {
                                jSONObject.put("crash_shield", z36VarQ.toString());
                                String str = ff5.j;
                                arrayList.add(xz5.h0(null, String.format("%s/instruments", Arrays.copyOf(new Object[]{f94.b()}, 1)), jSONObject, new a4(2, z36VarQ)));
                            } catch (JSONException unused) {
                            }
                        }
                    }
                    if (!arrayList.isEmpty()) {
                        hf5 hf5Var = new hf5(arrayList);
                        String str2 = ff5.j;
                        hk7.D(hf5Var);
                        new gf5(hf5Var).executeOnExecutor(f94.c(), new Void[0]);
                    }
                }
                ec2.b = true;
            }
            na4.b(ka4.ThreadCheck);
        }
    }

    @Override // defpackage.ha4
    public void c(boolean z) {
        File[] fileArrListFiles;
        int i = 1;
        switch (this.a) {
            case 23:
                p(z);
                return;
            case 24:
                if (z) {
                    f94 f94Var = f94.a;
                    if (!mme.c() || epe.H()) {
                        return;
                    }
                    File fileU = xz5.U();
                    if (fileU == null) {
                        fileArrListFiles = new File[0];
                    } else {
                        fileArrListFiles = fileU.listFiles(new fc2(4));
                        fileArrListFiles.getClass();
                    }
                    ArrayList arrayList = new ArrayList();
                    for (File file : fileArrListFiles) {
                        file.getClass();
                        p14 p14Var = new p14();
                        String name = file.getName();
                        name.getClass();
                        p14Var.a = name;
                        JSONObject jSONObjectS0 = xz5.s0(name);
                        if (jSONObjectS0 != null) {
                            p14Var.c = Long.valueOf(jSONObjectS0.optLong("timestamp", 0L));
                            p14Var.b = jSONObjectS0.optString("error_message", null);
                        }
                        if (p14Var.b != null && p14Var.c != null) {
                            arrayList.add(p14Var);
                        }
                    }
                    eu1.m0(arrayList, new g(6));
                    JSONArray jSONArray = new JSONArray();
                    for (int i2 = 0; i2 < arrayList.size() && i2 < 1000; i2++) {
                        jSONArray.put(arrayList.get(i2));
                    }
                    xz5.v0("error_reports", jSONArray, new a4(i, arrayList));
                    return;
                }
                return;
            default:
                if (z) {
                    AtomicBoolean atomicBoolean = i.a;
                    synchronized (i.class) {
                        Set set = ec2.a;
                        if (set.contains(i.class)) {
                            return;
                        }
                        try {
                            if (i.a.getAndSet(true)) {
                                return;
                            }
                            f94 f94Var2 = f94.a;
                            if (mme.c()) {
                                i.a();
                            }
                            int i3 = f.a;
                            if (!set.contains(f.class)) {
                                try {
                                    f.b.scheduleWithFixedDelay(f.d, 0L, 500L, TimeUnit.MILLISECONDS);
                                } catch (Throwable th) {
                                    ec2.a(f.class, th);
                                }
                            }
                            break;
                        } catch (Throwable th2) {
                            ec2.a(i.class, th2);
                        }
                        return;
                    }
                }
                return;
        }
    }

    @Override // defpackage.dz1
    public Object f(iq1 iq1Var) {
        switch (this.a) {
            case 0:
                return FirebaseInstallationsRegistrar.lambda$getComponents$0(iq1Var);
            case 3:
                return FirebaseSessionsRegistrar.getComponents$lambda$0(iq1Var);
            default:
                return FirebaseSessionsRegistrar.getComponents$lambda$1(iq1Var);
        }
    }

    @Override // defpackage.o92
    public Object m0(jrg jrgVar) throws IOException {
        Object obj;
        synchronized (jrgVar.a) {
            vp7.r("Task is not yet complete", jrgVar.c);
            if (jrgVar.d) {
                throw new CancellationException("Task is already canceled.");
            }
            boolean zIsInstance = IOException.class.isInstance(jrgVar.f);
            Exception exc = jrgVar.f;
            if (zIsInstance) {
                throw ((Throwable) IOException.class.cast(exc));
            }
            if (exc != null) {
                throw new RuntimeExecutionException(exc);
            }
            obj = jrgVar.e;
        }
        Bundle bundle = (Bundle) obj;
        if (bundle == null) {
            g("SERVICE_NOT_AVAILABLE");
            return null;
        }
        String string = bundle.getString("registration_id");
        if (string != null) {
            return string;
        }
        String string2 = bundle.getString("unregistered");
        if (string2 != null) {
            return string2;
        }
        String string3 = bundle.getString("error");
        if ("RST".equals(string3)) {
            g("INSTANCE_ID_RESET");
            return null;
        }
        if (string3 != null) {
            g(string3);
            return null;
        }
        Log.w("FirebaseMessaging", "Unexpected response: " + bundle, new Throwable());
        g("SERVICE_NOT_AVAILABLE");
        return null;
    }

    public /* synthetic */ ik4(int i) {
        this.a = i;
    }
}
