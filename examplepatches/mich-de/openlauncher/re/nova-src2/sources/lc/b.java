package lc;

import ab.y;
import ab.z;
import ai.h;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Base64;
import com.digitalturbine.ignite.cl.aidl.IIgniteServiceAPI;
import com.fyber.inneractive.sdk.ignite.k;
import io.sentry.android.core.b0;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.concurrent.TimeUnit;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class b implements a {

    /* renamed from: e, reason: collision with root package name */
    public Context f74833e;

    /* renamed from: f, reason: collision with root package name */
    public String f74834f;

    /* renamed from: g, reason: collision with root package name */
    public String f74835g;

    /* renamed from: h, reason: collision with root package name */
    public final String f74836h;

    /* renamed from: i, reason: collision with root package name */
    public b0 f74837i;

    /* renamed from: j, reason: collision with root package name */
    public IIgniteServiceAPI f74838j;
    public c n;
    public c o;

    /* renamed from: a, reason: collision with root package name */
    public boolean f74829a = false;

    /* renamed from: b, reason: collision with root package name */
    public boolean f74830b = false;

    /* renamed from: c, reason: collision with root package name */
    public long f74831c = 0;

    /* renamed from: d, reason: collision with root package name */
    public boolean f74832d = false;

    /* renamed from: k, reason: collision with root package name */
    public final Bundle f74839k = new Bundle();

    /* renamed from: l, reason: collision with root package name */
    public final Object f74840l = new Object();

    /* renamed from: p, reason: collision with root package name */
    public String f74842p = null;

    /* renamed from: q, reason: collision with root package name */
    public final h f74843q = new h(this, 23);

    /* renamed from: m, reason: collision with root package name */
    public final kc.a f74841m = new kc.a(this);

    public b(Context context) {
        String str = null;
        this.f74833e = context.getApplicationContext();
        Intent intent = new Intent("com.digitalturbine.ignite.cl.IgniteRemoteService");
        Context context2 = this.f74833e;
        if (context2 != null) {
            List<ResolveInfo> listQueryIntentServices = context2.getPackageManager().queryIntentServices(intent, 0);
            if (listQueryIntentServices.size() > 0) {
                str = listQueryIntentServices.get(0).serviceInfo.packageName;
            }
        }
        this.f74836h = str;
        this.f74837i = new b0(false, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }

    @Override // lc.a
    public final boolean a() {
        IIgniteServiceAPI iIgniteServiceAPI;
        return this.f74832d && (iIgniteServiceAPI = this.f74838j) != null && iIgniteServiceAPI.asBinder().isBinderAlive();
    }

    @Override // lc.a
    public final void b() {
        if (TextUtils.isEmpty(this.f74836h)) {
            rc.a.b("%s : unable to authenticate - there is no ignite on the device", "IgniteAuthenticationComponent");
            return;
        }
        if (!a()) {
            uc.b.f90789a.execute(this.f74843q);
        } else {
            if (!this.f74829a || f()) {
                l();
                return;
            }
            Object[] objArr = {"IgniteAuthenticationComponent"};
            k kVar = rc.a.f85792b.f85793a;
            if (kVar != null) {
                kVar.i("%s : already authenticated", objArr);
            }
        }
    }

    @Override // lc.a
    public final void c(String str) {
        String str2;
        rc.a.a("%s: onAuthenticationSuccess", "IgniteAuthenticationComponent");
        this.f74830b = false;
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.f74842p = str;
        this.f74839k.putString("clientToken", str);
        this.f74829a = true;
        boolean zIsEmpty = TextUtils.isEmpty(str);
        String str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (zIsEmpty) {
            str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } else {
            try {
                str2 = new String(Base64.decode(str.split("\\.")[1], 8), "UTF-8");
            } catch (Exception e3) {
                rc.a.b("%s : decodeJwtBody : %s", "JwtUtil", e3.toString());
            }
        }
        if (!str2.isEmpty()) {
            try {
                long jOptLong = new JSONObject(str2).optLong("exp");
                this.f74831c = jOptLong;
                long millis = TimeUnit.SECONDS.toMillis(jOptLong);
                try {
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTimeInMillis(millis);
                    str3 = simpleDateFormat.format(calendar.getTime());
                } catch (Exception unused) {
                }
                rc.a.a("%s : Ignite session will exp in: %s", "IgniteAuthenticationComponent", str3);
            } catch (Exception e11) {
                nc.a.a(nc.c.ONE_DT_GENERAL_ERROR, e11);
                rc.a.b("%s: resolveSessionExpiryTime : unable resolve session expiration : %s", "IgniteAuthenticationComponent", e11.toString());
            }
        }
        c cVar = this.n;
        if (cVar != null) {
            cVar.c(str);
        }
    }

    @Override // lc.a
    public final String d() {
        return this.f74836h;
    }

    @Override // lc.a
    public final void destroy() {
        if (this.f74833e != null && a()) {
            this.f74833e.unbindService(this);
            this.f74833e = null;
        }
        this.o = null;
        this.n = null;
        this.f74838j = null;
    }

    @Override // lc.a
    public final String e() {
        return this.f74842p;
    }

    @Override // lc.a
    public final boolean f() {
        return this.f74831c > 0 && TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis()) > this.f74831c;
    }

    @Override // lc.a
    public final Context g() {
        return this.f74833e;
    }

    @Override // lc.a
    public final boolean h() {
        return this.f74829a;
    }

    @Override // lc.a
    public final String i() {
        return this.f74837i.f66850a;
    }

    @Override // lc.a
    public final boolean j() {
        return this.f74837i.f66851b;
    }

    @Override // lc.a
    public final IIgniteServiceAPI k() {
        return this.f74838j;
    }

    public final void l() {
        Bundle bundle = this.f74839k;
        if (a()) {
            String str = this.f74834f;
            String str2 = this.f74835g;
            if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2) || this.f74830b) {
                return;
            }
            if ((f() || !this.f74829a) && this.f74838j != null) {
                try {
                    this.f74830b = true;
                    bundle.putInt("sdkFlowTypeKey", 1);
                    this.f74838j.authenticate(this.f74834f, this.f74835g, bundle, this.f74841m);
                } catch (RemoteException e3) {
                    this.f74830b = false;
                    nc.a.a(nc.c.ONE_DT_AUTHENTICATION_ERROR, e3);
                    rc.a.b("%s: startAuthenticationProcess: unable to start authentication : %s", "IgniteAuthenticationComponent", e3.toString());
                }
            }
        }
    }

    @Override // pc.b
    public final void onCredentialsRequestFailed(String str) {
        rc.a.b("%s: onCredentialsRequestFailed: %s", "IgniteAuthenticationComponent", str);
        b(str);
    }

    @Override // pc.b
    public final void onCredentialsRequestSuccess(String str, String str2) {
        this.f74834f = str;
        this.f74835g = str2;
        l();
    }

    @Override // android.content.ServiceConnection
    public final void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        rc.a.a("%s : onIgniteConnected", "IgniteAuthenticationComponent");
        this.f74838j = IIgniteServiceAPI.Stub.asInterface(iBinder);
        this.f74832d = true;
        uc.b.f90789a.execute(new z(26, this, new y(16, this, componentName, iBinder)));
    }

    @Override // android.content.ServiceConnection
    public final void onServiceDisconnected(ComponentName componentName) {
        this.f74832d = false;
        this.f74831c = 0L;
        b("Service : " + (componentName != null ? componentName.getClassName() : "Ignite") + " disconnected");
    }

    @Override // lc.a
    public final void a(String str) {
        rc.a.b("%s : onAuthenticationFailed : %s", "IgniteAuthenticationComponent", str);
        this.f74830b = false;
        c cVar = this.n;
        if (cVar != null) {
            cVar.a(str);
        }
    }

    @Override // lc.a
    public final void a(c cVar) {
        this.n = cVar;
    }

    @Override // lc.a
    public final void b(String str) {
        rc.a.b("%s : onIgniteFailedToConnect : %s", "IgniteAuthenticationComponent", str);
        c cVar = this.o;
        if (cVar != null) {
            cVar.b(str);
        }
    }

    @Override // lc.a
    public final void b(c cVar) {
        this.o = cVar;
    }

    @Override // lc.a
    public final void c(ComponentName componentName, IBinder iBinder) {
        c cVar = this.o;
        if (cVar != null) {
            cVar.c(componentName, iBinder);
        }
    }

    @Override // lc.a
    public final boolean c() {
        return f() || !a();
    }
}
