package defpackage;

import android.os.Trace;
import android.view.Choreographer;
import android.view.View;
import java.util.PriorityQueue;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vr implements cz9, View.OnAttachStateChangeListener, Runnable, Choreographer.FrameCallback {
    public static long h;
    public final View a;
    public boolean c;
    public boolean f;
    public long g;
    public final PriorityQueue b = new PriorityQueue(11, new g(1));
    public final Choreographer d = Choreographer.getInstance();
    public final ur e = new ur();

    /* JADX WARN: Removed duplicated region for block: B:10:0x0040  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public vr(android.view.View r6) {
        /*
            r5 = this;
            r5.<init>()
            r5.a = r6
            java.util.PriorityQueue r0 = new java.util.PriorityQueue
            g r1 = new g
            r2 = 1
            r1.<init>(r2)
            r3 = 11
            r0.<init>(r3, r1)
            r5.b = r0
            android.view.Choreographer r0 = android.view.Choreographer.getInstance()
            r5.d = r0
            ur r0 = new ur
            r0.<init>()
            r5.e = r0
            long r0 = defpackage.vr.h
            r3 = 0
            int r0 = (r0 > r3 ? 1 : (r0 == r3 ? 0 : -1))
            if (r0 != 0) goto L49
            android.view.Display r0 = r6.getDisplay()
            boolean r1 = r6.isInEditMode()
            if (r1 != 0) goto L40
            if (r0 == 0) goto L40
            float r0 = r0.getRefreshRate()
            r1 = 1106247680(0x41f00000, float:30.0)
            int r1 = (r0 > r1 ? 1 : (r0 == r1 ? 0 : -1))
            if (r1 < 0) goto L40
            goto L42
        L40:
            r0 = 1114636288(0x42700000, float:60.0)
        L42:
            r1 = 1315859240(0x4e6e6b28, float:1.0E9)
            float r1 = r1 / r0
            long r0 = (long) r1
            defpackage.vr.h = r0
        L49:
            r6.addOnAttachStateChangeListener(r5)
            boolean r6 = r6.isAttachedToWindow()
            if (r6 == 0) goto L54
            r5.f = r2
        L54:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vr.<init>(android.view.View):void");
    }

    @Override // defpackage.cz9
    public final void a(az9 az9Var) {
        this.b.add(new d1a(1, az9Var));
        if (this.c) {
            return;
        }
        this.c = true;
        this.a.post(this);
    }

    public final boolean b() {
        ur urVar = this.e;
        long jA = urVar.a();
        nm.N(jA, "compose:lazy:prefetch:available_time_nanos");
        boolean z = true;
        if (jA > 0) {
            PriorityQueue priorityQueue = this.b;
            Object objPeek = priorityQueue.peek();
            objPeek.getClass();
            if (!((d1a) objPeek).b.c(urVar)) {
                priorityQueue.poll();
                z = false;
            }
            urVar.a = false;
        }
        return z;
    }

    @Override // android.view.Choreographer.FrameCallback
    public final void doFrame(long j) {
        if (this.f) {
            this.g = j;
            this.a.post(this);
        }
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        this.f = true;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        this.f = false;
        this.a.removeCallbacks(this);
        this.d.removeFrameCallback(this);
    }

    @Override // java.lang.Runnable
    public final void run() {
        PriorityQueue priorityQueue = this.b;
        if (!priorityQueue.isEmpty() && this.c && this.f) {
            View view = this.a;
            if (view.getWindowVisibility() == 0) {
                long nanos = TimeUnit.MILLISECONDS.toNanos(view.getDrawingTime());
                boolean z = System.nanoTime() > (2 * h) + nanos;
                ur urVar = this.e;
                urVar.a = z;
                urVar.b = Math.max(this.g, nanos) + h;
                boolean zB = false;
                while (!priorityQueue.isEmpty() && !zB) {
                    if (urVar.a) {
                        Trace.beginSection("compose:lazy:prefetch:idle_frame");
                        try {
                            zB = b();
                        } finally {
                            Trace.endSection();
                        }
                    } else {
                        zB = b();
                    }
                }
                if (zB) {
                    this.d.postFrameCallback(this);
                } else {
                    this.c = false;
                }
                nm.N(0L, "compose:lazy:prefetch:available_time_nanos");
                return;
            }
        }
        this.c = false;
    }
}
