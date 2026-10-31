package u20;

import android.content.Intent;
import android.content.pm.ResolveInfo;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import mx.p1;

/* loaded from: classes4.dex */
public final class j extends f {
    @Override // android.content.AsyncTaskLoader
    public final Object loadInBackground() {
        try {
            p1.c("allapps loadInBackground");
        } catch (InterruptedException e3) {
            e3.printStackTrace();
        }
        List<ResolveInfo> listQueryIntentActivities = this.f90471b.queryIntentActivities(new Intent("android.intent.action.MAIN").addCategory("android.intent.category.LAUNCHER"), 0);
        ArrayList arrayList = new ArrayList(listQueryIntentActivities.size());
        Collections.sort(listQueryIntentActivities, new ct.v(this, new HashMap()));
        for (ResolveInfo resolveInfo : listQueryIntentActivities) {
            String str = resolveInfo.activityInfo.packageName;
            int iconResource = resolveInfo.getIconResource();
            k kVar = new k();
            kVar.f90482a = str;
            kVar.f90483b = iconResource;
            arrayList.add(kVar);
        }
        try {
            p1.c("allapps loadInBackground");
        } catch (InterruptedException e11) {
            e11.printStackTrace();
        }
        return arrayList;
    }
}
