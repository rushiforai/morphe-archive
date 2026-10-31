package ai;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import b.c9;
import com.amplitude.core.events.Plan;
import com.google.android.play.core.hsdp.service.HsdpDeepLinkServiceFactory;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class k4 implements qh.b, tk.l {

    /* renamed from: a, reason: collision with root package name */
    public final Context f13083a;

    public /* synthetic */ k4(Context context, byte b11) {
        this.f13083a = context;
    }

    @Override // tk.m
    public Object a() {
        return this.f13083a;
    }

    public void b() {
        e10.g2 g2Var = e10.a3.f51435a;
        if (!g2Var.f51552h || g2Var.f51547c) {
            g2Var.f51547c = false;
            g2Var.b(UUID.randomUUID().hashCode());
        }
        if (g2Var.f51552h) {
            return;
        }
        g2Var.f51552h = true;
        c9.q(g2Var.f51545a, "nova_prime", true);
        g2Var.onSharedPreferenceChanged(g2Var.f51545a, "_all");
    }

    public boolean c(ko.a spec) {
        Intrinsics.g(spec, "spec");
        Intent intent = new Intent();
        String str = spec.f71661a;
        if (str != null) {
            intent.setAction(str);
        }
        String str2 = spec.f71662b;
        if (str2 != null) {
            intent.setData(Uri.parse(str2));
        }
        String str3 = spec.f71665e;
        if (str3 != null) {
            intent.setType(str3);
        }
        String str4 = spec.f71664d;
        if (str4 != null) {
            intent.setPackage(str4);
        }
        Iterator it = spec.f71663c.iterator();
        while (it.hasNext()) {
            intent.addCategory((String) it.next());
        }
        Intrinsics.f(this.f13083a.getPackageManager().queryIntentActivities(intent, 0), "queryIntentActivities(...)");
        return !r3.isEmpty();
    }

    public void d(int i5) throws PackageManager.NameNotFoundException {
        String installerPackageName;
        String str;
        boolean z11 = mx.h1.f77108b;
        StringBuilder sb2 = new StringBuilder();
        sb2.append(z11);
        sb2.append(" ");
        o30.b bVar = mx.h1.f77111e;
        if (bVar != null && bVar.l() != null) {
            String str2 = o30.a.f79461h;
        }
        PackageManager packageManager = this.f13083a.getPackageManager();
        String strSubstring = null;
        try {
            installerPackageName = packageManager.getInstallerPackageName("com.teslacoilsw.launcher.prime");
        } catch (Exception unused) {
            installerPackageName = null;
        }
        try {
            packageManager.getPackageInfo(new t40.a(new long[]{6117112061083267321L, -7106421703487206295L, 7178631550397697369L}).f88524a, UserMetadata.MAX_INTERNAL_KEY_SIZE);
            installerPackageName = null;
        } catch (PackageManager.NameNotFoundException unused2) {
        }
        try {
            packageManager.getPackageInfo(new t40.a(new long[]{5878118542243349746L, 8217141465753154512L, 2642224280714520322L, -9119439120642886619L, 6746300614801872325L, 537734709973098676L, -3686722389832371537L, -2157756718794532171L}).f88524a, UserMetadata.MAX_INTERNAL_KEY_SIZE);
            installerPackageName = null;
        } catch (PackageManager.NameNotFoundException unused3) {
        }
        if (!mx.h1.f77109c) {
            installerPackageName = null;
        }
        if (i5 != 110 && i5 != 111 && i5 != 114) {
            try {
                o30.b bVar2 = mx.h1.f77111e;
                if (bVar2 != null && bVar2.l() != null && (str = o30.a.f79461h) != null) {
                    strSubstring = str.substring(0, 1);
                    Intrinsics.f(strSubstring, "substring(...)");
                }
                if (!"1".equals(strSubstring) || installerPackageName != null) {
                    return;
                }
            } catch (Exception unused4) {
                return;
            }
        }
        e10.g2 g2Var = e10.a3.f51435a;
        if (g2Var.f51545a.contains("1")) {
            g2Var.b(0);
            mx.h1.f77107a = -2147483648L;
            c9.q(g2Var.f51545a, "nova_prime", false);
            Context context = mx.g0.f77088a;
            if (mx.g0.m()) {
                Context contextE = mx.g0.e();
                Map mapJ0 = MapsKt.j0(new Pair("lvl_reason", Integer.valueOf(i5)), new Pair("has_prime_apk", Boolean.valueOf(mx.h1.f77108b)), new Pair("direct_license", Boolean.valueOf(o30.i.d(contextE))));
                zy.c cVar = zy.c.f98823a;
                cy.d0 d0Var = cy.d0.f48442a;
                boolean z12 = contextE.getSharedPreferences("nova_billing", 0).getBoolean("subscription_active", false);
                long jZ = cy.d0.z(contextE);
                MapBuilder mapBuilder = new MapBuilder();
                mapBuilder.put(Plan.AMP_PLAN_SOURCE, "lvl_dont_allow");
                mapBuilder.put("subscription_active", Boolean.valueOf(z12));
                mapBuilder.put("last_verified_age_h", Long.valueOf(jZ));
                mapBuilder.putAll(mapJ0);
                zy.c.i("prime_revoked", mapBuilder.b());
            }
            lh.i iVar = mx.g0.f77095h;
            aa.o oVar = mx.h1.f77113g;
            iVar.removeCallbacks(oVar);
            iVar.postDelayed(oVar, 0L);
        }
    }

    public f5.f e() throws PackageManager.NameNotFoundException {
        String string;
        Context context = this.f13083a;
        PackageInfo packageInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE);
        ArrayList arrayList = new ArrayList();
        ServiceInfo[] serviceInfoArr = packageInfo.services;
        if (serviceInfoArr != null) {
            for (ServiceInfo serviceInfo : serviceInfoArr) {
                Bundle bundle = serviceInfo.metaData;
                if (bundle != null && (string = bundle.getString("androidx.credentials.CREDENTIAL_PROVIDER_KEY")) != null) {
                    arrayList.add(string);
                }
            }
        }
        List listI1 = b70.g.I1(arrayList);
        if (listI1.isEmpty()) {
            return null;
        }
        Iterator it = listI1.iterator();
        f5.f fVar = null;
        while (it.hasNext()) {
            try {
                Object objNewInstance = Class.forName((String) it.next()).getConstructor(Context.class).newInstance(context);
                Intrinsics.e(objNewInstance, "null cannot be cast to non-null type androidx.credentials.CredentialProvider");
                f5.f fVar2 = (f5.f) objNewInstance;
                if (!fVar2.isAvailableOnDevice()) {
                    continue;
                } else {
                    if (fVar != null) {
                        Log.i("CredProviderFactory", "Only one active OEM CredentialProvider allowed");
                        return null;
                    }
                    fVar = fVar2;
                }
            } catch (Throwable unused) {
            }
        }
        return fVar;
    }

    @Override // qh.b
    public Object zza() {
        return mk.v.U(this.f13083a, HsdpDeepLinkServiceFactory.createHsdpServiceIntent());
    }

    public k4(Context context, int i5) {
        switch (i5) {
            case 1:
                Intrinsics.g(context, "context");
                this.f13083a = context;
                break;
            default:
                sg.w.h(context);
                Context applicationContext = context.getApplicationContext();
                sg.w.h(applicationContext);
                this.f13083a = applicationContext;
                break;
        }
    }
}
