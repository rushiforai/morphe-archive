package com.moloco.sdk.internal.publisher;

import com.moloco.sdk.publisher.AdShowListener;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.Nullable;
import t70.r1;

/* loaded from: classes.dex */
public final class v<T extends AdShowListener> {

    /* renamed from: f, reason: collision with root package name */
    public static final int f37469f = 8;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.m<?, ?> f37470a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public com.moloco.sdk.internal.ortb.model.D f37471b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public C2949k f37472c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public r1 f37473d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public A f37474e;

    public v() {
        this(null, null, null, null, null, 31, null);
    }

    @Nullable
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.m<?, ?> a() {
        return this.f37470a;
    }

    @Nullable
    public final r1 b() {
        return this.f37473d;
    }

    @Nullable
    public final C2949k c() {
        return this.f37472c;
    }

    @Nullable
    public final A d() {
        return this.f37474e;
    }

    @Nullable
    public final com.moloco.sdk.internal.ortb.model.D e() {
        return this.f37471b;
    }

    public v(@Nullable com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.m<?, ?> mVar, @Nullable com.moloco.sdk.internal.ortb.model.D d5, @Nullable C2949k c2949k, @Nullable r1 r1Var, @Nullable A a11) {
        this.f37470a = mVar;
        this.f37471b = d5;
        this.f37472c = c2949k;
        this.f37473d = r1Var;
        this.f37474e = a11;
    }

    public final void a(@Nullable com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.m<?, ?> mVar) {
        this.f37470a = mVar;
    }

    public final void a(@Nullable com.moloco.sdk.internal.ortb.model.D d5) {
        this.f37471b = d5;
    }

    public final void a(@Nullable C2949k c2949k) {
        this.f37472c = c2949k;
    }

    public final void a(@Nullable r1 r1Var) {
        this.f37473d = r1Var;
    }

    public final void a(@Nullable A a11) {
        this.f37474e = a11;
    }

    public /* synthetic */ v(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.m mVar, com.moloco.sdk.internal.ortb.model.D d5, C2949k c2949k, r1 r1Var, A a11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : mVar, (i5 & 2) != 0 ? null : d5, (i5 & 4) != 0 ? null : c2949k, (i5 & 8) != 0 ? null : r1Var, (i5 & 16) != 0 ? null : a11);
    }
}
