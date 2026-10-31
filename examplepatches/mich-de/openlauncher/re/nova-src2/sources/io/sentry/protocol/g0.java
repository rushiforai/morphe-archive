package io.sentry.protocol;

import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.util.HashMap;
import java.util.List;

/* loaded from: classes4.dex */
public final class g0 implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f67529a;

    /* renamed from: b, reason: collision with root package name */
    public final List f67530b;

    /* renamed from: c, reason: collision with root package name */
    public HashMap f67531c;

    public g0(String str, List list) {
        this.f67529a = str;
        this.f67530b = list;
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        String str = this.f67529a;
        if (str != null) {
            e3Var.o("rendering_system");
            e3Var.A(str);
        }
        List list = this.f67530b;
        if (list != null) {
            e3Var.o("windows");
            e3Var.x(iLogger, list);
        }
        HashMap map = this.f67531c;
        if (map != null) {
            for (String str2 : map.keySet()) {
                Object obj = this.f67531c.get(str2);
                e3Var.o(str2);
                e3Var.x(iLogger, obj);
            }
        }
        e3Var.i();
    }
}
