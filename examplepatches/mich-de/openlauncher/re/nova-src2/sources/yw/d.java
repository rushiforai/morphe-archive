package yw;

import android.os.Build;
import android.os.Bundle;
import com.stripe.hcaptcha.HCaptchaStateListener;

/* loaded from: classes4.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final ww.e f97672a = new ww.e(17);

    public static zw.c a(Bundle bundle) {
        return (zw.c) (Build.VERSION.SDK_INT >= 33 ? bundle.getSerializable("hCaptchaConfig", zw.c.class) : bundle.getSerializable("hCaptchaConfig"));
    }

    public static zw.d b(Bundle bundle) {
        return (zw.d) (Build.VERSION.SDK_INT >= 33 ? bundle.getSerializable("hCaptchaInternalConfig", zw.d.class) : bundle.getSerializable("hCaptchaInternalConfig"));
    }

    public static HCaptchaStateListener c(Bundle bundle) {
        return (HCaptchaStateListener) vm.d.i(bundle, "hCaptchaDialogListener", HCaptchaStateListener.class);
    }
}
