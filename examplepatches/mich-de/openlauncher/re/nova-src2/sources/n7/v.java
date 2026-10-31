package n7;

import android.content.pm.PackageInfo;
import android.os.Build;
import androidx.webkit.WebViewCompat;
import androidx.webkit.WebViewFeature;

/* loaded from: classes.dex */
public final class v extends b {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f77939e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ v(String str, String str2, int i5) {
        super(str, str2, 2);
        this.f77939e = i5;
    }

    @Override // n7.c
    public final boolean b() {
        PackageInfo currentLoadedWebViewPackage;
        switch (this.f77939e) {
            case 0:
                if (super.b() && (currentLoadedWebViewPackage = WebViewCompat.getCurrentLoadedWebViewPackage()) != null) {
                    if ((Build.VERSION.SDK_INT >= 28 ? p4.a.c(currentLoadedWebViewPackage) : currentLoadedWebViewPackage.versionCode) >= 636700000) {
                        return true;
                    }
                }
                return false;
            case 1:
                if (super.b() && WebViewFeature.a(WebViewFeature.MULTI_PROCESS)) {
                    return WebViewCompat.isMultiProcessEnabled();
                }
                return false;
            default:
                if (WebViewFeature.a(WebViewFeature.MULTI_PROFILE)) {
                    return super.b();
                }
                return false;
        }
    }
}
