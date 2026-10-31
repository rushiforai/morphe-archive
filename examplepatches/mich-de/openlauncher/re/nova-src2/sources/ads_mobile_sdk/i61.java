package ads_mobile_sdk;

import android.content.Context;
import android.os.Bundle;
import android.os.Looper;
import b.e9;
import b0.b0;
import eg.n;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class i61 {

    /* renamed from: a, reason: collision with root package name */
    public final eg.b f4639a;

    public i61(eg.b bVar) {
        this.f4639a = bVar;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
     */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0088  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final ArrayList a(i61 i61Var, oa oaVar) {
        bg.b bVar;
        e9<qa> e9VarP$1 = oaVar.p$1();
        Intrinsics.f(e9VarP$1, "getInitializationDataList(...)");
        ArrayList arrayList = new ArrayList(b70.c.u0(e9VarP$1, 10));
        for (qa qaVar : e9VarP$1) {
            String strP = qaVar.p();
            Intrinsics.f(strP, "getFormat(...)");
            switch (strP.hashCode()) {
                case -1396342996:
                    if (strP.equals("banner")) {
                        bVar = bg.b.f17864a;
                        break;
                    } else {
                        bVar = bg.b.f17869f;
                        break;
                    }
                case -1052618729:
                    if (strP.equals("native")) {
                        bVar = bg.b.f17868e;
                        break;
                    }
                    break;
                case -239580146:
                    if (strP.equals("rewarded")) {
                        bVar = bg.b.f17866c;
                        break;
                    }
                    break;
                case 604727084:
                    if (strP.equals("interstitial")) {
                        bVar = bg.b.f17865b;
                        break;
                    }
                    break;
                case 1167692200:
                    if (strP.equals("app_open")) {
                        bVar = bg.b.f17870g;
                        break;
                    }
                    break;
                case 1778294298:
                    if (strP.equals("app_open_ad")) {
                        bVar = bg.b.f17870g;
                        break;
                    }
                    break;
                case 1911491517:
                    if (strP.equals("rewarded_interstitial")) {
                        bVar = bg.b.f17867d;
                        break;
                    }
                    break;
            }
            Bundle bundle = new Bundle();
            Map mapO = qaVar.o();
            Intrinsics.f(mapO, "getExtrasMap(...)");
            for (Map.Entry entry : mapO.entrySet()) {
                bundle.putString((String) entry.getKey(), (String) entry.getValue());
            }
            arrayList.add(new n(bVar, bundle));
        }
        return arrayList;
    }

    public final Object a(Context context, oa oaVar, b0 b0Var) {
        if (Intrinsics.b(Looper.getMainLooper(), Looper.myLooper())) {
            t70.m mVar = new t70.m(1, IntrinsicsKt.b(b0Var));
            mVar.t();
            AtomicBoolean atomicBoolean = new AtomicBoolean(false);
            try {
                this.f4639a.initialize(context, new x7.l(atomicBoolean, mVar), a(this, oaVar));
            } catch (Throwable th2) {
                if (!atomicBoolean.getAndSet(true)) {
                    int i5 = Result.f71687b;
                    mVar.resumeWith(new qu0(th2, wd1.f11225m, "Exception caught initializing adapter: ".concat(th2.getClass().getName())));
                }
            }
            Object objS = mVar.s();
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            return objS;
        }
        throw new IllegalStateException("Check failed.");
    }
}
