package io.branch.search.internal;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.t0, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3375t0 extends Lambda implements Function1<InterfaceC3164g8, Boolean> {

    /* renamed from: a, reason: collision with root package name */
    public static final C3375t0 f65811a = new C3375t0();

    public C3375t0() {
        super(1);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        InterfaceC3164g8 scheduleBranchJob = (InterfaceC3164g8) obj;
        Intrinsics.g(scheduleBranchJob, "$this$scheduleBranchJob");
        return Boolean.TRUE;
    }
}
