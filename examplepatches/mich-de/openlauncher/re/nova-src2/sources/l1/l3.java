package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;
import kotlin.math.MathKt;

/* loaded from: classes2.dex */
public final class l3 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f73579j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ z2.i1 f73580k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ int f73581l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l3(int i5, int i11, z2.i1 i1Var) {
        super(1);
        this.f73579j = i5;
        this.f73580k = i1Var;
        this.f73581l = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        ((z2.h1) obj).i(this.f73580k, MathKt.b((this.f73579j - r0.f98081a) / 2.0f), MathKt.b((this.f73581l - r0.f98082b) / 2.0f), 0.0f);
        return Unit.f71706a;
    }
}
