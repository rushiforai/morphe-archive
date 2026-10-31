package com.moloco.sdk.internal.services;

import h6.c1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: com.moloco.sdk.internal.services.c, reason: case insensitive filesystem */
/* loaded from: classes.dex */
public abstract class AbstractC2955c {

    /* renamed from: a, reason: collision with root package name */
    public static final int f37935a = 0;

    /* renamed from: com.moloco.sdk.internal.services.c$a */
    public static final class a extends AbstractC2955c {

        /* renamed from: c, reason: collision with root package name */
        public static final int f37936c = 0;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final String f37937b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(@NotNull String id2) {
            super(null);
            Intrinsics.g(id2, "id");
            this.f37937b = id2;
        }

        @NotNull
        public final String a() {
            return this.f37937b;
        }

        @NotNull
        public final String b() {
            return this.f37937b;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof a) && Intrinsics.b(this.f37937b, ((a) obj).f37937b);
        }

        public int hashCode() {
            return this.f37937b.hashCode();
        }

        @NotNull
        public String toString() {
            return c1.t(new StringBuilder("Available(id="), this.f37937b, ')');
        }

        @NotNull
        public final a a(@NotNull String id2) {
            Intrinsics.g(id2, "id");
            return new a(id2);
        }

        public static /* synthetic */ a a(a aVar, String str, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = aVar.f37937b;
            }
            return aVar.a(str);
        }
    }

    /* renamed from: com.moloco.sdk.internal.services.c$b */
    /* loaded from: classes4.dex */
    public static final class b extends AbstractC2955c {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final b f37938b = new b();

        /* renamed from: c, reason: collision with root package name */
        public static final int f37939c = 0;

        public b() {
            super(null);
        }
    }

    public /* synthetic */ AbstractC2955c(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public AbstractC2955c() {
    }
}
