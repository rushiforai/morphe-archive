package x80;

import androidx.compose.ui.node.LayoutNode;
import java.io.InterruptedIOException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public ExecutorService f95597a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayDeque f95598b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayDeque f95599c;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayDeque f95600d;

    public r() {
        this.f95598b = new ArrayDeque();
        this.f95599c = new ArrayDeque();
        this.f95600d = new ArrayDeque();
    }

    public final void a(ArrayDeque arrayDeque, Object obj) {
        synchronized (this) {
            if (!arrayDeque.remove(obj)) {
                throw new AssertionError("Call wasn't in-flight!");
            }
            Unit unit = Unit.f71706a;
        }
        c();
    }

    public final void b(b90.g gVar) {
        gVar.f17680b.decrementAndGet();
        a(this.f95599c, gVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x005d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c() {
        int size;
        int i5;
        ExecutorService executorService;
        byte[] bArr = y80.c.f96853a;
        ArrayList arrayList = new ArrayList();
        synchronized (this) {
            try {
                Iterator it = this.f95598b.iterator();
                Intrinsics.f(it, "readyAsyncCalls.iterator()");
                while (it.hasNext()) {
                    b90.g gVar = (b90.g) it.next();
                    if (this.f95599c.size() >= 64) {
                        break;
                    }
                    if (gVar.f17680b.get() < 5) {
                        it.remove();
                        gVar.f17680b.incrementAndGet();
                        arrayList.add(gVar);
                        this.f95599c.add(gVar);
                    }
                }
                synchronized (this) {
                    this.f95599c.size();
                    this.f95600d.size();
                }
                size = arrayList.size();
                for (i5 = 0; i5 < size; i5++) {
                    b90.g gVar2 = (b90.g) arrayList.get(i5);
                    synchronized (this) {
                        try {
                            if (this.f95597a == null) {
                                TimeUnit timeUnit = TimeUnit.SECONDS;
                                SynchronousQueue synchronousQueue = new SynchronousQueue();
                                String name = y80.c.f96859g + " Dispatcher";
                                Intrinsics.g(name, "name");
                                this.f95597a = new ThreadPoolExecutor(0, LayoutNode.NotPlacedPlaceOrder, 60L, timeUnit, synchronousQueue, new y80.b(name, false));
                            }
                            executorService = this.f95597a;
                            Intrinsics.d(executorService);
                        } finally {
                        }
                    }
                    gVar2.getClass();
                    b90.j jVar = gVar2.f17681c;
                    byte[] bArr2 = y80.c.f96853a;
                    try {
                        try {
                            executorService.execute(gVar2);
                        } catch (RejectedExecutionException e3) {
                            InterruptedIOException interruptedIOException = new InterruptedIOException("executor rejected");
                            interruptedIOException.initCause(e3);
                            jVar.h(interruptedIOException);
                            gVar2.f17679a.onFailure(jVar, interruptedIOException);
                            jVar.f17684a.f95458a.b(gVar2);
                        }
                    } catch (Throwable th2) {
                        jVar.f17684a.f95458a.b(gVar2);
                        throw th2;
                    }
                }
            } catch (Throwable th3) {
                throw th3;
            }
        }
        Unit unit = Unit.f71706a;
        size = arrayList.size();
        while (i5 < size) {
        }
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public r(ExecutorService executorService) {
        this();
        Intrinsics.g(executorService, "executorService");
        this.f95597a = executorService;
    }
}
