package io.branch.search.internal;

import io.branch.search.internal.Rb;
import io.branch.search.internal.Xb;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class M7 implements Xb {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Function0<Long> f62918a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public List<Sb> f62919b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final ArrayList f62920c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final ReentrantLock f62921d;

    /* renamed from: e, reason: collision with root package name */
    public long f62922e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final LinkedHashMap f62923f;

    public M7(@NotNull Function0<Long> clock) {
        Intrinsics.g(clock, "clock");
        this.f62918a = clock;
        this.f62919b = Vb.a();
        this.f62920c = new ArrayList();
        this.f62921d = new ReentrantLock();
        this.f62923f = new LinkedHashMap();
    }

    @Override // io.branch.search.internal.Xb
    @NotNull
    public final Rb.a a(@NotNull String url) {
        Intrinsics.g(url, "url");
        ReentrantLock reentrantLock = this.f62921d;
        reentrantLock.lock();
        try {
            long j11 = this.f62922e + 1;
            this.f62922e = j11;
            Rb.a aVar = new Rb.a(j11, ((Number) this.f62918a.invoke()).longValue(), Wb.NEW, url, 0, 0);
            this.f62920c.add(aVar);
            return aVar;
        } finally {
            reentrantLock.unlock();
        }
    }

    @NotNull
    public final ArrayList b() {
        ReentrantLock reentrantLock = this.f62921d;
        reentrantLock.lock();
        try {
            ArrayList arrayList = this.f62920c;
            ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                Rb rb2 = (Rb) it.next();
                Long l9 = (Long) this.f62923f.get(Long.valueOf(rb2.getId()));
                arrayList2.add(new Pair(rb2, Long.valueOf(l9 != null ? l9.longValue() : 0L)));
            }
            reentrantLock.unlock();
            return arrayList2;
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v4 */
    @Override // io.branch.search.internal.Xb
    @Nullable
    public final Pair<Rb, Long> c() {
        Pair<Rb, Long> pair;
        Object next;
        ReentrantLock reentrantLock = this.f62921d;
        reentrantLock.lock();
        try {
            List listQ0 = MapsKt.q0(this.f62923f);
            ArrayList arrayList = new ArrayList();
            Iterator it = listQ0.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Pair pair2 = (Pair) it.next();
                Iterator it2 = this.f62920c.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        next = null;
                        break;
                    }
                    next = it2.next();
                    if (((Rb) next).getId() == ((Number) pair2.f71683a).longValue()) {
                        break;
                    }
                }
                Rb rb2 = (Rb) next;
                pair = rb2 != null ? new Pair<>(rb2, pair2.f71684b) : null;
                if (pair != null) {
                    arrayList.add(pair);
                }
            }
            ArrayList arrayList2 = new ArrayList();
            Iterator it3 = arrayList.iterator();
            while (it3.hasNext()) {
                Object next2 = it3.next();
                if (!ul.b.Q(Wb.SUCCESS, Wb.PROCESSING).contains(((Rb) ((Pair) next2).f71683a).b())) {
                    arrayList2.add(next2);
                }
            }
            Iterator it4 = arrayList2.iterator();
            if (it4.hasNext()) {
                Object next3 = it4.next();
                Pair<Rb, Long> pair3 = next3;
                if (it4.hasNext()) {
                    long jLongValue = ((Number) ((Pair) next3).f71684b).longValue();
                    do {
                        Object next4 = it4.next();
                        long jLongValue2 = ((Number) ((Pair) next4).f71684b).longValue();
                        next3 = next3;
                        if (jLongValue > jLongValue2) {
                            next3 = next4;
                            jLongValue = jLongValue2;
                        }
                    } while (it4.hasNext());
                    pair3 = next3;
                }
                pair = pair3;
            }
            Pair<Rb, Long> pair4 = pair;
            reentrantLock.unlock();
            return pair4;
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }

    @Override // io.branch.search.internal.Xb
    @NotNull
    public final List<Sb> d() {
        ReentrantLock reentrantLock = this.f62921d;
        reentrantLock.lock();
        try {
            return b70.g.I1(this.f62919b);
        } finally {
            reentrantLock.unlock();
        }
    }

    @Override // io.branch.search.internal.Xb
    @NotNull
    public final List<Rb> a(@NotNull Wb... state) {
        Intrinsics.g(state, "state");
        ReentrantLock reentrantLock = this.f62921d;
        reentrantLock.lock();
        try {
            ArrayList arrayList = this.f62920c;
            ArrayList arrayList2 = new ArrayList();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                Object next = it.next();
                if (kotlin.collections.c.o0(((Rb) next).b(), state)) {
                    arrayList2.add(next);
                }
            }
            return arrayList2;
        } finally {
            reentrantLock.unlock();
        }
    }

    @Override // io.branch.search.internal.Xb
    public final void a() {
        ReentrantLock reentrantLock = this.f62921d;
        reentrantLock.lock();
        try {
            this.f62923f.clear();
            this.f62920c.clear();
            Unit unit = Unit.f71706a;
        } finally {
            reentrantLock.unlock();
        }
    }

    @Override // io.branch.search.internal.Xb
    public final void a(long j11) {
        ReentrantLock reentrantLock = this.f62921d;
        reentrantLock.lock();
        try {
            this.f62923f.remove(Long.valueOf(j11));
            Xb.a.a(this, j11, Wb.DROPPED, null, 12);
            Unit unit = Unit.f71706a;
        } finally {
            reentrantLock.unlock();
        }
    }

    @Override // io.branch.search.internal.Xb
    public final void a(@NotNull List<Sb> policies) {
        Intrinsics.g(policies, "policies");
        ReentrantLock reentrantLock = this.f62921d;
        reentrantLock.lock();
        try {
            this.f62919b = policies;
            Unit unit = Unit.f71706a;
        } finally {
            reentrantLock.unlock();
        }
    }

    @Override // io.branch.search.internal.Xb
    public final void a(long j11, long j12) {
        ReentrantLock reentrantLock = this.f62921d;
        reentrantLock.lock();
        try {
            this.f62923f.put(Long.valueOf(j11), Long.valueOf(j12));
            Unit unit = Unit.f71706a;
        } finally {
            reentrantLock.unlock();
        }
    }

    @Override // io.branch.search.internal.Xb
    public final void a(long j11, @NotNull Wb state, @Nullable Integer num, @Nullable Integer num2) {
        Object next;
        int iD;
        int iC;
        Intrinsics.g(state, "state");
        ReentrantLock reentrantLock = this.f62921d;
        reentrantLock.lock();
        try {
            Iterator it = this.f62920c.iterator();
            while (true) {
                if (!it.hasNext()) {
                    next = null;
                    break;
                } else {
                    next = it.next();
                    if (((Rb) next).getId() == j11) {
                        break;
                    }
                }
            }
            Rb rb2 = (Rb) next;
            if (rb2 != null) {
                this.f62920c.remove(rb2);
                if (rb2 instanceof Rb.a) {
                    long jA = rb2.a();
                    String str = ((Rb.a) rb2).f63279d;
                    if (num != null) {
                        iD = num.intValue();
                    } else {
                        iD = rb2.d();
                    }
                    int i5 = iD;
                    if (num2 != null) {
                        iC = num2.intValue();
                    } else {
                        iC = rb2.c();
                    }
                    this.f62920c.add(new Rb.a(j11, jA, state, str, i5, iC));
                    reentrantLock.unlock();
                    return;
                }
                throw new NoWhenBranchMatchedException();
            }
            throw new RuntimeException("Event does not exists");
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }
}
