package jb;

import android.os.Handler;
import android.os.Looper;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes2.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final AtomicInteger f69403a;

    /* renamed from: b, reason: collision with root package name */
    public final HashSet f69404b;

    /* renamed from: c, reason: collision with root package name */
    public final PriorityBlockingQueue f69405c;

    /* renamed from: d, reason: collision with root package name */
    public final PriorityBlockingQueue f69406d;

    /* renamed from: e, reason: collision with root package name */
    public final com.android.volley.toolbox.d f69407e;

    /* renamed from: f, reason: collision with root package name */
    public final c10.a f69408f;

    /* renamed from: g, reason: collision with root package name */
    public final gu.j f69409g;

    /* renamed from: h, reason: collision with root package name */
    public final e[] f69410h;

    /* renamed from: i, reason: collision with root package name */
    public b f69411i;

    /* renamed from: j, reason: collision with root package name */
    public final ArrayList f69412j;

    /* renamed from: k, reason: collision with root package name */
    public final ArrayList f69413k;

    public j(com.android.volley.toolbox.d dVar, c10.a aVar) {
        gu.j jVar = new gu.j(new Handler(Looper.getMainLooper()));
        this.f69403a = new AtomicInteger();
        this.f69404b = new HashSet();
        this.f69405c = new PriorityBlockingQueue();
        this.f69406d = new PriorityBlockingQueue();
        this.f69412j = new ArrayList();
        this.f69413k = new ArrayList();
        this.f69407e = dVar;
        this.f69408f = aVar;
        this.f69410h = new e[4];
        this.f69409g = jVar;
    }

    public final void a(i iVar) {
        iVar.setRequestQueue(this);
        synchronized (this.f69404b) {
            this.f69404b.add(iVar);
        }
        iVar.setSequence(this.f69403a.incrementAndGet());
        iVar.addMarker("add-to-queue");
        b();
        if (iVar.shouldCache()) {
            this.f69405c.add(iVar);
        } else {
            this.f69406d.add(iVar);
        }
    }

    public final void b() {
        synchronized (this.f69413k) {
            try {
                Iterator it = this.f69413k.iterator();
                if (it.hasNext()) {
                    if (it.next() != null) {
                        throw new ClassCastException();
                    }
                    throw null;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
