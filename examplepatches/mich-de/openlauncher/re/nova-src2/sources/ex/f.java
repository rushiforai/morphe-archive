package ex;

import android.app.Activity;
import com.teslacoilsw.ads.internal.runtime.AdErrorException;
import gx.d0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function4;

/* loaded from: classes4.dex */
public final class f implements gx.e {

    /* renamed from: a, reason: collision with root package name */
    public final Function2 f53069a;

    /* renamed from: b, reason: collision with root package name */
    public final Function4 f53070b;

    public f() {
        c cVar = c.f53064d;
        d dVar = d.f53065d;
        this.f53069a = cVar;
        this.f53070b = dVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // gx.e
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(dx.f fVar, Activity activity, d0 d0Var, ContinuationImpl continuationImpl) {
        e eVar;
        if (continuationImpl instanceof e) {
            eVar = (e) continuationImpl;
            int i5 = eVar.f53068v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f53068v = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(this, continuationImpl);
            }
        }
        Object objInvoke = eVar.f53066t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f53068v;
        if (i11 == 0) {
            ResultKt.b(objInvoke);
            if (!(fVar instanceof dx.b)) {
                throw new IllegalArgumentException("GmaBannerLoader only handles Banner specs");
            }
            if (activity == null) {
                int i12 = Result.f71687b;
                return ResultKt.a(new AdErrorException(new dx.j("Banner load requires Activity, none attached")));
            }
            b bVar = (b) this.f53069a.invoke(fVar, activity);
            if (bVar != null) {
                int i13 = Result.f71687b;
                return bVar;
            }
            eVar.f53068v = 1;
            objInvoke = this.f53070b.invoke(fVar, activity, d0Var, eVar);
            if (objInvoke == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objInvoke);
        }
        return ((Result) objInvoke).f71688a;
    }
}
