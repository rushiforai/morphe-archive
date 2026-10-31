package com.moloco.sdk.internal.publisher;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.x;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.Nullable;
import t70.r1;

/* renamed from: com.moloco.sdk.internal.publisher.l, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2950l<L extends com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.x> {

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.C<L> f37109a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public com.moloco.sdk.internal.ortb.model.D f37110b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public C2949k f37111c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public r1 f37112d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f37113e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public String f37114f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public String f37115g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f37116h;

    public C2950l() {
        this(null, null, null, null, false, null, null, false, 255, null);
    }

    public final void a(@Nullable com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.C<L> c11) {
        this.f37109a = c11;
    }

    @Nullable
    public final C2949k b() {
        return this.f37111c;
    }

    @Nullable
    public final String c() {
        return this.f37115g;
    }

    @Nullable
    public final String d() {
        return this.f37114f;
    }

    @Nullable
    public final com.moloco.sdk.internal.ortb.model.D e() {
        return this.f37110b;
    }

    @Nullable
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.C<L> f() {
        return this.f37109a;
    }

    public final boolean g() {
        return this.f37116h;
    }

    public final boolean h() {
        return this.f37113e;
    }

    public C2950l(@Nullable com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.C<L> c11, @Nullable com.moloco.sdk.internal.ortb.model.D d5, @Nullable C2949k c2949k, @Nullable r1 r1Var, boolean z11, @Nullable String str, @Nullable String str2, boolean z12) {
        this.f37109a = c11;
        this.f37110b = d5;
        this.f37111c = c2949k;
        this.f37112d = r1Var;
        this.f37113e = z11;
        this.f37114f = str;
        this.f37115g = str2;
        this.f37116h = z12;
    }

    public final void a(@Nullable com.moloco.sdk.internal.ortb.model.D d5) {
        this.f37110b = d5;
    }

    public final void b(boolean z11) {
        this.f37113e = z11;
    }

    public final void a(@Nullable C2949k c2949k) {
        this.f37111c = c2949k;
    }

    public final void b(@Nullable String str) {
        this.f37114f = str;
    }

    @Nullable
    public final r1 a() {
        return this.f37112d;
    }

    public final void a(@Nullable r1 r1Var) {
        this.f37112d = r1Var;
    }

    public final void a(@Nullable String str) {
        this.f37115g = str;
    }

    public final void a(boolean z11) {
        this.f37116h = z11;
    }

    public /* synthetic */ C2950l(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.C c11, com.moloco.sdk.internal.ortb.model.D d5, C2949k c2949k, r1 r1Var, boolean z11, String str, String str2, boolean z12, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : c11, (i5 & 2) != 0 ? null : d5, (i5 & 4) != 0 ? null : c2949k, (i5 & 8) != 0 ? null : r1Var, (i5 & 16) != 0 ? false : z11, (i5 & 32) != 0 ? null : str, (i5 & 64) != 0 ? null : str2, (i5 & 128) != 0 ? false : z12);
    }
}
