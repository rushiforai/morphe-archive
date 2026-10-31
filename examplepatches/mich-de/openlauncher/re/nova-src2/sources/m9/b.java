package m9;

import ai.a1;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.os.Bundle;
import android.os.RemoteException;
import java.util.List;

/* loaded from: classes2.dex */
public final class b extends a {

    /* renamed from: a, reason: collision with root package name */
    public int f76082a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final Context f76083b;

    /* renamed from: c, reason: collision with root package name */
    public zf.c f76084c;

    /* renamed from: d, reason: collision with root package name */
    public a1 f76085d;

    public b(Context context) {
        this.f76083b = context.getApplicationContext();
    }

    @Override // m9.a
    public final void a() {
        this.f76082a = 3;
        a1 a1Var = this.f76085d;
        if (a1Var != null) {
            this.f76083b.unbindService(a1Var);
            this.f76085d = null;
        }
        this.f76084c = null;
    }

    @Override // m9.a
    public final d b() throws RemoteException {
        if (!c()) {
            throw new IllegalStateException("Service not connected. Please start a connection before using the service.");
        }
        Bundle bundle = new Bundle();
        bundle.putString("package_name", this.f76083b.getPackageName());
        try {
            return new d(((zf.a) this.f76084c).T(bundle));
        } catch (RemoteException e3) {
            io.sentry.config.a.N("RemoteException getting install referrer information");
            this.f76082a = 0;
            throw e3;
        }
    }

    public final boolean c() {
        return (this.f76082a != 2 || this.f76084c == null || this.f76085d == null) ? false : true;
    }

    public final void d(c cVar) {
        ServiceInfo serviceInfo;
        if (c()) {
            cVar.onInstallReferrerSetupFinished(0);
            return;
        }
        int i5 = this.f76082a;
        if (i5 == 1) {
            io.sentry.config.a.N("Client is already in the process of connecting to the service.");
            cVar.onInstallReferrerSetupFinished(3);
            return;
        }
        if (i5 == 3) {
            io.sentry.config.a.N("Client was already closed and can't be reused. Please create another instance.");
            cVar.onInstallReferrerSetupFinished(3);
            return;
        }
        Intent intent = new Intent("com.google.android.finsky.BIND_GET_INSTALL_REFERRER_SERVICE");
        intent.setComponent(new ComponentName("com.android.vending", "com.google.android.finsky.externalreferrer.GetInstallReferrerService"));
        Context context = this.f76083b;
        List<ResolveInfo> listQueryIntentServices = context.getPackageManager().queryIntentServices(intent, 0);
        if (listQueryIntentServices == null || listQueryIntentServices.isEmpty() || (serviceInfo = listQueryIntentServices.get(0).serviceInfo) == null) {
            this.f76082a = 0;
            cVar.onInstallReferrerSetupFinished(2);
            return;
        }
        String str = serviceInfo.packageName;
        String str2 = serviceInfo.name;
        if ("com.android.vending".equals(str) && str2 != null) {
            try {
                if (context.getPackageManager().getPackageInfo("com.android.vending", 128).versionCode >= 80837300) {
                    Intent intent2 = new Intent(intent);
                    a1 a1Var = new a1(this, cVar);
                    this.f76085d = a1Var;
                    try {
                        if (context.bindService(intent2, a1Var, 1)) {
                            return;
                        }
                        io.sentry.config.a.N("Connection to service is blocked.");
                        this.f76082a = 0;
                        cVar.onInstallReferrerSetupFinished(1);
                        return;
                    } catch (SecurityException unused) {
                        io.sentry.config.a.N("No permission to connect to service.");
                        this.f76082a = 0;
                        cVar.onInstallReferrerSetupFinished(4);
                        return;
                    }
                }
            } catch (PackageManager.NameNotFoundException unused2) {
            }
        }
        io.sentry.config.a.N("Play Store missing or incompatible. Version 8.3.73 or later required.");
        this.f76082a = 0;
        cVar.onInstallReferrerSetupFinished(2);
    }
}
