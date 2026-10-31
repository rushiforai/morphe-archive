package io.sentry;

import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.Arrays;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public class j4 implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public final io.sentry.protocol.u f67352a;

    /* renamed from: b, reason: collision with root package name */
    public final l4 f67353b;

    /* renamed from: c, reason: collision with root package name */
    public final l4 f67354c;

    /* renamed from: d, reason: collision with root package name */
    public transient tm.o f67355d;

    /* renamed from: e, reason: collision with root package name */
    public final String f67356e;

    /* renamed from: f, reason: collision with root package name */
    public String f67357f;

    /* renamed from: g, reason: collision with root package name */
    public m4 f67358g;

    /* renamed from: h, reason: collision with root package name */
    public ConcurrentHashMap f67359h;

    /* renamed from: i, reason: collision with root package name */
    public String f67360i;

    /* renamed from: j, reason: collision with root package name */
    public ConcurrentHashMap f67361j;

    public j4(io.sentry.protocol.u uVar, l4 l4Var, String str, l4 l4Var2, tm.o oVar) {
        this(uVar, l4Var, l4Var2, str, null, oVar, null, "manual");
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j4)) {
            return false;
        }
        j4 j4Var = (j4) obj;
        return this.f67352a.equals(j4Var.f67352a) && this.f67353b.equals(j4Var.f67353b) && i30.j.z(this.f67354c, j4Var.f67354c) && this.f67356e.equals(j4Var.f67356e) && i30.j.z(this.f67357f, j4Var.f67357f) && this.f67358g == j4Var.f67358g;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f67352a, this.f67353b, this.f67354c, this.f67356e, this.f67357f, this.f67358g});
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        e3Var.o("trace_id");
        this.f67352a.serialize(e3Var, iLogger);
        e3Var.o("span_id");
        this.f67353b.serialize(e3Var, iLogger);
        l4 l4Var = this.f67354c;
        if (l4Var != null) {
            e3Var.o("parent_span_id");
            l4Var.serialize(e3Var, iLogger);
        }
        e3Var.o("op");
        e3Var.A(this.f67356e);
        if (this.f67357f != null) {
            e3Var.o(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION);
            e3Var.A(this.f67357f);
        }
        if (this.f67358g != null) {
            e3Var.o("status");
            e3Var.x(iLogger, this.f67358g);
        }
        if (this.f67360i != null) {
            e3Var.o("origin");
            e3Var.x(iLogger, this.f67360i);
        }
        if (!this.f67359h.isEmpty()) {
            e3Var.o("tags");
            e3Var.x(iLogger, this.f67359h);
        }
        ConcurrentHashMap concurrentHashMap = this.f67361j;
        if (concurrentHashMap != null) {
            for (String str : concurrentHashMap.keySet()) {
                Object obj = this.f67361j.get(str);
                e3Var.o(str);
                e3Var.x(iLogger, obj);
            }
        }
        e3Var.i();
    }

    public j4(io.sentry.protocol.u uVar, l4 l4Var, l4 l4Var2, String str, String str2, tm.o oVar, m4 m4Var, String str3) {
        this.f67359h = new ConcurrentHashMap();
        this.f67360i = "manual";
        i30.j.Q(uVar, "traceId is required");
        this.f67352a = uVar;
        i30.j.Q(l4Var, "spanId is required");
        this.f67353b = l4Var;
        i30.j.Q(str, "operation is required");
        this.f67356e = str;
        this.f67354c = l4Var2;
        this.f67355d = oVar;
        this.f67357f = str2;
        this.f67358g = m4Var;
        this.f67360i = str3;
    }

    public j4(j4 j4Var) {
        this.f67359h = new ConcurrentHashMap();
        this.f67360i = "manual";
        this.f67352a = j4Var.f67352a;
        this.f67353b = j4Var.f67353b;
        this.f67354c = j4Var.f67354c;
        this.f67355d = j4Var.f67355d;
        this.f67356e = j4Var.f67356e;
        this.f67357f = j4Var.f67357f;
        this.f67358g = j4Var.f67358g;
        ConcurrentHashMap concurrentHashMapY = com.google.android.gms.internal.consent_sdk.k0.y(j4Var.f67359h);
        if (concurrentHashMapY != null) {
            this.f67359h = concurrentHashMapY;
        }
    }
}
