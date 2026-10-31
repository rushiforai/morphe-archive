package ul;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes.dex */
public final class e implements rg.b {

    /* renamed from: a, reason: collision with root package name */
    public static final AtomicReference f91315a = new AtomicReference();

    @Override // rg.b
    public final void a(boolean z11) {
        synchronized (g.f91318k) {
            try {
                Iterator it = new ArrayList(g.f91319l.values()).iterator();
                while (it.hasNext()) {
                    g gVar = (g) it.next();
                    if (gVar.f91324e.get()) {
                        Iterator it2 = gVar.f91328i.iterator();
                        while (it2.hasNext()) {
                            g gVar2 = ((d) it2.next()).f91314a;
                            if (!z11) {
                                ((lm.d) gVar2.f91327h.get()).b();
                            }
                        }
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
