package io.branch.search.internal;

import android.net.Uri;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import java.util.Locale;
import java.util.Map;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.b3, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3074b3 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final Map<H2, EnumC3075b4> f63986d;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f63987a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final EnumC3075b4 f63988b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Lazy f63989c;

    /* renamed from: io.branch.search.internal.b3$a */
    public static final class a {
        public static final EnumC3075b4 a(a aVar, H2 h22) {
            aVar.getClass();
            EnumC3075b4 enumC3075b4 = C3074b3.f63986d.get(h22);
            return enumC3075b4 == null ? EnumC3075b4.C : enumC3075b4;
        }
    }

    /* renamed from: io.branch.search.internal.b3$b */
    public static final class b extends Lambda implements Function0<Boolean> {
        public b() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            String lowerCase;
            EnumC3075b4 enumC3075b4;
            String queryParameter = Uri.parse(C3074b3.this.f63987a).getQueryParameter("bnc_adaptive");
            if (queryParameter != null) {
                lowerCase = queryParameter.toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase, "this as java.lang.String).toLowerCase(Locale.ROOT)");
            } else {
                lowerCase = null;
            }
            return Boolean.valueOf(lowerCase != null ? lowerCase.equals(InneractiveMediationDefs.SHOW_HOUSE_AD_YES) || lowerCase.equals("1") : (enumC3075b4 = C3074b3.this.f63988b) == EnumC3075b4.f63999s || enumC3075b4 == EnumC3075b4.f64003w || enumC3075b4 == EnumC3075b4.f63998r || enumC3075b4 == EnumC3075b4.f64002v);
        }
    }

    static {
        Pair pair = new Pair(H2.REMOTE_SEARCH, EnumC3075b4.f63997q);
        Pair pair2 = new Pair(H2.LOCAL_SEARCH_AD, EnumC3075b4.f63998r);
        Pair pair3 = new Pair(H2.LOCAL_SEARCH_LINK, EnumC3075b4.f64002v);
        Pair pair4 = new Pair(H2.LOCAL_ZERO_STATE_AD, EnumC3075b4.f64003w);
        Pair pair5 = new Pair(H2.LOCAL_ZERO_STATE_LINK, EnumC3075b4.f64004x);
        H2 h22 = H2.APP_STORE_SEARCH;
        EnumC3075b4 enumC3075b4 = EnumC3075b4.f63999s;
        f63986d = MapsKt.j0(pair, pair2, pair3, pair4, pair5, new Pair(h22, enumC3075b4), new Pair(H2.SUGGESTED_INSTALL, enumC3075b4), new Pair(H2.SUGGESTED_CONTENT, EnumC3075b4.f64001u), new Pair(H2.GROUPS, EnumC3075b4.f64000t), new Pair(H2.LOCAL_SEARCH_AD_PRELOAD, EnumC3075b4.f64005y), new Pair(H2.LOCAL_SEARCH_LINK_PRELOAD, EnumC3075b4.f64006z), new Pair(H2.LOCAL_ZERO_STATE_AD_PRELOAD, EnumC3075b4.A), new Pair(H2.LOCAL_ZERO_STATE_LINK_PRELOAD, EnumC3075b4.B));
    }

    public C3074b3(@NotNull String urlToFetch, @NotNull H2 type) {
        Intrinsics.g(urlToFetch, "urlToFetch");
        Intrinsics.g(type, "type");
        this.f63987a = urlToFetch;
        this.f63988b = a.a(Companion, type);
        this.f63989c = LazyKt.a(new b());
    }
}
