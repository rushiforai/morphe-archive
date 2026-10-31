package c4;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class c0 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Ref.LongRef f19566j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ d0 f19567k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ y3.l f19568l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ long f19569m;
    public final /* synthetic */ long n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c0(Ref.LongRef longRef, d0 d0Var, y3.l lVar, long j11, long j12) {
        super(0);
        this.f19566j = longRef;
        this.f19567k = d0Var;
        this.f19568l = lVar;
        this.f19569m = j11;
        this.n = j12;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        d0 d0Var = this.f19567k;
        this.f19566j.f71862a = d0Var.f19581g.s(this.f19568l, this.f19569m, d0Var.f19582h, this.n);
        return Unit.f71706a;
    }
}
