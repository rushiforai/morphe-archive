package com.vungle.ads.internal.network;

import java.io.IOException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i extends m90.o {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ j f47251a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(j jVar, m90.i iVar) {
        super(iVar);
        this.f47251a = jVar;
    }

    @Override // m90.o, m90.j0
    public final long read(m90.g sink, long j11) throws IOException {
        Intrinsics.g(sink, "sink");
        try {
            return super.read(sink, j11);
        } catch (IOException e3) {
            this.f47251a.a(e3);
            throw e3;
        }
    }
}
