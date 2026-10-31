package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public interface Rb {

    public static final class a implements Rb {

        /* renamed from: a, reason: collision with root package name */
        public final long f63276a;

        /* renamed from: b, reason: collision with root package name */
        public final long f63277b;

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public final Wb f63278c;

        /* renamed from: d, reason: collision with root package name */
        @NotNull
        public final String f63279d;

        /* renamed from: e, reason: collision with root package name */
        public final int f63280e;

        /* renamed from: f, reason: collision with root package name */
        public final int f63281f;

        public a(long j11, long j12, @NotNull Wb state, @NotNull String url, int i5, int i11) {
            Intrinsics.g(state, "state");
            Intrinsics.g(url, "url");
            this.f63276a = j11;
            this.f63277b = j12;
            this.f63278c = state;
            this.f63279d = url;
            this.f63280e = i5;
            this.f63281f = i11;
        }

        @Override // io.branch.search.internal.Rb
        public final long a() {
            return this.f63277b;
        }

        @Override // io.branch.search.internal.Rb
        @NotNull
        public final Wb b() {
            return this.f63278c;
        }

        @Override // io.branch.search.internal.Rb
        public final int c() {
            return this.f63281f;
        }

        @Override // io.branch.search.internal.Rb
        public final int d() {
            return this.f63280e;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof a)) {
                return false;
            }
            a aVar = (a) obj;
            return this.f63276a == aVar.f63276a && this.f63277b == aVar.f63277b && this.f63278c == aVar.f63278c && Intrinsics.b(this.f63279d, aVar.f63279d) && this.f63280e == aVar.f63280e && this.f63281f == aVar.f63281f;
        }

        @Override // io.branch.search.internal.Rb
        public final long getId() {
            return this.f63276a;
        }

        public final int hashCode() {
            return Integer.hashCode(this.f63281f) + C3214j8.a(this.f63280e, C3248l8.a(this.f63279d, (this.f63278c.hashCode() + C3231k8.a(this.f63277b, Long.hashCode(this.f63276a) * 31, 31)) * 31, 31), 31);
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("ClickEvent(id=");
            sb2.append(this.f63276a);
            sb2.append(", createTime=");
            sb2.append(this.f63277b);
            sb2.append(", state=");
            sb2.append(this.f63278c);
            sb2.append(", url=");
            sb2.append(this.f63279d);
            sb2.append(", crashCount=");
            sb2.append(this.f63280e);
            sb2.append(", failCount=");
            return a2.c.m(sb2, this.f63281f, ')');
        }
    }

    long a();

    @NotNull
    Wb b();

    int c();

    int d();

    long getId();
}
