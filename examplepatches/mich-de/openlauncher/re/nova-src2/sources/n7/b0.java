package n7;

import android.webkit.WebView;
import androidx.webkit.WebViewStartUpConfig;
import org.chromium.support_lib_boundary.ProfileStoreBoundaryInterface;
import org.chromium.support_lib_boundary.StaticsBoundaryInterface;
import org.chromium.support_lib_boundary.WebViewProviderBoundaryInterface;
import org.chromium.support_lib_boundary.WebkitToCompatConverterBoundaryInterface;

/* loaded from: classes.dex */
public interface b0 {
    void a(WebViewStartUpConfig webViewStartUpConfig, k30.e eVar);

    String[] b();

    WebViewProviderBoundaryInterface createWebView(WebView webView);

    ProfileStoreBoundaryInterface getProfileStore();

    StaticsBoundaryInterface getStatics();

    WebkitToCompatConverterBoundaryInterface getWebkitToCompatConverter();
}
