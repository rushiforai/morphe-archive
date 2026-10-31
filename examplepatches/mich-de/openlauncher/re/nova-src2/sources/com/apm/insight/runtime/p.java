package com.apm.insight.runtime;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;

/* loaded from: classes.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    private final HandlerThread f21928a;

    /* renamed from: d, reason: collision with root package name */
    private volatile Handler f21931d;

    /* renamed from: b, reason: collision with root package name */
    private final Queue<c> f21929b = new ConcurrentLinkedQueue();

    /* renamed from: c, reason: collision with root package name */
    private final Queue<Message> f21930c = new ConcurrentLinkedQueue();

    /* renamed from: e, reason: collision with root package name */
    private final Object f21932e = new Object();

    public class a implements Runnable {
        public a() {
        }

        @Override // java.lang.Runnable
        public final void run() {
            while (!p.this.f21930c.isEmpty()) {
                if (p.this.f21931d != null) {
                    try {
                        p.this.f21931d.sendMessageAtFrontOfQueue((Message) p.this.f21930c.poll());
                    } catch (Throwable unused) {
                    }
                }
            }
            while (!p.this.f21929b.isEmpty()) {
                c cVar = (c) p.this.f21929b.poll();
                if (p.this.f21931d != null) {
                    try {
                        p.this.f21931d.sendMessageAtTime(cVar.f21937a, cVar.f21938b);
                    } catch (Throwable unused2) {
                    }
                }
            }
        }
    }

    public class b extends HandlerThread {

        /* renamed from: a, reason: collision with root package name */
        private volatile int f21934a;

        /* renamed from: b, reason: collision with root package name */
        private volatile boolean f21935b;

        public b(String str) {
            super(str);
            this.f21934a = 0;
            this.f21935b = false;
        }

        @Override // android.os.HandlerThread
        public final void onLooperPrepared() {
            super.onLooperPrepared();
            synchronized (p.this.f21932e) {
                p.this.f21931d = new Handler();
            }
            p.this.f21931d.post(p.this.new a());
            while (true) {
                try {
                    Looper.loop();
                } catch (Throwable th2) {
                    try {
                        com.apm.insight.b.f.a(com.apm.insight.e.g()).a().c();
                        if (this.f21934a < 5) {
                            com.apm.insight.c.a();
                            j.a(th2, "NPTH_CATCH");
                        } else if (!this.f21935b) {
                            this.f21935b = true;
                            com.apm.insight.c.a();
                            j.a(new RuntimeException(), "NPTH_ERR_MAX");
                        }
                        this.f21934a++;
                    } catch (Throwable unused) {
                    }
                }
            }
        }
    }

    public static class c {

        /* renamed from: a, reason: collision with root package name */
        Message f21937a;

        /* renamed from: b, reason: collision with root package name */
        long f21938b;

        public c(Message message, long j11) {
            this.f21937a = message;
            this.f21938b = j11;
        }
    }

    static {
        new Object() { // from class: com.apm.insight.runtime.p.1
        };
        new Object() { // from class: com.apm.insight.runtime.p.2
        };
    }

    public p(String str) {
        this.f21928a = new b(str);
    }

    public final void b() {
        this.f21928a.start();
    }

    public final HandlerThread c() {
        return this.f21928a;
    }

    private Message b(Runnable runnable) {
        return Message.obtain(this.f21931d, runnable);
    }

    public final Handler a() {
        return this.f21931d;
    }

    private boolean b(Message message, long j11) {
        if (this.f21931d == null) {
            synchronized (this.f21932e) {
                try {
                    if (this.f21931d == null) {
                        this.f21929b.add(new c(message, j11));
                        return true;
                    }
                } finally {
                }
            }
        }
        try {
            return this.f21931d.sendMessageAtTime(message, j11);
        } catch (Throwable unused) {
            return true;
        }
    }

    public final boolean a(Runnable runnable) {
        return a(b(runnable), 0L);
    }

    public final boolean a(Runnable runnable, long j11) {
        return a(b(runnable), j11);
    }

    private boolean a(Message message, long j11) {
        if (j11 < 0) {
            j11 = 0;
        }
        return b(message, SystemClock.uptimeMillis() + j11);
    }
}
