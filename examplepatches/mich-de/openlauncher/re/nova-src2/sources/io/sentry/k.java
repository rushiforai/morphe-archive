package io.sentry;

import java.util.Iterator;
import java.util.List;
import java.util.TimerTask;

/* loaded from: classes4.dex */
public final class k extends TimerTask {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f67362a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l f67363b;

    public /* synthetic */ k(l lVar, int i5) {
        this.f67362a = i5;
        this.f67363b = lVar;
    }

    @Override // java.util.TimerTask, java.lang.Runnable
    public final void run() {
        switch (this.f67362a) {
            case 0:
                Iterator it = this.f67363b.f67377d.iterator();
                while (it.hasNext()) {
                    ((l0) it.next()).a();
                }
                break;
            default:
                long jCurrentTimeMillis = System.currentTimeMillis();
                l lVar = this.f67363b;
                if (jCurrentTimeMillis - lVar.f67382i >= 10) {
                    lVar.f67382i = jCurrentTimeMillis;
                    a2 a2Var = new a2();
                    a2Var.f66739a = null;
                    a2Var.f66740b = null;
                    Iterator it2 = lVar.f67377d.iterator();
                    while (it2.hasNext()) {
                        ((l0) it2.next()).b(a2Var);
                    }
                    Iterator it3 = lVar.f67376c.values().iterator();
                    while (it3.hasNext()) {
                        ((List) it3.next()).add(a2Var);
                    }
                    break;
                }
                break;
        }
    }
}
