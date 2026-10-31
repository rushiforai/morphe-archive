package b90;

import b.c0;
import b.u4;
import java.lang.ref.Reference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.TimeUnit;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final int f17717a;

    /* renamed from: b, reason: collision with root package name */
    public final long f17718b;

    /* renamed from: c, reason: collision with root package name */
    public final a90.c f17719c;

    /* renamed from: d, reason: collision with root package name */
    public final a90.b f17720d;

    /* renamed from: e, reason: collision with root package name */
    public final ConcurrentLinkedQueue f17721e;

    public n(a90.e taskRunner, int i5, long j11) {
        TimeUnit timeUnit = TimeUnit.MINUTES;
        Intrinsics.g(taskRunner, "taskRunner");
        Intrinsics.g(timeUnit, "timeUnit");
        this.f17717a = i5;
        this.f17718b = timeUnit.toNanos(j11);
        this.f17719c = taskRunner.e();
        this.f17720d = new a90.b(this, c0.q(new StringBuilder(), y80.c.f96859g, " ConnectionPool"));
        this.f17721e = new ConcurrentLinkedQueue();
        if (j11 <= 0) {
            throw new IllegalArgumentException(u4.g(j11, "keepAliveDuration <= 0: ").toString());
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x002c A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a(x80.a aVar, j jVar, ArrayList arrayList, boolean z11) {
        Iterator it = this.f17721e.iterator();
        while (true) {
            if (!it.hasNext()) {
                return false;
            }
            m connection = (m) it.next();
            Intrinsics.f(connection, "connection");
            synchronized (connection) {
                if (z11) {
                    try {
                        if (connection.f17708g != null) {
                            if (connection.h(aVar, arrayList)) {
                                jVar.c(connection);
                                return true;
                            }
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                } else if (connection.h(aVar, arrayList)) {
                }
                Unit unit = Unit.f71706a;
            }
        }
    }

    public final int b(m mVar, long j11) {
        byte[] bArr = y80.c.f96853a;
        ArrayList arrayList = mVar.f17715p;
        int i5 = 0;
        while (i5 < arrayList.size()) {
            Reference reference = (Reference) arrayList.get(i5);
            if (reference.get() != null) {
                i5++;
            } else {
                String str = "A connection to " + mVar.f17703b.f95594a.f95393h + " was leaked. Did you forget to close a response body?";
                g90.m mVar2 = g90.m.f57276a;
                g90.m.f57276a.k(((h) reference).f17682a, str);
                arrayList.remove(i5);
                mVar.f17711j = true;
                if (arrayList.isEmpty()) {
                    mVar.f17716q = j11 - this.f17718b;
                    return 0;
                }
            }
        }
        return arrayList.size();
    }
}
