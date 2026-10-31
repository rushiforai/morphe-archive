package gv;

import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentsheet.model.SavedSelection;
import java.util.Iterator;
import java.util.List;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class j0 {
    /* JADX WARN: Removed duplicated region for block: B:25:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0079 A[EDGE_INSN: B:40:0x0079->B:36:0x0079 BREAK  A[LOOP:0: B:31:0x0063->B:42:?], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:43:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(List list, t70.p0 p0Var, boolean z11, String str, ContinuationImpl continuationImpl) {
        i0 i0Var;
        SavedSelection savedSelection;
        Iterator it;
        PaymentMethod paymentMethod;
        if (continuationImpl instanceof i0) {
            i0Var = (i0) continuationImpl;
            int i5 = i0Var.f57876v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                i0Var.f57876v = i5 - Integer.MIN_VALUE;
            } else {
                i0Var = new i0(continuationImpl);
            }
        }
        Object objL = i0Var.f57875u;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = i0Var.f57876v;
        Object obj2 = null;
        if (i11 == 0) {
            ResultKt.b(objL);
            if (!z11) {
                if (p0Var != null) {
                    i0Var.f57874t = list;
                    i0Var.f57876v = 1;
                    objL = p0Var.l(i0Var);
                    if (objL == obj) {
                        return obj;
                    }
                } else {
                    savedSelection = null;
                    SavedSelection.PaymentMethod paymentMethod2 = !(savedSelection instanceof SavedSelection.PaymentMethod) ? (SavedSelection.PaymentMethod) savedSelection : null;
                    str = paymentMethod2 == null ? paymentMethod2.f44853a : null;
                }
            }
            List list2 = list;
            it = list2.iterator();
            while (true) {
                if (it.hasNext()) {
                    break;
                }
                Object next = it.next();
                if (Intrinsics.b(((PaymentMethod) next).f43569a, str)) {
                    obj2 = next;
                    break;
                }
            }
            paymentMethod = (PaymentMethod) obj2;
            if (paymentMethod == null) {
                return b70.g.t1(b70.g.p1(list2, paymentMethod), ul.b.P(paymentMethod));
            }
            return list;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        list = i0Var.f57874t;
        ResultKt.b(objL);
        savedSelection = (SavedSelection) objL;
        if (!(savedSelection instanceof SavedSelection.PaymentMethod)) {
        }
        if (paymentMethod2 == null) {
        }
        List list22 = list;
        it = list22.iterator();
        while (true) {
            if (it.hasNext()) {
            }
        }
        paymentMethod = (PaymentMethod) obj2;
        if (paymentMethod == null) {
        }
    }
}
