package io.sentry;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f66728a;

    /* renamed from: b, reason: collision with root package name */
    public final io.sentry.protocol.g0 f66729b;

    /* renamed from: c, reason: collision with root package name */
    public final String f66730c;

    /* renamed from: d, reason: collision with root package name */
    public final String f66731d;

    /* renamed from: e, reason: collision with root package name */
    public final String f66732e;

    public a(String str, String str2, byte[] bArr) {
        this.f66728a = bArr;
        this.f66729b = null;
        this.f66730c = str;
        this.f66731d = str2;
        this.f66732e = "event.attachment";
    }

    public a(io.sentry.protocol.g0 g0Var) {
        this.f66728a = null;
        this.f66729b = g0Var;
        this.f66730c = "view-hierarchy.json";
        this.f66731d = "application/json";
        this.f66732e = "event.view_hierarchy";
    }
}
