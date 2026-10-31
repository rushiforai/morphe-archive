package mk;

import android.os.Bundle;
import android.util.Log;
import b.c0;

/* loaded from: classes3.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public int f76455a = 1;

    /* renamed from: b, reason: collision with root package name */
    public a f76456b;

    /* renamed from: c, reason: collision with root package name */
    public final String f76457c;

    public l(String str, a aVar) {
        this.f76457c = str;
        this.f76456b = aVar;
    }

    public final boolean a(int i5) {
        int i11 = this.f76455a;
        String str = this.f76457c;
        if (i11 == i5) {
            Log.w("HsdpOverlay", "targetPackage: " + str + " status was already set to " + i5);
            return false;
        }
        if (i11 == 4) {
            Log.w("HsdpOverlay", "targetPackage: " + str + " status was destroyed so cannot be updated");
            return false;
        }
        if (Log.isLoggable("HsdpOverlay", 4)) {
            StringBuilder sbV = c0.v("targetPackage: ", this.f76455a, str, " status: ", "->");
            sbV.append(i5);
            Log.i("HsdpOverlay", sbV.toString());
        }
        if (i5 == 2) {
            Bundle bundle = new Bundle();
            bundle.putString("targetPackage", str);
            this.f76456b.onShown(bundle);
        } else if (i5 == 3) {
            Bundle bundle2 = new Bundle();
            bundle2.putString("targetPackage", str);
            this.f76456b.onDismissed(bundle2);
        } else if (i5 != 4) {
            Bundle bundle3 = new Bundle();
            bundle3.putString("targetPackage", str);
            bundle3.putBoolean("dldpRedirect", true);
            this.f76456b.onDismissed(bundle3);
        } else if (this.f76455a == 2) {
            Bundle bundle4 = new Bundle();
            bundle4.putString("targetPackage", str);
            bundle4.putString("errorMessage", "HSDP overlay destroyed");
            this.f76456b.onDismissed(bundle4);
        }
        this.f76455a = i5;
        return true;
    }

    public final String toString() {
        int i5 = this.f76455a;
        String strValueOf = String.valueOf(this.f76456b);
        StringBuilder sb2 = new StringBuilder("HsdpOverlay{'");
        sb2.append(this.f76457c);
        sb2.append("': ");
        sb2.append(i5);
        sb2.append(", ");
        return c0.q(sb2, strValueOf, "}");
    }
}
