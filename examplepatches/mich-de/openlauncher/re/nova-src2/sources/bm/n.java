package bm;

import java.util.Collections;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes.dex */
public final class n implements nm.c {

    /* renamed from: a, reason: collision with root package name */
    public volatile Set f18098a;

    /* renamed from: b, reason: collision with root package name */
    public volatile Set f18099b;

    /* JADX WARN: Code restructure failed: missing block: B:20:0x003a, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x003f, code lost:
    
        throw r0;
     */
    @Override // nm.c
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object get() {
        if (this.f18099b == null) {
            synchronized (this) {
                try {
                    if (this.f18099b == null) {
                        this.f18099b = Collections.newSetFromMap(new ConcurrentHashMap());
                        synchronized (this) {
                            Iterator it = this.f18098a.iterator();
                            while (it.hasNext()) {
                                this.f18099b.add(((nm.c) it.next()).get());
                            }
                            this.f18098a = null;
                        }
                    }
                } finally {
                }
            }
        }
        return Collections.unmodifiableSet(this.f18099b);
    }
}
