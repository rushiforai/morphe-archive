package ads_mobile_sdk;

import a60.d;
import b.f9;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.p2;

/* loaded from: classes.dex */
public final class wc1 extends jo {

    /* renamed from: e, reason: collision with root package name */
    public final int f11148e;

    /* renamed from: f, reason: collision with root package name */
    public final p32 f11149f;

    /* renamed from: g, reason: collision with root package name */
    public final jr0 f11150g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wc1(String requestId, int i5, mi3 traceMetaSet, f9 internalAdRequestEventEmitter, p32 networkRequester, jr0 flags) {
        super(requestId, i5, traceMetaSet, internalAdRequestEventEmitter);
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(internalAdRequestEventEmitter, "internalAdRequestEventEmitter");
        Intrinsics.g(networkRequester, "networkRequester");
        Intrinsics.g(flags, "flags");
        this.f11148e = i5;
        this.f11149f = networkRequester;
        this.f11150g = flags;
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x0097, code lost:
    
        if (r9 == r1) goto L27;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(wc1 wc1Var, ContinuationImpl continuationImpl) {
        uc1 uc1Var;
        if (continuationImpl instanceof uc1) {
            uc1Var = (uc1) continuationImpl;
            int i5 = uc1Var.f10309d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                uc1Var.f10309d = i5 - Integer.MIN_VALUE;
            } else {
                uc1Var = new uc1(wc1Var, continuationImpl);
            }
        }
        Object objC = uc1Var.f10307b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = uc1Var.f10309d;
        try {
            if (i11 == 0) {
                ResultKt.b(objC);
                uc1Var.f10306a = wc1Var;
                uc1Var.f10309d = 1;
                mi3 mi3Var = wc1Var.f5315c;
                th3 th3VarA = ji3.a();
                Intrinsics.g(mi3Var, "<set-?>");
                th3VarA.f9923a = mi3Var;
                fh1 fh1Var = mi3Var.f7225b;
                fh1Var.f3351a = wc1Var.f5313a;
                fh1Var.f3353c = wc1Var.f5314b;
                Object objB = wc1Var.f5316d.b(uc1Var);
                if ((objB == coroutineSingletons ? (Unit) objB : Unit.f71706a) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objC);
                return (b.a1) objC;
            }
            wc1Var = uc1Var.f10306a;
            ResultKt.b(objC);
            jr0 jr0Var = wc1Var.f11150g;
            jr0Var.getClass();
            Duration.Companion companion = Duration.f72038b;
            long j11 = ((Duration) jr0Var.a("gads:load_timeout:milliseconds", new Duration(DurationKt.g(5, DurationUnit.f72047f)), u.a$1)).f72041a;
            d dVar = new d(wc1Var, null, 19);
            uc1Var.f10306a = null;
            uc1Var.f10309d = 2;
            objC = p2.c(j11, dVar, uc1Var);
        } catch (TimeoutCancellationException e3) {
            return new yu0(e3, 1);
        }
    }
}
