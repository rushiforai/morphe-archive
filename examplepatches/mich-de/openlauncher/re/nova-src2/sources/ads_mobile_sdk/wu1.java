package ads_mobile_sdk;

import android.webkit.WebView;

/* loaded from: classes.dex */
public final class wu1 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final WebView f11413a;

    public wu1(xu1 xu1Var) {
        this.f11413a = xu1Var.f11835e;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f11413a.destroy();
    }
}
