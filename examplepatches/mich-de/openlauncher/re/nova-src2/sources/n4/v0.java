package n4;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.util.Log;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class v0 implements Iterable {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f77873a = new ArrayList();

    /* renamed from: b, reason: collision with root package name */
    public final Context f77874b;

    public v0(Context context) {
        this.f77874b = context;
    }

    public static v0 d(m.m mVar) {
        return new v0(mVar);
    }

    public final void b(ComponentName componentName) {
        Context context = this.f77874b;
        ArrayList arrayList = this.f77873a;
        int size = arrayList.size();
        try {
            for (Intent intentB = f.b(context, componentName); intentB != null; intentB = f.b(context, intentB.getComponent())) {
                arrayList.add(size, intentB);
            }
        } catch (PackageManager.NameNotFoundException e3) {
            Log.e("TaskStackBuilder", "Bad ComponentName while traversing activity parent metadata");
            throw new IllegalArgumentException(e3);
        }
    }

    public final void c(m.m mVar) {
        Intent supportParentActivityIntent = mVar.getSupportParentActivityIntent();
        if (supportParentActivityIntent == null) {
            supportParentActivityIntent = f.c(mVar);
        }
        if (supportParentActivityIntent != null) {
            ComponentName component = supportParentActivityIntent.getComponent();
            if (component == null) {
                component = supportParentActivityIntent.resolveActivity(this.f77874b.getPackageManager());
            }
            b(component);
            this.f77873a.add(supportParentActivityIntent);
        }
    }

    public final void e() {
        ArrayList arrayList = this.f77873a;
        if (arrayList.isEmpty()) {
            throw new IllegalStateException("No intents added to TaskStackBuilder; cannot startActivities");
        }
        Intent[] intentArr = (Intent[]) arrayList.toArray(new Intent[0]);
        intentArr[0] = new Intent(intentArr[0]).addFlags(268484608);
        this.f77874b.startActivities(intentArr, null);
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return this.f77873a.iterator();
    }
}
