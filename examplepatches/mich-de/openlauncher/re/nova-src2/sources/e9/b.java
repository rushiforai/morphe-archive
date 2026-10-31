package e9;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.webkit.WebView;
import com.afollestad.materialdialogs.internal.MDButton;
import com.afollestad.materialdialogs.internal.MDRootLayout;

/* loaded from: classes2.dex */
public final class b implements ViewTreeObserver.OnScrollChangedListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ViewGroup f52278a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f52279b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ MDRootLayout f52280c;

    public b(MDRootLayout mDRootLayout, ViewGroup viewGroup, boolean z11) {
        this.f52280c = mDRootLayout;
        this.f52278a = viewGroup;
        this.f52279b = z11;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x003f  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x008c  */
    @Override // android.view.ViewTreeObserver.OnScrollChangedListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onScrollChanged() {
        boolean z11;
        boolean z12;
        boolean z13;
        MDRootLayout mDRootLayout = this.f52280c;
        MDButton[] mDButtonArr = mDRootLayout.f20164e;
        int length = mDButtonArr.length;
        boolean z14 = false;
        int i5 = 0;
        while (true) {
            if (i5 >= length) {
                z11 = false;
                break;
            }
            MDButton mDButton = mDButtonArr[i5];
            if (mDButton != null && mDButton.getVisibility() != 8) {
                z11 = true;
                break;
            }
            i5++;
        }
        ViewGroup viewGroup = this.f52278a;
        boolean z15 = viewGroup instanceof WebView;
        boolean z16 = this.f52279b;
        if (z15) {
            WebView webView = (WebView) viewGroup;
            if (z16) {
                View view = mDRootLayout.f20160a;
                if (view == null || view.getVisibility() == 8) {
                    z13 = false;
                    mDRootLayout.f20162c = z13;
                } else {
                    if (webView.getPaddingTop() + webView.getScrollY() > 0) {
                        z13 = true;
                    }
                    mDRootLayout.f20162c = z13;
                }
            }
            if (z11) {
                if ((webView.getMeasuredHeight() + webView.getScrollY()) - webView.getPaddingBottom() < webView.getScale() * webView.getContentHeight()) {
                    z14 = true;
                }
            }
            mDRootLayout.f20163d = z14;
        } else {
            if (z16 && viewGroup.getChildCount() > 0) {
                View view2 = mDRootLayout.f20160a;
                if (view2 == null || view2.getVisibility() == 8) {
                    z12 = false;
                    mDRootLayout.f20162c = z12;
                } else {
                    if (viewGroup.getPaddingTop() + viewGroup.getScrollY() > viewGroup.getChildAt(0).getTop()) {
                        z12 = true;
                    }
                    mDRootLayout.f20162c = z12;
                }
            }
            if (viewGroup.getChildCount() > 0) {
                if (z11) {
                    if ((viewGroup.getHeight() + viewGroup.getScrollY()) - viewGroup.getPaddingBottom() < viewGroup.getChildAt(viewGroup.getChildCount() - 1).getBottom()) {
                        z14 = true;
                    }
                }
                mDRootLayout.f20163d = z14;
            }
        }
        mDRootLayout.invalidate();
    }
}
