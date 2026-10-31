package jk;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.os.Bundle;
import android.util.Base64;
import android.util.Log;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import kk.m;

/* loaded from: classes3.dex */
public final class h {

    /* renamed from: e, reason: collision with root package name */
    public static final ex.a f69586e = new ex.a("AppUpdateService", 2);

    /* renamed from: f, reason: collision with root package name */
    public static final Intent f69587f = new Intent("com.google.android.play.core.install.BIND_UPDATE_SERVICE").setPackage("com.android.vending");

    /* renamed from: a, reason: collision with root package name */
    public final m f69588a;

    /* renamed from: b, reason: collision with root package name */
    public final String f69589b;

    /* renamed from: c, reason: collision with root package name */
    public final Context f69590c;

    /* renamed from: d, reason: collision with root package name */
    public final i f69591d;

    public h(Context context, i iVar) throws NoSuchAlgorithmException {
        String strEncodeToString;
        this.f69589b = context.getPackageName();
        this.f69590c = context;
        this.f69591d = iVar;
        ex.a aVar = kk.a.f71527a;
        try {
            if (context.getPackageManager().getApplicationInfo("com.android.vending", 0).enabled) {
                Signature[] signatureArr = context.getPackageManager().getPackageInfo("com.android.vending", 64).signatures;
                if (signatureArr == null || (signatureArr.length) == 0) {
                    ex.a aVar2 = kk.a.f71527a;
                    Object[] objArr = new Object[0];
                    if (Log.isLoggable("PlayCore", 5)) {
                        Log.w("PlayCore", ex.a.m(aVar2.f53057b, "Phonesky package is not signed -- possibly self-built package. Could not verify.", objArr));
                        return;
                    } else {
                        aVar2.getClass();
                        return;
                    }
                }
                for (Signature signature : signatureArr) {
                    byte[] byteArray = signature.toByteArray();
                    try {
                        MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
                        messageDigest.update(byteArray);
                        strEncodeToString = Base64.encodeToString(messageDigest.digest(), 11);
                    } catch (NoSuchAlgorithmException unused) {
                        strEncodeToString = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                    if (!"8P1sW0EPJcslw7UzRsiXL64w-O50Ed-RBICtay1g24M".equals(strEncodeToString)) {
                        String str = Build.TAGS;
                        if ((!str.contains("dev-keys") && !str.contains("test-keys")) || !"GXWy8XF3vIml3_MfnmSmyuKBpT3B0dWbHRR_4cgq-gA".equals(strEncodeToString)) {
                        }
                    }
                    Context applicationContext = context.getApplicationContext();
                    this.f69588a = new m(applicationContext != null ? applicationContext : context, f69586e, f69587f);
                    return;
                }
            }
        } catch (PackageManager.NameNotFoundException unused2) {
        }
    }

    public static Bundle a(h hVar, String str) {
        Map map;
        Integer numValueOf;
        Bundle bundle = new Bundle();
        Bundle bundle2 = new Bundle();
        Bundle bundle3 = new Bundle();
        HashMap map2 = kk.g.f71533a;
        synchronized (kk.g.class) {
            try {
                HashMap map3 = kk.g.f71533a;
                if (!map3.containsKey("app_update")) {
                    HashMap map4 = new HashMap();
                    map4.put("java", 11004);
                    map3.put("app_update", map4);
                }
                map = (Map) map3.get("app_update");
            } catch (Throwable th2) {
                throw th2;
            }
        }
        bundle3.putInt("playcore_version_code", ((Integer) map.get("java")).intValue());
        if (map.containsKey("native")) {
            bundle3.putInt("playcore_native_version", ((Integer) map.get("native")).intValue());
        }
        if (map.containsKey("unity")) {
            bundle3.putInt("playcore_unity_version", ((Integer) map.get("unity")).intValue());
        }
        bundle2.putAll(bundle3);
        bundle2.putInt("playcore.version.code", 11004);
        bundle.putAll(bundle2);
        bundle.putString("package.name", str);
        try {
            numValueOf = Integer.valueOf(hVar.f69590c.getPackageManager().getPackageInfo(hVar.f69590c.getPackageName(), 0).versionCode);
        } catch (PackageManager.NameNotFoundException unused) {
            ex.a aVar = f69586e;
            Object[] objArr = new Object[0];
            if (Log.isLoggable("PlayCore", 6)) {
                Log.e("PlayCore", ex.a.m(aVar.f53057b, "The current version of the app could not be retrieved", objArr));
            } else {
                aVar.getClass();
            }
            numValueOf = null;
        }
        if (numValueOf != null) {
            bundle.putInt("app.version.code", numValueOf.intValue());
        }
        return bundle;
    }
}
