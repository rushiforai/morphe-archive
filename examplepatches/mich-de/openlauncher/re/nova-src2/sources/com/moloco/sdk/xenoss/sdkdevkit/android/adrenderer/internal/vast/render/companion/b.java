package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.companion;

import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final int f40999a = 0;

    public static final class a extends b {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final a f41000b = new a();

        /* renamed from: c, reason: collision with root package name */
        public static final int f41001c = 0;

        public a() {
            super(null);
        }
    }

    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.companion.b$b, reason: collision with other inner class name */
    public static final class C0266b extends b {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final C0266b f41002b = new C0266b();

        /* renamed from: c, reason: collision with root package name */
        public static final int f41003c = 0;

        public C0266b() {
            super(null);
        }
    }

    public static final class c extends b {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final c f41004b = new c();

        /* renamed from: c, reason: collision with root package name */
        public static final int f41005c = 0;

        public c() {
            super(null);
        }
    }

    public static final class d extends b {

        /* renamed from: c, reason: collision with root package name */
        public static final int f41006c = 8;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c f41007b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c error) {
            super(null);
            Intrinsics.g(error, "error");
            this.f41007b = error;
        }

        @NotNull
        public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c a() {
            return this.f41007b;
        }

        @NotNull
        public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c b() {
            return this.f41007b;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof d) && Intrinsics.b(this.f41007b, ((d) obj).f41007b);
        }

        public int hashCode() {
            return this.f41007b.hashCode();
        }

        @NotNull
        public String toString() {
            return "Error(error=" + this.f41007b + ')';
        }

        @NotNull
        public final d a(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c error) {
            Intrinsics.g(error, "error");
            return new d(error);
        }

        public static /* synthetic */ d a(d dVar, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c cVar, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                cVar = dVar.f41007b;
            }
            return dVar.a(cVar);
        }
    }

    public /* synthetic */ b(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public b() {
    }
}
