package io.branch.search.internal;

import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public abstract class O3 {

    public static abstract class a extends O3 {

        /* renamed from: io.branch.search.internal.O3$a$a, reason: collision with other inner class name */
        public static final class C0325a extends a {

            /* renamed from: a, reason: collision with root package name */
            @NotNull
            public static final C0325a f63005a = new C0325a();

            public C0325a() {
                super(0);
            }
        }

        public static final class b extends a {

            /* renamed from: a, reason: collision with root package name */
            @NotNull
            public static final b f63006a = new b();

            public b() {
                super(0);
            }
        }

        public static final class c extends a {

            /* renamed from: a, reason: collision with root package name */
            @NotNull
            public final String f63007a;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public c(@NotNull String responseError) {
                super(0);
                Intrinsics.g(responseError, "responseError");
                this.f63007a = responseError;
            }
        }

        public static final class d extends a {

            /* renamed from: a, reason: collision with root package name */
            @NotNull
            public static final d f63008a = new d();

            public d() {
                super(0);
            }
        }

        public a() {
            super(0);
        }

        public /* synthetic */ a(int i5) {
            this();
        }
    }

    public static final class b extends O3 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final b f63009a = new b();

        public b() {
            super(0);
        }
    }

    public O3() {
    }

    @NotNull
    public final String a() {
        if (equals(b.f63009a)) {
            return "Cache update successful.";
        }
        if (equals(a.b.f63006a)) {
            return "No prior request found.";
        }
        if (equals(a.d.f63008a)) {
            return "Request timed out.";
        }
        if (equals(a.C0325a.f63005a)) {
            return "Request cancelled.";
        }
        if (!(this instanceof a.c)) {
            throw new NoWhenBranchMatchedException();
        }
        return "Request error: " + ((a.c) this).f63007a;
    }

    public /* synthetic */ O3(int i5) {
        this();
    }
}
