package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear;

import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final int f41755a = 0;

    public static final class a extends d {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final a f41756b = new a();

        /* renamed from: c, reason: collision with root package name */
        public static final int f41757c = 0;

        public a() {
            super(null);
        }
    }

    public static final class b extends d {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final b f41758b = new b();

        /* renamed from: c, reason: collision with root package name */
        public static final int f41759c = 0;

        public b() {
            super(null);
        }
    }

    public static final class c extends d {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final c f41760b = new c();

        /* renamed from: c, reason: collision with root package name */
        public static final int f41761c = 0;

        public c() {
            super(null);
        }
    }

    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.d$d, reason: collision with other inner class name */
    public static final class C0285d extends d {

        /* renamed from: c, reason: collision with root package name */
        public static final int f41762c = 0;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.l f41763b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C0285d(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.l error) {
            super(null);
            Intrinsics.g(error, "error");
            this.f41763b = error;
        }

        @NotNull
        public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.l a() {
            return this.f41763b;
        }

        @NotNull
        public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.l b() {
            return this.f41763b;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof C0285d) && this.f41763b == ((C0285d) obj).f41763b;
        }

        public int hashCode() {
            return this.f41763b.hashCode();
        }

        @NotNull
        public String toString() {
            return "Error(error=" + this.f41763b + ')';
        }

        @NotNull
        public final C0285d a(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.l error) {
            Intrinsics.g(error, "error");
            return new C0285d(error);
        }

        public static /* synthetic */ C0285d a(C0285d c0285d, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.l lVar, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                lVar = c0285d.f41763b;
            }
            return c0285d.a(lVar);
        }
    }

    public static final class e extends d {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final e f41764b = new e();

        /* renamed from: c, reason: collision with root package name */
        public static final int f41765c = 0;

        public e() {
            super(null);
        }
    }

    public /* synthetic */ d(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public d() {
    }
}
