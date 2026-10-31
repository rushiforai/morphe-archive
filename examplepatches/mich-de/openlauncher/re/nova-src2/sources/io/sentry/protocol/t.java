package io.sentry.protocol;

import com.tiktok.util.TTConst;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.util.HashMap;

/* loaded from: classes4.dex */
public final class t implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public String f67613a;

    /* renamed from: b, reason: collision with root package name */
    public String f67614b;

    /* renamed from: c, reason: collision with root package name */
    public String f67615c;

    /* renamed from: d, reason: collision with root package name */
    public Long f67616d;

    /* renamed from: e, reason: collision with root package name */
    public z f67617e;

    /* renamed from: f, reason: collision with root package name */
    public k f67618f;

    /* renamed from: g, reason: collision with root package name */
    public HashMap f67619g;

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        if (this.f67613a != null) {
            e3Var.o(TTConst.TRACK_TYPE);
            e3Var.A(this.f67613a);
        }
        if (this.f67614b != null) {
            e3Var.o("value");
            e3Var.A(this.f67614b);
        }
        if (this.f67615c != null) {
            e3Var.o("module");
            e3Var.A(this.f67615c);
        }
        if (this.f67616d != null) {
            e3Var.o("thread_id");
            e3Var.z(this.f67616d);
        }
        if (this.f67617e != null) {
            e3Var.o("stacktrace");
            e3Var.x(iLogger, this.f67617e);
        }
        if (this.f67618f != null) {
            e3Var.o("mechanism");
            e3Var.x(iLogger, this.f67618f);
        }
        HashMap map = this.f67619g;
        if (map != null) {
            for (String str : map.keySet()) {
                Object obj = this.f67619g.get(str);
                e3Var.o(str);
                e3Var.x(iLogger, obj);
            }
        }
        e3Var.i();
    }
}
