package ads_mobile_sdk;

import as.d0;
import b.fb;
import b.mc;
import com.google.android.libraries.ads.mobile.sdk.internal.nativead.InternalNativeAd;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.internal.Intrinsics;
import ni.v;
import ui.f;
import ui.i;

/* loaded from: classes.dex */
public final class bg1 extends fb {

    /* renamed from: b, reason: collision with root package name */
    public static final lm.e f1413b = new lm.e(12);

    /* renamed from: a, reason: collision with root package name */
    public final Object f1414a;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f1415e;

    public /* synthetic */ bg1(Object obj, int i5) {
        this.f1415e = i5;
        this.f1414a = obj;
    }

    private final void a$ads_mobile_sdk$bg1() {
    }

    private final void a$ads_mobile_sdk$hh1() {
    }

    @Override // b.fb
    public final void a() {
        int i5 = this.f1415e;
    }

    @Override // b.fb
    public final void a(v vVar) {
        switch (this.f1415e) {
            case 0:
                ((ui.k) this.f1414a).onAdFailedToLoad(vVar);
                break;
            default:
                ((d0) this.f1414a).onAdFailedToLoad(vVar);
                break;
        }
    }

    @Override // b.fb
    public final Object a(b.ja jaVar, SuspendLambda suspendLambda) {
        switch (this.f1415e) {
            case 0:
                return a((b.b7) jaVar, (ContinuationImpl) suspendLambda);
            default:
                ((d0) this.f1414a).onAdLoaded(u.a$12.invoke((gh1) jaVar));
                return Unit.f71706a;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(b.b7 b7Var, ContinuationImpl continuationImpl) throws Throwable {
        ag1 ag1Var;
        Object iVar;
        Object aVar;
        ui.k kVar = (ui.k) this.f1414a;
        if (continuationImpl instanceof ag1) {
            ag1Var = (ag1) continuationImpl;
            int i5 = ag1Var.f984d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ag1Var.f984d = i5 - Integer.MIN_VALUE;
            } else {
                ag1Var = new ag1(this, continuationImpl);
            }
        }
        Object objG = ag1Var.f982b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ag1Var.f984d;
        if (i11 == 0) {
            ResultKt.b(objG);
            if (b7Var instanceof ms1) {
                InternalNativeAd ad = ((ms1) b7Var).f7330a;
                Intrinsics.g(ad, "ad");
                gt1 gt1Var = ad.f33987e.f4933b;
                int i12 = gt1Var == null ? -1 : mc.f15949a[gt1Var.ordinal()];
                if (i12 == 1) {
                    iVar = new i(new bu1(ad));
                } else if (i12 != 2) {
                    aVar = new br.a(new v(ni.u.f78326b, "Invalid native ad response.", null));
                    if (!(aVar instanceof i)) {
                        kVar.b(((i) aVar).f91285a);
                    } else if (!(aVar instanceof ui.g)) {
                        kVar.onAdFailedToLoad(new v(ni.u.f78326b, "Invalid native ad response.", null));
                    }
                } else {
                    iVar = new ui.g(new x70(ad));
                }
                aVar = iVar;
                if (!(aVar instanceof i)) {
                }
            } else if (b7Var instanceof ls1) {
                od1 od1Var = ((ls1) b7Var).f6942a;
                ag1Var.f981a = kVar;
                ag1Var.f984d = 1;
                objG = f1413b.g(od1Var, ag1Var);
                if (objG == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        kVar = ag1Var.f981a;
        ResultKt.b(objG);
        kVar.a(((f) objG).a());
        return Unit.f71706a;
    }
}
