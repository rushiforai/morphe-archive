package x80;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class i0 extends k0 {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ a0 f95515c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f95516d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ byte[] f95517e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f95518f;

    public i0(a0 a0Var, byte[] bArr, int i5, int i11) {
        this.f95515c = a0Var;
        this.f95516d = i5;
        this.f95517e = bArr;
        this.f95518f = i11;
    }

    @Override // x80.k0
    public final long contentLength() {
        return this.f95516d;
    }

    @Override // x80.k0
    public final a0 contentType() {
        return this.f95515c;
    }

    @Override // x80.k0
    public final void writeTo(m90.h sink) {
        Intrinsics.g(sink, "sink");
        sink.Y(this.f95518f, this.f95516d, this.f95517e);
    }
}
