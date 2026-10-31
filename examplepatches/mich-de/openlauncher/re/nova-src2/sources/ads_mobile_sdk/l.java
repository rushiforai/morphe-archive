package ads_mobile_sdk;

import b.s6;
import java.util.Iterator;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final Map f6022a;

    public l(Map actionHandlers) {
        Intrinsics.g(actionHandlers, "actionHandlers");
        this.f6022a = actionHandlers;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(z23 z23Var, ContinuationImpl continuationImpl) {
        k kVar;
        Iterator it;
        l lVar;
        s6 s6Var;
        if (continuationImpl instanceof k) {
            kVar = (k) continuationImpl;
            int i5 = kVar.f5458e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kVar.f5458e = i5 - Integer.MIN_VALUE;
            } else {
                kVar = new k(this, continuationImpl);
            }
        }
        Object obj = kVar.f5456c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kVar.f5458e;
        if (i11 == 0) {
            ResultKt.b(obj);
            it = z23Var.f12429c.iterator();
            lVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            it = kVar.f5455b;
            lVar = kVar.f5454a;
            ResultKt.b(obj);
        }
        while (it.hasNext()) {
            x23 x23Var = (x23) it.next();
            com.google.gson.r rVar = x23Var.f11557b;
            if (rVar != null && (s6Var = (s6) lVar.f6022a.get(x23Var.f11556a)) != null) {
                kVar.f5454a = lVar;
                kVar.f5455b = it;
                kVar.f5458e = 1;
                if (s6Var.a(rVar, kVar) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
        }
        return Unit.f71706a;
    }
}
