package io.sentry.protocol;

import com.tiktok.util.TTConst;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.util.HashMap;
import java.util.List;

/* loaded from: classes4.dex */
public final class h0 implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public String f67536a;

    /* renamed from: b, reason: collision with root package name */
    public String f67537b;

    /* renamed from: c, reason: collision with root package name */
    public String f67538c;

    /* renamed from: d, reason: collision with root package name */
    public String f67539d;

    /* renamed from: e, reason: collision with root package name */
    public Double f67540e;

    /* renamed from: f, reason: collision with root package name */
    public Double f67541f;

    /* renamed from: g, reason: collision with root package name */
    public Double f67542g;

    /* renamed from: h, reason: collision with root package name */
    public Double f67543h;

    /* renamed from: i, reason: collision with root package name */
    public String f67544i;

    /* renamed from: j, reason: collision with root package name */
    public Double f67545j;

    /* renamed from: k, reason: collision with root package name */
    public List f67546k;

    /* renamed from: l, reason: collision with root package name */
    public HashMap f67547l;

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        if (this.f67536a != null) {
            e3Var.o("rendering_system");
            e3Var.A(this.f67536a);
        }
        if (this.f67537b != null) {
            e3Var.o(TTConst.TRACK_TYPE);
            e3Var.A(this.f67537b);
        }
        if (this.f67538c != null) {
            e3Var.o("identifier");
            e3Var.A(this.f67538c);
        }
        if (this.f67539d != null) {
            e3Var.o("tag");
            e3Var.A(this.f67539d);
        }
        if (this.f67540e != null) {
            e3Var.o("width");
            e3Var.z(this.f67540e);
        }
        if (this.f67541f != null) {
            e3Var.o("height");
            e3Var.z(this.f67541f);
        }
        if (this.f67542g != null) {
            e3Var.o("x");
            e3Var.z(this.f67542g);
        }
        if (this.f67543h != null) {
            e3Var.o("y");
            e3Var.z(this.f67543h);
        }
        if (this.f67544i != null) {
            e3Var.o("visibility");
            e3Var.A(this.f67544i);
        }
        if (this.f67545j != null) {
            e3Var.o("alpha");
            e3Var.z(this.f67545j);
        }
        List list = this.f67546k;
        if (list != null && !list.isEmpty()) {
            e3Var.o("children");
            e3Var.x(iLogger, this.f67546k);
        }
        HashMap map = this.f67547l;
        if (map != null) {
            for (String str : map.keySet()) {
                Object obj = this.f67547l.get(str);
                e3Var.o(str);
                e3Var.x(iLogger, obj);
            }
        }
        e3Var.i();
    }
}
