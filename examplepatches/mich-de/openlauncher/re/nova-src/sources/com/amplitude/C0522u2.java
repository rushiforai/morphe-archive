package com.amplitude;

import com.amplitude.core.events.Plan;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.u2, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0522u2 {

    /* renamed from: a, reason: collision with root package name */
    @gn.c(Plan.AMP_PLAN_SOURCE)
    private final int f20776a;

    /* renamed from: b, reason: collision with root package name */
    @gn.c("positions")
    private final List<C0532w2> f20777b;

    public C0522u2(ArrayList positions) {
        int iB = EnumC0424d2.f20532j.b();
        Intrinsics.g(positions, "positions");
        this.f20776a = iB;
        this.f20777b = positions;
    }
}
