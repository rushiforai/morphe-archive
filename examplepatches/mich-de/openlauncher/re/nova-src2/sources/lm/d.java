package lm;

import android.content.Context;
import bm.m;
import com.google.android.gms.tasks.Tasks;
import fi.t;
import java.util.Set;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final class d implements f, g {

    /* renamed from: a, reason: collision with root package name */
    public final m f75040a;

    /* renamed from: b, reason: collision with root package name */
    public final Context f75041b;

    /* renamed from: c, reason: collision with root package name */
    public final nm.c f75042c;

    /* renamed from: d, reason: collision with root package name */
    public final Set f75043d;

    /* renamed from: e, reason: collision with root package name */
    public final Executor f75044e;

    public d(Context context, String str, Set set, nm.c cVar, Executor executor) {
        this.f75040a = new m(new bm.g(1, context, str));
        this.f75043d = set;
        this.f75044e = executor;
        this.f75042c = cVar;
        this.f75041b = context;
    }

    public final t a() {
        return !w20.h.l(this.f75041b) ? Tasks.d(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b) : Tasks.b(new c(this, 0), this.f75044e);
    }

    public final void b() {
        if (this.f75043d.size() <= 0) {
            Tasks.d(null);
        } else if (w20.h.l(this.f75041b)) {
            Tasks.b(new c(this, 1), this.f75044e);
        } else {
            Tasks.d(null);
        }
    }
}
