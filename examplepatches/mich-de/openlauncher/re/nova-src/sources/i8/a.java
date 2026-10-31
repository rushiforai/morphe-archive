package i8;

import aosp.android.widget.ProgressBar;

/* loaded from: classes2.dex */
public final class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f61436a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ProgressBar f61437b;

    public /* synthetic */ a(ProgressBar progressBar, int i5) {
        this.f61436a = i5;
        this.f61437b = progressBar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f61436a) {
            case 0:
                this.f61437b.sendAccessibilityEvent(4);
                return;
            default:
                synchronized (this.f61437b) {
                    try {
                        int size = this.f61437b.C.size();
                        for (int i5 = 0; i5 < size; i5++) {
                            c cVar = (c) this.f61437b.C.get(i5);
                            this.f61437b.c(cVar.f61453a, cVar.f61454b, cVar.f61455c, true, cVar.f61456d);
                            c.f61452e.n(cVar);
                        }
                        this.f61437b.C.clear();
                        this.f61437b.A = false;
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return;
        }
    }
}
