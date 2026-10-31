package j00;

import android.os.CancellationSignal;
import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import com.stripe.android.lpmfoundations.paymentmethod.CustomerMetadata;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.paymentsheet.state.CustomerState;
import com.teslacoilsw.launcher.search.NovaSearchProvider;
import java.util.List;
import java.util.Map;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kw.e3;
import kw.w0;
import kw.z1;
import n0.y0;
import r10.b1;

/* loaded from: classes4.dex */
public final /* synthetic */ class k0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68515a;

    public /* synthetic */ k0(int i5) {
        this.f68515a = 29;
        mx.c0 c0Var = mx.c0.NONE;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        CustomerMetadata customerMetadata;
        switch (this.f68515a) {
            case 0:
                ((Integer) obj).intValue();
                break;
            case 1:
                break;
            case 2:
                Function0 f11 = (Function0) obj2;
                Intrinsics.g(f11, "f");
                k5.a aVar = k5.c.f71100c;
                k5.b.a((CancellationSignal) obj, f11);
                break;
            case 3:
                String message = (String) obj;
                Throwable error = (Throwable) obj2;
                Intrinsics.g(message, "message");
                Intrinsics.g(error, "error");
                break;
            case 4:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                boolean zBooleanValue2 = ((Boolean) obj2).booleanValue();
                if (!zBooleanValue && !zBooleanValue2) {
                    z = true;
                }
                break;
            case 5:
                boolean zBooleanValue3 = ((Boolean) obj).booleanValue();
                String value = (String) obj2;
                Intrinsics.g(value, "value");
                break;
            case 6:
                com.stripe.android.uicore.elements.a element = (com.stripe.android.uicore.elements.a) obj;
                boolean zBooleanValue4 = ((Boolean) obj2).booleanValue();
                Intrinsics.g(element, "element");
                element.a(zBooleanValue4);
                break;
            case 7:
                Integer num = (Integer) obj2;
                if (((Boolean) obj).booleanValue() && num == null) {
                    break;
                }
                break;
            case 8:
                break;
            case 9:
                String value2 = (String) obj;
                z1 formatter = (z1) obj2;
                Intrinsics.g(value2, "value");
                Intrinsics.g(formatter, "formatter");
                break;
            case 10:
                String rawFieldValue = (String) obj;
                boolean zBooleanValue5 = ((Boolean) obj2).booleanValue();
                Intrinsics.g(rawFieldValue, "rawFieldValue");
                break;
            case 11:
                boolean zBooleanValue6 = ((Boolean) obj).booleanValue();
                e3 fieldState = (e3) obj2;
                Intrinsics.g(fieldState, "fieldState");
                w0 w0VarG = fieldState.g();
                if (w0VarG != null && zBooleanValue6) {
                    break;
                }
                break;
            case 12:
                boolean zBooleanValue7 = ((Boolean) obj).booleanValue();
                String value3 = (String) obj2;
                Intrinsics.g(value3, "value");
                break;
            case 13:
                Function0 f12 = (Function0) obj2;
                Intrinsics.g(f12, "f");
                CredentialProviderPlayServicesImpl.Companion.getClass();
                if (!j5.d.a((CancellationSignal) obj)) {
                    f12.invoke();
                }
                break;
            case 14:
                Boolean boolValueOf = Boolean.valueOf(((m3.x) obj2).f75988a);
                ab.c0 c0Var = m3.e0.f75856a;
                break;
            case 15:
                break;
            case 16:
                x3.s sVar = (x3.s) obj2;
                x3.r rVar = new x3.r(sVar.f95035a);
                ab.c0 c0Var2 = m3.e0.f75856a;
                break;
            case 17:
                z2.s intrinsicMeasurable = (z2.s) obj;
                int iIntValue = ((Integer) obj2).intValue();
                Intrinsics.g(intrinsicMeasurable, "intrinsicMeasurable");
                break;
            case 18:
                z2.s intrinsicMeasurable2 = (z2.s) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                Intrinsics.g(intrinsicMeasurable2, "intrinsicMeasurable");
                break;
            case 19:
                z2.s intrinsicMeasurable3 = (z2.s) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                Intrinsics.g(intrinsicMeasurable3, "intrinsicMeasurable");
                break;
            case 20:
                z2.s intrinsicMeasurable4 = (z2.s) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                Intrinsics.g(intrinsicMeasurable4, "intrinsicMeasurable");
                break;
            case 21:
                Map mapD = ((y0) obj2).d();
                if (!mapD.isEmpty()) {
                    break;
                }
                break;
            case 22:
                CustomerMetadata.Permissions permissions = (CustomerMetadata.Permissions) obj2;
                break;
            case 23:
                List paymentMethods = (List) obj;
                CustomerMetadata.Permissions permissions2 = (CustomerMetadata.Permissions) obj2;
                Intrinsics.g(paymentMethods, "paymentMethods");
                if (permissions2 != null) {
                    tq.a aVar2 = permissions2.f43076a;
                    boolean z11 = aVar2 == tq.a.f89560b || aVar2 == tq.a.f89561c;
                    boolean z12 = permissions2.f43077b;
                    int size = paymentMethods.size();
                    if (size != 0) {
                        if (size != 1) {
                            z = z11;
                        } else if (z12 && z11) {
                            z = true;
                        }
                    }
                }
                break;
            case 24:
                CustomerState customerState = (CustomerState) obj;
                PaymentMethodMetadata paymentMethodMetadata = (PaymentMethodMetadata) obj2;
                if (paymentMethodMetadata != null && (customerMetadata = paymentMethodMetadata.f43105p) != null && customerMetadata.f43074d && customerState != null) {
                    break;
                }
                break;
            case 25:
                p0.b bVar = (p0.b) obj2;
                break;
            case 26:
                CharSequence s11 = (CharSequence) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                Intrinsics.g(s11, "s");
                break;
            case 27:
                o50.s m11 = (o50.s) obj;
                int iIntValue6 = ((Integer) obj2).intValue();
                Intrinsics.g(m11, "m");
                break;
            case 28:
                String str = (String) obj;
                int iIntValue7 = ((Integer) obj2).intValue();
                b1 b1Var = NovaSearchProvider.Companion;
                if (!tx.p.b()) {
                    break;
                } else {
                    try {
                        fo.d.f().addTriggeredQuery("User searched for '" + str + "' " + iIntValue7 + " times this week without resolution", 86400000L, "search_repeated");
                    } catch (Exception unused) {
                    }
                    break;
                }
            default:
                mx.c0 c0Var3 = mx.c0.NONE;
                ((Integer) obj2).getClass();
                s00.f.b((p1.o) obj, p1.a0.l(7));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ k0(int i5, byte b11) {
        this.f68515a = i5;
    }
}
