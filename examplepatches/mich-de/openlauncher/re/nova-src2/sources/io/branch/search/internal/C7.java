package io.branch.search.internal;

import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public interface C7 {

    public static final class a implements C7 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final String f62291a;

        /* renamed from: b, reason: collision with root package name */
        public final long f62292b;

        /* renamed from: c, reason: collision with root package name */
        @Nullable
        public final String f62293c;

        public a(long j11, @NotNull String packageName, @Nullable String str) {
            Intrinsics.g(packageName, "packageName");
            this.f62291a = packageName;
            this.f62292b = j11;
            this.f62293c = str;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof a)) {
                return false;
            }
            a aVar = (a) obj;
            return Intrinsics.b(this.f62291a, aVar.f62291a) && this.f62292b == aVar.f62292b && Intrinsics.b(this.f62293c, aVar.f62293c);
        }

        public final int hashCode() {
            int iA = C3231k8.a(this.f62292b, this.f62291a.hashCode() * 31, 31);
            String str = this.f62293c;
            return iA + (str == null ? 0 : str.hashCode());
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("AppIcon(packageName=");
            sb2.append(this.f62291a);
            sb2.append(", userId=");
            sb2.append(this.f62292b);
            sb2.append(", activityClassName=");
            return Z.a(sb2, this.f62293c, ')');
        }
    }

    public static final class b implements C7 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final String f62294a;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final String f62295b;

        /* renamed from: c, reason: collision with root package name */
        public final double f62296c;

        /* renamed from: d, reason: collision with root package name */
        @NotNull
        public final Map<String, String> f62297d;

        public b(@NotNull String url, double d5, @NotNull LinkedHashMap params) {
            Intrinsics.g(url, "url");
            Intrinsics.g(params, "params");
            this.f62294a = url;
            this.f62295b = "local_search";
            this.f62296c = d5;
            this.f62297d = params;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof b)) {
                return false;
            }
            b bVar = (b) obj;
            return Intrinsics.b(this.f62294a, bVar.f62294a) && Intrinsics.b(this.f62295b, bVar.f62295b) && Double.valueOf(this.f62296c).equals(Double.valueOf(bVar.f62296c)) && Intrinsics.b(this.f62297d, bVar.f62297d);
        }

        public final int hashCode() {
            return this.f62297d.hashCode() + b.c9.c(this.f62296c, C3248l8.a(this.f62295b, this.f62294a.hashCode() * 31, 31), 31);
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("LargeUrl(url=");
            sb2.append(this.f62294a);
            sb2.append(", resultType=");
            sb2.append(this.f62295b);
            sb2.append(", aspectRatio=");
            sb2.append(this.f62296c);
            sb2.append(", params=");
            return b.c9.l(sb2, this.f62297d, ')');
        }
    }

    public static final class c implements C7 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final String f62298a;

        /* renamed from: b, reason: collision with root package name */
        public final long f62299b;

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public final String f62300c;

        public c(long j11, @NotNull String packageName, @NotNull String id2) {
            Intrinsics.g(packageName, "packageName");
            Intrinsics.g(id2, "id");
            this.f62298a = packageName;
            this.f62299b = j11;
            this.f62300c = id2;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof c)) {
                return false;
            }
            c cVar = (c) obj;
            return Intrinsics.b(this.f62298a, cVar.f62298a) && this.f62299b == cVar.f62299b && Intrinsics.b(this.f62300c, cVar.f62300c);
        }

        public final int hashCode() {
            return this.f62300c.hashCode() + C3231k8.a(this.f62299b, this.f62298a.hashCode() * 31, 31);
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("ShortcutIcon(packageName=");
            sb2.append(this.f62298a);
            sb2.append(", userId=");
            sb2.append(this.f62299b);
            sb2.append(", id=");
            return Z.a(sb2, this.f62300c, ')');
        }
    }

    public static final class d implements C7 {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final String f62301a;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final String f62302b;

        public d(@NotNull String url, @NotNull String resultType) {
            Intrinsics.g(url, "url");
            Intrinsics.g(resultType, "resultType");
            this.f62301a = url;
            this.f62302b = resultType;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof d)) {
                return false;
            }
            d dVar = (d) obj;
            return Intrinsics.b(this.f62301a, dVar.f62301a) && Intrinsics.b(this.f62302b, dVar.f62302b);
        }

        public final int hashCode() {
            return this.f62302b.hashCode() + (this.f62301a.hashCode() * 31);
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Url(url=");
            sb2.append(this.f62301a);
            sb2.append(", resultType=");
            return Z.a(sb2, this.f62302b, ')');
        }
    }
}
