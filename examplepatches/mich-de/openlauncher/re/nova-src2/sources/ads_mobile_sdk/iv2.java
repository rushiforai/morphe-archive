package ads_mobile_sdk;

import b.e6;
import java.io.IOException;
import java.util.LinkedList;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;
import v70.i;
import v70.o;

/* loaded from: classes.dex */
public abstract class iv2 {

    /* renamed from: a, reason: collision with root package name */
    public final b.m5 f4957a;

    /* renamed from: b, reason: collision with root package name */
    public final e6 f4958b;

    /* renamed from: c, reason: collision with root package name */
    public final jr0 f4959c;

    /* renamed from: d, reason: collision with root package name */
    public final b.y3 f4960d;

    /* renamed from: e, reason: collision with root package name */
    public fz f4961e;

    /* renamed from: f, reason: collision with root package name */
    public t70.j0 f4962f;

    /* renamed from: g, reason: collision with root package name */
    public hs f4963g;

    /* renamed from: h, reason: collision with root package name */
    public cu0 f4964h;

    /* renamed from: i, reason: collision with root package name */
    public final i f4965i;

    /* renamed from: j, reason: collision with root package name */
    public final LinkedList f4966j;

    public iv2(b.m5 consentManagerProvider, e6 httpClient, jr0 flags, b.y3 userAgentProvider) {
        Intrinsics.g(consentManagerProvider, "consentManagerProvider");
        Intrinsics.g(httpClient, "httpClient");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(userAgentProvider, "userAgentProvider");
        this.f4957a = consentManagerProvider;
        this.f4958b = httpClient;
        this.f4959c = flags;
        this.f4960d = userAgentProvider;
        this.f4965i = o.b(0, 7, null);
        this.f4966j = new LinkedList();
    }

    public abstract Object a(SuspendLambda suspendLambda);

    public final void a(t70.j0 backgroundScope, cu0 cu0Var, hs hsVar) {
        Intrinsics.g(backgroundScope, "backgroundScope");
        this.f4962f = backgroundScope;
        this.f4964h = cu0Var;
        Object obj = this.f4957a.get();
        Intrinsics.f(obj, "get(...)");
        this.f4961e = (fz) obj;
        this.f4963g = hsVar;
        t70.j0 j0Var = this.f4962f;
        Continuation continuation = null;
        if (j0Var == null) {
            Intrinsics.m("backgroundScope");
            throw null;
        }
        b00.e eVar = new b00.e(this, continuation, 6);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        Intrinsics.g(context, "context");
        m0.t(j0Var, context, null, new ar.a(eVar, null), 2);
    }

    public abstract boolean a();

    public abstract long b();

    public final void a(Object obj) {
        synchronized (this) {
            this.f4966j.add(obj);
        }
        if (a()) {
            this.f4965i.j(Unit.f71706a);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(byte[] bArr, ContinuationImpl continuationImpl) {
        ev2 ev2Var;
        if (continuationImpl instanceof ev2) {
            ev2Var = (ev2) continuationImpl;
            int i5 = ev2Var.f3016c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ev2Var.f3016c = i5 - Integer.MIN_VALUE;
            } else {
                ev2Var = new ev2(this, continuationImpl);
            }
        }
        Object obj = ev2Var.f3014a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ev2Var.f3016c;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                x11 x11Var = new x11();
                x11Var.b((String) this.f4959c.a("gads:remote_capture_service_url", "https://pagead2.googlesyndication.com/pagead/ping?e=2&f=1", u.a$7));
                x11Var.b("application/x-protobuf", bArr);
                y11 y11VarA = x11Var.a();
                e6 e6Var = this.f4958b;
                ev2Var.f3016c = 1;
                if (e6.a(e6Var, y11VarA, null, ev2Var, 30) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
        } catch (IOException e3) {
            cz.b bVar = mu0.f7335a;
            mu0.b("Failed to ping RCS payload: " + e3, null);
        }
        return Unit.f71706a;
    }
}
