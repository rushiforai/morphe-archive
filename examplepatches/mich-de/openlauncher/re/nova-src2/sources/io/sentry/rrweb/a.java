package io.sentry.rrweb;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.tiktok.util.TTConst;
import io.branch.search.internal.C3125e3;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.g3;
import io.sentry.i1;
import io.sentry.y1;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class a extends b implements i1 {

    /* renamed from: c, reason: collision with root package name */
    public String f67704c;

    /* renamed from: d, reason: collision with root package name */
    public double f67705d;

    /* renamed from: e, reason: collision with root package name */
    public String f67706e;

    /* renamed from: f, reason: collision with root package name */
    public String f67707f;

    /* renamed from: g, reason: collision with root package name */
    public String f67708g;

    /* renamed from: h, reason: collision with root package name */
    public g3 f67709h;

    /* renamed from: i, reason: collision with root package name */
    public ConcurrentHashMap f67710i;

    /* renamed from: j, reason: collision with root package name */
    public HashMap f67711j;

    /* renamed from: k, reason: collision with root package name */
    public ConcurrentHashMap f67712k;

    /* renamed from: l, reason: collision with root package name */
    public ConcurrentHashMap f67713l;

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) throws IOException {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        e3Var.o(TTConst.TRACK_TYPE);
        e3Var.x(iLogger, this.f67714a);
        e3Var.o("timestamp");
        e3Var.w(this.f67715b);
        e3Var.o("data");
        e3Var.f();
        e3Var.o("tag");
        e3Var.A(this.f67704c);
        e3Var.o("payload");
        e3Var.f();
        if (this.f67706e != null) {
            e3Var.o(TTConst.TRACK_TYPE);
            e3Var.A(this.f67706e);
        }
        e3Var.o("timestamp");
        e3Var.x(iLogger, BigDecimal.valueOf(this.f67705d));
        if (this.f67707f != null) {
            e3Var.o("category");
            e3Var.A(this.f67707f);
        }
        if (this.f67708g != null) {
            e3Var.o(PglCryptUtils.KEY_MESSAGE);
            e3Var.A(this.f67708g);
        }
        if (this.f67709h != null) {
            e3Var.o("level");
            e3Var.x(iLogger, this.f67709h);
        }
        if (this.f67710i != null) {
            e3Var.o("data");
            e3Var.x(iLogger, this.f67710i);
        }
        ConcurrentHashMap concurrentHashMap = this.f67712k;
        if (concurrentHashMap != null) {
            for (String str : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67712k, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
        ConcurrentHashMap concurrentHashMap2 = this.f67713l;
        if (concurrentHashMap2 != null) {
            for (String str2 : concurrentHashMap2.keySet()) {
                C3125e3.a(this.f67713l, str2, e3Var, str2, iLogger);
            }
        }
        e3Var.i();
        HashMap map = this.f67711j;
        if (map != null) {
            for (String str3 : map.keySet()) {
                C3125e3.a(this.f67711j, str3, e3Var, str3, iLogger);
            }
        }
        e3Var.i();
    }
}
