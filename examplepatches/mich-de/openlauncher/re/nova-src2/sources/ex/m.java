package ex;

import android.app.Activity;
import com.teslacoilsw.ads.internal.runtime.AdErrorException;
import gx.d0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class m implements gx.e {

    /* renamed from: c, reason: collision with root package name */
    public static final k f53090c = new k();

    /* renamed from: a, reason: collision with root package name */
    public final y f53091a;

    /* renamed from: b, reason: collision with root package name */
    public final Function2 f53092b;

    public m(y yVar) {
        bu.l lVar = new bu.l(2, f53090c, k.class, "loadIconAd", "loadIconAd(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", 0, 18);
        this.f53091a = yVar;
        this.f53092b = lVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x00a5, code lost:
    
        if (r7 == r8) goto L36;
     */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // gx.e
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(dx.f fVar, Activity activity, d0 d0Var, ContinuationImpl continuationImpl) {
        l lVar;
        m mVar;
        oi.b bVar;
        if (continuationImpl instanceof l) {
            lVar = (l) continuationImpl;
            int i5 = lVar.f53089x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lVar.f53089x = i5 - Integer.MIN_VALUE;
            } else {
                lVar = new l(this, continuationImpl);
            }
        }
        Object objC = lVar.f53087v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = lVar.f53089x;
        if (i11 == 0) {
            ResultKt.b(objC);
            if (!(fVar instanceof dx.c)) {
                throw new IllegalArgumentException("GmaIconLoader only handles Icon specs");
            }
            String str = ((dx.c) fVar).f49688b;
            lVar.f53085t = this;
            lVar.f53086u = fVar;
            lVar.f53089x = 1;
            Object objB = this.f53091a.b(str, lVar);
            if (objB != coroutineSingletons) {
                objB = Unit.f71706a;
            }
            if (objB != coroutineSingletons) {
                mVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            fVar = lVar.f53086u;
            mVar = (m) lVar.f53085t;
            ResultKt.b(objC);
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                fVar = (dx.f) lVar.f53085t;
                ResultKt.b(objC);
                oi.b bVar2 = (oi.b) objC;
                if (bVar2 != null) {
                    int i12 = Result.f71687b;
                    return new j(bVar2, ((dx.c) fVar).f49687a);
                }
                int i13 = Result.f71687b;
                return ResultKt.a(new AdErrorException(dx.l.f49740a));
            }
            fVar = lVar.f53086u;
            mVar = (m) lVar.f53085t;
            ResultKt.b(objC);
            bVar = (oi.b) objC;
            if (bVar == null) {
                int i14 = Result.f71687b;
                return new j(bVar, ((dx.c) fVar).f49687a);
            }
            Function2 function2 = mVar.f53092b;
            String str2 = ((dx.c) fVar).f49688b;
            lVar.f53085t = fVar;
            lVar.f53086u = null;
            lVar.f53089x = 3;
            objC = function2.invoke(str2, lVar);
        }
        y yVar = mVar.f53091a;
        String str3 = ((dx.c) fVar).f49688b;
        lVar.f53085t = mVar;
        lVar.f53086u = fVar;
        lVar.f53089x = 2;
        objC = yVar.c(str3, lVar);
        if (objC != coroutineSingletons) {
            bVar = (oi.b) objC;
            if (bVar == null) {
            }
        }
        return coroutineSingletons;
    }
}
