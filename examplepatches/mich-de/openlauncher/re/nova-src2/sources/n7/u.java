package n7;

import android.content.pm.PackageInfo;
import android.os.Build;
import androidx.webkit.WebViewCompat;
import androidx.webkit.WebViewFeature;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes.dex */
public final class u extends c {

    /* renamed from: d, reason: collision with root package name */
    public final Pattern f77938d;

    public u() {
        super(WebViewFeature.ALGORITHMIC_DARKENING, WebViewFeature.ALGORITHMIC_DARKENING);
        this.f77938d = Pattern.compile("\\A\\d+");
    }

    @Override // n7.c
    public final boolean a() {
        return Build.VERSION.SDK_INT >= 33;
    }

    @Override // n7.c
    public final boolean b() {
        boolean zB = super.b();
        if (!zB || Build.VERSION.SDK_INT >= 29) {
            return zB;
        }
        PackageInfo currentLoadedWebViewPackage = WebViewCompat.getCurrentLoadedWebViewPackage();
        if (currentLoadedWebViewPackage == null) {
            return false;
        }
        Matcher matcher = this.f77938d.matcher(currentLoadedWebViewPackage.versionName);
        return matcher.find() && Integer.parseInt(currentLoadedWebViewPackage.versionName.substring(matcher.start(), matcher.end())) >= 105;
    }
}
