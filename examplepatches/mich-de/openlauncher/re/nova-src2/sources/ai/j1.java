package ai;

import android.os.Process;
import java.util.concurrent.BlockingQueue;

/* loaded from: classes3.dex */
public final class j1 extends Thread {

    /* renamed from: a, reason: collision with root package name */
    public final Object f13024a;

    /* renamed from: b, reason: collision with root package name */
    public final BlockingQueue f13025b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f13026c = false;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ k1 f13027d;

    public j1(k1 k1Var, String str, BlockingQueue blockingQueue) {
        this.f13027d = k1Var;
        sg.w.h(blockingQueue);
        this.f13024a = new Object();
        this.f13025b = blockingQueue;
        setName(str);
    }

    public final void a() {
        k1 k1Var = this.f13027d;
        synchronized (k1Var.f13075i) {
            try {
                if (!this.f13026c) {
                    k1Var.f13076j.release();
                    k1Var.f13075i.notifyAll();
                    if (this == k1Var.f13069c) {
                        k1Var.f13069c = null;
                    } else if (this == k1Var.f13070d) {
                        k1Var.f13070d = null;
                    } else {
                        o0 o0Var = ((m1) k1Var.f13368a).f13138f;
                        m1.l(o0Var);
                        o0Var.f13190f.a("Current scheduler thread is neither worker nor network");
                    }
                    this.f13026c = true;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() throws InterruptedException {
        boolean z11 = false;
        while (!z11) {
            try {
                this.f13027d.f13076j.acquire();
                z11 = true;
            } catch (InterruptedException e3) {
                o0 o0Var = ((m1) this.f13027d.f13368a).f13138f;
                m1.l(o0Var);
                o0Var.f13193i.b(e3, String.valueOf(getName()).concat(" was interrupted"));
            }
        }
        try {
            int threadPriority = Process.getThreadPriority(Process.myTid());
            while (true) {
                BlockingQueue blockingQueue = this.f13025b;
                i1 i1Var = (i1) blockingQueue.poll();
                if (i1Var != null) {
                    Process.setThreadPriority(true != i1Var.f13008b ? 10 : threadPriority);
                    i1Var.run();
                } else {
                    Object obj = this.f13024a;
                    synchronized (obj) {
                        if (blockingQueue.peek() == null) {
                            this.f13027d.getClass();
                            try {
                                obj.wait(30000L);
                            } catch (InterruptedException e11) {
                                o0 o0Var2 = ((m1) this.f13027d.f13368a).f13138f;
                                m1.l(o0Var2);
                                o0Var2.f13193i.b(e11, String.valueOf(getName()).concat(" was interrupted"));
                            }
                        }
                    }
                    synchronized (this.f13027d.f13075i) {
                        if (this.f13025b.peek() == null) {
                            a();
                            a();
                            return;
                        }
                    }
                }
            }
        } catch (Throwable th2) {
            a();
            throw th2;
        }
    }
}
