package io.branch.search.internal;

import io.branch.search.internal.Rb;
import io.branch.search.internal.Yb;
import io.branch.search.internal.Z6;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.dc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3117dc implements Xb, Q6 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Be f64294a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Yb f64295b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final M7 f64296c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final AtomicBoolean f64297d;

    /* renamed from: io.branch.search.internal.dc$a */
    public static final class a extends Lambda implements Function0<Rb.a> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ String f64299b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(String str) {
            super(0);
            this.f64299b = str;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return C3117dc.this.f64295b.a(this.f64299b);
        }
    }

    /* renamed from: io.branch.search.internal.dc$b */
    public static final class b extends Lambda implements Function0<Rb.a> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ String f64301b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(String str) {
            super(0);
            this.f64301b = str;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return C3117dc.this.f64296c.a(this.f64301b);
        }
    }

    /* renamed from: io.branch.search.internal.dc$c */
    public static final class c extends Lambda implements Function0<List<? extends Rb>> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ Wb[] f64303b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(Wb[] wbArr) {
            super(0);
            this.f64303b = wbArr;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            Yb yb2 = C3117dc.this.f64295b;
            Wb[] wbArr = this.f64303b;
            return yb2.a((Wb[]) Arrays.copyOf(wbArr, wbArr.length));
        }
    }

    /* renamed from: io.branch.search.internal.dc$d */
    public static final class d extends Lambda implements Function0<List<? extends Rb>> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ Wb[] f64305b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(Wb[] wbArr) {
            super(0);
            this.f64305b = wbArr;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            M7 m72 = C3117dc.this.f64296c;
            Wb[] wbArr = this.f64305b;
            return m72.a((Wb[]) Arrays.copyOf(wbArr, wbArr.length));
        }
    }

    /* renamed from: io.branch.search.internal.dc$e */
    public static final class e extends Lambda implements Function0<Pair<? extends Rb, ? extends Long>> {
        public e() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return C3117dc.this.f64295b.c();
        }
    }

    /* renamed from: io.branch.search.internal.dc$f */
    public static final class f extends Lambda implements Function0<Pair<? extends Rb, ? extends Long>> {
        public f() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return C3117dc.this.f64296c.c();
        }
    }

    /* renamed from: io.branch.search.internal.dc$g */
    public static final class g extends Lambda implements Function0<List<? extends Sb>> {
        public g() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return C3117dc.this.f64295b.d();
        }
    }

    /* renamed from: io.branch.search.internal.dc$h */
    public static final class h extends Lambda implements Function0<List<? extends Sb>> {
        public h() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return C3117dc.this.f64296c.d();
        }
    }

    /* renamed from: io.branch.search.internal.dc$i */
    public static final class i extends Lambda implements Function0<Unit> {
        public i() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            Yb yb2 = C3117dc.this.f64295b;
            C3083bc.a(yb2.b(), new Yb.g(yb2));
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.dc$j */
    public static final class j extends Lambda implements Function0<Unit> {
        public j() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            C3117dc.this.f64296c.a();
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.dc$k */
    public static final class k extends Lambda implements Function0<Unit> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ long f64313b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public k(long j11) {
            super(0);
            this.f64313b = j11;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            C3083bc.a(C3117dc.this.f64295b.b(), new Yb.h(this.f64313b));
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.dc$l */
    public static final class l extends Lambda implements Function0<Unit> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ long f64315b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public l(long j11) {
            super(0);
            this.f64315b = j11;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            C3117dc.this.f64296c.a(this.f64315b);
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.dc$m */
    public static final class m extends Lambda implements Function0<Unit> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ List<Sb> f64317b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public m(ArrayList arrayList) {
            super(0);
            this.f64317b = arrayList;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            C3117dc.this.f64295b.a(this.f64317b);
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.dc$n */
    public static final class n extends Lambda implements Function0<Unit> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ List<Sb> f64319b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public n(ArrayList arrayList) {
            super(0);
            this.f64319b = arrayList;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            C3117dc.this.f64297d.set(false);
            C3117dc.this.f64296c.a(this.f64319b);
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.dc$o */
    public static final class o extends Lambda implements Function0<Unit> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ long f64321b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ long f64322c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public o(long j11, long j12) {
            super(0);
            this.f64321b = j11;
            this.f64322c = j12;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            C3083bc.a(C3117dc.this.f64295b.b(), new Yb.j(this.f64321b, this.f64322c));
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.dc$p */
    public static final class p extends Lambda implements Function0<Unit> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ long f64324b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ long f64325c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public p(long j11, long j12) {
            super(0);
            this.f64324b = j11;
            this.f64325c = j12;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            C3117dc.this.f64296c.a(this.f64324b, this.f64325c);
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.dc$q */
    public static final class q extends Lambda implements Function0<Unit> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ long f64327b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ Wb f64328c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ Integer f64329d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Integer f64330e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public q(long j11, Wb wb2, Integer num, Integer num2) {
            super(0);
            this.f64327b = j11;
            this.f64328c = wb2;
            this.f64329d = num;
            this.f64330e = num2;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            C3117dc.this.f64295b.a(this.f64327b, this.f64328c, this.f64329d, this.f64330e);
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.dc$r */
    public static final class r extends Lambda implements Function0<Unit> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ long f64332b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ Wb f64333c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ Integer f64334d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Integer f64335e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public r(long j11, Wb wb2, Integer num, Integer num2) {
            super(0);
            this.f64332b = j11;
            this.f64333c = wb2;
            this.f64334d = num;
            this.f64335e = num2;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            C3117dc.this.f64296c.a(this.f64332b, this.f64333c, this.f64334d, this.f64335e);
            return Unit.f71706a;
        }
    }

    public C3117dc(@NotNull Z6.a storageMonitor, @NotNull Yb retryStoreDB, @NotNull M7 inMemoryRetryStore) {
        Intrinsics.g(storageMonitor, "storageMonitor");
        Intrinsics.g(retryStoreDB, "retryStoreDB");
        Intrinsics.g(inMemoryRetryStore, "inMemoryRetryStore");
        this.f64294a = storageMonitor;
        this.f64295b = retryStoreDB;
        this.f64296c = inMemoryRetryStore;
        this.f64297d = new AtomicBoolean(false);
        storageMonitor.a(this);
    }

    @Override // io.branch.search.internal.Xb
    @NotNull
    public final Rb.a a(@NotNull String url) {
        Intrinsics.g(url, "url");
        return (Rb.a) Ce.a(this.f64294a, new a(url), new b(url));
    }

    @Override // io.branch.search.internal.Q6
    public final void b() {
        C3309p1.b("Flushing inmemory retry storage");
        try {
            if (this.f64297d.get()) {
                C3309p1.b("Flushing retry policies");
                this.f64295b.a(this.f64296c.d());
            }
            ArrayList arrayListB = this.f64296c.b();
            C3309p1.b("Flushing inmemory entries(count = " + arrayListB.size() + ')');
            Yb yb2 = this.f64295b;
            yb2.getClass();
            C3083bc.a(yb2.b(), new C3066ac(arrayListB));
        } catch (Throwable th2) {
            C3309p1.a(a50.b.f403d, "Flush exception ", (String) null, th2);
        }
    }

    @Override // io.branch.search.internal.Xb
    @Nullable
    public final Pair<Rb, Long> c() {
        return (Pair) Ce.a(this.f64294a, new e(), new f());
    }

    @Override // io.branch.search.internal.Xb
    @NotNull
    public final List<Sb> d() {
        return (List) Ce.a(this.f64294a, new g(), new h());
    }

    @Override // io.branch.search.internal.Xb
    @NotNull
    public final List<Rb> a(@NotNull Wb... state) {
        Intrinsics.g(state, "state");
        return (List) Ce.a(this.f64294a, new c(state), new d(state));
    }

    @Override // io.branch.search.internal.Xb
    public final void a() {
        Ce.a(this.f64294a, new i(), new j());
    }

    @Override // io.branch.search.internal.Xb
    public final void a(long j11) {
        Ce.a(this.f64294a, new k(j11), new l(j11));
    }

    @Override // io.branch.search.internal.Xb
    public final void a(@NotNull List<Sb> policies) {
        Intrinsics.g(policies, "policies");
        ArrayList arrayList = (ArrayList) policies;
        Ce.a(this.f64294a, new m(arrayList), new n(arrayList));
    }

    @Override // io.branch.search.internal.Xb
    public final void a(long j11, long j12) {
        Ce.a(this.f64294a, new o(j11, j12), new p(j11, j12));
    }

    @Override // io.branch.search.internal.Xb
    public final void a(long j11, @NotNull Wb state, @Nullable Integer num, @Nullable Integer num2) {
        Intrinsics.g(state, "state");
        Ce.a(this.f64294a, new q(j11, state, num, num2), new r(j11, state, num, num2));
    }
}
