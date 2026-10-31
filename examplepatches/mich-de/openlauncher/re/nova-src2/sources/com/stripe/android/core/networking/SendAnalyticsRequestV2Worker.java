package com.stripe.android.core.networking;

import android.content.Context;
import androidx.work.CoroutineWorker;
import androidx.work.WorkerParameters;
import com.stripe.android.core.exception.InvalidRequestException;
import cw.r;
import f1.o0;
import fl.l;
import fr.g;
import fr.u;
import fr.u0;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import o7.m;
import o7.n;
import o7.p;
import org.jetbrains.annotations.NotNull;
import t70.c0;
import t70.m0;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/core/networking/SendAnalyticsRequestV2Worker;", "Landroidx/work/CoroutineWorker;", "Landroid/content/Context;", "appContext", "Landroidx/work/WorkerParameters;", "params", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V", "stripe-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class SendAnalyticsRequestV2Worker extends CoroutineWorker {

    /* renamed from: f, reason: collision with root package name */
    public static final r f42579f = new r(null, null, 31);

    /* renamed from: g, reason: collision with root package name */
    public static final o0 f42580g = new o0(16);

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SendAnalyticsRequestV2Worker(@NotNull Context appContext, @NotNull WorkerParameters params) {
        super(appContext, params);
        Intrinsics.g(appContext, "appContext");
        Intrinsics.g(params, "params");
    }

    /* JADX WARN: Removed duplicated region for block: B:52:0x011c  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0123  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // androidx.work.CoroutineWorker
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object doWork(Continuation continuation) throws Throwable {
        fr.o0 o0Var;
        SendAnalyticsRequestV2Worker sendAnalyticsRequestV2Worker;
        SendAnalyticsRequestV2Worker sendAnalyticsRequestV2Worker2;
        Throwable th2;
        SendAnalyticsRequestV2Worker sendAnalyticsRequestV2Worker3;
        Object objA;
        Throwable thA;
        if (continuation instanceof fr.o0) {
            o0Var = (fr.o0) continuation;
            int i5 = o0Var.f55677x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                o0Var.f55677x = i5 - Integer.MIN_VALUE;
            } else {
                o0Var = new fr.o0(this, (ContinuationImpl) continuation);
            }
        }
        Object objY = o0Var.f55675v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = o0Var.f55677x;
        if (i11 == 0) {
            ResultKt.b(objY);
            String strB = getInputData().b("data");
            if (strB == null) {
                return new m();
            }
            Context applicationContext = getApplicationContext();
            Intrinsics.f(applicationContext, "getApplicationContext(...)");
            l lVar = (l) f42580g.invoke(applicationContext);
            o0Var.f55673t = this;
            o0Var.f55674u = this;
            o0Var.f55677x = 1;
            objY = m0.y((c0) lVar.f55374b, new fr.c0(lVar, strB, null), o0Var);
            if (objY != coroutineSingletons) {
                sendAnalyticsRequestV2Worker = this;
                sendAnalyticsRequestV2Worker2 = sendAnalyticsRequestV2Worker;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            sendAnalyticsRequestV2Worker3 = o0Var.f55673t;
            try {
                ResultKt.b(objY);
                objA = (u0) objY;
                int i12 = Result.f71687b;
            } catch (Throwable th3) {
                th2 = th3;
                int i13 = Result.f71687b;
                objA = ResultKt.a(th2);
                thA = Result.a(objA);
                if (thA == null) {
                }
            }
            thA = Result.a(objA);
            if (thA == null) {
                return ((thA instanceof InvalidRequestException) || sendAnalyticsRequestV2Worker3.getRunAttemptCount() >= 4) ? new m() : new n();
            }
            return p.a();
        }
        sendAnalyticsRequestV2Worker = o0Var.f55674u;
        sendAnalyticsRequestV2Worker2 = o0Var.f55673t;
        ResultKt.b(objY);
        g gVar = (g) objY;
        if (gVar == null) {
            return new m();
        }
        int runAttemptCount = sendAnalyticsRequestV2Worker.getRunAttemptCount();
        Map mapG = u.g(gVar.f55616e);
        Duration.Companion companion = Duration.f72038b;
        g gVar2 = new g(gVar.f55612a, gVar.f55613b, gVar.f55614c, gVar.f55615d, u.f(MapsKt.m0(mapG, MapsKt.j0(new Pair("uses_work_manager", Boolean.TRUE), new Pair("is_retry", Boolean.valueOf(runAttemptCount > 0)), new Pair("delayed", Boolean.valueOf(Duration.p(DurationKt.h(System.currentTimeMillis(), DurationUnit.f72045d), DurationUnit.f72046e) - gVar.f55615d > 5.0d))))));
        try {
            int i14 = Result.f71687b;
            r rVar = f42579f;
            o0Var.f55673t = sendAnalyticsRequestV2Worker2;
            o0Var.f55674u = null;
            o0Var.f55677x = 2;
            objY = rVar.r(gVar2, o0Var);
        } catch (Throwable th4) {
            th2 = th4;
            sendAnalyticsRequestV2Worker3 = sendAnalyticsRequestV2Worker2;
            int i132 = Result.f71687b;
            objA = ResultKt.a(th2);
            thA = Result.a(objA);
            if (thA == null) {
            }
        }
        if (objY != coroutineSingletons) {
            sendAnalyticsRequestV2Worker3 = sendAnalyticsRequestV2Worker2;
            objA = (u0) objY;
            int i122 = Result.f71687b;
            thA = Result.a(objA);
            if (thA == null) {
            }
        }
        return coroutineSingletons;
    }
}
