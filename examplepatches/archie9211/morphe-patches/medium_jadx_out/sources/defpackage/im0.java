package defpackage;

import java.util.LinkedHashMap;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class im0 extends LinkedBlockingQueue {
    public final AtomicLong a;
    public final f66 b;
    public final String c;
    public final int d;
    public final int e;
    public final m45 f;
    public final x45 g;
    public final em0 h;
    public final rv8 i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public im0(f66 f66Var, String str, int i, int i2, m45 m45Var, x45 x45Var, em0 em0Var, rv8 rv8Var) {
        super(i2);
        f66Var.getClass();
        rv8Var.getClass();
        this.a = new AtomicLong(0L);
        this.b = f66Var;
        this.c = str;
        this.d = i2;
        this.e = i;
        this.f = m45Var;
        this.g = x45Var;
        this.h = em0Var;
        this.i = rv8Var;
    }

    public final void e(Object obj) {
        this.g.invoke(obj);
        u98 u98Var = obj instanceof u98 ? (u98) obj : null;
        String string = u98Var != null ? u98Var.b : obj.toString();
        d66 d66Var = d66.ERROR;
        e66 e66Var = e66.MAINTAINER;
        hm0 hm0Var = new hm0(string, 0);
        ei7.Q(new f09("backpressure.capacity", Integer.valueOf(this.d)), new f09("executor.context", this.c));
        ((nig) this.b).y(d66Var, e66Var, hm0Var, null, false);
    }

    public final void f() {
        this.i.getClass();
        long jCurrentTimeMillis = System.currentTimeMillis();
        AtomicLong atomicLong = this.a;
        long j = atomicLong.get();
        LinkedHashMap linkedHashMap = null;
        if (jCurrentTimeMillis - j > 5000 && super.size() <= 2048 && atomicLong.compareAndSet(j, jCurrentTimeMillis)) {
            LinkedHashMap linkedHashMap2 = new LinkedHashMap();
            Object[] array = toArray();
            array.getClass();
            for (Object obj : array) {
                u98 u98Var = obj instanceof u98 ? (u98) obj : null;
                if (u98Var != null) {
                    String str = u98Var.b;
                    Integer num = (Integer) linkedHashMap2.get(str);
                    linkedHashMap2.put(str, Integer.valueOf((num != null ? num.intValue() : 0) + 1));
                }
            }
            linkedHashMap = linkedHashMap2;
        }
        dh7 dh7Var = new dh7();
        dh7Var.put("capacity", Integer.valueOf(this.d));
        if (linkedHashMap != null && !linkedHashMap.isEmpty()) {
            dh7Var.put("dump", linkedHashMap);
        }
        dh7 dh7VarB = dh7Var.b();
        this.f.invoke();
        ((nig) this.b).A(d66.WARN, d46.R(e66.MAINTAINER, e66.TELEMETRY), new ir(3, this), null, false, ei7.Q(new f09("backpressure", dh7VarB), new f09("executor.context", this.c)));
    }

    @Override // java.util.concurrent.LinkedBlockingQueue, java.util.Queue, java.util.concurrent.BlockingQueue
    public final boolean offer(Object obj) throws InterruptedException {
        obj.getClass();
        ce ceVar = new ce(7, this);
        if (remainingCapacity() != 0) {
            if (super.size() + 1 == this.e) {
                f();
            }
            return ((Boolean) ceVar.invoke(obj)).booleanValue();
        }
        em0 em0Var = this.h;
        int i = em0Var == null ? -1 : gm0.a[em0Var.ordinal()];
        if (i != -1) {
            if (i == 1) {
                Object objTake = take();
                objTake.getClass();
                e(objTake);
                return ((Boolean) ceVar.invoke(obj)).booleanValue();
            }
            if (i != 2) {
                ygf.a();
                return false;
            }
        }
        e(obj);
        return true;
    }

    @Override // java.util.concurrent.LinkedBlockingQueue, java.util.concurrent.BlockingQueue
    public final void put(Object obj) throws InterruptedException {
        obj.getClass();
        if (super.size() + 1 == this.e) {
            f();
        }
        super.put(obj);
    }

    @Override // java.util.concurrent.LinkedBlockingQueue, java.util.concurrent.BlockingQueue
    public final boolean offer(Object obj, long j, TimeUnit timeUnit) {
        obj.getClass();
        if (!super.offer(obj, j, timeUnit)) {
            return offer(obj);
        }
        if (super.size() != this.e) {
            return true;
        }
        f();
        return true;
    }
}
