package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class que {
    public final rue a = new rue();

    public final void a(String str, AutoCloseable autoCloseable) {
        AutoCloseable autoCloseable2;
        rue rueVar = this.a;
        if (rueVar.d) {
            rue.a(autoCloseable);
            return;
        }
        synchronized (rueVar.a) {
            autoCloseable2 = (AutoCloseable) rueVar.b.put(str, autoCloseable);
        }
        rue.a(autoCloseable2);
    }

    public final void b() {
        rue rueVar = this.a;
        if (!rueVar.d) {
            rueVar.d = true;
            synchronized (rueVar.a) {
                try {
                    Iterator it2 = rueVar.b.values().iterator();
                    while (it2.hasNext()) {
                        rue.a((AutoCloseable) it2.next());
                    }
                    Iterator it3 = rueVar.c.iterator();
                    while (it3.hasNext()) {
                        rue.a((AutoCloseable) it3.next());
                    }
                    rueVar.c.clear();
                } catch (Throwable th) {
                    throw th;
                }
            }
        }
        d();
    }

    public final AutoCloseable c(String str) {
        AutoCloseable autoCloseable;
        rue rueVar = this.a;
        synchronized (rueVar.a) {
            autoCloseable = (AutoCloseable) rueVar.b.get(str);
        }
        return autoCloseable;
    }

    public void d() {
    }
}
