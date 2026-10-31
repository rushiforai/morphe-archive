package ads_mobile_sdk;

import android.content.Context;
import android.content.pm.PackageManager;
import android.util.Log;
import com.amazon.privacypass.PrivacyPass;
import com.amazon.privacypass.VerificationContext;
import com.amazon.privacypass.callback.AttestAPICallback;
import com.tiktok.util.UrlConst;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes2.dex */
public final class lm0 implements b.h5 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f6275a;

    /* renamed from: b, reason: collision with root package name */
    public final mm0 f6276b;

    public lm0(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("Application context cannot be null");
        }
        this.f6275a = context;
        this.f6276b = mm0.a(context);
    }

    public final void a(c7 c7Var) {
        boolean zHasSystemFeature;
        boolean zBooleanValue;
        Map map;
        mm0 mm0Var = this.f6276b;
        if (mm0Var.f7275b != null) {
            zBooleanValue = mm0Var.f7275b.booleanValue();
        } else {
            synchronized (mm0Var) {
                try {
                    if (mm0Var.f7275b != null) {
                        zHasSystemFeature = mm0Var.f7275b.booleanValue();
                    } else {
                        if (!mm0Var.a()) {
                            mm0Var.f7275b = Boolean.FALSE;
                            return;
                        }
                        try {
                            PackageManager packageManager = mm0Var.f7276c.getPackageManager();
                            if (packageManager == null) {
                                mm0Var.f7275b = Boolean.FALSE;
                                return;
                            } else {
                                zHasSystemFeature = packageManager.hasSystemFeature("com.amazon.privacypass");
                                mm0Var.f7275b = Boolean.valueOf(zHasSystemFeature);
                            }
                        } catch (SecurityException e3) {
                            Log.e("OMIDLIB", "Security exception when checking attestation capability", e3);
                            mm0Var.f7275b = Boolean.FALSE;
                            return;
                        } catch (Exception e11) {
                            Log.e("OMIDLIB", "Unexpected error when checking attestation capability", e11);
                            mm0Var.f7275b = Boolean.FALSE;
                            return;
                        }
                    }
                    zBooleanValue = zHasSystemFeature;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        if (zBooleanValue && (map = (Map) c7Var.f1694a) != null) {
            String str = (String) map.get("verifierurl");
            String str2 = (String) ((Map) c7Var.f1694a).get("version");
            if (str2 == null || str2.trim().isEmpty()) {
                str2 = "1.0";
            }
            if (str == null || str.trim().isEmpty()) {
                return;
            }
            try {
                new URL(str);
                if (!str.startsWith(UrlConst.HTTPS)) {
                    if (!str.startsWith("http://")) {
                        return;
                    }
                }
                try {
                    if (this.f6275a == null) {
                        return;
                    }
                    PrivacyPass.getInstance(this.f6275a).attest(new VerificationContext(Collections.singletonList(str)), (AttestAPICallback) null, str2);
                } catch (IllegalArgumentException e12) {
                    Log.e("OMIDLIB", "Attestation failed: Invalid input parameters", e12);
                } catch (Exception e13) {
                    Log.e("OMIDLIB", "Attestation failed: unexpected error", e13);
                }
            } catch (MalformedURLException unused) {
            }
        }
    }
}
