package gu;

import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.SetupIntent;
import ft.m0;
import ft.r0;
import java.util.List;
import jt.z0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: b, reason: collision with root package name */
    public static final List f57819b = ul.b.P("payment_method");

    /* renamed from: a, reason: collision with root package name */
    public final z0 f57820a;

    public c(z0 z0Var) {
        this.f57820a = z0Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, String str2, String str3, String str4, ContinuationImpl continuationImpl) {
        a aVar;
        Object objA;
        Object objA2;
        Object objA3;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i5 = aVar.f57815v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f57815v = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, continuationImpl);
            }
        }
        a aVar2 = aVar;
        Object obj = aVar2.f57813t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar2.f57815v;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                try {
                    int i12 = Result.f71687b;
                    objA2 = new m0(str3);
                } catch (Throwable th2) {
                    int i13 = Result.f71687b;
                    objA2 = ResultKt.a(th2);
                }
                if (objA2 instanceof Result.Failure) {
                    return objA2;
                }
                m0 m0Var = (m0) objA2;
                z0 z0Var = this.f57820a;
                String str5 = m0Var.f55968a;
                String str6 = m0Var.f55969b;
                ApiRequest$Options apiRequest$Options = new ApiRequest$Options(str, str4, 4);
                List list = f57819b;
                aVar2.f57815v = 1;
                objA3 = z0Var.a(str5, str6, str2, apiRequest$Options, list, aVar2);
                if (objA3 == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objA3 = ((Result) obj).f71688a;
            }
            ResultKt.b(objA3);
            objA = (PaymentIntent) objA3;
            int i14 = Result.f71687b;
        } catch (Throwable th3) {
            int i15 = Result.f71687b;
            objA = ResultKt.a(th3);
        }
        return objA;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(String str, String str2, String str3, String str4, ContinuationImpl continuationImpl) {
        b bVar;
        Object objA;
        Object objA2;
        Object objB;
        if (continuationImpl instanceof b) {
            bVar = (b) continuationImpl;
            int i5 = bVar.f57818v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f57818v = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, continuationImpl);
            }
        }
        b bVar2 = bVar;
        Object obj = bVar2.f57816t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar2.f57818v;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                try {
                    int i12 = Result.f71687b;
                    objA2 = new r0(str3);
                } catch (Throwable th2) {
                    int i13 = Result.f71687b;
                    objA2 = ResultKt.a(th2);
                }
                if (objA2 instanceof Result.Failure) {
                    return objA2;
                }
                r0 r0Var = (r0) objA2;
                z0 z0Var = this.f57820a;
                String str5 = r0Var.f56018a;
                String str6 = r0Var.f56019b;
                ApiRequest$Options apiRequest$Options = new ApiRequest$Options(str, str4, 4);
                List list = f57819b;
                bVar2.f57818v = 1;
                objB = z0Var.b(str5, str6, str2, apiRequest$Options, list, bVar2);
                if (objB == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objB = ((Result) obj).f71688a;
            }
            ResultKt.b(objB);
            objA = (SetupIntent) objB;
            int i14 = Result.f71687b;
        } catch (Throwable th3) {
            int i15 = Result.f71687b;
            objA = ResultKt.a(th3);
        }
        return objA;
    }
}
