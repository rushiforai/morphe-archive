package io.branch.search.internal;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.ze, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public abstract class AbstractC3491ze {

    /* renamed from: io.branch.search.internal.ze$b */
    public static final class b extends AbstractC3491ze {

        /* renamed from: a, reason: collision with root package name */
        public final boolean f66379a;

        public b() {
            this(0);
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof b) && this.f66379a == ((b) obj).f66379a;
        }

        public final int hashCode() {
            boolean z11 = this.f66379a;
            if (z11) {
                return 1;
            }
            return z11 ? 1 : 0;
        }

        @NotNull
        public final String toString() {
            return a2.c.p(new StringBuilder("Online(forceDeferring="), this.f66379a, ')');
        }

        public /* synthetic */ b(int i5) {
            this(false);
        }

        public b(boolean z11) {
            super(0);
            this.f66379a = z11;
        }
    }

    public AbstractC3491ze() {
    }

    public /* synthetic */ AbstractC3491ze(int i5) {
        this();
    }

    /* renamed from: io.branch.search.internal.ze$a */
    public static final class a extends AbstractC3491ze {

        /* renamed from: a, reason: collision with root package name */
        public final long f66374a;

        /* renamed from: b, reason: collision with root package name */
        public final long f66375b;

        /* renamed from: c, reason: collision with root package name */
        public final long f66376c;

        /* renamed from: d, reason: collision with root package name */
        public final int f66377d;

        /* renamed from: e, reason: collision with root package name */
        public final boolean f66378e;

        public a(long j11, long j12, long j13, int i5, boolean z11) {
            super(0);
            this.f66374a = j11;
            this.f66375b = j12;
            this.f66376c = j13;
            this.f66377d = i5;
            this.f66378e = z11;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof a)) {
                return false;
            }
            a aVar = (a) obj;
            return this.f66374a == aVar.f66374a && this.f66375b == aVar.f66375b && this.f66376c == aVar.f66376c && this.f66377d == aVar.f66377d && this.f66378e == aVar.f66378e;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public final int hashCode() {
            int iA = C3214j8.a(this.f66377d, C3231k8.a(this.f66376c, C3231k8.a(this.f66375b, Long.hashCode(this.f66374a) * 31, 31), 31), 31);
            boolean z11 = this.f66378e;
            int i5 = z11;
            if (z11 != 0) {
                i5 = 1;
            }
            return iA + i5;
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Offline(defDelay=");
            sb2.append(this.f66374a);
            sb2.append(", bundleUpdateDelay=");
            sb2.append(this.f66375b);
            sb2.append(", sqDelay=");
            sb2.append(this.f66376c);
            sb2.append(", backOffPolicy=");
            sb2.append(this.f66377d);
            sb2.append(", forceDeferring=");
            return a2.c.p(sb2, this.f66378e, ')');
        }

        public /* synthetic */ a(long j11, long j12, long j13, boolean z11, int i5) {
            this(j11, (i5 & 2) != 0 ? j11 : j12, (i5 & 4) != 0 ? j11 : j13, 0, z11);
        }
    }
}
