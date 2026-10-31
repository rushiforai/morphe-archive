package vt;

import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.paymentelement.confirmation.intent.CallbackNotFoundException;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import t70.p2;

/* loaded from: classes4.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public final iu.f f93012a;

    /* renamed from: b, reason: collision with root package name */
    public final w60.a f93013b;

    public b(iu.f errorReporter, w60.a requestOptionsProvider) {
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(requestOptionsProvider, "requestOptionsProvider");
        this.f93012a = errorReporter;
        this.f93013b = requestOptionsProvider;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(iu.d dVar, iu.c cVar, String str, String str2, Function0 function0, ContinuationImpl continuationImpl) throws CallbackNotFoundException {
        a aVar;
        String str3;
        b bVar;
        iu.c cVar2;
        String str4;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i5 = aVar.f93008z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f93008z = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, continuationImpl);
            }
        }
        a aVar2 = aVar;
        Object objInvoke = aVar2.f93006x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar2.f93008z;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(objInvoke);
            objInvoke = function0.invoke();
            if (objInvoke == null) {
                Duration.Companion companion = Duration.f72038b;
                long jG = DurationKt.g(2, DurationUnit.f72046e);
                pu.h hVar = new pu.h(function0, this, dVar, continuation, 21);
                aVar2.f93002t = this;
                aVar2.f93003u = cVar;
                aVar2.f93004v = str;
                str3 = str2;
                aVar2.f93005w = str3;
                aVar2.f93008z = 1;
                objInvoke = p2.e(jG, hVar, aVar2);
                if (objInvoke == coroutineSingletons) {
                    return coroutineSingletons;
                }
                bVar = this;
                cVar2 = cVar;
                str4 = str;
            }
            return objInvoke;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        String str5 = aVar2.f93005w;
        str4 = aVar2.f93004v;
        iu.c cVar3 = aVar2.f93003u;
        bVar = aVar2.f93002t;
        ResultKt.b(objInvoke);
        str3 = str5;
        cVar2 = cVar3;
        if (objInvoke == null) {
            t2.c.L(bVar.f93012a, cVar2, null, null, 6);
            throw new CallbackNotFoundException(str4, ((ApiRequest$Options) bVar.f93013b.get()).b() ? zg.a.G(2132019808) : zg.a.H(str4), str3);
        }
        return objInvoke;
    }
}
