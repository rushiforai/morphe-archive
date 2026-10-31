package os;

import b00.i0;
import cw.l2;
import e00.p6;
import f1.t0;
import hw.m;
import hw.n;
import hw.q;
import hw.r;
import i2.r0;
import p1.o;
import p1.t;
import p1.t1;

/* loaded from: classes4.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final long f80724a = r0.c(4279703319L);

    /* renamed from: b, reason: collision with root package name */
    public static final long f80725b = r0.c(4280690214L);

    /* renamed from: c, reason: collision with root package name */
    public static final long f80726c = r0.c(4282400832L);

    /* renamed from: d, reason: collision with root package name */
    public static final long f80727d = r0.c(4285558896L);

    /* renamed from: e, reason: collision with root package name */
    public static final long f80728e = r0.c(4288914339L);

    /* renamed from: f, reason: collision with root package name */
    public static final long f80729f = r0.c(4292138196L);

    /* renamed from: g, reason: collision with root package name */
    public static final long f80730g = r0.c(4293256677L);

    /* renamed from: h, reason: collision with root package name */
    public static final long f80731h = r0.c(4294309365L);

    /* renamed from: i, reason: collision with root package name */
    public static final long f80732i = r0.c(4294967295L);

    /* renamed from: j, reason: collision with root package name */
    public static final long f80733j = r0.c(4278216245L);

    /* renamed from: k, reason: collision with root package name */
    public static final long f80734k = r0.c(4278231893L);

    /* renamed from: l, reason: collision with root package name */
    public static final long f80735l = r0.c(4278244975L);

    /* renamed from: m, reason: collision with root package name */
    public static final long f80736m = r0.c(4290777660L);
    public static final long n = r0.c(4293269831L);
    public static final long o = r0.c(4294593127L);

    public static final void a(m mVar, x1.e eVar, o oVar, int i5, int i11) {
        m mVar2;
        int i12;
        x1.e eVar2;
        m mVar3;
        t tVar = (t) oVar;
        tVar.d0(-896902563);
        int i13 = i11 & 1;
        if (i13 != 0) {
            i12 = i5 | 6;
            mVar2 = mVar;
        } else if ((i5 & 6) == 0) {
            mVar2 = mVar;
            i12 = i5 | (tVar.f(mVar2) ? 4 : 2);
        } else {
            mVar2 = mVar;
            i12 = i5;
        }
        if ((i12 & 19) == 18 && tVar.E()) {
            tVar.V();
            eVar2 = eVar;
            mVar3 = mVar2;
        } else {
            m mVar4 = i13 != 0 ? m.f60751b : mVar2;
            n nVar = q.f60776a;
            n nVar2 = l2.r(tVar).f80737a ? q.f60777b : q.f60776a;
            m mVar5 = mVar4;
            eVar2 = eVar;
            r.a(n.a(nVar2, l2.r(tVar).f80739c, l2.r(tVar).f80739c, l2.r(tVar).f80742f, l2.r(tVar).f80749m, 0L, l2.r(tVar).o, 0L, t0.a(nVar2.f60761i, l2.r(tVar).f80743g, l2.r(tVar).f80752r, 8126), 176), new hw.o(12.0f, 24.0f, q.f60778c.f60764c), q.f60779d, null, mVar5, q.f60789p, q.f60791r, x1.f.d(-1570603149, new i0(eVar2, 18), tVar), tVar, 12582912 | ((i12 << 12) & 57344), 0);
            mVar3 = mVar5;
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new p6(i5, i11, 1, mVar3, eVar2);
        }
    }
}
