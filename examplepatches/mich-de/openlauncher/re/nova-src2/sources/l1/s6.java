package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class s6 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ z2.i1 f73962j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ int f73963k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ int f73964l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ z2.i1 f73965m;
    public final /* synthetic */ int n;
    public final /* synthetic */ int o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s6(z2.i1 i1Var, int i5, int i11, z2.i1 i1Var2, int i12, int i13) {
        super(1);
        this.f73962j = i1Var;
        this.f73963k = i5;
        this.f73964l = i11;
        this.f73965m = i1Var2;
        this.n = i12;
        this.o = i13;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        z2.h1 h1Var = (z2.h1) obj;
        z2.h1.m(h1Var, this.f73962j, this.f73963k, this.f73964l);
        z2.h1.m(h1Var, this.f73965m, this.n, this.o);
        return Unit.f71706a;
    }
}
