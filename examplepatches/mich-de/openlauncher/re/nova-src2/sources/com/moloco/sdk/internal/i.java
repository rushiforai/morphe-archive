package com.moloco.sdk.internal;

import androidx.recyclerview.widget.n0;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public abstract class i {

    /* renamed from: c, reason: collision with root package name */
    public static final int f36404c = 0;

    /* renamed from: a, reason: collision with root package name */
    public final int f36405a;

    /* renamed from: b, reason: collision with root package name */
    public final int f36406b;

    public static final class a extends i {

        /* renamed from: e, reason: collision with root package name */
        public static final int f36407e = 0;

        /* renamed from: d, reason: collision with root package name */
        @Nullable
        public final Integer f36408d;

        /* JADX WARN: Multi-variable type inference failed */
        public a() {
            this(null, 1, 0 == true ? 1 : 0);
        }

        @NotNull
        public final a a(@Nullable Integer num) {
            return new a(num);
        }

        @Nullable
        public final Integer c() {
            return this.f36408d;
        }

        @Nullable
        public final Integer d() {
            return this.f36408d;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof a) && Intrinsics.b(this.f36408d, ((a) obj).f36408d);
        }

        public int hashCode() {
            Integer num = this.f36408d;
            if (num == null) {
                return 0;
            }
            return num.hashCode();
        }

        @NotNull
        public String toString() {
            return a2.c.o(new StringBuilder("AnchoredAdaptive(availableWidth="), this.f36408d, ')');
        }

        /* JADX WARN: Illegal instructions before constructor call */
        public a(@Nullable Integer num) {
            int i5 = 0;
            super(i5, i5, null);
            this.f36408d = num;
        }

        public static /* synthetic */ a a(a aVar, Integer num, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                num = aVar.f36408d;
            }
            return aVar.a(num);
        }

        public /* synthetic */ a(Integer num, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this((i5 & 1) != 0 ? null : num);
        }
    }

    public static final class b extends i {

        /* renamed from: f, reason: collision with root package name */
        public static final int f36409f = 0;

        /* renamed from: d, reason: collision with root package name */
        public final int f36410d;

        /* renamed from: e, reason: collision with root package name */
        public final int f36411e;

        public b(int i5, int i11) {
            super(i5, i11, null);
            this.f36410d = i5;
            this.f36411e = i11;
        }

        @NotNull
        public final b a(int i5, int i11) {
            return new b(i5, i11);
        }

        @Override // com.moloco.sdk.internal.i
        public int b() {
            return this.f36410d;
        }

        public final int c() {
            return this.f36410d;
        }

        public final int d() {
            return this.f36411e;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof b)) {
                return false;
            }
            b bVar = (b) obj;
            return this.f36410d == bVar.f36410d && this.f36411e == bVar.f36411e;
        }

        public int hashCode() {
            return Integer.hashCode(this.f36411e) + (Integer.hashCode(this.f36410d) * 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("Custom(wDp=");
            sb2.append(this.f36410d);
            sb2.append(", hDp=");
            return a2.c.m(sb2, this.f36411e, ')');
        }

        public static /* synthetic */ b a(b bVar, int i5, int i11, int i12, Object obj) {
            if ((i12 & 1) != 0) {
                i5 = bVar.f36410d;
            }
            if ((i12 & 2) != 0) {
                i11 = bVar.f36411e;
            }
            return bVar.a(i5, i11);
        }

        @Override // com.moloco.sdk.internal.i
        public int a() {
            return this.f36411e;
        }
    }

    public static final class c extends i {

        /* renamed from: e, reason: collision with root package name */
        public static final int f36412e = 0;

        /* renamed from: d, reason: collision with root package name */
        @Nullable
        public final Integer f36413d;

        /* JADX WARN: Multi-variable type inference failed */
        public c() {
            this(null, 1, 0 == true ? 1 : 0);
        }

        @NotNull
        public final c a(@Nullable Integer num) {
            return new c(num);
        }

        @Nullable
        public final Integer c() {
            return this.f36413d;
        }

        @Nullable
        public final Integer d() {
            return this.f36413d;
        }

        public boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof c) && Intrinsics.b(this.f36413d, ((c) obj).f36413d);
        }

        public int hashCode() {
            Integer num = this.f36413d;
            if (num == null) {
                return 0;
            }
            return num.hashCode();
        }

        @NotNull
        public String toString() {
            return a2.c.o(new StringBuilder("InlineAdaptive(availableWidth="), this.f36413d, ')');
        }

        /* JADX WARN: Illegal instructions before constructor call */
        public c(@Nullable Integer num) {
            int i5 = 0;
            super(i5, i5, null);
            this.f36413d = num;
        }

        public static /* synthetic */ c a(c cVar, Integer num, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                num = cVar.f36413d;
            }
            return cVar.a(num);
        }

        public /* synthetic */ c(Integer num, int i5, DefaultConstructorMarker defaultConstructorMarker) {
            this((i5 & 1) != 0 ? null : num);
        }
    }

    public static final class d extends i {

        /* renamed from: d, reason: collision with root package name */
        @NotNull
        public static final d f36414d = new d();

        /* renamed from: e, reason: collision with root package name */
        public static final int f36415e = 0;

        public d() {
            super(300, n0.DEFAULT_SWIPE_ANIMATION_DURATION, null);
        }
    }

    public static final class e extends i {

        /* renamed from: d, reason: collision with root package name */
        @NotNull
        public static final e f36416d = new e();

        /* renamed from: e, reason: collision with root package name */
        public static final int f36417e = 0;

        public e() {
            super(Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 50, null);
        }
    }

    public static final class f extends i {

        /* renamed from: d, reason: collision with root package name */
        @NotNull
        public static final f f36418d = new f();

        /* renamed from: e, reason: collision with root package name */
        public static final int f36419e = 0;

        public f() {
            super(728, 90, null);
        }
    }

    public /* synthetic */ i(int i5, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(i5, i11);
    }

    public int a() {
        return this.f36406b;
    }

    public int b() {
        return this.f36405a;
    }

    public i(int i5, int i11) {
        this.f36405a = i5;
        this.f36406b = i11;
    }
}
