package fs;

import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.link.model.LinkAccount;
import com.stripe.android.model.ConsumerPaymentDetails;
import com.stripe.android.model.ConsumerShippingAddress;
import com.stripe.android.model.ConsumerShippingAddresses;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class j0 {
    public static final LinkAccountUpdate a(h0 h0Var) {
        Intrinsics.g(h0Var, "<this>");
        return (LinkAccountUpdate) ((y) h0Var).f55853a.f55777b.f93973a.getValue();
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0074 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(h0 h0Var, ContinuationImpl continuationImpl) {
        i0 i0Var;
        ConsumerShippingAddresses consumerShippingAddresses;
        Object objH;
        Iterator it;
        Object next;
        ConsumerShippingAddress consumerShippingAddress;
        if (continuationImpl instanceof i0) {
            i0Var = (i0) continuationImpl;
            int i5 = i0Var.f55787v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                i0Var.f55787v = i5 - Integer.MIN_VALUE;
            } else {
                i0Var = new i0(continuationImpl);
            }
        }
        Object obj = i0Var.f55786u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = i0Var.f55787v;
        if (i11 == 0) {
            ResultKt.b(obj);
            y yVar = (y) h0Var;
            consumerShippingAddresses = yVar.f55862j;
            if (consumerShippingAddresses == null) {
                i0Var.f55785t = h0Var;
                i0Var.f55787v = 1;
                objH = yVar.h(i0Var);
                if (objH == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            ArrayList arrayList = consumerShippingAddresses.f43357a;
            y yVar2 = (y) h0Var;
            yVar2.f55862j = consumerShippingAddresses;
            it = arrayList.iterator();
            while (true) {
                if (it.hasNext()) {
                    next = null;
                    break;
                }
                next = it.next();
                if (((ConsumerShippingAddress) next).f43354b) {
                    break;
                }
            }
            consumerShippingAddress = (ConsumerShippingAddress) next;
            if (consumerShippingAddress == null) {
                consumerShippingAddress = (ConsumerShippingAddress) b70.g.Y0(arrayList);
            }
            if (consumerShippingAddress != null) {
                LinkAccount linkAccount = ((LinkAccountUpdate.Value) yVar2.f55853a.f55777b.f93973a.getValue()).f42864a;
                String strB = linkAccount != null ? linkAccount.b() : null;
                String id2 = consumerShippingAddress.f43353a;
                boolean z11 = consumerShippingAddress.f43354b;
                ConsumerPaymentDetails.BillingAddress address = consumerShippingAddress.f43355c;
                Intrinsics.g(id2, "id");
                Intrinsics.g(address, "address");
                return new ConsumerShippingAddress(id2, z11, address, strB);
            }
            return null;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        h0Var = i0Var.f55785t;
        ResultKt.b(obj);
        objH = ((Result) obj).f71688a;
        int i12 = Result.f71687b;
        if (objH instanceof Result.Failure) {
            objH = null;
        }
        consumerShippingAddresses = (ConsumerShippingAddresses) objH;
        if (consumerShippingAddresses != null) {
            ArrayList arrayList2 = consumerShippingAddresses.f43357a;
            y yVar22 = (y) h0Var;
            yVar22.f55862j = consumerShippingAddresses;
            it = arrayList2.iterator();
            while (true) {
                if (it.hasNext()) {
                }
            }
            consumerShippingAddress = (ConsumerShippingAddress) next;
            if (consumerShippingAddress == null) {
            }
            if (consumerShippingAddress != null) {
            }
        }
        return null;
    }
}
