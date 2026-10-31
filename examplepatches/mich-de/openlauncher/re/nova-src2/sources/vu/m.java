package vu;

import android.app.Application;
import com.stripe.android.paymentsheet.PaymentOptionContract;
import h6.u0;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import ms.y;
import vt.n0;
import vt.p0;

/* loaded from: classes4.dex */
public final class m {
    public final s40.h A;
    public final s40.h B;
    public final p0 C;
    public final bs.e D;
    public final au.e E;
    public final s40.h F;
    public final s40.h G;
    public final s40.h H;
    public final au.e I;

    /* renamed from: a, reason: collision with root package name */
    public final PaymentOptionContract.Args f93192a;

    /* renamed from: b, reason: collision with root package name */
    public final Application f93193b;

    /* renamed from: d, reason: collision with root package name */
    public final s40.h f93195d;

    /* renamed from: f, reason: collision with root package name */
    public final s40.e f93197f;

    /* renamed from: g, reason: collision with root package name */
    public final s f93198g;

    /* renamed from: h, reason: collision with root package name */
    public final av.a f93199h;

    /* renamed from: i, reason: collision with root package name */
    public final bs.e f93200i;

    /* renamed from: j, reason: collision with root package name */
    public final s40.e f93201j;

    /* renamed from: k, reason: collision with root package name */
    public final as.h f93202k;

    /* renamed from: l, reason: collision with root package name */
    public final p0 f93203l;

    /* renamed from: m, reason: collision with root package name */
    public final av.a f93204m;
    public final s40.h n;
    public final u o;

    /* renamed from: p, reason: collision with root package name */
    public final bs.b f93205p;

    /* renamed from: q, reason: collision with root package name */
    public final s40.h f93206q;

    /* renamed from: r, reason: collision with root package name */
    public final bs.e f93207r;

    /* renamed from: s, reason: collision with root package name */
    public final bu.o f93208s;

    /* renamed from: t, reason: collision with root package name */
    public final bs.e f93209t;

    /* renamed from: u, reason: collision with root package name */
    public final br.b f93210u;

    /* renamed from: v, reason: collision with root package name */
    public final s40.h f93211v;

    /* renamed from: w, reason: collision with root package name */
    public final s40.h f93212w;

    /* renamed from: x, reason: collision with root package name */
    public final bs.b f93213x;

    /* renamed from: y, reason: collision with root package name */
    public final s40.h f93214y;

    /* renamed from: z, reason: collision with root package name */
    public final s40.h f93215z;

    /* renamed from: c, reason: collision with root package name */
    public final m f93194c = this;

    /* renamed from: e, reason: collision with root package name */
    public final k f93196e = new k(this);

    public m(b50.d dVar, r rVar, br.c cVar, br.a aVar, Application application, u0 u0Var, PaymentOptionContract.Args args) {
        this.f93192a = args;
        this.f93193b = application;
        this.f93195d = s40.c.b(new p0(s40.e.a(u0Var), 7));
        s40.e eVarA = s40.e.a(args);
        this.f93197f = eVarA;
        s sVar = new s(rVar, eVarA);
        this.f93198g = sVar;
        av.a aVar2 = new av.a(dVar, 5);
        this.f93199h = aVar2;
        this.f93200i = new bs.e(sVar, aVar2, 1);
        s40.e eVarA2 = s40.e.a(application);
        this.f93201j = eVarA2;
        as.h hVar = new as.h(rVar, eVarA2, 12);
        this.f93202k = hVar;
        p0 p0Var = new p0(hVar, 4);
        this.f93203l = p0Var;
        this.f93204m = new av.a(p0Var, 13);
        this.n = s40.c.b(new av.a(cVar, 1));
        u uVar = new u(rVar, this.f93197f);
        this.o = uVar;
        this.f93205p = new bs.b(this.f93202k, this.f93204m, uVar, 4);
        s40.h hVarB = s40.c.b(new br.b(aVar, s40.c.b(e.f93169d), 0));
        this.f93206q = hVarB;
        s40.h hVar2 = this.n;
        bs.e eVar = new bs.e(hVarB, hVar2, 4);
        this.f93207r = eVar;
        as.h hVar3 = this.f93202k;
        av.a aVar3 = this.f93204m;
        av.a aVar4 = this.f93199h;
        u uVar2 = this.o;
        bs.b bVar = this.f93205p;
        bu.o oVar = new bu.o(hVar3, aVar3, aVar4, hVar2, uVar2, bVar, eVar, hVarB, 1);
        this.f93208s = oVar;
        bs.e eVar2 = new bs.e(eVar, bVar, 5);
        this.f93209t = eVar2;
        this.f93210u = new br.b(this.f93200i, new bs.e(oVar, eVar2, 2));
        s40.h hVarB2 = s40.c.b(new au.e(hVar3, 6));
        int i5 = 0;
        this.f93211v = s40.c.b(new es.p(i5, this.f93210u, this.f93196e, this.f93198g, hVarB2));
        this.f93212w = s40.c.b(new av.a(rVar, 12));
        this.f93213x = new bs.b(this.f93202k, this.n, this.f93206q, 5);
        s40.h hVarB3 = s40.c.b(e.f93168c);
        this.f93214y = hVarB3;
        p0 p0Var2 = new p0(this.f93198g, 6);
        as.h hVar4 = this.f93202k;
        this.f93215z = s40.c.b(new ru.b(hVar4, this.f93212w, this.f93207r, this.f93213x, this.f93205p, hVarB3, p0Var2, this.n, new au.e(hVar4, 10), new t(rVar, this.f93197f)));
        this.A = s40.c.b(new as.f(this.f93208s, this.f93203l, this.f93206q, this.f93209t, this.n, this.o, 4));
        this.B = s40.c.b(new au.e(s40.c.b(new au.e(new l(this), 5)), 24));
        p0 p0Var3 = new p0(this.f93203l, 5);
        this.C = p0Var3;
        this.D = new bs.e(this.f93204m, p0Var3, 3);
        this.E = new au.e(this.f93198g, 28);
        this.F = s40.c.b(new as.f(this.f93207r, this.f93205p, this.f93209t, this.n, this.f93206q, this.f93214y, 5));
        this.G = s40.c.b(new bs.e(this.f93206q, this.n, 6));
        this.H = s40.c.b(new y(this.f93201j, this.f93199h, this.f93204m, this.C, this.f93208s, this.G, this.n, s40.c.b(new au.c(aVar, 7)), this.f93209t));
        this.I = new au.e(this.f93201j, 18);
    }

    public final iu.f a() {
        fr.l lVar = new fr.l((xq.c) this.f93206q.get(), (CoroutineContext) this.n.get());
        p0 paymentConfiguration = this.f93203l;
        Intrinsics.g(paymentConfiguration, "paymentConfiguration");
        return new iu.f(lVar, new jt.a(this.f93193b, new n0(paymentConfiguration, 2), this.f93192a.f44434f));
    }
}
