package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public abstract class y {

    /* renamed from: a, reason: collision with root package name */
    public static final int f40855a = 0;

    public static final class a extends y {

        /* renamed from: c, reason: collision with root package name */
        public static final int f40856c = 0;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final j f40857b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(@NotNull j resource) {
            super(null);
            Intrinsics.g(resource, "resource");
            this.f40857b = resource;
        }

        @NotNull
        public final j a() {
            return this.f40857b;
        }
    }

    public static final class b extends y {

        /* renamed from: c, reason: collision with root package name */
        public static final int f40858c = 0;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final k f40859b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(@NotNull k resource) {
            super(null);
            Intrinsics.g(resource, "resource");
            this.f40859b = resource;
        }

        @NotNull
        public final k a() {
            return this.f40859b;
        }
    }

    public static final class c extends y {

        /* renamed from: c, reason: collision with root package name */
        public static final int f40860c = 0;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final t f40861b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(@NotNull t resource) {
            super(null);
            Intrinsics.g(resource, "resource");
            this.f40861b = resource;
        }

        @NotNull
        public final t a() {
            return this.f40861b;
        }
    }

    public /* synthetic */ y(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public y() {
    }
}
