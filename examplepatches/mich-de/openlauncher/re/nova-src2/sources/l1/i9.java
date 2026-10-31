package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class i9 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ z2.i1 f73458j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ l9 f73459k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ float f73460l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i9(z2.i1 i1Var, l9 l9Var, float f11) {
        super(1);
        this.f73458j = i1Var;
        this.f73459k = l9Var;
        this.f73460l = f11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        z2.h1 h1Var = (z2.h1) obj;
        c0.e eVar = this.f73459k.f73615d;
        z2.h1.m(h1Var, this.f73458j, (int) (eVar != null ? ((Number) eVar.e()).floatValue() : this.f73460l), 0);
        return Unit.f71706a;
    }
}
