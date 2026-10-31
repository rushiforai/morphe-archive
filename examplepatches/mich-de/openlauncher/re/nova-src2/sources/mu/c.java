package mu;

import android.content.Context;
import com.stripe.android.financialconnections.FinancialConnectionsSheetKt;
import e00.s0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class c {
    public static final Function1 a(b bVar, Context context) {
        Intrinsics.g(context, "context");
        int iOrdinal = bVar.ordinal();
        if (iOrdinal == 0) {
            return FinancialConnectionsSheetKt.intentBuilder(context);
        }
        if (iOrdinal == 1) {
            return new s0(context, 4);
        }
        throw new NoWhenBranchMatchedException();
    }
}
