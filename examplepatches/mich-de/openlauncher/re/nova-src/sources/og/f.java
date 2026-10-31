package og;

import android.os.Bundle;
import android.util.Log;
import com.google.android.gms.cloudmessaging.zzt;
import fi.j;

/* loaded from: classes3.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final int f80398a;

    /* renamed from: b, reason: collision with root package name */
    public final j f80399b = new j();

    /* renamed from: c, reason: collision with root package name */
    public final int f80400c;

    /* renamed from: d, reason: collision with root package name */
    public final Bundle f80401d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f80402e;

    public f(int i5, int i11, Bundle bundle, int i12) {
        this.f80402e = i12;
        this.f80398a = i5;
        this.f80400c = i11;
        this.f80401d = bundle;
    }

    public final boolean a() {
        switch (this.f80402e) {
            case 0:
                return true;
            default:
                return false;
        }
    }

    public final void b(Bundle bundle) {
        if (Log.isLoggable("MessengerIpcClient", 3)) {
            new StringBuilder(toString().length() + 16 + String.valueOf(bundle).length());
        }
        this.f80399b.a(bundle);
    }

    public final void c(zzt zztVar) {
        if (Log.isLoggable("MessengerIpcClient", 3)) {
            new StringBuilder(toString().length() + 14 + zztVar.toString().length());
        }
        this.f80399b.f55135a.v(zztVar);
    }

    public final String toString() {
        int i5 = this.f80400c;
        int length = String.valueOf(i5).length();
        int i11 = this.f80398a;
        int length2 = String.valueOf(i11).length();
        boolean zA = a();
        StringBuilder sb2 = new StringBuilder(length + 19 + length2 + 8 + String.valueOf(zA).length() + 1);
        sb2.append("Request { what=");
        sb2.append(i5);
        sb2.append(" id=");
        sb2.append(i11);
        sb2.append(" oneWay=");
        sb2.append(zA);
        sb2.append("}");
        return sb2.toString();
    }
}
