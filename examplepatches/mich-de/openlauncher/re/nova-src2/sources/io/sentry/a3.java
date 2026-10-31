package io.sentry;

import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import io.branch.search.internal.C3125e3;
import java.io.IOException;
import java.util.HashMap;
import java.util.concurrent.Callable;

/* loaded from: classes4.dex */
public final class a3 implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f66741a;

    /* renamed from: b, reason: collision with root package name */
    public final String f66742b;

    /* renamed from: c, reason: collision with root package name */
    public final f3 f66743c;

    /* renamed from: d, reason: collision with root package name */
    public final int f66744d;

    /* renamed from: e, reason: collision with root package name */
    public final Callable f66745e;

    /* renamed from: f, reason: collision with root package name */
    public final String f66746f;

    /* renamed from: g, reason: collision with root package name */
    public HashMap f66747g;

    public a3(f3 f3Var, int i5, String str, String str2, String str3) {
        this.f66743c = f3Var;
        this.f66741a = str;
        this.f66744d = i5;
        this.f66742b = str2;
        this.f66745e = null;
        this.f66746f = str3;
    }

    public final int a() {
        Callable callable = this.f66745e;
        if (callable == null) {
            return this.f66744d;
        }
        try {
            return ((Integer) callable.call()).intValue();
        } catch (Throwable unused) {
            return -1;
        }
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) throws IOException {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        String str = this.f66741a;
        if (str != null) {
            e3Var.o(TTContentsEventConstants.Params.EVENT_PROPERTY_CONTENT_TYPE);
            e3Var.A(str);
        }
        String str2 = this.f66742b;
        if (str2 != null) {
            e3Var.o("filename");
            e3Var.A(str2);
        }
        e3Var.o(TTConst.TRACK_TYPE);
        e3Var.x(iLogger, this.f66743c);
        String str3 = this.f66746f;
        if (str3 != null) {
            e3Var.o("attachment_type");
            e3Var.A(str3);
        }
        e3Var.o("length");
        e3Var.w(a());
        HashMap map = this.f66747g;
        if (map != null) {
            for (String str4 : map.keySet()) {
                C3125e3.a(this.f66747g, str4, e3Var, str4, iLogger);
            }
        }
        e3Var.i();
    }

    public a3(f3 f3Var, Callable callable, String str, String str2, String str3) {
        i30.j.Q(f3Var, "type is required");
        this.f66743c = f3Var;
        this.f66741a = str;
        this.f66744d = -1;
        this.f66742b = str2;
        this.f66745e = callable;
        this.f66746f = str3;
    }
}
