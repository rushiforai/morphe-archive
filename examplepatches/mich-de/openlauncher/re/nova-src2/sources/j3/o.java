package j3;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.reflect.KProperty;

/* loaded from: classes2.dex */
public final class o extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f68817j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ String f68818k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ o(String str, int i5) {
        super(1);
        this.f68817j = i5;
        this.f68818k = str;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5 = this.f68817j;
        String str = this.f68818k;
        switch (i5) {
            case 0:
                y.e(str, (b0) obj);
                return Unit.f71706a;
            case 1:
                y.g(str, (b0) obj);
                return Unit.f71706a;
            case 2:
                y.e(str, (b0) obj);
                return Unit.f71706a;
            case 3:
                b0 b0Var = (b0) obj;
                y.g(str, b0Var);
                a0 a0Var = w.f68868s;
                KProperty kProperty = y.f68878a[10];
                a0Var.a(b0Var, Float.valueOf(0.0f));
                return Unit.f71706a;
            case 4:
                KProperty[] kPropertyArr = y.f68878a;
                ((k) ((b0) obj)).f(w.K, str);
                return Unit.f71706a;
            case 5:
                b0 b0Var2 = (b0) obj;
                y.e(str, b0Var2);
                y.j(b0Var2, 5);
                return Unit.f71706a;
            default:
                return Boolean.valueOf(Intrinsics.b((String) obj, str));
        }
    }
}
