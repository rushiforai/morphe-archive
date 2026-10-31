package nc;

import com.fyber.inneractive.sdk.network.t;
import com.fyber.inneractive.sdk.network.w;
import com.fyber.inneractive.sdk.util.IAlog;
import ps.j;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: b, reason: collision with root package name */
    public static final a f78183b = new a();

    /* renamed from: a, reason: collision with root package name */
    public com.fyber.inneractive.sdk.ignite.events.wrappers.a f78184a;

    public static void a(c cVar, Exception exc) {
        b(cVar, j.b(exc, null));
    }

    public static void b(c cVar, Object... objArr) {
        rc.a.a("%s : dispatching event", "IgniteEventDispatcher");
        if (f78183b.f78184a != null) {
            t tVarA = t.a(cVar);
            if (tVarA == null) {
                IAlog.f("%s : One DT Error: %s is missing in IAReportError map", "IgniteEventDispatcherWrapper", cVar);
            } else {
                new w(tVarA).a(objArr).a((String) null);
            }
        }
    }
}
