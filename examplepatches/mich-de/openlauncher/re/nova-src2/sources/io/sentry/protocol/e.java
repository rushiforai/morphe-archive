package io.sentry.protocol;

import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.util.HashMap;
import java.util.List;

/* loaded from: classes4.dex */
public final class e implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public r f67492a;

    /* renamed from: b, reason: collision with root package name */
    public List f67493b;

    /* renamed from: c, reason: collision with root package name */
    public HashMap f67494c;

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        if (this.f67492a != null) {
            e3Var.o("sdk_info");
            e3Var.x(iLogger, this.f67492a);
        }
        if (this.f67493b != null) {
            e3Var.o("images");
            e3Var.x(iLogger, this.f67493b);
        }
        HashMap map = this.f67494c;
        if (map != null) {
            for (String str : map.keySet()) {
                Object obj = this.f67494c.get(str);
                e3Var.o(str);
                e3Var.x(iLogger, obj);
            }
        }
        e3Var.i();
    }
}
