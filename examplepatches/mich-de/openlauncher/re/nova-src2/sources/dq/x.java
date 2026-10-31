package dq;

import com.stripe.android.core.exception.StripeException;
import com.stripe.android.core.model.StripeModel;
import com.stripe.android.core.networking.ApiRequest$Options;
import java.util.List;
import jt.z0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public abstract class x {
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(s sVar, String str, String str2, List list, ContinuationImpl continuationImpl) throws StripeException {
        v vVar;
        Object objQ;
        if (continuationImpl instanceof v) {
            vVar = (v) continuationImpl;
            int i5 = vVar.f49373u;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                vVar.f49373u = i5 - Integer.MIN_VALUE;
            } else {
                vVar = new v(continuationImpl);
            }
        }
        Object obj = vVar.f49372t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = vVar.f49373u;
        if (i11 == 0) {
            ResultKt.b(obj);
            z0 z0Var = sVar.f49367a;
            ApiRequest$Options apiRequest$Options = new ApiRequest$Options(sVar.f49368b, str2, 4);
            vVar.f49373u = 1;
            objQ = z0Var.Q(str, apiRequest$Options, list, vVar);
            if (objQ == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objQ = ((Result) obj).f71688a;
        }
        Throwable thA = Result.a(objQ);
        if (thA == null) {
            return (StripeModel) objQ;
        }
        int i12 = StripeException.f42562e;
        throw p6.u.i(thA);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(s sVar, String str, String str2, List list, ContinuationImpl continuationImpl) throws StripeException {
        w wVar;
        Object objR;
        if (continuationImpl instanceof w) {
            wVar = (w) continuationImpl;
            int i5 = wVar.f49375u;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wVar.f49375u = i5 - Integer.MIN_VALUE;
            } else {
                wVar = new w(continuationImpl);
            }
        }
        Object obj = wVar.f49374t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wVar.f49375u;
        if (i11 == 0) {
            ResultKt.b(obj);
            z0 z0Var = sVar.f49367a;
            ApiRequest$Options apiRequest$Options = new ApiRequest$Options(sVar.f49368b, str2, 4);
            wVar.f49375u = 1;
            objR = z0Var.R(str, apiRequest$Options, list, wVar);
            if (objR == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objR = ((Result) obj).f71688a;
        }
        Throwable thA = Result.a(objR);
        if (thA == null) {
            return (StripeModel) objR;
        }
        int i12 = StripeException.f42562e;
        throw p6.u.i(thA);
    }
}
