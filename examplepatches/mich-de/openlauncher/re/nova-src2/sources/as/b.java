package as;

import com.google.android.gms.wallet.IsReadyToPayRequest;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final gi.b f15575a;

    public b(gi.b bVar) {
        this.f15575a = bVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(IsReadyToPayRequest isReadyToPayRequest, ContinuationImpl continuationImpl) {
        a aVar;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i5 = aVar.f15571v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f15571v = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, continuationImpl);
            }
        }
        Object objI = aVar.f15569t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f15571v;
        if (i11 == 0) {
            ResultKt.b(objI);
            cz.b bVarB = rg.m.b();
            bVarB.f48574b = 23705;
            bVarB.f48575c = new cm.f(isReadyToPayRequest, 26);
            fi.t tVarC = this.f15575a.c(0, bVarB.a());
            Intrinsics.f(tVarC, "isReadyToPay(...)");
            aVar.f15571v = 1;
            objI = ul.b.i(tVarC, aVar);
            if (objI == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objI);
        }
        Intrinsics.f(objI, "await(...)");
        return objI;
    }
}
