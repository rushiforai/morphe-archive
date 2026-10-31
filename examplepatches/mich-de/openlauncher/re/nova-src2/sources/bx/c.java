package bx;

import android.os.Handler;
import android.os.Looper;
import com.stripe.hcaptcha.HCaptchaException;
import java.util.ArrayList;
import java.util.Iterator;
import yw.e;

/* loaded from: classes4.dex */
public abstract class c {

    /* renamed from: f, reason: collision with root package name */
    public final Handler f18676f = new Handler(Looper.getMainLooper());

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f18673c = new ArrayList();

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f18674d = new ArrayList();

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f18675e = new ArrayList();

    /* renamed from: a, reason: collision with root package name */
    public e f18671a = null;

    /* renamed from: b, reason: collision with root package name */
    public HCaptchaException f18672b = null;

    public final void a() {
        e eVar = this.f18671a;
        boolean z11 = false;
        if (eVar != null) {
            Iterator it = this.f18673c.iterator();
            while (it.hasNext()) {
                ((b) it.next()).onSuccess(eVar);
                z11 = true;
            }
        }
        HCaptchaException hCaptchaException = this.f18672b;
        if (hCaptchaException != null) {
            Iterator it2 = this.f18674d.iterator();
            while (it2.hasNext()) {
                ((a) it2.next()).b(hCaptchaException);
                z11 = true;
            }
        }
        if (z11) {
            this.f18671a = null;
            this.f18672b = null;
        }
    }
}
