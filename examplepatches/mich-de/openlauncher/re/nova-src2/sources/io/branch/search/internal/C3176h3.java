package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.h3, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3176h3 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f64633a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final P1 f64634b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Z1 f64635c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final C3454xb f64636d;

    public C3176h3(@NotNull F4 context, @NotNull P1 branchConfiguration, @NotNull Z1 branchDeviceInfo, @NotNull C3454xb state) {
        Intrinsics.g(context, "context");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(branchDeviceInfo, "branchDeviceInfo");
        Intrinsics.g(state, "state");
        this.f64633a = context;
        this.f64634b = branchConfiguration;
        this.f64635c = branchDeviceInfo;
        this.f64636d = state;
    }
}
