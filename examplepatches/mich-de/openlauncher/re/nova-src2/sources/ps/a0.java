package ps;

import com.stripe.android.link.model.LinkAccount;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a0 implements Function4 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f82841a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function0 f82842b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function1 f82843c;

    public /* synthetic */ a0(int i5, Function0 function0, Function1 function1) {
        this.f82841a = i5;
        this.f82842b = function0;
        this.f82843c = function1;
    }

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        switch (this.f82841a) {
            case 0:
                b0.p composable = (b0.p) obj;
                p6.n it = (p6.n) obj2;
                p1.o oVar = (p1.o) obj3;
                ((Number) obj4).intValue();
                Intrinsics.g(composable, "$this$composable");
                Intrinsics.g(it, "it");
                LinkAccount linkAccount = (LinkAccount) this.f82842b.invoke();
                Function1 function1 = this.f82843c;
                if (linkAccount == null) {
                    function1.invoke(b0.i());
                } else {
                    b0.c(linkAccount, function1, oVar, 8);
                }
                break;
            default:
                b0.p composable2 = (b0.p) obj;
                p6.n it2 = (p6.n) obj2;
                p1.o oVar2 = (p1.o) obj3;
                ((Number) obj4).intValue();
                Intrinsics.g(composable2, "$this$composable");
                Intrinsics.g(it2, "it");
                LinkAccount linkAccount2 = (LinkAccount) this.f82842b.invoke();
                Function1 function12 = this.f82843c;
                if (linkAccount2 == null) {
                    function12.invoke(b0.i());
                } else {
                    b0.b(linkAccount2, function12, oVar2, 8);
                }
                break;
        }
        return Unit.f71706a;
    }
}
