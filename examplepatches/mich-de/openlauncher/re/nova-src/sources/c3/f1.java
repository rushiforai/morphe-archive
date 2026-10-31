package c3;

import android.view.Choreographer;
import java.util.ArrayList;
import kotlin.Unit;

/* loaded from: classes.dex */
public final class f1 implements Choreographer.FrameCallback, Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ g1 f19278a;

    public f1(g1 g1Var) {
        this.f19278a = g1Var;
    }

    @Override // android.view.Choreographer.FrameCallback
    public final void doFrame(long j11) {
        this.f19278a.f19289d.removeCallbacks(this);
        g1.g0(this.f19278a);
        g1 g1Var = this.f19278a;
        synchronized (g1Var.f19290e) {
            if (g1Var.f19295j) {
                g1Var.f19295j = false;
                ArrayList arrayList = g1Var.f19292g;
                g1Var.f19292g = g1Var.f19293h;
                g1Var.f19293h = arrayList;
                int size = arrayList.size();
                for (int i5 = 0; i5 < size; i5++) {
                    ((Choreographer.FrameCallback) arrayList.get(i5)).doFrame(j11);
                }
                arrayList.clear();
            }
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        g1.g0(this.f19278a);
        g1 g1Var = this.f19278a;
        synchronized (g1Var.f19290e) {
            try {
                if (g1Var.f19292g.isEmpty()) {
                    g1Var.f19288c.removeFrameCallback(this);
                    g1Var.f19295j = false;
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
