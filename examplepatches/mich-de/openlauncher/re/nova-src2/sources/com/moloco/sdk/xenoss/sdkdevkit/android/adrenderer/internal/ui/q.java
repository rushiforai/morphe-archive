package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui;

import com.amplitude.eventbridge.EventBridgeChannel;
import i2.v0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class q {

    /* renamed from: a, reason: collision with root package name */
    public static final int f39985a = 0;

    public static final class a extends q {

        /* renamed from: e, reason: collision with root package name */
        public static final int f39986e = 0;

        /* renamed from: b, reason: collision with root package name */
        public final boolean f39987b;

        /* renamed from: c, reason: collision with root package name */
        public final int f39988c;

        /* renamed from: d, reason: collision with root package name */
        public final int f39989d;

        public /* synthetic */ a(boolean z11, int i5, int i11, DefaultConstructorMarker defaultConstructorMarker) {
            this(z11, i5, i11);
        }

        public final int a() {
            return this.f39989d;
        }

        public final boolean b() {
            return this.f39987b;
        }

        public final int c() {
            return this.f39988c;
        }

        public a(boolean z11, int i5, int i11) {
            super(null);
            this.f39987b = z11;
            this.f39988c = i5;
            this.f39989d = i11;
        }
    }

    public static final class b extends q {

        /* renamed from: g, reason: collision with root package name */
        public static final int f39990g = 8;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final n2.c f39991b;

        /* renamed from: c, reason: collision with root package name */
        @Nullable
        public final String f39992c;

        /* renamed from: d, reason: collision with root package name */
        public final long f39993d;

        /* renamed from: e, reason: collision with root package name */
        @NotNull
        public final v0 f39994e;

        /* renamed from: f, reason: collision with root package name */
        public final long f39995f;

        public /* synthetic */ b(n2.c cVar, String str, long j11, v0 v0Var, long j12, DefaultConstructorMarker defaultConstructorMarker) {
            this(cVar, str, j11, v0Var, j12);
        }

        public final long a() {
            return this.f39995f;
        }

        @NotNull
        public final v0 b() {
            return this.f39994e;
        }

        @Nullable
        public final String c() {
            return this.f39992c;
        }

        public final long d() {
            return this.f39993d;
        }

        @NotNull
        public final n2.c e() {
            return this.f39991b;
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(n2.c painter, String str, long j11, v0 backgroundShape, long j12) {
            super(null);
            Intrinsics.g(painter, "painter");
            Intrinsics.g(backgroundShape, "backgroundShape");
            this.f39991b = painter;
            this.f39992c = str;
            this.f39993d = j11;
            this.f39994e = backgroundShape;
            this.f39995f = j12;
        }
    }

    public static final class c extends q {

        /* renamed from: c, reason: collision with root package name */
        public static final int f39996c = 0;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final String f39997b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(@NotNull String text) {
            super(null);
            Intrinsics.g(text, "text");
            this.f39997b = text;
        }

        @NotNull
        public final String a() {
            return this.f39997b;
        }
    }

    public static final class d extends q {

        /* renamed from: l, reason: collision with root package name */
        public static final int f39998l = 8;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final String f39999b;

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public final n2.c f40000c;

        /* renamed from: d, reason: collision with root package name */
        @Nullable
        public final String f40001d;

        /* renamed from: e, reason: collision with root package name */
        public final long f40002e;

        /* renamed from: f, reason: collision with root package name */
        @NotNull
        public final v0 f40003f;

        /* renamed from: g, reason: collision with root package name */
        public final long f40004g;

        /* renamed from: h, reason: collision with root package name */
        public final boolean f40005h;

        /* renamed from: i, reason: collision with root package name */
        public final boolean f40006i;

        /* renamed from: j, reason: collision with root package name */
        public final long f40007j;

        /* renamed from: k, reason: collision with root package name */
        public final long f40008k;

        public /* synthetic */ d(String str, n2.c cVar, String str2, long j11, v0 v0Var, long j12, boolean z11, boolean z12, long j13, long j14, DefaultConstructorMarker defaultConstructorMarker) {
            this(str, cVar, str2, j11, v0Var, j12, z11, z12, j13, j14);
        }

        public final long a() {
            return this.f40004g;
        }

        @NotNull
        public final v0 b() {
            return this.f40003f;
        }

        @Nullable
        public final String c() {
            return this.f40001d;
        }

        public final long d() {
            return this.f40008k;
        }

        public final long e() {
            return this.f40007j;
        }

        public final long f() {
            return this.f40002e;
        }

        @NotNull
        public final n2.c g() {
            return this.f40000c;
        }

        @NotNull
        public final String h() {
            return this.f39999b;
        }

        public final boolean i() {
            return this.f40005h;
        }

        public final boolean j() {
            return this.f40006i;
        }

        /* JADX WARN: Illegal instructions before constructor call */
        public d(String str, n2.c cVar, String str2, long j11, v0 v0Var, long j12, boolean z11, boolean z12, long j13, long j14, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            long j15;
            if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0) {
                y3.q[] qVarArr = y3.p.f96616b;
                j15 = y3.p.f96617c;
            } else {
                j15 = j14;
            }
            this(str, cVar, str2, j11, v0Var, j12, z11, z12, j13, j15, null);
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(String text, n2.c painter, String str, long j11, v0 backgroundShape, long j12, boolean z11, boolean z12, long j13, long j14) {
            super(null);
            Intrinsics.g(text, "text");
            Intrinsics.g(painter, "painter");
            Intrinsics.g(backgroundShape, "backgroundShape");
            this.f39999b = text;
            this.f40000c = painter;
            this.f40001d = str;
            this.f40002e = j11;
            this.f40003f = backgroundShape;
            this.f40004g = j12;
            this.f40005h = z11;
            this.f40006i = z12;
            this.f40007j = j13;
            this.f40008k = j14;
        }
    }

    public /* synthetic */ q(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public q() {
    }
}
