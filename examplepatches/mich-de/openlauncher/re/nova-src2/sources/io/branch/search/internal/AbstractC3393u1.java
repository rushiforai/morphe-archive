package io.branch.search.internal;

import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.u1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public abstract class AbstractC3393u1 {

    /* renamed from: io.branch.search.internal.u1$a */
    public static final class a extends c {

        /* renamed from: m, reason: collision with root package name */
        @NotNull
        public final y40.c f65946m;

        @NotNull
        public final F0 n;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(@NotNull F4 contextDelegate, @NotNull P1 branchConfiguration, @NotNull C3282n8 remoteConfiguration, @NotNull Z1 branchDeviceInfo, @NotNull A9 networkRepository, @NotNull y40.c request, @NotNull F0 virtualRequest) {
            super(contextDelegate, branchConfiguration, remoteConfiguration, branchDeviceInfo, networkRepository);
            Intrinsics.g(contextDelegate, "contextDelegate");
            Intrinsics.g(branchConfiguration, "branchConfiguration");
            Intrinsics.g(remoteConfiguration, "remoteConfiguration");
            Intrinsics.g(branchDeviceInfo, "branchDeviceInfo");
            Intrinsics.g(networkRepository, "networkRepository");
            Intrinsics.g(request, "request");
            Intrinsics.g(virtualRequest, "virtualRequest");
            this.f65946m = request;
            this.n = virtualRequest;
        }

        @Override // io.branch.search.internal.AbstractC3393u1.c, io.branch.search.internal.AbstractC3393u1
        @Nullable
        public final String a(@Nullable String str) {
            if (!"user_query".equalsIgnoreCase(str)) {
                return "user_query_raw".equalsIgnoreCase(str) ? this.f65946m.f96656a : "request_id".equalsIgnoreCase(str) ? this.n.f66313d : super.a(str);
            }
            List<Integer> list = C3217jb.f64893a;
            return C3217jb.a(this.f65946m.f96656a, true);
        }
    }

    /* renamed from: io.branch.search.internal.u1$b */
    public static final class b extends c {
        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(@NotNull F4 contextDelegate, @NotNull P1 branchConfiguration, @NotNull C3282n8 remoteConfiguration, @NotNull Z1 branchDeviceInfo, @NotNull A9 networkRepository) {
            super(contextDelegate, branchConfiguration, remoteConfiguration, branchDeviceInfo, networkRepository);
            Intrinsics.g(contextDelegate, "contextDelegate");
            Intrinsics.g(branchConfiguration, "branchConfiguration");
            Intrinsics.g(remoteConfiguration, "remoteConfiguration");
            Intrinsics.g(branchDeviceInfo, "branchDeviceInfo");
            Intrinsics.g(networkRepository, "networkRepository");
        }
    }

    @Nullable
    public abstract String a(@Nullable String str);

    @NotNull
    public final String[] b(@Nullable String str) {
        List arrayList = TextUtils.isEmpty(str) ? new ArrayList() : str != null ? r70.k.i1(str, new String[]{","}, 6) : null;
        int i5 = 0;
        String[] strArr = new String[arrayList != null ? arrayList.size() : 0];
        if (arrayList != null) {
            for (Object obj : arrayList) {
                int i11 = i5 + 1;
                if (i5 < 0) {
                    ul.b.e0();
                    throw null;
                }
                strArr[i5] = a((String) obj);
                i5 = i11;
            }
        }
        return strArr;
    }

    @Nullable
    public List<String[]> c(@Nullable String str) {
        throw new IllegalStateException(getClass().getSimpleName().concat(" does not support repeated bindings"));
    }

    /* renamed from: io.branch.search.internal.u1$c */
    public static class c extends AbstractC3393u1 {

        @NotNull
        public static final a Companion = new a();

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final F4 f65947a;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final P1 f65948b;

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public final Z1 f65949c;

        /* renamed from: d, reason: collision with root package name */
        @NotNull
        public final A9 f65950d;

        /* renamed from: e, reason: collision with root package name */
        @NotNull
        public final Map<String, String> f65951e;

        /* renamed from: f, reason: collision with root package name */
        public boolean f65952f;

        /* renamed from: g, reason: collision with root package name */
        @NotNull
        public JSONObject f65953g;

        /* renamed from: h, reason: collision with root package name */
        @NotNull
        public final Q5 f65954h;

        /* renamed from: i, reason: collision with root package name */
        @NotNull
        public final C3295o4 f65955i;

        /* renamed from: j, reason: collision with root package name */
        @Nullable
        public String f65956j;

        /* renamed from: k, reason: collision with root package name */
        @Nullable
        public String f65957k;

        /* renamed from: l, reason: collision with root package name */
        @Nullable
        public String f65958l;

        /* renamed from: io.branch.search.internal.u1$c$a */
        public static final class a {
        }

        static {
            ul.b.Q("user_id", "debug_mode", "is_connected", "connected_network_types", "is_network_metered", "gaid", "user_latitude", "user_longitude");
        }

        public /* synthetic */ c(F4 f42, P1 p12, C3282n8 c3282n8, Z1 z12, A9 a92) {
            this(f42, p12, c3282n8, z12, a92, b70.h.f17594a);
        }

        @Override // io.branch.search.internal.AbstractC3393u1
        @Nullable
        public String a(@Nullable String str) {
            if (str != null && r70.j.I0(str, "c:", false)) {
                String strSubstring = str.substring(2);
                Intrinsics.f(strSubstring, "this as java.lang.String).substring(startIndex)");
                return strSubstring;
            }
            if ("gaid".equalsIgnoreCase(str)) {
                if (this.f65958l == null) {
                    this.f65958l = this.f65948b.f63038e;
                }
                return this.f65958l;
            }
            if ("user_latitude".equalsIgnoreCase(str)) {
                if (this.f65956j == null) {
                    this.f65949c.getClass();
                    this.f65956j = Double.compare(0.0d, 0.0d) != 0 ? String.valueOf(0.0d) : null;
                }
                return this.f65956j;
            }
            if ("user_longitude".equalsIgnoreCase(str)) {
                if (this.f65957k == null) {
                    this.f65949c.getClass();
                    this.f65957k = Double.compare(0.0d, 0.0d) != 0 ? String.valueOf(0.0d) : null;
                }
                return this.f65957k;
            }
            if ("debug_mode".equalsIgnoreCase(str)) {
                return "0";
            }
            if ("user_id".equalsIgnoreCase(str)) {
                return String.valueOf(((C3356rf) this.f65947a.f62440c.getValue()).f65680a.getCurrentUserId());
            }
            if ("is_connected".equalsIgnoreCase(str)) {
                return this.f65950d.isConnected() ? "1" : "0";
            }
            if ("is_network_metered".equalsIgnoreCase(str)) {
                return this.f65950d.b() ? "1" : "0";
            }
            if ("connected_network_types".equalsIgnoreCase(str)) {
                Set<Integer> setA = this.f65950d.a();
                StringBuilder sb2 = new StringBuilder();
                Iterator<T> it = setA.iterator();
                while (it.hasNext()) {
                    int iIntValue = ((Number) it.next()).intValue();
                    if (iIntValue == 0) {
                        sb2.append("cellular,");
                    } else if (iIntValue == 1) {
                        sb2.append("wifi,");
                    } else if (iIntValue == 2) {
                        sb2.append("bluetooth,");
                    } else if (iIntValue == 3) {
                        sb2.append("ethernet,");
                    }
                }
                return sb2.length() > 0 ? sb2.substring(0, sb2.length() - 1) : sb2.toString();
            }
            if (!this.f65952f) {
                Q5 q5 = this.f65954h;
                Z1 z12 = this.f65949c;
                z12.b(true);
                P5 p52 = new P5(z12.a(), z12.c());
                q5.getClass();
                JSONObject jSONObjectA = Q5.a(p52);
                C3295o4 c3295o4 = this.f65955i;
                C3278n4 c3278n4A = this.f65948b.a();
                c3295o4.getClass();
                this.f65953g = C3199i9.a(jSONObjectA, C3295o4.a(c3278n4A));
                this.f65952f = true;
            }
            if (this.f65953g.isNull(str)) {
                return this.f65951e.get(str);
            }
            if (str == null) {
                return null;
            }
            try {
                return this.f65953g.get(str).toString();
            } catch (JSONException unused) {
                throw new IllegalStateException("Unknown binding: ".concat(str));
            }
        }

        public c(@NotNull F4 contextDelegate, @NotNull P1 branchConfiguration, @NotNull C3282n8 remoteConfiguration, @NotNull Z1 branchDeviceInfo, @NotNull A9 networkRepository, @NotNull Map<String, String> other) {
            Intrinsics.g(contextDelegate, "contextDelegate");
            Intrinsics.g(branchConfiguration, "branchConfiguration");
            Intrinsics.g(remoteConfiguration, "remoteConfiguration");
            Intrinsics.g(branchDeviceInfo, "branchDeviceInfo");
            Intrinsics.g(networkRepository, "networkRepository");
            Intrinsics.g(other, "other");
            this.f65947a = contextDelegate;
            this.f65948b = branchConfiguration;
            this.f65949c = branchDeviceInfo;
            this.f65950d = networkRepository;
            this.f65951e = other;
            this.f65953g = new JSONObject();
            this.f65954h = new Q5();
            this.f65955i = new C3295o4();
        }
    }
}
