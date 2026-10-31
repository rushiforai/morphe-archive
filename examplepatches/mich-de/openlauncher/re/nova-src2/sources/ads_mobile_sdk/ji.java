package ads_mobile_sdk;

import a70.d;
import ab.c0;
import android.content.Context;
import b.o2;
import com.google.android.gms.appset.AppSetIdClient;
import kotlin.LazyKt;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class ji {

    /* renamed from: a, reason: collision with root package name */
    public final Context f5244a;

    /* renamed from: b, reason: collision with root package name */
    public final ci3 f5245b;

    /* renamed from: c, reason: collision with root package name */
    public final o2 f5246c;

    /* renamed from: d, reason: collision with root package name */
    public final d f5247d;

    public ji(Context applicationContext, ci3 traceLogger, o2 clock) {
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(clock, "clock");
        this.f5244a = applicationContext;
        this.f5245b = traceLogger;
        this.f5246c = clock;
        this.f5247d = LazyKt.a(new a3.e(this, 3));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(ji jiVar, ContinuationImpl continuationImpl) {
        hi hiVar;
        if (continuationImpl instanceof hi) {
            hiVar = (hi) continuationImpl;
            int i5 = hiVar.f4394d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hiVar.f4394d = i5 - Integer.MIN_VALUE;
            } else {
                hiVar = new hi(jiVar, continuationImpl);
            }
        }
        Object objS = hiVar.f4392b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hiVar.f4394d;
        try {
            if (i11 == 0) {
                ResultKt.b(objS);
                hiVar.f4391a = jiVar;
                hiVar.f4394d = 1;
                t70.m mVar = new t70.m(1, IntrinsicsKt.b(hiVar));
                mVar.t();
                ((AppSetIdClient) jiVar.f5247d.getValue()).getAppSetIdInfo().b(new c0(1, jiVar, mVar));
                objS = mVar.s();
                if (objS == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                jiVar = hiVar.f4391a;
                ResultKt.b(objS);
            }
            return (b.a1) objS;
        } catch (Exception e3) {
            jiVar.f5245b.a("Exception while getting AppSet Id", (Throwable) e3);
            return new qu0(e3, null, null, 6);
        }
    }
}
