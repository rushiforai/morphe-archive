package u20;

import android.content.ComponentName;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;

/* loaded from: classes4.dex */
public final class h extends e {

    /* renamed from: a, reason: collision with root package name */
    public final int f90476a;

    /* renamed from: b, reason: collision with root package name */
    public final ComponentName f90477b;

    /* renamed from: c, reason: collision with root package name */
    public final CharSequence f90478c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f90479d;

    public h(PackageManager packageManager, ResolveInfo resolveInfo) {
        CharSequence charSequenceLoadLabel = resolveInfo.loadLabel(packageManager);
        int iconResource = resolveInfo.getIconResource();
        ActivityInfo activityInfo = resolveInfo.activityInfo;
        ComponentName componentName = new ComponentName(activityInfo.packageName, activityInfo.name);
        this.f90479d = false;
        this.f90478c = charSequenceLoadLabel;
        this.f90476a = iconResource;
        this.f90477b = componentName;
    }

    @Override // u20.e
    public final CharSequence c() {
        return this.f90478c;
    }
}
