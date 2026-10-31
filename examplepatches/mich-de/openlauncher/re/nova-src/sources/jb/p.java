package jb;

import android.os.SystemClock;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class p {

    /* renamed from: c, reason: collision with root package name */
    public static final boolean f69421c = q.f69424a;

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f69422a = new ArrayList();

    /* renamed from: b, reason: collision with root package name */
    public boolean f69423b = false;

    public final synchronized void a(long j11, String str) {
        if (this.f69423b) {
            throw new IllegalStateException("Marker added to finished log");
        }
        this.f69422a.add(new o(str, j11, SystemClock.elapsedRealtime()));
    }

    public final synchronized void b(String str) {
        long j11;
        this.f69423b = true;
        ArrayList arrayList = this.f69422a;
        if (arrayList.size() == 0) {
            j11 = 0;
        } else {
            j11 = ((o) arrayList.get(arrayList.size() - 1)).f69420c - ((o) arrayList.get(0)).f69420c;
        }
        if (j11 <= 0) {
            return;
        }
        long j12 = ((o) this.f69422a.get(0)).f69420c;
        q.a("(%-4d ms) %s", Long.valueOf(j11), str);
        Iterator it = this.f69422a.iterator();
        while (it.hasNext()) {
            o oVar = (o) it.next();
            long j13 = oVar.f69420c;
            q.a("(+%-4d) [%2d] %s", Long.valueOf(j13 - j12), Long.valueOf(oVar.f69419b), oVar.f69418a);
            j12 = j13;
        }
    }

    public final void finalize() {
        if (this.f69423b) {
            return;
        }
        b("Request on the loose");
        q.b("Marker log finalized without finish() - uncaught exit point for request", new Object[0]);
    }
}
