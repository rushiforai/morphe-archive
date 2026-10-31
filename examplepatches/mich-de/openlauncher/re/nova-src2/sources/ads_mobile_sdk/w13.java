package ads_mobile_sdk;

import android.webkit.WebView;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.Iterator;

/* loaded from: classes.dex */
public final class w13 {

    /* renamed from: d, reason: collision with root package name */
    public static final w13 f10993d;

    /* renamed from: a, reason: collision with root package name */
    public WeakReference f10994a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f10995b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f10996c;

    static {
        w13 w13Var = new w13();
        w13Var.f10995b = false;
        w13Var.f10996c = false;
        f10993d = w13Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void a(boolean z11, boolean z12) {
        if ((z12 || z11) == (this.f10996c || this.f10995b)) {
            return;
        }
        Iterator it = Collections.unmodifiableCollection(n6.f7447c.f7448a).iterator();
        while (it.hasNext()) {
            o6 o6Var = ((m6) it.next()).f7018d;
            boolean z13 = z12 || z11;
            if (o6Var.f7769b.get() != 0) {
                d62.f2192a.a((WebView) o6Var.f7769b.get(), "setDeviceLockState", z13 ? "locked" : "unlocked");
            }
        }
    }
}
