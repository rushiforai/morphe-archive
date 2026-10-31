package u20;

import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import mx.p1;

/* loaded from: classes4.dex */
public final class g extends f {

    /* renamed from: d, reason: collision with root package name */
    public Intent f90473d;

    /* renamed from: e, reason: collision with root package name */
    public Intent f90474e;

    /* renamed from: f, reason: collision with root package name */
    public ArrayList f90475f;

    @Override // android.content.AsyncTaskLoader
    public final Object loadInBackground() {
        ArrayList arrayList = this.f90475f;
        try {
            p1.c("loadInBackground");
        } catch (InterruptedException e3) {
            e3.printStackTrace();
        }
        Intent intent = this.f90473d;
        PackageManager packageManager = this.f90471b;
        List<ResolveInfo> listQueryIntentActivities = packageManager.queryIntentActivities(intent, 0);
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = new ArrayList(listQueryIntentActivities.size());
        for (ResolveInfo resolveInfo : listQueryIntentActivities) {
            if (arrayList == null || !arrayList.contains(resolveInfo.activityInfo.packageName)) {
                arrayList3.add(new h(packageManager, resolveInfo));
                arrayList2.add(resolveInfo.activityInfo.packageName);
            }
        }
        Intent intent2 = this.f90474e;
        if (intent2 != null) {
            for (ResolveInfo resolveInfo2 : packageManager.queryIntentActivities(intent2, 0)) {
                if (arrayList == null || !arrayList.contains(resolveInfo2.activityInfo.packageName)) {
                    if (!arrayList2.contains(resolveInfo2.activityInfo.packageName)) {
                        h hVar = new h(packageManager, resolveInfo2);
                        hVar.f90479d = true;
                        arrayList3.add(hVar);
                    }
                }
            }
        }
        if (arrayList3.size() > 1) {
            Collections.sort(arrayList3, new yb.a(1));
        }
        try {
            p1.c("loadInBackground");
        } catch (InterruptedException e11) {
            e11.printStackTrace();
        }
        return arrayList3;
    }
}
