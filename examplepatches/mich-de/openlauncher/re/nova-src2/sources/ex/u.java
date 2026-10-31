package ex;

import android.app.Activity;
import com.teslacoilsw.ads.internal.runtime.AdErrorException;
import gx.d0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class u implements gx.e {

    /* renamed from: d, reason: collision with root package name */
    public static final s f53108d = new s();

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f53109a;

    /* renamed from: b, reason: collision with root package name */
    public final Function2 f53110b;

    /* renamed from: c, reason: collision with root package name */
    public final Function0 f53111c;

    public u(gx.f fVar) {
        s sVar = f53108d;
        bu.m mVar = new bu.m(1, sVar, s.class, "pollPreloadedAd", "pollPreloadedAd(Ljava/lang/String;)Lcom/google/android/libraries/ads/mobile/sdk/rewarded/RewardedAd;", 0, 18);
        bu.l lVar = new bu.l(2, sVar, s.class, "loadRewardedAd", "loadRewardedAd(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", 0, 19);
        this.f53109a = mVar;
        this.f53110b = lVar;
        this.f53111c = fVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // gx.e
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(dx.f fVar, Activity activity, d0 d0Var, ContinuationImpl continuationImpl) {
        t tVar;
        if (continuationImpl instanceof t) {
            tVar = (t) continuationImpl;
            int i5 = tVar.f53107w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                tVar.f53107w = i5 - Integer.MIN_VALUE;
            } else {
                tVar = new t(this, continuationImpl);
            }
        }
        Object objInvoke = tVar.f53105u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = tVar.f53107w;
        dx.l lVar = dx.l.f49740a;
        if (i11 == 0) {
            ResultKt.b(objInvoke);
            if (!(fVar instanceof dx.e)) {
                throw new IllegalArgumentException("GmaRewardedLoader only handles Rewarded specs");
            }
            dx.e eVar = (dx.e) fVar;
            String str = eVar.f49695a;
            wi.b bVar = (wi.b) this.f53109a.invoke(str);
            if (bVar != null) {
                int i12 = Result.f71687b;
                return new r(bVar);
            }
            if (!((Boolean) this.f53111c.invoke()).booleanValue()) {
                int i13 = Result.f71687b;
                return ResultKt.a(new AdErrorException(lVar));
            }
            tVar.f53104t = eVar;
            tVar.f53107w = 1;
            objInvoke = this.f53110b.invoke(str, tVar);
            if (objInvoke == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            fVar = tVar.f53104t;
            ResultKt.b(objInvoke);
        }
        wi.b bVar2 = (wi.b) objInvoke;
        if (bVar2 == null) {
            int i14 = Result.f71687b;
            return ResultKt.a(new AdErrorException(lVar));
        }
        int i15 = Result.f71687b;
        ((dx.e) fVar).getClass();
        return new r(bVar2);
    }
}
