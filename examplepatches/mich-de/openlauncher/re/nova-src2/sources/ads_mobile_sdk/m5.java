package ads_mobile_sdk;

import b.e6;
import b.ed;
import b.k9;
import java.util.Iterator;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationUnit;
import t70.m0;

/* loaded from: classes.dex */
public final class m5 extends b.h1 {

    /* renamed from: c, reason: collision with root package name */
    public final jr0 f7010c;

    /* renamed from: d, reason: collision with root package name */
    public final e6 f7011d;

    /* renamed from: e, reason: collision with root package name */
    public final t70.j0 f7012e;

    public m5(jr0 flags, e6 httpClient, t70.j0 backgroundScope) {
        Intrinsics.g(flags, "flags");
        Intrinsics.g(httpClient, "httpClient");
        Intrinsics.g(backgroundScope, "backgroundScope");
        this.f7010c = flags;
        this.f7011d = httpClient;
        this.f7012e = backgroundScope;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(m5 m5Var, ContinuationImpl continuationImpl) {
        l5 l5Var;
        jn jnVar = jn.a$10;
        if (continuationImpl instanceof l5) {
            l5Var = (l5) continuationImpl;
            int i5 = l5Var.f6079d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                l5Var.f6079d = i5 - Integer.MIN_VALUE;
            } else {
                l5Var = new l5(m5Var, continuationImpl);
            }
        }
        Object obj = l5Var.f6077b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = l5Var.f6079d;
        if (i11 == 0) {
            ResultKt.b(obj);
            jr0 jr0Var = m5Var.f7010c;
            jr0Var.getClass();
            if (((Boolean) jr0Var.a("gads:ad_request_http_client_enabled", Boolean.TRUE, jnVar)).booleanValue()) {
                e6 e6Var = m5Var.f7011d;
                int iIntValue = ((Number) jr0Var.a("gads:ad_request_http_client_max_idle_connections", k9.q(jr0Var, "gads:ad_request_http_client_max_idle_connections", 5), jn.a$15)).intValue();
                Duration.Companion companion = Duration.f72038b;
                DurationUnit durationUnit = DurationUnit.f72047f;
                long jQ = Duration.q(((Duration) jr0Var.a("gads:ad_request_http_client_connection_pool_keep_alive_minutes", ed.k(5, durationUnit, "gads:ad_request_http_client_connection_pool_keep_alive_minutes"), u.a$2)).f72041a, durationUnit);
                l5Var.f6076a = m5Var;
                l5Var.f6079d = 1;
                if (e6Var.a(iIntValue, jQ, l5Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            m5Var = l5Var.f6076a;
            ResultKt.b(obj);
        }
        jr0 jr0Var2 = m5Var.f7010c;
        jr0Var2.getClass();
        if (((Boolean) jr0Var2.a("gads:preconnect_initialization_task_enabled", Boolean.TRUE, jnVar)).booleanValue()) {
            m5Var.b$1();
        }
        return new xu0(Unit.f71706a);
    }

    public final void b$1() {
        jr0 jr0Var = this.f7010c;
        jr0Var.getClass();
        List defaultValue = ul.b.Q("https://googleads.g.doubleclick.net", "https://pubads.g.doubleclick.net");
        Intrinsics.g(defaultValue, "defaultValue");
        Iterator it = ((List) jr0Var.a("gads:preconnect_urls", defaultValue, jn.a$20)).iterator();
        while (it.hasNext()) {
            m0.t(this.f7012e, null, null, new b00.e(this, (String) it.next(), null, 9), 3);
        }
    }

    @Override // ads_mobile_sdk.c61
    public final Object h(Continuation continuation) {
        return a(this, (ContinuationImpl) continuation);
    }
}
