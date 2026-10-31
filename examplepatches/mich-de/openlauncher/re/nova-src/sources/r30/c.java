package r30;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import mc0.d;
import q4.k;

/* loaded from: classes4.dex */
public final class c implements b {

    /* renamed from: a, reason: collision with root package name */
    public final String f85475a;

    /* renamed from: b, reason: collision with root package name */
    public final int f85476b;

    public /* synthetic */ c(String str, int i5) {
        this.f85476b = i5;
        this.f85475a = str;
    }

    @Override // r30.b
    public Drawable e(Context context) throws PackageManager.NameNotFoundException {
        ApplicationInfo applicationInfo;
        Resources resourcesForApplication;
        int i5 = this.f85476b;
        String str = this.f85475a;
        String packageName = TextUtils.isEmpty(str) ? context.getPackageName() : str;
        if ("android".equals(packageName)) {
            resourcesForApplication = Resources.getSystem();
        } else {
            PackageManager packageManager = context.getPackageManager();
            try {
                applicationInfo = packageManager.getApplicationInfo(packageName, UserMetadata.MAX_INTERNAL_KEY_SIZE);
            } catch (PackageManager.NameNotFoundException e3) {
                mc0.b bVar = d.f76206a;
                bVar.r("IconCompatResource");
                bVar.f(e3, "Unable to find pkg=%s for icon %s", packageName, this);
            }
            resourcesForApplication = applicationInfo != null ? packageManager.getResourcesForApplication(applicationInfo) : null;
        }
        if (resourcesForApplication == null) {
            return null;
        }
        try {
            Resources.Theme theme = context.getTheme();
            ThreadLocal threadLocal = k.f83638a;
            return resourcesForApplication.getDrawable(i5, theme);
        } catch (RuntimeException e11) {
            mc0.b bVar2 = d.f76206a;
            bVar2.r("IconCompatResource");
            bVar2.f(e11, "Unable to load resource 0x%08x from pkg=%s", Integer.valueOf(i5), str);
            return null;
        }
    }
}
