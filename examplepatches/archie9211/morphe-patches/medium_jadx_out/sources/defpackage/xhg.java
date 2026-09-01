package defpackage;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.util.Log;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xhg implements Iterable {
    public final /* synthetic */ int a;
    public final List b;
    public final Object c;

    public xhg(Context context) {
        this.a = 2;
        this.b = new ArrayList();
        this.c = context;
    }

    public void d(ComponentName componentName) {
        Context context = (Context) this.c;
        ArrayList arrayList = (ArrayList) this.b;
        int size = arrayList.size();
        try {
            for (Intent intentB = hp7.B(context, componentName); intentB != null; intentB = hp7.B(context, intentB.getComponent())) {
                arrayList.add(size, intentB);
            }
        } catch (PackageManager.NameNotFoundException e) {
            Log.e("TaskStackBuilder", "Bad ComponentName while traversing activity parent metadata");
            throw new IllegalArgumentException(e);
        }
    }

    public void e() {
        ArrayList arrayList = (ArrayList) this.b;
        if (arrayList.isEmpty()) {
            ygf.f("No intents added to TaskStackBuilder; cannot startActivities");
            return;
        }
        Intent[] intentArr = (Intent[]) arrayList.toArray(new Intent[0]);
        intentArr[0] = new Intent(intentArr[0]).addFlags(268484608);
        ((Context) this.c).startActivities(intentArr, null);
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        int i = this.a;
        Object obj = this.c;
        List list = this.b;
        switch (i) {
            case 0:
                return new aig(list.iterator(), ((List) obj).iterator(), 0);
            case 1:
                return new aig(list.iterator(), ((List) obj).iterator(), 1);
            default:
                return ((ArrayList) list).iterator();
        }
    }

    public /* synthetic */ xhg(Object obj, List list, List list2, int i) {
        this.a = i;
        this.b = list;
        this.c = list2;
    }
}
