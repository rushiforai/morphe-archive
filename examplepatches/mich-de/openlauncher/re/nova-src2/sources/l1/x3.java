package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class x3 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f74227j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Function0 f74228k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ x3(Function0 function0, int i5) {
        super(1);
        this.f74227j = i5;
        this.f74228k = function0;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f74227j) {
            case 0:
                this.f74228k.invoke();
                break;
            case 1:
                long j11 = ((h2.b) obj).f59016a;
                this.f74228k.invoke();
                break;
            case 2:
                j3.y.i((j3.b0) obj, new j3.g(((Number) this.f74228k.invoke()).floatValue(), new p70.a(0.0f, 1.0f), 0));
                break;
            case 3:
                j3.y.i((j3.b0) obj, new j3.g(((Number) this.f74228k.invoke()).floatValue(), new p70.a(0.0f, 1.0f), 0));
                break;
            default:
                j3.y.i((j3.b0) obj, new j3.g(((Number) this.f74228k.invoke()).floatValue(), new p70.a(0.0f, 1.0f), 0));
                break;
        }
        return Unit.f71706a;
    }
}
