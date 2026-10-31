package ou;

import android.content.SharedPreferences;
import com.stripe.android.paymentsheet.model.SavedSelection;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ g f80858t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ boolean f80859u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ boolean f80860v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(g gVar, boolean z11, boolean z12, Continuation continuation) {
        super(2, continuation);
        this.f80858t = gVar;
        this.f80859u = z11;
        this.f80860v = z12;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new f(this.f80858t, this.f80859u, this.f80860v, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((f) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        String strL;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        g gVar = this.f80858t;
        Object value = gVar.f80872d.getValue();
        Intrinsics.f(value, "getValue(...)");
        SharedPreferences sharedPreferences = (SharedPreferences) value;
        String str = gVar.f80870b;
        if (str == null || (strL = b.c0.l("customer[", str, "]")) == null) {
            strL = "guest";
        }
        Object paymentMethod = null;
        String string = sharedPreferences.getString(strL, null);
        if (string == null) {
            string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        List listI1 = r70.k.i1(string, new String[]{":"}, 6);
        String str2 = (String) b70.g.Y0(listI1);
        if (str2 != null) {
            int iHashCode = str2.hashCode();
            if (iHashCode != -1534821982) {
                if (iHashCode != -1029412550) {
                    if (iHashCode == 3321850 && str2.equals("link") && this.f80860v) {
                        paymentMethod = SavedSelection.Link.f44851a;
                    }
                } else if (str2.equals("payment_method")) {
                    String str3 = (String) b70.g.Z0(1, listI1);
                    if (str3 != null) {
                        String str4 = (String) b70.g.Z0(2, listI1);
                        paymentMethod = new SavedSelection.PaymentMethod(str3, str4 != null && Boolean.parseBoolean(str4));
                    }
                }
            } else if (str2.equals("google_pay") && this.f80859u) {
                paymentMethod = SavedSelection.GooglePay.f44850a;
            }
        }
        return paymentMethod == null ? SavedSelection.None.f44852a : paymentMethod;
    }
}
