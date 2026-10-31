package ts;

import com.stripe.android.core.strings.ResolvableString;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import p1.a0;
import p1.o;
import ys.s0;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f89574a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ResolvableString f89575b;

    public /* synthetic */ c(ResolvableString resolvableString, int i5, int i11) {
        this.f89574a = i11;
        this.f89575b = resolvableString;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f89574a;
        o oVar = (o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                f.f(this.f89575b, oVar, a0.l(1));
                break;
            default:
                s0.g(this.f89575b, oVar, a0.l(1));
                break;
        }
        return Unit.f71706a;
    }
}
