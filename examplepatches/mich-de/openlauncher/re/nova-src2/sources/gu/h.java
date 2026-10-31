package gu;

import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.financialconnections.ElementsSessionContext;
import com.stripe.android.model.FinancialConnectionsSession;
import com.stripe.android.model.q0;
import com.stripe.android.model.r0;
import com.stripe.android.payments.bankaccount.CollectBankAccountConfiguration;
import ft.d0;
import ft.m0;
import ft.o;
import ft.p;
import ft.v0;
import jt.z0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final z0 f57831a;

    public h(z0 z0Var) {
        this.f57831a = z0Var;
    }

    public static p d(CollectBankAccountConfiguration collectBankAccountConfiguration, String str, String str2) {
        if (collectBankAccountConfiguration instanceof CollectBankAccountConfiguration.USBankAccount) {
            CollectBankAccountConfiguration.USBankAccount uSBankAccount = (CollectBankAccountConfiguration.USBankAccount) collectBankAccountConfiguration;
            return new r0(str, uSBankAccount.f44247a, uSBankAccount.f44248b, str2, null);
        }
        if (collectBankAccountConfiguration instanceof CollectBankAccountConfiguration.USBankAccountInternal) {
            CollectBankAccountConfiguration.USBankAccountInternal uSBankAccountInternal = (CollectBankAccountConfiguration.USBankAccountInternal) collectBankAccountConfiguration;
            String str3 = uSBankAccountInternal.f44249a;
            String str4 = uSBankAccountInternal.f44250b;
            ElementsSessionContext elementsSessionContext = uSBankAccountInternal.f44251c;
            return new r0(str, str3, str4, str2, elementsSessionContext != null ? elementsSessionContext.f42635c : null);
        }
        if (!(collectBankAccountConfiguration instanceof CollectBankAccountConfiguration.InstantDebits)) {
            throw new NoWhenBranchMatchedException();
        }
        CollectBankAccountConfiguration.InstantDebits instantDebits = (CollectBankAccountConfiguration.InstantDebits) collectBankAccountConfiguration;
        String str5 = instantDebits.f44245a;
        ElementsSessionContext elementsSessionContext2 = instantDebits.f44246b;
        return new q0(str, str5, str2, elementsSessionContext2 != null ? elementsSessionContext2.f42635c : null);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, String str2, String str3, String str4, String str5, String str6, d0 d0Var, Integer num, String str7, String str8, ContinuationImpl continuationImpl) {
        e eVar;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.f57824v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f57824v = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(this, continuationImpl);
            }
        }
        Object obj = eVar.f57822t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f57824v;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return ((Result) obj).f71688a;
        }
        ResultKt.b(obj);
        v0 v0Var = v0.f56064a;
        o oVar = new o(str3, str6, str4, str5, d0Var, str8, num, str7);
        ApiRequest$Options apiRequest$Options = new ApiRequest$Options(str, str2, 4);
        eVar.f57824v = 1;
        Object objN = this.f57831a.n(oVar, apiRequest$Options, eVar);
        return objN == coroutineSingletons ? coroutineSingletons : objN;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(String str, String str2, String str3, String str4, CollectBankAccountConfiguration collectBankAccountConfiguration, ContinuationImpl continuationImpl) {
        f fVar;
        Object objA;
        Object objA2;
        Object objO;
        if (continuationImpl instanceof f) {
            fVar = (f) continuationImpl;
            int i5 = fVar.f57827v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fVar.f57827v = i5 - Integer.MIN_VALUE;
            } else {
                fVar = new f(this, continuationImpl);
            }
        }
        Object obj = fVar.f57825t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fVar.f57827v;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                try {
                    int i12 = Result.f71687b;
                    objA2 = new m0(str2);
                } catch (Throwable th2) {
                    int i13 = Result.f71687b;
                    objA2 = ResultKt.a(th2);
                }
                if (objA2 instanceof Result.Failure) {
                    return objA2;
                }
                z0 z0Var = this.f57831a;
                String str5 = ((m0) objA2).f55969b;
                p pVarD = d(collectBankAccountConfiguration, str2, str4);
                ApiRequest$Options apiRequest$Options = new ApiRequest$Options(str, str3, 4);
                fVar.f57827v = 1;
                objO = z0Var.o(str5, pVarD, apiRequest$Options, fVar);
                if (objO == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                objO = ((Result) obj).f71688a;
            }
            ResultKt.b(objO);
            objA = (FinancialConnectionsSession) objO;
            int i14 = Result.f71687b;
        } catch (Throwable th3) {
            int i15 = Result.f71687b;
            objA = ResultKt.a(th3);
        }
        return objA;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(String str, String str2, String str3, String str4, CollectBankAccountConfiguration collectBankAccountConfiguration, ContinuationImpl continuationImpl) {
        g gVar;
        Object objA;
        Object objA2;
        Object objR;
        if (continuationImpl instanceof g) {
            gVar = (g) continuationImpl;
            int i5 = gVar.f57830v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar.f57830v = i5 - Integer.MIN_VALUE;
            } else {
                gVar = new g(this, continuationImpl);
            }
        }
        Object obj = gVar.f57828t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gVar.f57830v;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                try {
                    int i12 = Result.f71687b;
                    objA2 = new ft.r0(str2);
                } catch (Throwable th2) {
                    int i13 = Result.f71687b;
                    objA2 = ResultKt.a(th2);
                }
                if (objA2 instanceof Result.Failure) {
                    return objA2;
                }
                z0 z0Var = this.f57831a;
                String str5 = ((ft.r0) objA2).f56019b;
                p pVarD = d(collectBankAccountConfiguration, str2, str4);
                ApiRequest$Options apiRequest$Options = new ApiRequest$Options(str, str3, 4);
                gVar.f57830v = 1;
                objR = z0Var.r(str5, pVarD, apiRequest$Options, gVar);
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
            ResultKt.b(objR);
            objA = (FinancialConnectionsSession) objR;
            int i14 = Result.f71687b;
        } catch (Throwable th3) {
            int i15 = Result.f71687b;
            objA = ResultKt.a(th3);
        }
        return objA;
    }
}
