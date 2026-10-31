package io.branch.search.internal;

import io.branch.search.internal.P1;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class J6 {

    public static final class a extends J6 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final List<J6> f62727a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(@NotNull ArrayList rules) {
            super(0);
            Intrinsics.g(rules, "rules");
            this.f62727a = rules;
        }

        @Override // io.branch.search.internal.J6
        public final boolean a(@NotNull C3289nf userData) {
            Intrinsics.g(userData, "userData");
            List<J6> list = this.f62727a;
            if ((list instanceof Collection) && list.isEmpty()) {
                return true;
            }
            Iterator<T> it = list.iterator();
            while (it.hasNext()) {
                if (!((J6) it.next()).a(userData)) {
                    return false;
                }
            }
            return true;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof a) && Intrinsics.b(this.f62727a, ((a) obj).f62727a);
        }

        public final int hashCode() {
            return this.f62727a.hashCode();
        }

        @NotNull
        public final String toString() {
            return Ob.a(new StringBuilder("And(rules="), this.f62727a, ')');
        }
    }

    public static final class b extends J6 {

        /* renamed from: a, reason: collision with root package name */
        public final boolean f62728a;

        public b(boolean z11) {
            super(0);
            this.f62728a = z11;
        }

        @Override // io.branch.search.internal.J6
        public final boolean a(@NotNull C3289nf userData) {
            Intrinsics.g(userData, "userData");
            return this.f62728a;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof b) && this.f62728a == ((b) obj).f62728a;
        }

        public final int hashCode() {
            boolean z11 = this.f62728a;
            if (z11) {
                return 1;
            }
            return z11 ? 1 : 0;
        }

        @NotNull
        public final String toString() {
            return a2.c.p(new StringBuilder("Constant(value="), this.f62728a, ')');
        }
    }

    public static final class c extends J6 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final J6 f62729a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(@NotNull J6 rule) {
            super(0);
            Intrinsics.g(rule, "rule");
            this.f62729a = rule;
        }

        @Override // io.branch.search.internal.J6
        public final boolean a(@NotNull C3289nf userData) {
            Intrinsics.g(userData, "userData");
            return !this.f62729a.a(userData);
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof c) && Intrinsics.b(this.f62729a, ((c) obj).f62729a);
        }

        public final int hashCode() {
            return this.f62729a.hashCode();
        }

        @NotNull
        public final String toString() {
            return "Not(rule=" + this.f62729a + ')';
        }
    }

    public static final class d extends J6 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final List<J6> f62730a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(@NotNull ArrayList rules) {
            super(0);
            Intrinsics.g(rules, "rules");
            this.f62730a = rules;
        }

        @Override // io.branch.search.internal.J6
        public final boolean a(@NotNull C3289nf userData) {
            Intrinsics.g(userData, "userData");
            List<J6> list = this.f62730a;
            if ((list instanceof Collection) && list.isEmpty()) {
                return false;
            }
            Iterator<T> it = list.iterator();
            while (it.hasNext()) {
                if (((J6) it.next()).a(userData)) {
                    return true;
                }
            }
            return false;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof d) && Intrinsics.b(this.f62730a, ((d) obj).f62730a);
        }

        public final int hashCode() {
            return this.f62730a.hashCode();
        }

        @NotNull
        public final String toString() {
            return Ob.a(new StringBuilder("Or(rules="), this.f62730a, ')');
        }
    }

    public static final class e extends J6 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final P1.a f62731a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public e(@NotNull P1.a value) {
            super(0);
            Intrinsics.g(value, "value");
            this.f62731a = value;
        }

        @Override // io.branch.search.internal.J6
        public final boolean a(@NotNull C3289nf userData) {
            Intrinsics.g(userData, "userData");
            return userData.f65397a == this.f62731a;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof e) && this.f62731a == ((e) obj).f62731a;
        }

        public final int hashCode() {
            return this.f62731a.hashCode();
        }

        @NotNull
        public final String toString() {
            return "TrackingStatus(value=" + this.f62731a + ')';
        }
    }

    public J6() {
    }

    public abstract boolean a(@NotNull C3289nf c3289nf);

    public /* synthetic */ J6(int i5) {
        this();
    }
}
