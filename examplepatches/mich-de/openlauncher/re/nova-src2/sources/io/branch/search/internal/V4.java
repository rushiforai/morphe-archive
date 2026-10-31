package io.branch.search.internal;

import android.content.Context;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class V4 implements T4 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f63472a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Context f63473b;

    /* renamed from: c, reason: collision with root package name */
    public int f63474c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final InterfaceC3076b5 f63475d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final C3426w0 f63476e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final H0 f63477f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final Q0 f63478g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final X7 f63479h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final C3079b8 f63480i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final C3096c8 f63481j;

    /* renamed from: k, reason: collision with root package name */
    @NotNull
    public final C3130e8 f63482k;

    /* renamed from: l, reason: collision with root package name */
    @NotNull
    public final L8 f63483l;

    /* renamed from: m, reason: collision with root package name */
    @NotNull
    public final P8 f63484m;

    @NotNull
    public final Hc n;

    @NotNull
    public final Nc o;

    /* renamed from: p, reason: collision with root package name */
    @NotNull
    public final C3118dd f63485p;

    /* renamed from: q, reason: collision with root package name */
    @NotNull
    public final Ue f63486q;

    /* renamed from: r, reason: collision with root package name */
    @NotNull
    public final C3069af f63487r;

    /* renamed from: s, reason: collision with root package name */
    @NotNull
    public final C3120df f63488s;

    /* renamed from: t, reason: collision with root package name */
    @NotNull
    public final C3154ff f63489t;

    /* renamed from: u, reason: collision with root package name */
    @NotNull
    public final X4 f63490u;

    /* renamed from: v, reason: collision with root package name */
    @NotNull
    public final C3239l f63491v;

    /* renamed from: w, reason: collision with root package name */
    @NotNull
    public final List<InterfaceC3279n5> f63492w;

    public static final class a extends Lambda implements Function1<InterfaceC3365s7, Unit> {
        public a() {
            super(1);
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            InterfaceC3365s7 db2 = (InterfaceC3365s7) obj;
            Intrinsics.g(db2, "db");
            Iterator<T> it = V4.this.f63492w.iterator();
            while (it.hasNext()) {
                ((InterfaceC3279n5) it.next()).a(db2);
            }
            return Unit.f71706a;
        }
    }

    public static final class b extends Lambda implements Function3<InterfaceC3365s7, Integer, Integer, Unit> {
        public b() {
            super(3);
        }

        @Override // kotlin.jvm.functions.Function3
        public final Object invoke(Object obj, Object obj2, Object obj3) {
            InterfaceC3365s7 db2 = (InterfaceC3365s7) obj;
            int iIntValue = ((Number) obj2).intValue();
            int iIntValue2 = ((Number) obj3).intValue();
            Intrinsics.g(db2, "db");
            C3309p1.a("RawDatabase", "Updating " + V4.this.f63472a + " from " + iIntValue + " to " + iIntValue2);
            List<InterfaceC3279n5> list = V4.this.f63492w;
            ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
            Iterator<T> it = list.iterator();
            while (it.hasNext()) {
                arrayList.add(((InterfaceC3279n5) it.next()).getName());
            }
            Map<String, List<C3249l9>> map = C3266m9.f65081a;
            ArrayList arrayList2 = new ArrayList();
            Iterator<T> it2 = C3266m9.f65081a.entrySet().iterator();
            while (it2.hasNext()) {
                for (C3249l9 c3249l9 : (Iterable) ((Map.Entry) it2.next()).getValue()) {
                    int i5 = iIntValue + 1;
                    int i11 = c3249l9.f64962a;
                    if (i5 <= i11 && i11 <= 11) {
                        arrayList2.addAll(c3249l9.f64963b);
                    }
                }
            }
            Iterator it3 = arrayList.iterator();
            while (it3.hasNext()) {
                List<C3249l9> list2 = C3266m9.f65082b.get((String) it3.next());
                if (list2 != null) {
                    for (C3249l9 c3249l92 : list2) {
                        int i12 = iIntValue + 1;
                        int i13 = c3249l92.f64962a;
                        if (i12 <= i13 && i13 <= 11) {
                            arrayList2.addAll(c3249l92.f64963b);
                        }
                    }
                }
            }
            Iterator it4 = arrayList2.iterator();
            while (it4.hasNext()) {
                String str = (String) it4.next();
                C3309p1.a("RawDatabase", "Running command: " + str);
                db2.a(str, false);
            }
            return Unit.f71706a;
        }
    }

    public V4(@NotNull String name, @NotNull String canonicalName, int i5, @NotNull Context context, boolean z11, @NotNull InterfaceC3093c5 databaseConnectionProviderFactory) {
        Intrinsics.g(name, "name");
        Intrinsics.g(canonicalName, "canonicalName");
        Intrinsics.g(context, "context");
        Intrinsics.g(databaseConnectionProviderFactory, "databaseConnectionProviderFactory");
        this.f63472a = name;
        this.f63473b = context;
        this.f63474c = b(i5);
        this.f63475d = databaseConnectionProviderFactory.a(context, getName(), z11, a(), new a(), new b());
        this.f63476e = new C3426w0(p());
        this.f63477f = new H0(p());
        this.f63478g = new Q0(p());
        this.f63479h = new X7();
        this.f63480i = new C3079b8();
        this.f63481j = new C3096c8();
        this.f63482k = new C3130e8(p());
        this.f63483l = new L8(p());
        this.f63484m = new P8(p());
        this.n = new Hc();
        this.o = new Nc();
        this.f63485p = new C3118dd(p());
        this.f63486q = new Ue(p());
        this.f63487r = new C3069af(p());
        this.f63488s = new C3120df(p());
        this.f63489t = new C3154ff(p());
        this.f63490u = new X4(p());
        this.f63491v = new C3239l(p());
        this.f63492w = ul.b.Q(j(), c(), g(), q(), r(), s(), k(), m(), n(), t(), u(), b(), o(), e(), d(), h(), f(), i());
    }

    public static int b(int i5) {
        if (i5 >= 100 && i5 <= 500) {
            return i5;
        }
        String strI = b.c0.i(i5, "Can't change cache size, requested cache size ", " must be between in range <100,500>");
        EnumC3131e9 enumC3131e9 = EnumC3131e9.Database;
        C3309p1.b(enumC3131e9, strI);
        int iF = v4.a.f(i5, 100, 500);
        C3309p1.c(enumC3131e9, "Fallback cache size: " + iF);
        return iF;
    }

    @Override // io.branch.search.internal.T4
    public final int a() {
        return this.f63474c;
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final H0 c() {
        return this.f63477f;
    }

    @Override // io.branch.search.internal.T4
    public final void close() throws IllegalStateException {
        this.f63475d.close();
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final C3120df d() {
        return this.f63488s;
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final C3069af e() {
        return this.f63487r;
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final X4 f() {
        return this.f63490u;
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final Q0 g() {
        return this.f63478g;
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final String getName() {
        return this.f63472a;
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final C3154ff h() {
        return this.f63489t;
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final C3239l i() {
        return this.f63491v;
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final C3426w0 j() {
        return this.f63476e;
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final C3130e8 k() {
        return this.f63482k;
    }

    @Override // io.branch.search.internal.T4
    public final void l() {
        this.f63475d.close();
        this.f63473b.deleteDatabase(this.f63472a);
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final L8 m() {
        return this.f63483l;
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final P8 n() {
        return this.f63484m;
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final Ue o() {
        return this.f63486q;
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final InterfaceC3076b5 p() {
        return this.f63475d;
    }

    @NotNull
    public final X7 q() {
        return this.f63479h;
    }

    @NotNull
    public final C3079b8 r() {
        return this.f63480i;
    }

    @NotNull
    public final C3096c8 s() {
        return this.f63481j;
    }

    @NotNull
    public final Hc t() {
        return this.n;
    }

    @NotNull
    public final Nc u() {
        return this.o;
    }

    @Override // io.branch.search.internal.T4
    public final void a(int i5) {
        int iB = b(i5);
        this.f63474c = iB;
        this.f63475d.setMaxSqlCacheSize(iB);
    }

    @Override // io.branch.search.internal.T4
    @NotNull
    public final C3118dd b() {
        return this.f63485p;
    }
}
