package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import java.util.List;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public abstract class h {

    /* renamed from: a, reason: collision with root package name */
    public static final int f40750a = 0;

    public static final class a extends h {

        /* renamed from: c, reason: collision with root package name */
        public static final int f40751c = 8;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final List<e> f40752b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(@NotNull List<e> companions) {
            super(null);
            Intrinsics.g(companions, "companions");
            this.f40752b = companions;
        }

        @NotNull
        public final List<e> a() {
            return this.f40752b;
        }
    }

    public static final class b extends h {

        /* renamed from: c, reason: collision with root package name */
        public static final int f40753c = 8;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final p f40754b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(@NotNull p linear) {
            super(null);
            Intrinsics.g(linear, "linear");
            this.f40754b = linear;
        }

        @NotNull
        public final p a() {
            return this.f40754b;
        }
    }

    public /* synthetic */ h(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public h() {
    }
}
