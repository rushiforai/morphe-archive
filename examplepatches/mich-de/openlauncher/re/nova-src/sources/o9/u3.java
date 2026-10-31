package o9;

import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Build;
import com.android.launcher3.LauncherWallpaperPickerActivity;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public final class u3 extends y3 {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f80176c;

    public /* synthetic */ u3(int i5) {
        this.f80176c = i5;
    }

    @Override // o9.y3
    public final void c(LauncherWallpaperPickerActivity launcherWallpaperPickerActivity) {
        boolean z11;
        switch (this.f80176c) {
            case 0:
                launcherWallpaperPickerActivity.onBackPressed();
                break;
            default:
                Intent intent = new Intent("android.intent.action.GET_CONTENT");
                intent.setType("image/*");
                if (v30.a.f92040d && "samsung".equalsIgnoreCase(Build.MANUFACTURER)) {
                    PackageManager packageManager = launcherWallpaperPickerActivity.getApplicationContext().getPackageManager();
                    List<ResolveInfo> listQueryIntentActivities = packageManager.queryIntentActivities(intent, 0);
                    if (listQueryIntentActivities == null || listQueryIntentActivities.size() <= 0) {
                        z11 = false;
                    } else {
                        Iterator<ResolveInfo> it = listQueryIntentActivities.iterator();
                        z11 = false;
                        while (it.hasNext()) {
                            ActivityInfo activityInfo = it.next().activityInfo;
                            if (activityInfo != null && "com.android.documentsui".equals(activityInfo.packageName)) {
                                z11 = true;
                            }
                        }
                    }
                    if (!z11) {
                        intent.setClassName("com.android.documentsui", "com.android.documentsui.DocumentsActivity");
                        List<ResolveInfo> listQueryIntentActivities2 = packageManager.queryIntentActivities(intent, 0);
                        if (listQueryIntentActivities2 == null || listQueryIntentActivities2.size() <= 0) {
                            intent.setComponent(null);
                        }
                    }
                }
                launcherWallpaperPickerActivity.r0(5, intent);
                break;
        }
    }
}
