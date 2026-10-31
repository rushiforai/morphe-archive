package ads_mobile_sdk;

import android.webkit.WebView;
import java.util.Collections;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class qi0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ float f8682a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ qj3 f8683b;

    public qi0(qj3 qj3Var, float f11) {
        this.f8683b = qj3Var;
        this.f8682a = f11;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.lang.Runnable
    public final void run() {
        p72 p72Var = ((si0) this.f8683b.f8705a).f9569e;
        float f11 = this.f8682a;
        p72Var.f8123a = f11;
        if (p72Var.f8126e == null) {
            p72Var.f8126e = n6.f7447c;
        }
        Iterator it = Collections.unmodifiableCollection(p72Var.f8126e.f7449b).iterator();
        while (it.hasNext()) {
            o6 o6Var = ((m6) it.next()).f7018d;
            d62.f2192a.a((WebView) o6Var.f7769b.get(), "setDeviceVolume", Float.valueOf(f11), o6Var.f7768a);
        }
    }
}
