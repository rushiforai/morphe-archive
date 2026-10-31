package io.branch.search.internal;

import io.branch.search.internal.Xb;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.g4, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3160g4 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final t70.j0 f64562a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Xb f64563b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final InterfaceC3092c4 f64564c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final Function1<Long, Unit> f64565d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final Function0<Long> f64566e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public Thread f64567f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final ReentrantLock f64568g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final AtomicBoolean f64569h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final AtomicBoolean f64570i;

    @DebugMetadata(c = "io.branch.search.internal.retry.ClickTracker$recoveryLoop$1$1", f = "ClickTracker.kt", l = {90}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.g4$a */
    public static final class a extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f64571a;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ Rb f64573c;

        /* renamed from: io.branch.search.internal.g4$a$a, reason: collision with other inner class name */
        public static final class C0338a extends Lambda implements Function0<Unit> {

            /* renamed from: a, reason: collision with root package name */
            public final /* synthetic */ C3160g4 f64574a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ Rb f64575b;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public C0338a(C3160g4 c3160g4, Rb rb2) {
                super(0);
                this.f64574a = c3160g4;
                this.f64575b = rb2;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                Xb.a.a(this.f64574a.f64563b, this.f64575b.getId(), Wb.SUCCESS, null, 12);
                return Unit.f71706a;
            }
        }

        /* renamed from: io.branch.search.internal.g4$a$b */
        public static final class b extends Lambda implements Function0<Unit> {

            /* renamed from: a, reason: collision with root package name */
            public final /* synthetic */ C3160g4 f64576a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ Rb f64577b;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public b(C3160g4 c3160g4, Rb rb2) {
                super(0);
                this.f64576a = c3160g4;
                this.f64577b = rb2;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                this.f64576a.f64563b.a(this.f64577b.getId(), Wb.FAIL, Integer.valueOf(this.f64577b.d()), Integer.valueOf(this.f64577b.c() + 1));
                this.f64576a.a(this.f64577b);
                Thread thread = this.f64576a.f64567f;
                if (thread != null) {
                    thread.interrupt();
                }
                return Unit.f71706a;
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(Rb rb2, Continuation<? super a> continuation) {
            super(2, continuation);
            this.f64573c = rb2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3160g4.this.new a(this.f64573c, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return C3160g4.this.new a(this.f64573c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f64571a;
            if (i5 == 0) {
                ResultKt.b(obj);
                C3160g4 c3160g4 = C3160g4.this;
                InterfaceC3092c4 interfaceC3092c4 = c3160g4.f64564c;
                Rb rb2 = this.f64573c;
                C0338a c0338a = new C0338a(c3160g4, rb2);
                b bVar = new b(C3160g4.this, this.f64573c);
                this.f64571a = 1;
                if (interfaceC3092c4.a("io.branch.search", rb2, c0338a, bVar, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            return Unit.f71706a;
        }
    }

    public C3160g4(@NotNull t70.j0 bgScope, @NotNull C3117dc retryStore, @NotNull C3177h4 executeEvent, @NotNull Function1 pause, @NotNull Function0 clock) {
        Intrinsics.g(bgScope, "bgScope");
        Intrinsics.g(retryStore, "retryStore");
        Intrinsics.g(executeEvent, "executeEvent");
        Intrinsics.g(pause, "pause");
        Intrinsics.g(clock, "clock");
        this.f64562a = bgScope;
        this.f64563b = retryStore;
        this.f64564c = executeEvent;
        this.f64565d = pause;
        this.f64566e = clock;
        this.f64568g = new ReentrantLock();
        this.f64569h = new AtomicBoolean(false);
        this.f64570i = new AtomicBoolean(false);
    }

    public final void a() {
        a50.b bVar = a50.b.f403d;
        try {
            List<Rb> listA = this.f64563b.a(Wb.PROCESSING);
            if (listA.isEmpty()) {
                return;
            }
            C3309p1 c3309p1 = C3309p1.f65465a;
            C3309p1.a(bVar, "BranchSearchSDK", "recovering after crash", (Throwable) null);
            for (Rb rb2 : listA) {
                Xb.a.a(this.f64563b, rb2.getId(), Wb.FAIL, Integer.valueOf(rb2.d() + 1), 8);
            }
        } catch (Throwable th2) {
            C3309p1 c3309p12 = C3309p1.f65465a;
            C3309p1.a(bVar, "BranchSearchSDK", (String) null, th2);
            try {
                this.f64563b.a();
            } catch (Throwable th3) {
                C3309p1.a(bVar, "BranchSearchSDK", (String) null, th3);
            }
        }
    }

    public final void b() {
        while (this.f64569h.get()) {
            ReentrantLock reentrantLock = this.f64568g;
            reentrantLock.lock();
            try {
                Pair<Rb, Long> pairC = this.f64563b.c();
                if (pairC == null) {
                    if (this.f64569h.compareAndSet(true, false)) {
                        Thread thread = this.f64567f;
                        if (thread != null) {
                            thread.interrupt();
                        }
                        try {
                            Thread thread2 = this.f64567f;
                            if (thread2 != null) {
                                thread2.join();
                            }
                        } catch (InterruptedException unused) {
                        }
                        this.f64567f = null;
                    }
                    pairC = null;
                }
                if (pairC != null) {
                    Rb rb2 = (Rb) pairC.f71683a;
                    long jLongValue = ((Number) pairC.f71684b).longValue() - ((Number) this.f64566e.invoke()).longValue();
                    if (jLongValue > 0) {
                        this.f64565d.invoke(Long.valueOf(jLongValue));
                    } else {
                        C3309p1.b("Retrying click event with id " + rb2.getId());
                        Xb.a.a(this.f64563b, rb2.getId(), Wb.PROCESSING, null, 12);
                        t70.m0.t(this.f64562a, null, null, new a(rb2, null), 3);
                    }
                }
            } finally {
                reentrantLock.unlock();
            }
        }
    }

    public final void c() throws InterruptedException {
        if (this.f64569h.compareAndSet(false, true)) {
            Thread thread = this.f64567f;
            if (thread != null) {
                thread.join();
            }
            Thread thread2 = new Thread(new o9.d4(this, 22));
            thread2.start();
            this.f64567f = thread2;
        }
    }

    public final void a(Rb rb2) {
        Ac ac;
        List<Rb> listP = ul.b.P(rb2);
        List<Sb> policies = this.f64563b.d();
        long jLongValue = ((Number) this.f64566e.invoke()).longValue();
        Intrinsics.g(policies, "policies");
        List listD1 = b70.g.D1(new C3100cc(), policies);
        EmptyList emptyList = EmptyList.f71733a;
        Ac ac2 = new Ac(emptyList, emptyList);
        for (Rb rb3 : listP) {
            long jA = jLongValue - rb3.a();
            Intrinsics.g(listD1, "<this>");
            int size = listD1.size() - 1;
            while (size >= 0 && ((Sb) listD1.get(size)).f63350b > jA) {
                size--;
            }
            if (size >= 0 && ((Sb) listD1.get(size)).f63350b > jA) {
                size = -1;
            }
            if (rb3.b() == Wb.NEW) {
                ac = new Ac(b70.g.u1(ac2.f62040a, new C3489zc(rb3, jLongValue)), ac2.f62041b);
            } else if (size != -1 && ((Sb) listD1.get(size)).f63349a != EnumC3065ab.DROP) {
                long jA2 = (jLongValue - rb3.a()) - ((Sb) listD1.get(size)).f63350b;
                long j11 = ((Sb) listD1.get(size)).f63351c;
                long j12 = jA2 % j11;
                ac = new Ac(b70.g.u1(ac2.f62040a, new C3489zc(rb3, (j12 > 0 ? j11 - j12 : 0L) + jLongValue)), ac2.f62041b);
            } else {
                ac = new Ac(ac2.f62040a, b70.g.u1(ac2.f62041b, rb3));
            }
            ac2 = ac;
        }
        List<Rb> list = ac2.f62041b;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        Iterator<T> it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(Long.valueOf(((Rb) it.next()).getId()));
        }
        Xb xb2 = this.f64563b;
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            xb2.a(((Number) it2.next()).longValue());
        }
        for (C3489zc c3489zc : ac2.f62040a) {
            this.f64563b.a(c3489zc.f66372a.getId(), c3489zc.f66373b);
        }
        ReentrantLock reentrantLock = this.f64568g;
        reentrantLock.lock();
        try {
            if (this.f64570i.get()) {
                c();
            }
            Unit unit = Unit.f71706a;
            reentrantLock.unlock();
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }

    public final void a(@NotNull Pb retryConfig) {
        EnumC3065ab enumC3065ab;
        Intrinsics.g(retryConfig, "retryConfig");
        List<Tb> list = retryConfig.f63087b;
        if (list != null) {
            Xb xb2 = this.f64563b;
            ArrayList arrayList = new ArrayList();
            for (Tb tb2 : list) {
                EnumC3065ab[] enumC3065abArrValues = EnumC3065ab.values();
                int length = enumC3065abArrValues.length;
                int i5 = 0;
                while (true) {
                    if (i5 >= length) {
                        enumC3065ab = null;
                        break;
                    }
                    enumC3065ab = enumC3065abArrValues[i5];
                    if (Intrinsics.b(enumC3065ab.name(), tb2.f63384a)) {
                        break;
                    } else {
                        i5++;
                    }
                }
                Sb sb2 = enumC3065ab != null ? new Sb(enumC3065ab, tb2.f63385b, tb2.f63386c) : null;
                if (sb2 != null) {
                    arrayList.add(sb2);
                }
            }
            xb2.a(arrayList);
        }
    }
}
