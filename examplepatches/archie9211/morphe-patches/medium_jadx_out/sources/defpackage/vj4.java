package defpackage;

import android.util.Log;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vj4 implements pm0 {
    public static final AtomicReference a = new AtomicReference();

    @Override // defpackage.pm0
    public final void a(boolean z) {
        synchronized (xj4.k) {
            try {
                for (xj4 xj4Var : new ArrayList(xj4.l.values())) {
                    if (xj4Var.e.get()) {
                        Log.d("FirebaseApp", "Notifying background state change listeners.");
                        Iterator it2 = xj4Var.i.iterator();
                        while (it2.hasNext()) {
                            xj4 xj4Var2 = ((uj4) it2.next()).a;
                            if (!z) {
                                ((fz2) xj4Var2.h.get()).b();
                            }
                        }
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
