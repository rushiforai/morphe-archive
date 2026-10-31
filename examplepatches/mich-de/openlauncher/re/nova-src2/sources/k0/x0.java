package k0;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final /* synthetic */ class x0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70772a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ z2.i1 f70773b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f70774c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f70775d;

    public /* synthetic */ x0(int i5, int i11, int i12, z2.i1 i1Var) {
        this.f70772a = i12;
        this.f70773b = i1Var;
        this.f70774c = i5;
        this.f70775d = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f70772a) {
            case 0:
                ((z2.h1) obj).i(this.f70773b, this.f70774c, this.f70775d, 0.0f);
                break;
            default:
                ((z2.h1) obj).i(this.f70773b, this.f70774c, this.f70775d, 0.0f);
                break;
        }
        return Unit.f71706a;
    }
}
