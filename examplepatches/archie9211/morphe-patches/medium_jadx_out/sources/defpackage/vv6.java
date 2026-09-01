package defpackage;

import j$.util.DesugarCollections;
import j$.util.concurrent.ConcurrentHashMap;
import java.util.Collections;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vv6 implements h8a {
    public volatile Set a;
    public volatile Set b;

    public final synchronized void a() {
        try {
            Iterator it2 = this.a.iterator();
            while (it2.hasNext()) {
                this.b.add(((h8a) it2.next()).get());
            }
            this.a = null;
        } catch (Throwable th) {
            throw th;
        }
    }

    @Override // defpackage.h8a
    public final Object get() {
        if (this.b == null) {
            synchronized (this) {
                try {
                    if (this.b == null) {
                        this.b = Collections.newSetFromMap(new ConcurrentHashMap());
                        a();
                    }
                } finally {
                }
            }
        }
        return DesugarCollections.unmodifiableSet(this.b);
    }
}
