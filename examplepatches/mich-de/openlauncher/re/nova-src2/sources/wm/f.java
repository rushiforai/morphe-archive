package wm;

import java.util.Iterator;
import java.util.Random;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes.dex */
public final class f implements rg.b {

    /* renamed from: a, reason: collision with root package name */
    public static final AtomicReference f94611a = new AtomicReference();

    @Override // rg.b
    public final void a(boolean z11) {
        Random random = g.f94612j;
        synchronized (g.class) {
            Iterator it = g.f94613k.values().iterator();
            while (it.hasNext()) {
                ((c) it.next()).d(z11);
            }
        }
    }
}
