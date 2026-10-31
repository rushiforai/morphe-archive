package iv;

import com.stripe.android.networking.PaymentAnalyticsEvent;
import kotlin.Function;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionAdapter;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements fw.a, FunctionAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Function1 f68119a;

    public d(Function1 function) {
        Intrinsics.g(function, "function");
        this.f68119a = function;
    }

    @Override // fw.a
    public final /* synthetic */ void a() {
        this.f68119a.invoke(PaymentAnalyticsEvent.U);
    }

    @Override // kotlin.jvm.internal.FunctionAdapter
    public final Function b() {
        return this.f68119a;
    }

    public final boolean equals(Object obj) {
        if ((obj instanceof fw.a) && (obj instanceof FunctionAdapter)) {
            return Intrinsics.b(this.f68119a, ((FunctionAdapter) obj).b());
        }
        return false;
    }

    public final int hashCode() {
        return this.f68119a.hashCode();
    }
}
