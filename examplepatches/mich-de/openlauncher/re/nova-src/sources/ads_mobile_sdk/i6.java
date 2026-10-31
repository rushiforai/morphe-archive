package ads_mobile_sdk;

import android.view.View;
import android.webkit.WebView;
import java.util.Collections;
import java.util.Iterator;

/* loaded from: classes.dex */
public final class i6 extends zj {

    /* renamed from: d, reason: collision with root package name */
    public static final i6 f4638d = new i6();

    /* JADX WARN: Multi-variable type inference failed */
    @Override // ads_mobile_sdk.zj
    public final void a(boolean z11) {
        Iterator it = Collections.unmodifiableCollection(n6.f7447c.f7448a).iterator();
        while (it.hasNext()) {
            o6 o6Var = ((m6) it.next()).f7018d;
            if (o6Var.f7769b.get() != 0) {
                d62.f2192a.a((WebView) o6Var.f7769b.get(), "setState", z11 ? "foregrounded" : "backgrounded", o6Var.f7768a);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // ads_mobile_sdk.zj
    public final boolean b() {
        Iterator it = Collections.unmodifiableCollection(n6.f7447c.f7449b).iterator();
        while (it.hasNext()) {
            View view = (View) ((m6) it.next()).f7017c.get();
            if (view != null && view.hasWindowFocus()) {
                return true;
            }
        }
        return false;
    }
}
