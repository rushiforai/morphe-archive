package io.branch.search.internal;

import android.text.TextUtils;
import java.util.Map;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.t8, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3383t8 {

    @NotNull
    public static final a Companion;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public static final Map<String, String> f65859i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public static final Map<String, String> f65860j;

    /* renamed from: a, reason: collision with root package name */
    public final int f65861a;

    /* renamed from: b, reason: collision with root package name */
    public final long f65862b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final String f65863c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f65864d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final Lazy f65865e = LazyKt.a(new b());

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final Lazy f65866f = LazyKt.a(new c());

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public final String f65867g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public final String f65868h;

    /* renamed from: io.branch.search.internal.t8$b */
    public static final class b extends Lambda implements Function0<String> {
        public b() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return a.a(C3383t8.Companion, C3383t8.f65859i, C3383t8.this.f65863c);
        }
    }

    /* renamed from: io.branch.search.internal.t8$c */
    public static final class c extends Lambda implements Function0<String> {
        public c() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return a.a(C3383t8.Companion, C3383t8.f65860j, C3383t8.this.f65864d);
        }
    }

    static {
        a aVar = new a();
        Companion = aVar;
        EnumC3075b4 enumC3075b4 = EnumC3075b4.f64005y;
        EnumC3075b4 enumC3075b42 = EnumC3075b4.A;
        EnumC3075b4 enumC3075b43 = EnumC3075b4.f64006z;
        EnumC3075b4 enumC3075b44 = EnumC3075b4.B;
        f65859i = MapsKt.j0(new Pair("LOCAL_IMAGES", a.a(aVar, enumC3075b4, enumC3075b42, enumC3075b43, enumC3075b44)), new Pair("ADS_IMAGES", a.a(aVar, enumC3075b4, enumC3075b42)), new Pair("ALL_LOCAL", a.a(aVar, enumC3075b4, enumC3075b42, enumC3075b43, enumC3075b44, EnumC3075b4.n)));
        f65860j = MapsKt.j0(new Pair("ALL_WIFI", a.a(aVar, "wifi", "wifi:metered")), new Pair("ALL_CELLULAR", a.a(aVar, "cellular", "cellular:metered")), new Pair("ALL_METERED", a.a(aVar, "wifi:metered", "cellular:metered")), new Pair("ALL_NONMETERED", a.a(aVar, "wifi", "cellular")));
    }

    public C3383t8(int i5, long j11, @Nullable String str, @Nullable String str2) {
        this.f65861a = i5;
        this.f65862b = j11;
        this.f65863c = str;
        this.f65864d = str2;
        this.f65867g = str;
        this.f65868h = str2;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3383t8)) {
            return false;
        }
        C3383t8 c3383t8 = (C3383t8) obj;
        return this.f65861a == c3383t8.f65861a && this.f65862b == c3383t8.f65862b && Intrinsics.b(this.f65863c, c3383t8.f65863c) && Intrinsics.b(this.f65864d, c3383t8.f65864d);
    }

    public final int hashCode() {
        int iA = C3231k8.a(this.f65862b, Integer.hashCode(this.f65861a) * 31, 31);
        String str = this.f65863c;
        int iHashCode = (iA + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f65864d;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("KNetworkUsageCappingRule(days=");
        sb2.append(this.f65861a);
        sb2.append(", byte_limit=");
        sb2.append(this.f65862b);
        sb2.append(", _channels=");
        sb2.append(this.f65863c);
        sb2.append(", _connectionTypes=");
        return Z.a(sb2, this.f65864d, ')');
    }

    /* renamed from: io.branch.search.internal.t8$a */
    public static final class a {
        public static final String a(a aVar, Map map, String str) {
            aVar.getClass();
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            StringBuilder sb2 = new StringBuilder();
            Intrinsics.d(str);
            Object[] array = r70.k.i1(str, new String[]{"|"}, 6).toArray(new String[0]);
            Intrinsics.e(array, "null cannot be cast to non-null type kotlin.Array<T of kotlin.collections.ArraysKt__ArraysJVMKt.toTypedArray>");
            for (String str2 : (String[]) array) {
                if (!TextUtils.isEmpty(str2)) {
                    sb2.append("|");
                    if (map.containsKey(str2)) {
                        sb2.append((String) map.get(str2));
                    } else {
                        sb2.append(str2);
                    }
                }
            }
            sb2.append("|");
            return sb2.toString();
        }

        public static final String a(a aVar, Object... objArr) {
            return kotlin.collections.c.O0(objArr, "|", null, null, null, 62);
        }
    }
}
