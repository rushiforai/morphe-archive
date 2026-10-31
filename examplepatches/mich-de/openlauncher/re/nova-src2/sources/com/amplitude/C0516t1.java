package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.t1, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0516t1 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C0502q1 f20762a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f20763b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0516t1(C0502q1 c0502q1, long j11) {
        super(0);
        this.f20762a = c0502q1;
        this.f20763b = j11;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        C0502q1 c0502q1 = this.f20762a;
        String str = c0502q1.f20729a;
        long j11 = c0502q1.f20730b;
        long j12 = this.f20763b;
        int i5 = c0502q1.f20731c;
        StringBuilder sb2 = new StringBuilder("===== ");
        sb2.append(str);
        sb2.append(" - ");
        sb2.append(j11);
        b.c0.B(sb2, "ms - ", j12, "ms - 0ms - ");
        return b.c0.o(sb2, i5, " snapshots");
    }
}
