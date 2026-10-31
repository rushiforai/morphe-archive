package io.sentry.transport;

import b.u4;
import io.sentry.android.core.l0;
import io.sentry.w3;
import java.io.Closeable;
import java.util.Date;
import java.util.Iterator;
import java.util.Timer;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes4.dex */
public final class m implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    public final d f67813a;

    /* renamed from: b, reason: collision with root package name */
    public final w3 f67814b;

    /* renamed from: c, reason: collision with root package name */
    public final ConcurrentHashMap f67815c;

    /* renamed from: d, reason: collision with root package name */
    public final CopyOnWriteArrayList f67816d;

    /* renamed from: e, reason: collision with root package name */
    public Timer f67817e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f67818f;

    public m(w3 w3Var) {
        d dVar = d.f67797a;
        this.f67815c = new ConcurrentHashMap();
        this.f67816d = new CopyOnWriteArrayList();
        this.f67817e = null;
        this.f67818f = new Object();
        this.f67813a = dVar;
        this.f67814b = w3Var;
    }

    public final void a(io.sentry.i iVar, Date date) {
        Date date2 = (Date) this.f67815c.get(iVar);
        if (date2 == null || date.after(date2)) {
            this.f67815c.put(iVar, date);
            Iterator it = this.f67816d.iterator();
            if (it.hasNext()) {
                throw u4.e(it);
            }
            synchronized (this.f67818f) {
                try {
                    if (this.f67817e == null) {
                        this.f67817e = new Timer(true);
                    }
                    this.f67817e.schedule(new l0(this, 1), date);
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    }

    public final boolean b(io.sentry.i iVar) {
        Date date;
        this.f67813a.getClass();
        Date date2 = new Date(System.currentTimeMillis());
        io.sentry.i iVar2 = io.sentry.i.All;
        ConcurrentHashMap concurrentHashMap = this.f67815c;
        Date date3 = (Date) concurrentHashMap.get(iVar2);
        if (date3 != null && !date2.after(date3)) {
            return true;
        }
        if (io.sentry.i.Unknown.equals(iVar) || (date = (Date) concurrentHashMap.get(iVar)) == null) {
            return false;
        }
        return !date2.after(date);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        synchronized (this.f67818f) {
            try {
                Timer timer = this.f67817e;
                if (timer != null) {
                    timer.cancel();
                    this.f67817e = null;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        this.f67816d.clear();
    }
}
