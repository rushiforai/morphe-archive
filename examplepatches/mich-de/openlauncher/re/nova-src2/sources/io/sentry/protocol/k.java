package io.sentry.protocol;

import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.io.IOException;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class k implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public String f67561a;

    /* renamed from: b, reason: collision with root package name */
    public String f67562b;

    /* renamed from: c, reason: collision with root package name */
    public String f67563c;

    /* renamed from: d, reason: collision with root package name */
    public Boolean f67564d;

    /* renamed from: e, reason: collision with root package name */
    public ConcurrentHashMap f67565e;

    /* renamed from: f, reason: collision with root package name */
    public ConcurrentHashMap f67566f;

    /* renamed from: g, reason: collision with root package name */
    public Boolean f67567g;

    /* renamed from: h, reason: collision with root package name */
    public HashMap f67568h;

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) throws IOException {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        if (this.f67561a != null) {
            e3Var.o(TTConst.TRACK_TYPE);
            e3Var.A(this.f67561a);
        }
        if (this.f67562b != null) {
            e3Var.o(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION);
            e3Var.A(this.f67562b);
        }
        if (this.f67563c != null) {
            e3Var.o("help_link");
            e3Var.A(this.f67563c);
        }
        if (this.f67564d != null) {
            e3Var.o("handled");
            e3Var.y(this.f67564d);
        }
        if (this.f67565e != null) {
            e3Var.o("meta");
            e3Var.x(iLogger, this.f67565e);
        }
        if (this.f67566f != null) {
            e3Var.o("data");
            e3Var.x(iLogger, this.f67566f);
        }
        if (this.f67567g != null) {
            e3Var.o("synthetic");
            e3Var.y(this.f67567g);
        }
        HashMap map = this.f67568h;
        if (map != null) {
            for (String str : map.keySet()) {
                Object obj = this.f67568h.get(str);
                e3Var.o(str);
                e3Var.x(iLogger, obj);
            }
        }
        e3Var.i();
    }
}
