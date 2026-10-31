package kf;

import java.util.ArrayDeque;
import java.util.PriorityQueue;
import wf.v;

/* loaded from: classes3.dex */
public abstract class h implements jf.g {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayDeque f71516a = new ArrayDeque();

    /* renamed from: b, reason: collision with root package name */
    public final ArrayDeque f71517b;

    /* renamed from: c, reason: collision with root package name */
    public final PriorityQueue f71518c;

    /* renamed from: d, reason: collision with root package name */
    public g f71519d;

    /* renamed from: e, reason: collision with root package name */
    public long f71520e;

    /* renamed from: f, reason: collision with root package name */
    public long f71521f;

    public h() {
        for (int i5 = 0; i5 < 10; i5++) {
            this.f71516a.add(new g(1));
        }
        this.f71517b = new ArrayDeque();
        for (int i11 = 0; i11 < 2; i11++) {
            ArrayDeque arrayDeque = this.f71517b;
            k30.e eVar = new k30.e(this, 1);
            jf.d dVar = new jf.d();
            dVar.f69527g = eVar;
            arrayDeque.add(dVar);
        }
        this.f71518c = new PriorityQueue();
    }

    @Override // jf.g
    public final void a(long j11) {
        this.f71520e = j11;
    }

    @Override // ie.d
    public final void c(jf.i iVar) {
        wf.a.e(iVar == this.f71519d);
        g gVar = (g) iVar;
        if (gVar.d(Integer.MIN_VALUE)) {
            gVar.q();
            this.f71516a.add(gVar);
        } else {
            long j11 = this.f71521f;
            this.f71521f = 1 + j11;
            gVar.f71515j = j11;
            this.f71518c.add(gVar);
        }
        this.f71519d = null;
    }

    @Override // ie.d
    public final Object d() {
        wf.a.i(this.f71519d == null);
        ArrayDeque arrayDeque = this.f71516a;
        if (arrayDeque.isEmpty()) {
            return null;
        }
        g gVar = (g) arrayDeque.pollFirst();
        this.f71519d = gVar;
        return gVar;
    }

    public abstract i e();

    public abstract void f(g gVar);

    @Override // ie.d
    public void flush() {
        ArrayDeque arrayDeque;
        this.f71521f = 0L;
        this.f71520e = 0L;
        while (true) {
            PriorityQueue priorityQueue = this.f71518c;
            boolean zIsEmpty = priorityQueue.isEmpty();
            arrayDeque = this.f71516a;
            if (zIsEmpty) {
                break;
            }
            g gVar = (g) priorityQueue.poll();
            int i5 = v.f94376a;
            gVar.q();
            arrayDeque.add(gVar);
        }
        g gVar2 = this.f71519d;
        if (gVar2 != null) {
            gVar2.q();
            arrayDeque.add(gVar2);
            this.f71519d = null;
        }
    }

    @Override // ie.d
    /* renamed from: g, reason: merged with bridge method [inline-methods] */
    public jf.d b() {
        ArrayDeque arrayDeque = this.f71517b;
        if (arrayDeque.isEmpty()) {
            return null;
        }
        while (true) {
            PriorityQueue priorityQueue = this.f71518c;
            if (priorityQueue.isEmpty()) {
                return null;
            }
            g gVar = (g) priorityQueue.peek();
            int i5 = v.f94376a;
            if (gVar.f61582f > this.f71520e) {
                return null;
            }
            g gVar2 = (g) priorityQueue.poll();
            boolean zD = gVar2.d(4);
            ArrayDeque arrayDeque2 = this.f71516a;
            if (zD) {
                jf.d dVar = (jf.d) arrayDeque.pollFirst();
                dVar.b(4);
                gVar2.q();
                arrayDeque2.add(gVar2);
                return dVar;
            }
            f(gVar2);
            if (h()) {
                i iVarE = e();
                jf.d dVar2 = (jf.d) arrayDeque.pollFirst();
                dVar2.t(gVar2.f61582f, iVarE, Long.MAX_VALUE);
                gVar2.q();
                arrayDeque2.add(gVar2);
                return dVar2;
            }
            gVar2.q();
            arrayDeque2.add(gVar2);
        }
    }

    public abstract boolean h();

    @Override // ie.d
    public void release() {
    }
}
