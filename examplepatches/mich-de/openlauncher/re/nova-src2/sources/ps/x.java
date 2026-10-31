package ps;

import com.stripe.android.link.model.LinkAccount;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class x implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f82978a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ LinkAccount f82979b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function1 f82980c;

    public /* synthetic */ x(LinkAccount linkAccount, Function1 function1, int i5, int i11) {
        this.f82978a = i11;
        this.f82979b = linkAccount;
        this.f82980c = function1;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f82978a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                b0.c(this.f82979b, this.f82980c, oVar, p1.a0.l(9));
                break;
            default:
                b0.b(this.f82979b, this.f82980c, oVar, p1.a0.l(9));
                break;
        }
        return Unit.f71706a;
    }
}
