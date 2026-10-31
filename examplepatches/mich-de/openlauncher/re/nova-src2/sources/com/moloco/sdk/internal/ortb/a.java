package com.moloco.sdk.internal.ortb;

import java.util.List;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final int f36611a = 0;

    /* renamed from: com.moloco.sdk.internal.ortb.a$a, reason: collision with other inner class name */
    public static final class C0154a extends a {

        /* renamed from: c, reason: collision with root package name */
        public static final int f36612c = 8;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final Exception f36613b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C0154a(@NotNull Exception cause) {
            super(null);
            Intrinsics.g(cause, "cause");
            this.f36613b = cause;
        }

        @NotNull
        public final Exception a() {
            return this.f36613b;
        }

        @NotNull
        public final Exception b() {
            return this.f36613b;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof C0154a) && Intrinsics.b(this.f36613b, ((C0154a) obj).f36613b);
        }

        public int hashCode() {
            return this.f36613b.hashCode();
        }

        @NotNull
        public String toString() {
            return "InvalidJson(cause=" + this.f36613b + ')';
        }

        @NotNull
        public final C0154a a(@NotNull Exception cause) {
            Intrinsics.g(cause, "cause");
            return new C0154a(cause);
        }

        public static /* synthetic */ C0154a a(C0154a c0154a, Exception exc, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                exc = c0154a.f36613b;
            }
            return c0154a.a(exc);
        }
    }

    public static final class b extends a {

        /* renamed from: c, reason: collision with root package name */
        public static final int f36614c = 8;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final List<String> f36615b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(@NotNull List<String> fields) {
            super(null);
            Intrinsics.g(fields, "fields");
            this.f36615b = fields;
        }

        @NotNull
        public final List<String> a() {
            return this.f36615b;
        }

        @NotNull
        public final List<String> b() {
            return this.f36615b;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof b) && Intrinsics.b(this.f36615b, ((b) obj).f36615b);
        }

        public int hashCode() {
            return this.f36615b.hashCode();
        }

        @NotNull
        public String toString() {
            return fq.c.e(new StringBuilder("MissingRequiredFields(fields="), this.f36615b, ')');
        }

        @NotNull
        public final b a(@NotNull List<String> fields) {
            Intrinsics.g(fields, "fields");
            return new b(fields);
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ b a(b bVar, List list, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                list = bVar.f36615b;
            }
            return bVar.a(list);
        }
    }

    public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public a() {
    }
}
