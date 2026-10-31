package pu;

import android.app.Application;
import h6.g1;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kw.r2;
import kw.t2;
import ou.i1;
import w70.i2;
import w70.n1;
import w70.o1;
import w70.t1;
import w70.u1;

/* loaded from: classes4.dex */
public final class z extends h6.b {

    /* renamed from: b, reason: collision with root package name */
    public final dw.e f83096b;

    /* renamed from: c, reason: collision with root package name */
    public final u f83097c;

    /* renamed from: d, reason: collision with root package name */
    public final i2 f83098d;

    /* renamed from: e, reason: collision with root package name */
    public final i2 f83099e;

    /* renamed from: f, reason: collision with root package name */
    public final t1 f83100f;

    /* renamed from: g, reason: collision with root package name */
    public final n1 f83101g;

    /* renamed from: h, reason: collision with root package name */
    public final r2 f83102h;

    /* renamed from: i, reason: collision with root package name */
    public final t2 f83103i;

    /* renamed from: j, reason: collision with root package name */
    public final o1 f83104j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public z(dw.e eVar, u autocompleteArgs, qu.c eventReporter, Application application) {
        super(application);
        Intrinsics.g(autocompleteArgs, "autocompleteArgs");
        Intrinsics.g(eventReporter, "eventReporter");
        this.f83096b = eVar;
        this.f83097c = autocompleteArgs;
        Object[] objArr = 0;
        this.f83098d = u1.c(null);
        this.f83099e = u1.c(Boolean.FALSE);
        t1 t1VarB = u1.b(0, 0, null, 7);
        this.f83100f = t1VarB;
        this.f83101g = new n1(t1VarB);
        r2 r2Var = new r2(zg.a.U(2132019633, new Object[0], EmptyList.f71733a), 0, 0, u1.c(null), false, 22);
        this.f83102h = r2Var;
        t2 t2Var = new t2(r2Var, null, 0 == true ? 1 : 0, 6);
        this.f83103i = t2Var;
        o1 queryFlow = t2Var.n;
        this.f83104j = queryFlow;
        je.f fVar = new je.f(29, false);
        m6.a aVarF = g1.f(this);
        l10.z zVar = new l10.z(this, 12);
        Intrinsics.g(queryFlow, "queryFlow");
        t70.m0.t(aVarF, null, null, new i1(queryFlow, fVar, zVar, 0 == true ? 1 : 0, 1), 3);
        t70.m0.t(g1.f(this), null, null, new t(this, 0 == true ? 1 : 0, 0), 3);
        String str = autocompleteArgs.f83093a;
        if (str != null) {
            qu.b bVar = new qu.b(str);
            t70.m0.t(t70.k0.a(eventReporter.f84327c), null, null, new h6.w(eventReporter, bVar, objArr == true ? 1 : 0, 21), 3);
        }
    }

    public final void e() {
        t70.m0.t(g1.f(this), null, null, new t(this, null, 1), 3);
    }
}
