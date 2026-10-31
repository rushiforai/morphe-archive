package ex;

import ads_mobile_sdk.bu1;
import ads_mobile_sdk.db0;
import ads_mobile_sdk.fl2;
import ads_mobile_sdk.gt1;
import ads_mobile_sdk.gu0;
import ads_mobile_sdk.ls1;
import ads_mobile_sdk.mj2;
import ads_mobile_sdk.ms1;
import ads_mobile_sdk.ti3;
import ads_mobile_sdk.x70;
import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import b.b4;
import b.b7;
import b.c0;
import com.google.android.libraries.ads.mobile.sdk.internal.nativead.InternalNativeAd;
import dx.p0;
import gx.d0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import t70.m0;
import w70.t1;

/* loaded from: classes4.dex */
public final class q implements gx.e {
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00be  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00c2  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r3v0, types: [kotlin.coroutines.Continuation] */
    /* JADX WARN: Type inference failed for: r3v1, types: [ui.d] */
    /* JADX WARN: Type inference failed for: r3v2, types: [ads_mobile_sdk.bu1] */
    /* JADX WARN: Type inference failed for: r3v3 */
    /* JADX WARN: Type inference failed for: r3v4 */
    @Override // gx.e
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(dx.f fVar, Activity activity, d0 d0Var, ContinuationImpl continuationImpl) {
        o oVar;
        Object iVar;
        if (continuationImpl instanceof o) {
            oVar = (o) continuationImpl;
            int i5 = oVar.f53099v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                oVar.f53099v = i5 - Integer.MIN_VALUE;
            } else {
                oVar = new o(this, continuationImpl);
            }
        }
        Object objS = oVar.f53097t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = oVar.f53099v;
        int i12 = 1;
        if (i11 == 0) {
            ResultKt.b(objS);
            if (!(fVar instanceof dx.d)) {
                throw new IllegalArgumentException("GmaNativeLoader only handles Native specs");
            }
            t1 t1Var = p0.f49754a;
            dx.d dVar = (dx.d) fVar;
            String str = dVar.f49692b;
            ?? r32 = 0;
            r32 = 0;
            r32 = 0;
            if (ui.m.f91287a.s(str)) {
                b4.f15783a.getClass();
                fl2 fl2Var = (fl2) ((db0) gu0.a()).f2356v1.get();
                fl2Var.getClass();
                b7 b7Var = (b7) m0.u(new ti3(), new mj2(fl2Var, str, r32, i12));
                if (b7Var == null) {
                    iVar = null;
                    if (iVar != null) {
                        if (iVar instanceof ui.i) {
                            r32 = ((ui.i) iVar).f91285a;
                        } else {
                            Log.w("NovaAds", c0.n("pollAd returned unexpected subtype ", iVar.getClass().getSimpleName(), " for ", str, " — dropping"));
                        }
                    }
                } else {
                    if (b7Var instanceof ms1) {
                        InternalNativeAd internalNativeAd = ((ms1) b7Var).f7330a;
                        gt1 gt1Var = internalNativeAd.f33987e.f4933b;
                        int i13 = gt1Var == null ? -1 : ui.s.f91309a[gt1Var.ordinal()];
                        if (i13 == 1) {
                            iVar = new ui.i(new bu1(internalNativeAd));
                        } else if (i13 == 2) {
                            iVar = new ui.g(new x70(internalNativeAd));
                        }
                    } else {
                        if (!(b7Var instanceof ls1)) {
                            throw new NoWhenBranchMatchedException();
                        }
                        iVar = (ui.h) m0.u(EmptyCoroutineContext.f71803a, new u6.a(b7Var, r32, i12));
                    }
                    if (iVar != null) {
                    }
                }
            }
            if (r32 != 0) {
                int i14 = Result.f71687b;
                return new n(r32, dVar.f49691a);
            }
            oVar.f53099v = 1;
            t70.m mVar = new t70.m(1, IntrinsicsKt.b(oVar));
            mVar.t();
            ui.n nVar = new ui.n(dVar.f49692b, ul.b.P(ui.a.f91272a));
            if (lb0.b.f74823c) {
                Bundle bundle = new Bundle();
                bundle.putString("npa", "1");
                nVar.b(bundle);
            }
            ui.j.a(nVar.d(), new p(mVar, fVar));
            objS = mVar.s();
            if (objS == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objS);
        }
        return ((Result) objS).f71688a;
    }
}
