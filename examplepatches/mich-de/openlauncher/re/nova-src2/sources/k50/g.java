package k50;

import io.ktor.utils.io.t;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import o50.o;
import o50.u;
import o50.v;

/* loaded from: classes.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final v f71141a;

    /* renamed from: b, reason: collision with root package name */
    public final v50.d f71142b;

    /* renamed from: c, reason: collision with root package name */
    public final o f71143c;

    /* renamed from: d, reason: collision with root package name */
    public final u f71144d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f71145e;

    /* renamed from: f, reason: collision with root package name */
    public final CoroutineContext f71146f;

    /* renamed from: g, reason: collision with root package name */
    public final v50.d f71147g;

    public g(v vVar, v50.d requestTime, o oVar, u version, t body, CoroutineContext callContext) {
        Intrinsics.g(requestTime, "requestTime");
        Intrinsics.g(version, "version");
        Intrinsics.g(body, "body");
        Intrinsics.g(callContext, "callContext");
        this.f71141a = vVar;
        this.f71142b = requestTime;
        this.f71143c = oVar;
        this.f71144d = version;
        this.f71145e = body;
        this.f71146f = callContext;
        this.f71147g = v50.a.a(null);
    }

    public final String toString() {
        return "HttpResponseData=(statusCode=" + this.f71141a + ')';
    }
}
