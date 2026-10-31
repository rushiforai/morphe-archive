package com.moloco.sdk.internal.services.init;

import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public abstract class j {

    /* renamed from: a, reason: collision with root package name */
    public static final int f38067a = 0;

    public static final class a extends j {

        /* renamed from: c, reason: collision with root package name */
        public static final int f38068c = 0;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final com.moloco.sdk.internal.services.init.b f38069b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(@NotNull com.moloco.sdk.internal.services.init.b type) {
            super(null);
            Intrinsics.g(type, "type");
            this.f38069b = type;
        }

        @NotNull
        public final com.moloco.sdk.internal.services.init.b a() {
            return this.f38069b;
        }
    }

    public static final class b extends j {

        /* renamed from: c, reason: collision with root package name */
        public static final int f38070c = 0;

        /* renamed from: b, reason: collision with root package name */
        public final int f38071b;

        public b(int i5) {
            super(null);
            this.f38071b = i5;
        }

        public final int a() {
            return this.f38071b;
        }
    }

    public /* synthetic */ j(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public j() {
    }
}
