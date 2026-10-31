package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class v7 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ b2.t f74134j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ boolean f74135k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ boolean f74136l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ u7 f74137m;
    public final /* synthetic */ i0.i n;
    public final /* synthetic */ i2.v0 o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ int f74138p;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v7(b2.t tVar, boolean z11, boolean z12, u7 u7Var, i0.i iVar, i2.v0 v0Var, int i5) {
        super(2);
        this.f74134j = tVar;
        this.f74135k = z11;
        this.f74136l = z12;
        this.f74137m = u7Var;
        this.n = iVar;
        this.o = v0Var;
        this.f74138p = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        androidx.compose.material3.a.b(this.f74134j, this.f74135k, this.f74136l, this.f74137m, this.n, this.o, (p1.o) obj, p1.a0.l(this.f74138p | 1));
        return Unit.f71706a;
    }
}
