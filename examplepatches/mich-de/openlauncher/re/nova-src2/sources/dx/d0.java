package dx;

import android.util.Log;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d0 implements a {

    /* renamed from: a, reason: collision with root package name */
    public final List f49694a;

    public d0(a... aVarArr) {
        List sinks = kotlin.collections.c.b1(aVarArr);
        Intrinsics.g(sinks, "sinks");
        this.f49694a = sinks;
    }

    @Override // dx.a
    public final void a(o event) {
        Intrinsics.g(event, "event");
        Iterator it = this.f49694a.iterator();
        while (it.hasNext()) {
            try {
                ((a) it.next()).a(event);
            } catch (Throwable th2) {
                Log.w("NovaAds", "Analytics sink threw", th2);
            }
        }
    }
}
