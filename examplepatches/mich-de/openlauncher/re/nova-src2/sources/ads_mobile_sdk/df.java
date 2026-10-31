package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import w70.u1;

/* loaded from: classes.dex */
public final class df {

    /* renamed from: a, reason: collision with root package name */
    public final b.w4 f2489a;

    public df(b.w4 dataStore) {
        Intrinsics.g(dataStore, "dataStore");
        this.f2489a = dataStore;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        cf cfVar;
        if (continuationImpl instanceof cf) {
            cfVar = (cf) continuationImpl;
            int i5 = cfVar.f1848c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cfVar.f1848c = i5 - Integer.MIN_VALUE;
            } else {
                cfVar = new cf(this, continuationImpl);
            }
        }
        Object objQ = cfVar.f1846a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cfVar.f1848c;
        if (i11 == 0) {
            ResultKt.b(objQ);
            w70.m data = ((t5.g) this.f2489a.get()).getData();
            cfVar.f1848c = 1;
            objQ = u1.q(data, cfVar);
            if (objQ == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objQ);
        }
        ze zeVar = (ze) objQ;
        if (zeVar != null) {
            return zeVar.p();
        }
        return null;
    }
}
