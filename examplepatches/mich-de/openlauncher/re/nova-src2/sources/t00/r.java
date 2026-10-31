package t00;

import i2.s0;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class r implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f88400a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ h f88401b;

    public /* synthetic */ r(h hVar, int i5) {
        this.f88400a = i5;
        this.f88401b = hVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f88400a) {
            case 0:
                ((s0) ((i2.a0) obj)).t(this.f88401b.b());
                break;
            case 1:
                ((s0) ((i2.a0) obj)).t(((Number) this.f88401b.f88358j.e()).floatValue());
                break;
            case 2:
                this.f88401b.e(((h2.b) obj).f59016a);
                break;
            default:
                this.f88401b.e(((h2.b) obj).f59016a);
                break;
        }
        return Unit.f71706a;
    }
}
