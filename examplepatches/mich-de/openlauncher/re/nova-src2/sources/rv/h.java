package rv;

import android.os.Build;
import com.stripe.android.stripe3ds2.init.Warning;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h extends l {

    /* renamed from: b, reason: collision with root package name */
    public static final Warning f86440b = new Warning("SW02", "An emulator is being used to run the App.", m.f86447b);

    @Override // rv.l
    public final boolean a() {
        String FINGERPRINT = Build.FINGERPRINT;
        Intrinsics.f(FINGERPRINT, "FINGERPRINT");
        if (r70.j.I0(FINGERPRINT, "generic", false) || r70.j.I0(FINGERPRINT, "unknown", false)) {
            return true;
        }
        String MODEL = Build.MODEL;
        Intrinsics.f(MODEL, "MODEL");
        if (r70.k.K0(MODEL, "Emulator", false) || r70.k.K0(MODEL, "Android SDK built for x86", false) || r70.k.K0(MODEL, "google_sdk", false)) {
            return true;
        }
        String MANUFACTURER = Build.MANUFACTURER;
        Intrinsics.f(MANUFACTURER, "MANUFACTURER");
        if (r70.k.K0(MANUFACTURER, "Genymotion", false)) {
            return true;
        }
        String BRAND = Build.BRAND;
        Intrinsics.f(BRAND, "BRAND");
        if (r70.j.I0(BRAND, "generic", false)) {
            String DEVICE = Build.DEVICE;
            Intrinsics.f(DEVICE, "DEVICE");
            if (r70.j.I0(DEVICE, "generic", false)) {
                return true;
            }
        }
        return "google_sdk".equals(Build.PRODUCT);
    }
}
