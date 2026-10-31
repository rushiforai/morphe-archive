package io.sentry.protocol;

import com.amplitude.android.TrackingOptions;
import io.branch.search.internal.C3125e3;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.h3;
import io.sentry.i1;
import io.sentry.y1;
import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class y implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public String f67642a;

    /* renamed from: b, reason: collision with root package name */
    public String f67643b;

    /* renamed from: c, reason: collision with root package name */
    public String f67644c;

    /* renamed from: d, reason: collision with root package name */
    public Integer f67645d;

    /* renamed from: e, reason: collision with root package name */
    public Integer f67646e;

    /* renamed from: f, reason: collision with root package name */
    public String f67647f;

    /* renamed from: g, reason: collision with root package name */
    public String f67648g;

    /* renamed from: h, reason: collision with root package name */
    public Boolean f67649h;

    /* renamed from: i, reason: collision with root package name */
    public String f67650i;

    /* renamed from: j, reason: collision with root package name */
    public Boolean f67651j;

    /* renamed from: k, reason: collision with root package name */
    public String f67652k;

    /* renamed from: l, reason: collision with root package name */
    public String f67653l;

    /* renamed from: m, reason: collision with root package name */
    public String f67654m;
    public String n;
    public String o;

    /* renamed from: p, reason: collision with root package name */
    public ConcurrentHashMap f67655p;

    /* renamed from: q, reason: collision with root package name */
    public String f67656q;

    /* renamed from: r, reason: collision with root package name */
    public h3 f67657r;

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) throws IOException {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        if (this.f67642a != null) {
            e3Var.o("filename");
            e3Var.A(this.f67642a);
        }
        if (this.f67643b != null) {
            e3Var.o("function");
            e3Var.A(this.f67643b);
        }
        if (this.f67644c != null) {
            e3Var.o("module");
            e3Var.A(this.f67644c);
        }
        if (this.f67645d != null) {
            e3Var.o("lineno");
            e3Var.z(this.f67645d);
        }
        if (this.f67646e != null) {
            e3Var.o("colno");
            e3Var.z(this.f67646e);
        }
        if (this.f67647f != null) {
            e3Var.o("abs_path");
            e3Var.A(this.f67647f);
        }
        if (this.f67648g != null) {
            e3Var.o("context_line");
            e3Var.A(this.f67648g);
        }
        if (this.f67649h != null) {
            e3Var.o("in_app");
            e3Var.y(this.f67649h);
        }
        if (this.f67650i != null) {
            e3Var.o("package");
            e3Var.A(this.f67650i);
        }
        if (this.f67651j != null) {
            e3Var.o("native");
            e3Var.y(this.f67651j);
        }
        if (this.f67652k != null) {
            e3Var.o(TrackingOptions.AMP_TRACKING_OPTION_PLATFORM);
            e3Var.A(this.f67652k);
        }
        if (this.f67653l != null) {
            e3Var.o("image_addr");
            e3Var.A(this.f67653l);
        }
        if (this.f67654m != null) {
            e3Var.o("symbol_addr");
            e3Var.A(this.f67654m);
        }
        if (this.n != null) {
            e3Var.o("instruction_addr");
            e3Var.A(this.n);
        }
        if (this.f67656q != null) {
            e3Var.o("raw_function");
            e3Var.A(this.f67656q);
        }
        if (this.o != null) {
            e3Var.o("symbol");
            e3Var.A(this.o);
        }
        if (this.f67657r != null) {
            e3Var.o("lock");
            e3Var.x(iLogger, this.f67657r);
        }
        ConcurrentHashMap concurrentHashMap = this.f67655p;
        if (concurrentHashMap != null) {
            for (String str : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67655p, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
    }
}
