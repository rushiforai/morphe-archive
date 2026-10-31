package e9;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.webkit.WebView;
import com.afollestad.materialdialogs.internal.MDRootLayout;

/* loaded from: classes2.dex */
public final class a implements ViewTreeObserver.OnPreDrawListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f52275a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f52276b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ MDRootLayout f52277c;

    public a(MDRootLayout mDRootLayout, View view, boolean z11) {
        this.f52277c = mDRootLayout;
        this.f52275a = view;
        this.f52276b = z11;
    }

    @Override // android.view.ViewTreeObserver.OnPreDrawListener
    public final boolean onPreDraw() {
        View view = this.f52275a;
        if (view.getMeasuredHeight() == 0) {
            return true;
        }
        WebView webView = (WebView) view;
        int i5 = MDRootLayout.f20159s;
        float measuredHeight = webView.getMeasuredHeight();
        float scale = webView.getScale() * webView.getContentHeight();
        boolean z11 = this.f52276b;
        MDRootLayout mDRootLayout = this.f52277c;
        if (measuredHeight < scale) {
            mDRootLayout.a((ViewGroup) view, z11);
        } else {
            if (z11) {
                mDRootLayout.f20162c = false;
            }
            mDRootLayout.f20163d = false;
        }
        view.getViewTreeObserver().removeOnPreDrawListener(this);
        return true;
    }
}
