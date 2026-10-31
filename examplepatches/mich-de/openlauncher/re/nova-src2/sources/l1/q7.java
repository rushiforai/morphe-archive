package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;
import kotlin.reflect.KProperty;

/* loaded from: classes.dex */
public final class q7 extends Lambda implements Function1 {

    /* renamed from: k, reason: collision with root package name */
    public static final q7 f73848k;

    /* renamed from: l, reason: collision with root package name */
    public static final q7 f73849l;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f73850j;

    static {
        int i5 = 1;
        f73848k = new q7(i5, 0);
        f73849l = new q7(i5, 1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ q7(int i5, int i11) {
        super(i5);
        this.f73850j = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f73850j) {
            case 0:
                KProperty[] kPropertyArr = j3.y.f68878a;
                j3.a0 a0Var = j3.w.f68863l;
                KProperty kProperty = j3.y.f68878a[5];
                a0Var.a((j3.b0) obj, Boolean.TRUE);
                break;
            default:
                break;
        }
        return Unit.f71706a;
    }
}
