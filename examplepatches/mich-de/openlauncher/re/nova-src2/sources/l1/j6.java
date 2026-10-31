package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class j6 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ m6 f73499j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ i0.i f73500k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ b2.t f73501l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ h6 f73502m;
    public final /* synthetic */ boolean n;
    public final /* synthetic */ long o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j6(m6 m6Var, i0.i iVar, b2.t tVar, h6 h6Var, boolean z11, long j11, int i5) {
        super(2);
        this.f73499j = m6Var;
        this.f73500k = iVar;
        this.f73501l = tVar;
        this.f73502m = h6Var;
        this.n = z11;
        this.o = j11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        int iL = p1.a0.l(196609);
        this.f73499j.a(this.f73500k, this.f73501l, this.f73502m, this.n, this.o, (p1.o) obj, iL);
        return Unit.f71706a;
    }
}
