package ads_mobile_sdk;

import a5.i;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.os.Bundle;
import android.util.Base64;
import b.c0;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class tl2 {

    /* renamed from: c, reason: collision with root package name */
    public static final c7 f9987c = new c7("PrewarmService");

    /* renamed from: d, reason: collision with root package name */
    public static final Intent f9988d = new Intent("com.google.android.play.core.prewarm.BIND_PREWARM_SERVICE").setPackage("com.android.vending");

    /* renamed from: a, reason: collision with root package name */
    public final k33 f9989a;

    /* renamed from: b, reason: collision with root package name */
    public final String f9990b;

    public tl2(Context context) throws NoSuchAlgorithmException {
        boolean z11;
        String strEncodeToString;
        c7 c7Var = jf2.f5231a;
        try {
            z11 = context.getPackageManager().getApplicationInfo("com.android.vending", 0).enabled;
            if (!z11) {
                c7Var.b("Play Store package is disabled.", new Object[0]);
            }
        } catch (PackageManager.NameNotFoundException unused) {
            c7Var.b("Play Store package is not found.", new Object[0]);
        }
        if (z11) {
            try {
                Signature[] signatureArr = context.getPackageManager().getPackageInfo("com.android.vending", 64).signatures;
                if (signatureArr == null || signatureArr.length == 0) {
                    c7Var.b("Play Store package is not signed -- possibly self-built package. Could not verify.", new Object[0]);
                } else {
                    ArrayList arrayList = new ArrayList();
                    for (Signature signature : signatureArr) {
                        byte[] byteArray = signature.toByteArray();
                        try {
                            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
                            messageDigest.update(byteArray);
                            strEncodeToString = Base64.encodeToString(messageDigest.digest(), 11);
                        } catch (NoSuchAlgorithmException unused2) {
                            strEncodeToString = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        }
                        arrayList.add(strEncodeToString);
                        if (!"8P1sW0EPJcslw7UzRsiXL64w-O50Ed-RBICtay1g24M".equals(strEncodeToString)) {
                            String str = Build.TAGS;
                            if ((!str.contains("dev-keys") && !str.contains("test-keys")) || !"GXWy8XF3vIml3_MfnmSmyuKBpT3B0dWbHRR_4cgq-gA".equals(strEncodeToString)) {
                            }
                        }
                        this.f9989a = new k33(context.getApplicationContext(), f9987c, f9988d, new i(3));
                        break;
                    }
                    c7Var.b(c0.l("Play Store package certs are not valid. Found these sha256 certs: [", String.join(", ", arrayList), "]."), new Object[0]);
                }
            } catch (PackageManager.NameNotFoundException unused3) {
                c7Var.b("Play Store package is not found.", new Object[0]);
            }
            this.f9989a = null;
        } else {
            this.f9989a = null;
        }
        this.f9990b = context.getPackageName();
    }

    public static ArrayList a(hi2 hi2Var) {
        ArrayList arrayList = new ArrayList();
        Iterator it = new ArrayList(hi2Var.f4399a).iterator();
        while (it.hasNext()) {
            String str = (String) it.next();
            Bundle bundle = new Bundle();
            bundle.putString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str);
            arrayList.add(bundle);
        }
        return arrayList;
    }
}
