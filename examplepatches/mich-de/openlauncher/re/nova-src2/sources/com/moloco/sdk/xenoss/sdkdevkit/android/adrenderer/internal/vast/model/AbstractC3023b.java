package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.b, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public abstract class AbstractC3023b {

    /* renamed from: a, reason: collision with root package name */
    public static final int f40720a = 0;

    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.b$a */
    public static final class a extends AbstractC3023b {

        /* renamed from: c, reason: collision with root package name */
        public static final int f40721c = 8;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final o f40722b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(@NotNull o inline) {
            super(null);
            Intrinsics.g(inline, "inline");
            this.f40722b = inline;
        }

        @NotNull
        public final o a() {
            return this.f40722b;
        }
    }

    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.b$b, reason: collision with other inner class name */
    public static final class C0257b extends AbstractC3023b {

        /* renamed from: c, reason: collision with root package name */
        public static final int f40723c = 8;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final B f40724b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C0257b(@NotNull B wrapper) {
            super(null);
            Intrinsics.g(wrapper, "wrapper");
            this.f40724b = wrapper;
        }

        @NotNull
        public final B a() {
            return this.f40724b;
        }
    }

    public /* synthetic */ AbstractC3023b(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public AbstractC3023b() {
    }
}
