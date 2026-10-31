package io.sentry.protocol;

import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.util.HashMap;

/* loaded from: classes4.dex */
public final class r implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public String f67603a;

    /* renamed from: b, reason: collision with root package name */
    public Integer f67604b;

    /* renamed from: c, reason: collision with root package name */
    public Integer f67605c;

    /* renamed from: d, reason: collision with root package name */
    public Integer f67606d;

    /* renamed from: e, reason: collision with root package name */
    public HashMap f67607e;

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        if (this.f67603a != null) {
            e3Var.o("sdk_name");
            e3Var.A(this.f67603a);
        }
        if (this.f67604b != null) {
            e3Var.o("version_major");
            e3Var.z(this.f67604b);
        }
        if (this.f67605c != null) {
            e3Var.o("version_minor");
            e3Var.z(this.f67605c);
        }
        if (this.f67606d != null) {
            e3Var.o("version_patchlevel");
            e3Var.z(this.f67606d);
        }
        HashMap map = this.f67607e;
        if (map != null) {
            for (String str : map.keySet()) {
                Object obj = this.f67607e.get(str);
                e3Var.o(str);
                e3Var.x(iLogger, obj);
            }
        }
        e3Var.i();
    }
}
