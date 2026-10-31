package ads_mobile_sdk;

import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class ra3 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final w81 f8992a;

    /* renamed from: b, reason: collision with root package name */
    public final jr0 f8993b;

    /* renamed from: c, reason: collision with root package name */
    public final ci3 f8994c;

    public ra3(w81 inspectorManager, jr0 flags, ci3 traceLogger) {
        Intrinsics.g(inspectorManager, "inspectorManager");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(traceLogger, "traceLogger");
        this.f8992a = inspectorManager;
        this.f8993b = flags;
        this.f8994c = traceLogger;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    @Override // b.gb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) throws NumberFormatException {
        qa3 qa3Var;
        int i5;
        Throwable th2;
        ra3 ra3Var;
        NumberFormatException numberFormatException;
        Map map2;
        w81 w81Var;
        long j11;
        Long l9;
        if (continuation instanceof qa3) {
            qa3Var = (qa3) continuation;
            int i11 = qa3Var.f8541e;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                qa3Var.f8541e = i11 - Integer.MIN_VALUE;
            } else {
                qa3Var = new qa3(this, continuation);
            }
        }
        qa3 qa3Var2 = qa3Var;
        Object obj = qa3Var2.f8539c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = qa3Var2.f8541e;
        if (i12 != 0) {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            Map map3 = qa3Var2.f8538b;
            ra3 ra3Var2 = qa3Var2.f8537a;
            try {
                ResultKt.b(obj);
                return Unit.f71706a;
            } catch (NumberFormatException e3) {
                ra3Var = ra3Var2;
                i5 = 6;
                numberFormatException = e3;
                map2 = map3;
                th2 = null;
                mu0.c("Invalid expiration in SingleAdSourceTesting GMSG.", null);
                ra3Var.f8994c.a("SingleAdSourceTestingGmsgHandler.onGmsg", (Throwable) numberFormatException);
                zi3.a(i5, "Invalid expiration in SingleAdSource GMSG: " + map2, th2);
                return Unit.f71706a;
            }
        }
        ResultKt.b(obj);
        if (!this.f8993b.a0()) {
            return Unit.f71706a;
        }
        String str = (String) map.get("extras");
        if (str == null || str.length() == 0) {
            zi3.a(6, "Network Extras is missing from SingleAdSource GMSG: " + map, null);
            mu0.c("Missing network extras in SingleAdSourceTesting request.", null);
            return Unit.f71706a;
        }
        try {
            w81Var = this.f8992a;
            String str2 = (String) map.get("expires");
            if (str2 != null) {
                try {
                    j11 = Long.parseLong(str2);
                } catch (NumberFormatException e11) {
                    numberFormatException = e11;
                    ra3Var = this;
                    map2 = map;
                    i5 = 6;
                    th2 = null;
                    mu0.c("Invalid expiration in SingleAdSourceTesting GMSG.", null);
                    ra3Var.f8994c.a("SingleAdSourceTestingGmsgHandler.onGmsg", (Throwable) numberFormatException);
                    zi3.a(i5, "Invalid expiration in SingleAdSource GMSG: " + map2, th2);
                    return Unit.f71706a;
                }
            } else {
                j11 = Long.MAX_VALUE;
            }
            l9 = new Long(j11);
            qa3Var2.f8537a = this;
            qa3Var2.f8538b = map;
            qa3Var2.f8541e = 1;
            i5 = 6;
            th2 = null;
        } catch (NumberFormatException e12) {
            e = e12;
            i5 = 6;
            th2 = null;
        }
        try {
            if (w81.a(w81Var, null, null, 0, str, l9, null, null, null, null, qa3Var2, 487) == coroutineSingletons) {
                return coroutineSingletons;
            }
            return Unit.f71706a;
        } catch (NumberFormatException e13) {
            e = e13;
            ra3Var = this;
            numberFormatException = e;
            map2 = map;
            mu0.c("Invalid expiration in SingleAdSourceTesting GMSG.", null);
            ra3Var.f8994c.a("SingleAdSourceTestingGmsgHandler.onGmsg", (Throwable) numberFormatException);
            zi3.a(i5, "Invalid expiration in SingleAdSource GMSG: " + map2, th2);
            return Unit.f71706a;
        }
        mu0.c("Invalid expiration in SingleAdSourceTesting GMSG.", null);
        ra3Var.f8994c.a("SingleAdSourceTestingGmsgHandler.onGmsg", (Throwable) numberFormatException);
        zi3.a(i5, "Invalid expiration in SingleAdSource GMSG: " + map2, th2);
        return Unit.f71706a;
    }

    @Override // b.gb
    public final int b() {
        return 41;
    }
}
