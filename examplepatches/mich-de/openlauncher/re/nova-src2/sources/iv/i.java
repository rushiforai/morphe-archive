package iv;

import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.z2;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class i {
    public static final boolean a(List list) {
        Intrinsics.g(list, "<this>");
        if (list.size() != 1) {
            return false;
        }
        String str = ((bt.g) b70.g.W0(list)).f18480a;
        z2 z2Var = PaymentMethod.Type.f43637g;
        return !Intrinsics.b(str, "card");
    }
}
