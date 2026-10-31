package io.sentry.protocol;

import com.tiktok.util.TTConst;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.util.HashMap;

/* loaded from: classes4.dex */
public final class d implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public String f67482a;

    /* renamed from: b, reason: collision with root package name */
    public String f67483b;

    /* renamed from: c, reason: collision with root package name */
    public String f67484c;

    /* renamed from: d, reason: collision with root package name */
    public String f67485d;

    /* renamed from: e, reason: collision with root package name */
    public String f67486e;

    /* renamed from: f, reason: collision with root package name */
    public String f67487f;

    /* renamed from: g, reason: collision with root package name */
    public String f67488g;

    /* renamed from: h, reason: collision with root package name */
    public Long f67489h;

    /* renamed from: i, reason: collision with root package name */
    public String f67490i;

    /* renamed from: j, reason: collision with root package name */
    public HashMap f67491j;

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        if (this.f67482a != null) {
            e3Var.o("uuid");
            e3Var.A(this.f67482a);
        }
        if (this.f67483b != null) {
            e3Var.o(TTConst.TRACK_TYPE);
            e3Var.A(this.f67483b);
        }
        if (this.f67484c != null) {
            e3Var.o("debug_id");
            e3Var.A(this.f67484c);
        }
        if (this.f67485d != null) {
            e3Var.o("debug_file");
            e3Var.A(this.f67485d);
        }
        if (this.f67486e != null) {
            e3Var.o("code_id");
            e3Var.A(this.f67486e);
        }
        if (this.f67487f != null) {
            e3Var.o("code_file");
            e3Var.A(this.f67487f);
        }
        if (this.f67488g != null) {
            e3Var.o("image_addr");
            e3Var.A(this.f67488g);
        }
        if (this.f67489h != null) {
            e3Var.o("image_size");
            e3Var.z(this.f67489h);
        }
        if (this.f67490i != null) {
            e3Var.o("arch");
            e3Var.A(this.f67490i);
        }
        HashMap map = this.f67491j;
        if (map != null) {
            for (String str : map.keySet()) {
                Object obj = this.f67491j.get(str);
                e3Var.o(str);
                e3Var.x(iLogger, obj);
            }
        }
        e3Var.i();
    }
}
