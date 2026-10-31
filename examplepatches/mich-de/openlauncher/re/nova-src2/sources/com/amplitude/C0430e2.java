package com.amplitude;

import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.e2, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0430e2 extends W1 {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0430e2(int i5, int i11, long j11, String href, long j12) {
        super(Y1.f20441g.a(), j11, MapsKt.j0(new Pair("href", href), new Pair("width", Integer.valueOf(i5)), new Pair("height", Integer.valueOf(i11))), j12);
        Intrinsics.g(href, "href");
    }
}
