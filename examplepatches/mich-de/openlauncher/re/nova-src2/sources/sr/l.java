package sr;

import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityArgs;
import h6.f1;
import h6.g1;
import h6.u0;
import kotlin.jvm.internal.Intrinsics;
import t70.c0;
import t70.m0;
import w70.i2;
import w70.n1;
import w70.t1;
import w70.u1;

/* loaded from: classes4.dex */
public final class l extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final xq.c f87723a;

    /* renamed from: b, reason: collision with root package name */
    public final og.i f87724b;

    /* renamed from: c, reason: collision with root package name */
    public final c0 f87725c;

    /* renamed from: d, reason: collision with root package name */
    public final FinancialConnectionsSheetActivityArgs f87726d;

    /* renamed from: e, reason: collision with root package name */
    public final t1 f87727e;

    /* renamed from: f, reason: collision with root package name */
    public final n1 f87728f;

    /* renamed from: g, reason: collision with root package name */
    public final i2 f87729g;

    public l(xq.c logger, u0 u0Var, og.i iVar, c0 workContext, String str) {
        Intrinsics.g(logger, "logger");
        Intrinsics.g(workContext, "workContext");
        this.f87723a = logger;
        this.f87724b = iVar;
        this.f87725c = workContext;
        FinancialConnectionsSheetActivityArgs financialConnectionsSheetActivityArgs = (FinancialConnectionsSheetActivityArgs) u0Var.a("FinancialConnectionsSheetActivityArgs");
        if (financialConnectionsSheetActivityArgs == null) {
            throw new IllegalStateException("Missing arguments");
        }
        this.f87726d = financialConnectionsSheetActivityArgs;
        t1 t1VarB = u1.b(0, 0, null, 7);
        this.f87727e = t1VarB;
        this.f87728f = new n1(t1VarB);
        this.f87729g = u1.c(null);
        m0.t(g1.f(this), workContext, null, new a(str, null, this), 2);
    }

    public final void e(String str, Throwable th2) {
        this.f87723a.b(str, th2);
        m0.t(g1.f(this), null, null, new g(this, th2, null), 3);
    }
}
