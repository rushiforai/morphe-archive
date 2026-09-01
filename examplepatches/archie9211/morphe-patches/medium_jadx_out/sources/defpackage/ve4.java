package defpackage;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import com.facebook.FacebookException;
import java.util.Arrays;
import java.util.Set;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ve4 implements Runnable {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ Context b;
    public final /* synthetic */ String c;
    public final /* synthetic */ String d;

    public /* synthetic */ ve4(Context context, String str, String str2) {
        this.b = context;
        this.c = str;
        this.d = str2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        JSONObject jSONObject;
        final int i = 0;
        switch (this.a) {
            case 0:
                String str = this.c;
                Context context = this.b;
                String str2 = this.d;
                str.getClass();
                we4 we4Var = we4.a;
                JSONObject jSONObjectA = we4.a();
                if (jSONObjectA.length() != 0) {
                    we4.e(str, jSONObjectA);
                    context.getSharedPreferences("com.facebook.internal.preferences.APP_GATEKEEPERS", 0).edit().putString(str2, jSONObjectA.toString()).apply();
                    we4.e = Long.valueOf(System.currentTimeMillis());
                }
                we4.f();
                we4.b.set(false);
                return;
            default:
                Context context2 = this.b;
                String str3 = this.c;
                String str4 = this.d;
                af4 af4Var = af4.a;
                SharedPreferences sharedPreferences = context2.getSharedPreferences("com.facebook.internal.preferences.APP_SETTINGS", 0);
                xe4 xe4VarE = null;
                String string = sharedPreferences.getString(str3, null);
                if (!epe.J(string)) {
                    if (string == null) {
                        ygf.f("Required value was null.");
                        return;
                    }
                    try {
                        jSONObject = new JSONObject(string);
                    } catch (JSONException unused) {
                        f94 f94Var = f94.a;
                        jSONObject = null;
                    }
                    if (jSONObject != null) {
                        xe4VarE = af4.e(str4, jSONObject);
                    }
                    break;
                }
                JSONObject jSONObjectA2 = af4.a();
                af4.e(str4, jSONObjectA2);
                sharedPreferences.edit().putString(str3, jSONObjectA2.toString()).apply();
                final int i2 = 1;
                if (xe4VarE != null) {
                    String str5 = xe4VarE.i;
                    if (!af4.f && str5.length() > 0) {
                        af4.f = true;
                        Log.w("af4", str5);
                    }
                }
                we4 we4Var2 = we4.a;
                JSONObject jSONObjectA3 = we4.a();
                f94.a().getSharedPreferences("com.facebook.internal.preferences.APP_GATEKEEPERS", 0).edit().putString(String.format("com.facebook.internal.APP_GATEKEEPERS.%s", Arrays.copyOf(new Object[]{str4}, 1)), jSONObjectA3.toString()).apply();
                we4.e(str4, jSONObjectA3);
                md5 md5Var = wk0.a;
                Context contextA = f94.a();
                final String strB = f94.b();
                if (mme.c()) {
                    if (contextA instanceof Application) {
                        Application application = (Application) contextA;
                        String str6 = g50.c;
                        if (!f94.q.get()) {
                            throw new FacebookException("The Facebook sdk must be initialized before calling activateApp");
                        }
                        if (!zj.c) {
                            if (g50.b() == null) {
                                o7f.z();
                            }
                            ScheduledThreadPoolExecutor scheduledThreadPoolExecutorB = g50.b();
                            if (scheduledThreadPoolExecutorB == null) {
                                ygf.f("Required value was null.");
                                return;
                            }
                            scheduledThreadPoolExecutorB.execute(new e(4));
                        }
                        iae iaeVar = iae.a;
                        if (!ec2.a.contains(iae.class)) {
                            try {
                                if (!iae.c.get()) {
                                    iae.a.b();
                                    break;
                                }
                            } catch (Throwable th) {
                                ec2.a(iae.class, th);
                            }
                        }
                        Set set = ec2.a;
                        if (!set.contains(f94.class)) {
                            try {
                                final Context applicationContext = application.getApplicationContext();
                                if (applicationContext != null) {
                                    if (!we4.b("app_events_killswitch", f94.b(), false)) {
                                        f94.c().execute(new Runnable() { // from class: e94
                                            @Override // java.lang.Runnable
                                            public final void run() {
                                                switch (i) {
                                                    case 0:
                                                        Context context3 = applicationContext;
                                                        String str7 = strB;
                                                        f94 f94Var2 = f94.a;
                                                        if (ec2.a.contains(f94Var2)) {
                                                            return;
                                                        }
                                                        try {
                                                            ra0 ra0VarL = m40.L(context3);
                                                            SharedPreferences sharedPreferences2 = context3.getSharedPreferences("com.facebook.sdk.attributionTracking", 0);
                                                            String strConcat = str7.concat("ping");
                                                            long j = sharedPreferences2.getLong(strConcat, 0L);
                                                            try {
                                                                JSONObject jSONObjectA4 = i50.a(h50.MOBILE_INSTALL_EVENT, ra0VarL, kyd.T(context3), f94.f(context3), context3);
                                                                String str8 = g50.c;
                                                                String strW = o7f.w();
                                                                if (strW != null) {
                                                                    jSONObjectA4.put("install_referrer", strW);
                                                                }
                                                                String str9 = String.format("%s/activities", Arrays.copyOf(new Object[]{str7}, 1));
                                                                f94.t.getClass();
                                                                String str10 = ff5.j;
                                                                ff5 ff5VarH0 = xz5.h0(null, str9, jSONObjectA4, null);
                                                                if (j == 0 && ff5VarH0.c().c == null) {
                                                                    SharedPreferences.Editor editorEdit = sharedPreferences2.edit();
                                                                    editorEdit.putLong(strConcat, System.currentTimeMillis());
                                                                    editorEdit.apply();
                                                                    z46 z46Var = f87.b;
                                                                    z46.q(i87.APP_EVENTS, "f94", "MOBILE_APP_INSTALL has been logged");
                                                                    return;
                                                                }
                                                                return;
                                                            } catch (JSONException e) {
                                                                throw new FacebookException("An error occurred while publishing install.", e);
                                                            }
                                                        } catch (Exception unused2) {
                                                            return;
                                                        } catch (Throwable th2) {
                                                            ec2.a(f94Var2, th2);
                                                            return;
                                                        }
                                                    default:
                                                        Context context4 = applicationContext;
                                                        String str11 = strB;
                                                        Set set2 = ec2.a;
                                                        if (set2.contains(ar8.class)) {
                                                            return;
                                                        }
                                                        try {
                                                            SharedPreferences sharedPreferences3 = context4.getSharedPreferences("com.facebook.sdk.attributionTracking", 0);
                                                            String strConcat2 = str11.concat("pingForOnDevice");
                                                            if (sharedPreferences3.getLong(strConcat2, 0L) == 0) {
                                                                y3b y3bVar = y3b.b;
                                                                if (!set2.contains(y3b.class)) {
                                                                    try {
                                                                        y3b.b.x(v3b.MOBILE_APP_INSTALL, str11, ey3.a);
                                                                    } catch (Throwable th3) {
                                                                        ec2.a(y3b.class, th3);
                                                                    }
                                                                    break;
                                                                }
                                                                SharedPreferences.Editor editorEdit2 = sharedPreferences3.edit();
                                                                editorEdit2.putLong(strConcat2, System.currentTimeMillis());
                                                                editorEdit2.apply();
                                                                return;
                                                            }
                                                            return;
                                                        } catch (Throwable th4) {
                                                            ec2.a(ar8.class, th4);
                                                            return;
                                                        }
                                                }
                                            }
                                        });
                                    }
                                    if (na4.b(ka4.OnDeviceEventProcessing) && ar8.a() && !set.contains(ar8.class)) {
                                        try {
                                            final Context contextA2 = f94.a();
                                            f94.c().execute(new Runnable() { // from class: e94
                                                @Override // java.lang.Runnable
                                                public final void run() {
                                                    switch (i2) {
                                                        case 0:
                                                            Context context3 = contextA2;
                                                            String str7 = strB;
                                                            f94 f94Var2 = f94.a;
                                                            if (ec2.a.contains(f94Var2)) {
                                                                return;
                                                            }
                                                            try {
                                                                ra0 ra0VarL = m40.L(context3);
                                                                SharedPreferences sharedPreferences2 = context3.getSharedPreferences("com.facebook.sdk.attributionTracking", 0);
                                                                String strConcat = str7.concat("ping");
                                                                long j = sharedPreferences2.getLong(strConcat, 0L);
                                                                try {
                                                                    JSONObject jSONObjectA4 = i50.a(h50.MOBILE_INSTALL_EVENT, ra0VarL, kyd.T(context3), f94.f(context3), context3);
                                                                    String str8 = g50.c;
                                                                    String strW = o7f.w();
                                                                    if (strW != null) {
                                                                        jSONObjectA4.put("install_referrer", strW);
                                                                    }
                                                                    String str9 = String.format("%s/activities", Arrays.copyOf(new Object[]{str7}, 1));
                                                                    f94.t.getClass();
                                                                    String str10 = ff5.j;
                                                                    ff5 ff5VarH0 = xz5.h0(null, str9, jSONObjectA4, null);
                                                                    if (j == 0 && ff5VarH0.c().c == null) {
                                                                        SharedPreferences.Editor editorEdit = sharedPreferences2.edit();
                                                                        editorEdit.putLong(strConcat, System.currentTimeMillis());
                                                                        editorEdit.apply();
                                                                        z46 z46Var = f87.b;
                                                                        z46.q(i87.APP_EVENTS, "f94", "MOBILE_APP_INSTALL has been logged");
                                                                        return;
                                                                    }
                                                                    return;
                                                                } catch (JSONException e) {
                                                                    throw new FacebookException("An error occurred while publishing install.", e);
                                                                }
                                                            } catch (Exception unused2) {
                                                                return;
                                                            } catch (Throwable th2) {
                                                                ec2.a(f94Var2, th2);
                                                                return;
                                                            }
                                                        default:
                                                            Context context4 = contextA2;
                                                            String str11 = strB;
                                                            Set set2 = ec2.a;
                                                            if (set2.contains(ar8.class)) {
                                                                return;
                                                            }
                                                            try {
                                                                SharedPreferences sharedPreferences3 = context4.getSharedPreferences("com.facebook.sdk.attributionTracking", 0);
                                                                String strConcat2 = str11.concat("pingForOnDevice");
                                                                if (sharedPreferences3.getLong(strConcat2, 0L) == 0) {
                                                                    y3b y3bVar = y3b.b;
                                                                    if (!set2.contains(y3b.class)) {
                                                                        try {
                                                                            y3b.b.x(v3b.MOBILE_APP_INSTALL, str11, ey3.a);
                                                                        } catch (Throwable th3) {
                                                                            ec2.a(y3b.class, th3);
                                                                        }
                                                                        break;
                                                                    }
                                                                    SharedPreferences.Editor editorEdit2 = sharedPreferences3.edit();
                                                                    editorEdit2.putLong(strConcat2, System.currentTimeMillis());
                                                                    editorEdit2.apply();
                                                                    return;
                                                                }
                                                                return;
                                                            } catch (Throwable th4) {
                                                                ec2.a(ar8.class, th4);
                                                                return;
                                                            }
                                                    }
                                                }
                                            });
                                        } catch (Throwable th2) {
                                            ec2.a(ar8.class, th2);
                                        }
                                    }
                                    break;
                                }
                            } catch (Throwable th3) {
                                ec2.a(f94.class, th3);
                            }
                        }
                        u6.c(application, strB);
                        if (na4.b(ka4.GPSPACAProcessing)) {
                            qx8 qx8Var = qx8.a;
                            if (!ec2.a.contains(qx8Var)) {
                                try {
                                    if (!qx8.d) {
                                        qx8.a();
                                    }
                                    if (qx8.c) {
                                        qx8Var.b(strB, "fb_mobile_app_install");
                                        break;
                                    }
                                } catch (Throwable th4) {
                                    ec2.a(qx8Var, th4);
                                }
                            }
                        }
                        if (na4.b(ka4.GPSARATriggers)) {
                            oe5.a.d(strB, new i40("unknown", "MOBILE_INSTALL_EVENT", null, null, false, u6.k == 0, u6.b(), null));
                        }
                    } else {
                        Log.w("wk0", "Automatic logging of basic events will not happen, because FacebookSdk.getApplicationContext() returns object that is not instance of android.app.Application. Make sure you call FacebookSdk.sdkInitialize() from Application class and pass application context.");
                    }
                }
                af4.d.set(af4.c.containsKey(str4) ? ze4.SUCCESS : ze4.ERROR);
                af4Var.j();
                return;
        }
    }

    public /* synthetic */ ve4(String str, Context context, String str2) {
        this.c = str;
        this.b = context;
        this.d = str2;
    }
}
