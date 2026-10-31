package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class h5 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f73381j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ z2.i1 f73382k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ int f73383l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ h5(int i5, int i11, z2.i1 i1Var) {
        super(1);
        this.f73381j = i11;
        this.f73382k = i1Var;
        this.f73383l = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f73381j) {
            case 0:
                ((z2.h1) obj).i(this.f73382k, 0, -this.f73383l, 0.0f);
                break;
            default:
                ((z2.h1) obj).i(this.f73382k, -this.f73383l, 0, 0.0f);
                break;
        }
        return Unit.f71706a;
    }
}
