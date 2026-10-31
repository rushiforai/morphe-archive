package sr;

import android.net.Uri;
import android.util.Base64;
import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityResult;
import com.stripe.android.financialconnections.launcher.InstantDebitsResult;
import com.stripe.android.financialconnections.model.FinancialConnectionsSession;
import com.stripe.android.model.Token;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import t70.j0;
import w70.t1;

/* loaded from: classes4.dex */
public final class j extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public Object f87714t;

    /* renamed from: u, reason: collision with root package name */
    public int f87715u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ String f87716v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ l f87717w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(String str, Continuation continuation, l lVar) {
        super(2, continuation);
        this.f87716v = str;
        this.f87717w = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new j(this.f87716v, continuation, this.f87717w);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((j) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0097  */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        Object objA;
        Object obj2;
        String queryParameter;
        Throwable thA;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f87715u;
        l lVar = this.f87717w;
        String str = this.f87716v;
        if (i5 == 0) {
            ResultKt.b(obj);
            Uri uri = Uri.parse(str);
            Intrinsics.g(uri, "uri");
            try {
                int i11 = Result.f71687b;
                queryParameter = uri.getQueryParameter("payment_method");
            } catch (Throwable th2) {
                int i12 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            if (queryParameter == null) {
                throw new IllegalArgumentException("Required value was null.");
            }
            byte[] bArrDecode = Base64.decode(queryParameter, 0);
            Intrinsics.f(bArrDecode, "decode(...)");
            objA = new InstantDebitsResult(new String(bArrDecode, Charsets.f72000b), uri.getQueryParameter("last4"), uri.getQueryParameter("bank_name"), Boolean.parseBoolean(uri.getQueryParameter("incentive_eligible")));
            if (!(objA instanceof Result.Failure)) {
                t1 t1Var = lVar.f87727e;
                c cVar = new c(new FinancialConnectionsSheetActivityResult.Completed((InstantDebitsResult) objA, (FinancialConnectionsSession) null, (Token) null));
                this.f87714t = objA;
                this.f87715u = 1;
                if (t1Var.emit(cVar, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                obj2 = objA;
            }
            thA = Result.a(objA);
            if (thA != null) {
                lVar.e("Failed to parse instant debits result from url: ".concat(str), thA);
            }
            return Unit.f71706a;
        }
        if (i5 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        obj2 = this.f87714t;
        ResultKt.b(obj);
        objA = obj2;
        thA = Result.a(objA);
        if (thA != null) {
        }
        return Unit.f71706a;
    }
}
