package defpackage;

import android.os.Looper;
import java.util.HashSet;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hjb {
    public final HashSet a = new HashSet();

    public final void a() {
        if (qo7.d == null) {
            qo7.d = Looper.getMainLooper().getThread();
        }
        if (Thread.currentThread() != qo7.d) {
            ygf.f("Must be called on the Main thread.");
            return;
        }
        Iterator it2 = this.a.iterator();
        if (it2.hasNext()) {
            throw ev6.q(it2);
        }
    }
}
