package com.moloco.sdk.internal.ilrd;

import h6.c1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class g {

    /* renamed from: a, reason: collision with root package name */
    public static final int f36544a = 0;

    public static final class a extends g {

        /* renamed from: c, reason: collision with root package name */
        public static final int f36545c = 0;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final String f36546b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(@NotNull String reason) {
            super(null);
            Intrinsics.g(reason, "reason");
            this.f36546b = reason;
        }

        @NotNull
        public final String a() {
            return this.f36546b;
        }

        @NotNull
        public final String b() {
            return this.f36546b;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof a) && Intrinsics.b(this.f36546b, ((a) obj).f36546b);
        }

        public int hashCode() {
            return this.f36546b.hashCode();
        }

        @NotNull
        public String toString() {
            return c1.t(new StringBuilder("Error(reason="), this.f36546b, ')');
        }

        @NotNull
        public final a a(@NotNull String reason) {
            Intrinsics.g(reason, "reason");
            return new a(reason);
        }

        public static /* synthetic */ a a(a aVar, String str, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = aVar.f36546b;
            }
            return aVar.a(str);
        }
    }

    public static final class b extends g {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final b f36547b = new b();

        /* renamed from: c, reason: collision with root package name */
        public static final int f36548c = 0;

        public b() {
            super(null);
        }
    }

    public static final class c extends g {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final c f36549b = new c();

        /* renamed from: c, reason: collision with root package name */
        public static final int f36550c = 0;

        public c() {
            super(null);
        }
    }

    public /* synthetic */ g(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public g() {
    }
}
