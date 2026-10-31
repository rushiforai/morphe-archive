package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.l6, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3246l6 extends x80.k0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ x80.k0 f64960a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ byte[] f64961b;

    public C3246l6(x80.k0 k0Var, byte[] bArr) {
        this.f64960a = k0Var;
        this.f64961b = bArr;
    }

    @Override // x80.k0
    public final long contentLength() {
        return this.f64961b.length;
    }

    @Override // x80.k0
    @Nullable
    public final x80.a0 contentType() {
        return this.f64960a.contentType();
    }

    @Override // x80.k0
    public final void writeTo(@NotNull m90.h sink) {
        Intrinsics.g(sink, "sink");
        sink.write(this.f64961b);
        sink.close();
    }
}
