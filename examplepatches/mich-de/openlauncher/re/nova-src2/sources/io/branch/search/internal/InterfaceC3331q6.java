package io.branch.search.internal;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.UserHandle;
import android.text.TextUtils;
import android.view.View;
import io.branch.search.internal.AbstractC3394u2;
import io.branch.search.internal.C3296o5;
import io.branch.search.internal.C4;
import io.branch.search.internal.X1;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.q6, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public interface InterfaceC3331q6 extends X, Parcelable {
    @Override // io.branch.search.internal.X
    @Nullable
    List<String> a();

    void a(@NotNull Context context, @NotNull b50.f fVar, @NotNull X1 x12);

    void a(@NotNull View view);

    boolean a(@NotNull Context context, @NotNull X1 x12);

    @Nullable
    b50.a f();

    @NotNull
    String getContainerType();

    int getId();

    @Nullable
    String sourcePackageName();

    /* renamed from: io.branch.search.internal.q6$a */
    public static final class a implements InterfaceC3331q6, X, Y {

        @NotNull
        public static final Parcelable.Creator<a> CREATOR = new C0346a();

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final String f65532a;

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public final String f65533b;

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public final String f65534c;

        /* renamed from: d, reason: collision with root package name */
        public final int f65535d;

        /* renamed from: e, reason: collision with root package name */
        @NotNull
        public final String f65536e;

        /* renamed from: f, reason: collision with root package name */
        @Nullable
        public final String f65537f;

        /* renamed from: g, reason: collision with root package name */
        public final long f65538g;

        /* renamed from: h, reason: collision with root package name */
        @NotNull
        public final String f65539h;

        /* renamed from: i, reason: collision with root package name */
        @NotNull
        public final Lazy f65540i;

        /* renamed from: io.branch.search.internal.q6$a$a, reason: collision with other inner class name */
        public static final class C0346a implements Parcelable.Creator<a> {
            @Override // android.os.Parcelable.Creator
            public final a createFromParcel(Parcel parcel) {
                Intrinsics.g(parcel, "parcel");
                return new a(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt(), parcel.readString(), parcel.readString(), parcel.readLong(), parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final a[] newArray(int i5) {
                return new a[i5];
            }
        }

        /* renamed from: io.branch.search.internal.q6$a$b */
        public static final class b extends Lambda implements Function0<JSONObject> {
            public b() {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                JSONObject jSONObject = new JSONObject();
                a aVar = a.this;
                C3308p0.b(aVar, jSONObject, "analytics_window_id", aVar.f65536e);
                a aVar2 = a.this;
                C3308p0.b(aVar2, jSONObject, "request_id", aVar2.f65534c);
                a aVar3 = a.this;
                C3308p0.b(aVar3, jSONObject, "result_id", Integer.valueOf(aVar3.f65535d));
                String str = Intrinsics.b(a.this.f65533b, "autosuggest") ? "autosuggestion" : null;
                if (str != null) {
                    a aVar4 = a.this;
                    C3308p0.c(aVar4, jSONObject, str, aVar4.f65532a);
                }
                String str2 = a.this.f65537f;
                if (str2 != null && str2.length() != 0) {
                    a aVar5 = a.this;
                    C3308p0.b(aVar5, jSONObject, "bundle_source_id", aVar5.f65537f);
                }
                return jSONObject;
            }
        }

        public a(@NotNull String suggestion, @NotNull String apiName, @NotNull String requestId, int i5, @NotNull String sessionId, @Nullable String str, long j11, @NotNull String containerType) {
            Intrinsics.g(suggestion, "suggestion");
            Intrinsics.g(apiName, "apiName");
            Intrinsics.g(requestId, "requestId");
            Intrinsics.g(sessionId, "sessionId");
            Intrinsics.g(containerType, "containerType");
            this.f65532a = suggestion;
            this.f65533b = apiName;
            this.f65534c = requestId;
            this.f65535d = i5;
            this.f65536e = sessionId;
            this.f65537f = str;
            this.f65538g = j11;
            this.f65539h = containerType;
            this.f65540i = LazyKt.a(new b());
        }

        @Override // io.branch.search.internal.InterfaceC3331q6
        public final void a(@NotNull Context context, @NotNull b50.f handler, @NotNull X1 entityType) {
            Intrinsics.g(context, "context");
            Intrinsics.g(handler, "handler");
            Intrinsics.g(entityType, "entityType");
            y40.p.Companion.getClass();
            InterfaceC3445x2 interfaceC3445x2 = (InterfaceC3445x2) y40.o.a();
            String apiName = this.f65533b;
            JSONObject jSONObject = new JSONObject();
            C3308p0.a(this, jSONObject, "analytics_window_id", this.f65536e);
            C3308p0.a(this, jSONObject, "request_id", this.f65534c);
            C3308p0.a(this, jSONObject, "result_id", Integer.valueOf(this.f65535d));
            C3308p0.a(this, jSONObject, "timestamp", Long.valueOf(System.currentTimeMillis()));
            String str = Intrinsics.b(this.f65533b, "autosuggest") ? "autosuggestion" : null;
            if (str != null) {
                C3308p0.c(this, jSONObject, str, this.f65532a);
            }
            String str2 = this.f65537f;
            if (str2 != null && str2.length() != 0) {
                C3308p0.b(this, jSONObject, "bundle_source_id", this.f65537f);
            }
            Intrinsics.g(apiName, "apiName");
            String string = jSONObject.toString();
            Intrinsics.f(string, "clickJson.toString()");
            interfaceC3445x2.a(new C4.j.b(null, null, new C4.j.a(string, apiName, "auto_suggestion_click", null)));
        }

        @Override // io.branch.search.internal.Y
        @NotNull
        public final String b() {
            return this.f65533b + '.' + this.f65534c + '.' + this.f65535d;
        }

        @Override // io.branch.search.internal.X
        public final int c() {
            return ((JSONObject) this.f65540i.getValue()).toString().hashCode();
        }

        @Override // io.branch.search.internal.X
        @NotNull
        public final JSONObject d() {
            return (JSONObject) this.f65540i.getValue();
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // io.branch.search.internal.X
        @NotNull
        public final String e() {
            return this.f65533b;
        }

        @Override // io.branch.search.internal.InterfaceC3331q6
        @Nullable
        public final b50.a f() {
            return null;
        }

        @Override // io.branch.search.internal.InterfaceC3331q6
        @NotNull
        public final String getContainerType() {
            return this.f65539h;
        }

        @Override // io.branch.search.internal.InterfaceC3331q6
        public final int getId() {
            return this.f65532a.hashCode();
        }

        @Override // io.branch.search.internal.InterfaceC3331q6
        @Nullable
        public final String sourcePackageName() {
            return this.f65537f;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(@NotNull Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeString(this.f65532a);
            out.writeString(this.f65533b);
            out.writeString(this.f65534c);
            out.writeInt(this.f65535d);
            out.writeString(this.f65536e);
            out.writeString(this.f65537f);
            out.writeLong(this.f65538g);
            out.writeString(this.f65539h);
        }

        @Override // io.branch.search.internal.InterfaceC3331q6, io.branch.search.internal.X
        @NotNull
        public final List<String> a() {
            return EmptyList.f71733a;
        }

        @Override // io.branch.search.internal.InterfaceC3331q6
        public final void a(@NotNull View view) {
            Intrinsics.g(view, "view");
            y40.p.Companion.getClass();
            ((InterfaceC3445x2) y40.o.a()).a(view, this);
        }

        @Override // io.branch.search.internal.InterfaceC3331q6
        public final boolean a(@NotNull Context context, @NotNull X1 entityType) {
            Intrinsics.g(context, "context");
            Intrinsics.g(entityType, "entityType");
            return true;
        }
    }

    /* renamed from: io.branch.search.internal.q6$b */
    public static final class b implements InterfaceC3331q6, Y, X {

        @NotNull
        public static final Parcelable.Creator<b> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final int f65542a;

        /* renamed from: b, reason: collision with root package name */
        @Nullable
        public final List<String> f65543b;

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public final List<AbstractC3394u2> f65544c;

        /* renamed from: d, reason: collision with root package name */
        @Nullable
        public final List<String> f65545d;

        /* renamed from: e, reason: collision with root package name */
        @NotNull
        public final String f65546e;

        /* renamed from: f, reason: collision with root package name */
        @NotNull
        public final String f65547f;

        /* renamed from: g, reason: collision with root package name */
        @NotNull
        public final UserHandle f65548g;

        /* renamed from: h, reason: collision with root package name */
        public final long f65549h;

        /* renamed from: i, reason: collision with root package name */
        @NotNull
        public final String f65550i;

        /* renamed from: j, reason: collision with root package name */
        @NotNull
        public final String f65551j;

        /* renamed from: k, reason: collision with root package name */
        public final int f65552k;

        /* renamed from: l, reason: collision with root package name */
        @Nullable
        public final String f65553l;

        /* renamed from: m, reason: collision with root package name */
        @NotNull
        public final String f65554m;

        @NotNull
        public final String n;

        @NotNull
        public final String o;

        /* renamed from: p, reason: collision with root package name */
        @Nullable
        public final String f65555p;

        /* renamed from: q, reason: collision with root package name */
        @Nullable
        public final String f65556q;

        /* renamed from: r, reason: collision with root package name */
        @NotNull
        public final Map<String, String> f65557r;

        /* renamed from: s, reason: collision with root package name */
        public final boolean f65558s;

        /* renamed from: t, reason: collision with root package name */
        @NotNull
        public final Lazy f65559t;

        /* renamed from: io.branch.search.internal.q6$b$a */
        public static final class a implements Parcelable.Creator<b> {
            @Override // android.os.Parcelable.Creator
            public final b createFromParcel(Parcel parcel) {
                Intrinsics.g(parcel, "parcel");
                int i5 = parcel.readInt();
                ArrayList<String> arrayListCreateStringArrayList = parcel.createStringArrayList();
                int i11 = parcel.readInt();
                ArrayList arrayList = new ArrayList(i11);
                for (int i12 = 0; i12 != i11; i12++) {
                    arrayList.add(parcel.readParcelable(b.class.getClassLoader()));
                }
                ArrayList<String> arrayListCreateStringArrayList2 = parcel.createStringArrayList();
                String string = parcel.readString();
                String string2 = parcel.readString();
                UserHandle userHandle = (UserHandle) parcel.readParcelable(b.class.getClassLoader());
                long j11 = parcel.readLong();
                String string3 = parcel.readString();
                String string4 = parcel.readString();
                int i13 = parcel.readInt();
                String string5 = parcel.readString();
                String string6 = parcel.readString();
                String string7 = parcel.readString();
                String string8 = parcel.readString();
                String string9 = parcel.readString();
                String string10 = parcel.readString();
                int i14 = parcel.readInt();
                LinkedHashMap linkedHashMap = new LinkedHashMap(i14);
                int i15 = 0;
                while (i15 != i14) {
                    linkedHashMap.put(parcel.readString(), parcel.readString());
                    i15++;
                    i14 = i14;
                }
                return new b(i5, arrayListCreateStringArrayList, arrayList, arrayListCreateStringArrayList2, string, string2, userHandle, j11, string3, string4, i13, string5, string6, string7, string8, string9, string10, linkedHashMap, parcel.readInt() != 0);
            }

            @Override // android.os.Parcelable.Creator
            public final b[] newArray(int i5) {
                return new b[i5];
            }
        }

        /* renamed from: io.branch.search.internal.q6$b$b, reason: collision with other inner class name */
        public static final class C0347b extends Lambda implements Function0<JSONObject> {
            public C0347b() {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                JSONObject jSONObject = new JSONObject();
                if (!TextUtils.isEmpty(b.this.f65553l)) {
                    b bVar = b.this;
                    C3308p0.b(bVar, jSONObject, "entity_id", bVar.f65553l);
                }
                if (b.this.f65546e.length() > 0) {
                    b bVar2 = b.this;
                    C3308p0.b(bVar2, jSONObject, "package_name", bVar2.f65546e);
                }
                b bVar3 = b.this;
                C3308p0.b(bVar3, jSONObject, "analytics_window_id", bVar3.f65550i);
                b bVar4 = b.this;
                C3308p0.b(bVar4, jSONObject, "request_id", bVar4.f65551j);
                b bVar5 = b.this;
                C3308p0.b(bVar5, jSONObject, "result_id", Integer.valueOf(bVar5.f65552k));
                b bVar6 = b.this;
                C3308p0.b(bVar6, jSONObject, "entity_type", bVar6.o);
                b bVar7 = b.this;
                C3308p0.b(bVar7, jSONObject, "external_organic", Boolean.valueOf(bVar7.f65558s));
                if (!TextUtils.isEmpty(b.this.n)) {
                    b bVar8 = b.this;
                    C3308p0.b(bVar8, jSONObject, "container_type", bVar8.n);
                }
                if (!TextUtils.isEmpty(b.this.f65555p)) {
                    b bVar9 = b.this;
                    C3308p0.b(bVar9, jSONObject, "bundle_source_id", bVar9.f65555p);
                }
                String str = b.this.f65556q;
                if (str != null && str.length() != 0) {
                    b bVar10 = b.this;
                    C3308p0.c(bVar10, jSONObject, "ad_state", bVar10.f65556q);
                }
                b bVar11 = b.this;
                C3308p0.b(bVar11, jSONObject, "user_handle", Long.valueOf(bVar11.f65549h));
                b bVar12 = b.this;
                for (Map.Entry<String, String> entry : bVar12.f65557r.entrySet()) {
                    C3308p0.b(bVar12, jSONObject, entry.getKey(), entry.getValue());
                }
                return jSONObject;
            }
        }

        /* renamed from: io.branch.search.internal.q6$b$c */
        public static final class c implements J8 {
            public c() {
            }

            @Override // io.branch.search.internal.J8
            @NotNull
            public final String a() {
                return b.this.f65546e;
            }
        }

        /* renamed from: io.branch.search.internal.q6$b$d */
        public static final class d implements J8 {
            public d() {
            }

            @Override // io.branch.search.internal.J8
            @NotNull
            public final String a() {
                return b.this.f65546e;
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        public b(int i5, @Nullable List<String> list, @NotNull List<? extends AbstractC3394u2> linkingRules, @Nullable List<String> list2, @NotNull String packageName, @NotNull String targetPackageName, @NotNull UserHandle userHandle, long j11, @NotNull String sessionId, @NotNull String requestId, int i11, @Nullable String str, @NotNull String apiName, @NotNull String containerType, @NotNull String contentType, @Nullable String str2, @Nullable String str3, @NotNull Map<String, String> impressionExtra, boolean z11) {
            Intrinsics.g(linkingRules, "linkingRules");
            Intrinsics.g(packageName, "packageName");
            Intrinsics.g(targetPackageName, "targetPackageName");
            Intrinsics.g(userHandle, "userHandle");
            Intrinsics.g(sessionId, "sessionId");
            Intrinsics.g(requestId, "requestId");
            Intrinsics.g(apiName, "apiName");
            Intrinsics.g(containerType, "containerType");
            Intrinsics.g(contentType, "contentType");
            Intrinsics.g(impressionExtra, "impressionExtra");
            this.f65542a = i5;
            this.f65543b = list;
            this.f65544c = linkingRules;
            this.f65545d = list2;
            this.f65546e = packageName;
            this.f65547f = targetPackageName;
            this.f65548g = userHandle;
            this.f65549h = j11;
            this.f65550i = sessionId;
            this.f65551j = requestId;
            this.f65552k = i11;
            this.f65553l = str;
            this.f65554m = apiName;
            this.n = containerType;
            this.o = contentType;
            this.f65555p = str2;
            this.f65556q = str3;
            this.f65557r = impressionExtra;
            this.f65558s = z11;
            this.f65559t = LazyKt.a(new C0347b());
        }

        @NotNull
        public final C4.j.b a(@Nullable String str, @Nullable JSONObject jSONObject, @NotNull X1 entityType) {
            C4.j.c aVar;
            String str2;
            Intrinsics.g(entityType, "entityType");
            long jCurrentTimeMillis = System.currentTimeMillis();
            List<String> list = this.f65545d;
            if (entityType.equals(X1.a.f63610a) || (str2 = this.f65553l) == null || str2.length() == 0) {
                aVar = new C4.j.c.a(System.currentTimeMillis(), this.f65550i, this.f65551j, this.f65546e, this.f65553l, this.f65558s);
            } else {
                String str3 = this.f65550i;
                String str4 = this.f65551j;
                String str5 = this.f65546e;
                String str6 = this.f65547f;
                aVar = new C4.j.c.b(str3, jCurrentTimeMillis, str4, str5, str6 == null ? str5 : str6, this.f65552k, this.f65553l, this.f65548g, this.f65558s);
            }
            JSONObject jSONObject2 = new JSONObject();
            String str7 = this.f65553l;
            if (str7 != null && str7.length() != 0) {
                C3308p0.a(this, jSONObject2, "entity_id", this.f65553l);
            }
            if (this.f65546e.length() > 0) {
                C3308p0.a(this, jSONObject2, "package_name", this.f65546e);
            }
            C3308p0.a(this, jSONObject2, "analytics_window_id", this.f65550i);
            C3308p0.a(this, jSONObject2, "request_id", this.f65551j);
            C3308p0.a(this, jSONObject2, "timestamp", Long.valueOf(jCurrentTimeMillis));
            C3308p0.a(this, jSONObject2, "result_id", Integer.valueOf(this.f65552k));
            C3308p0.a(this, jSONObject2, "entity_type", this.o);
            C3308p0.a(this, jSONObject2, "external_organic", Boolean.valueOf(this.f65558s));
            if (!TextUtils.isEmpty(this.n)) {
                C3308p0.a(this, jSONObject2, "container_type", this.n);
            }
            if (!TextUtils.isEmpty(this.f65555p)) {
                C3308p0.a(this, jSONObject2, "bundle_source_id", this.f65555p);
            }
            String str8 = this.f65556q;
            if (str8 != null && str8.length() != 0) {
                C3308p0.c(this, jSONObject2, "ad_state", this.f65556q);
            }
            C3308p0.a(this, jSONObject2, "user_handle", Long.valueOf(this.f65549h));
            String string = jSONObject2.toString();
            Intrinsics.f(string, "getClickJson(clickTime).toString()");
            return new C4.j.b(list, aVar, new C4.j.a(string, this.f65554m, str, jSONObject != null ? jSONObject.toString() : null));
        }

        @Override // io.branch.search.internal.Y
        @NotNull
        public final String b() {
            return this.f65554m + '.' + this.f65551j + '.' + this.f65552k;
        }

        @Override // io.branch.search.internal.X
        public final int c() {
            return d().toString().hashCode();
        }

        @Override // io.branch.search.internal.X
        @NotNull
        public final JSONObject d() {
            return (JSONObject) this.f65559t.getValue();
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // io.branch.search.internal.X
        @NotNull
        public final String e() {
            return this.f65554m;
        }

        public final boolean equals(@Nullable Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof b)) {
                return false;
            }
            b bVar = (b) obj;
            return this.f65542a == bVar.f65542a && Intrinsics.b(this.f65543b, bVar.f65543b) && Intrinsics.b(this.f65544c, bVar.f65544c) && Intrinsics.b(this.f65545d, bVar.f65545d) && Intrinsics.b(this.f65546e, bVar.f65546e) && Intrinsics.b(this.f65547f, bVar.f65547f) && Intrinsics.b(this.f65548g, bVar.f65548g) && this.f65549h == bVar.f65549h && Intrinsics.b(this.f65550i, bVar.f65550i) && Intrinsics.b(this.f65551j, bVar.f65551j) && this.f65552k == bVar.f65552k && Intrinsics.b(this.f65553l, bVar.f65553l) && Intrinsics.b(this.f65554m, bVar.f65554m) && Intrinsics.b(this.n, bVar.n) && Intrinsics.b(this.o, bVar.o) && Intrinsics.b(this.f65555p, bVar.f65555p) && Intrinsics.b(this.f65556q, bVar.f65556q) && Intrinsics.b(this.f65557r, bVar.f65557r) && this.f65558s == bVar.f65558s;
        }

        @Override // io.branch.search.internal.InterfaceC3331q6
        @Nullable
        public final b50.a f() {
            return new b50.a(this.f65546e, this.f65548g);
        }

        @Override // io.branch.search.internal.InterfaceC3331q6
        @NotNull
        public final String getContainerType() {
            return this.n;
        }

        @Override // io.branch.search.internal.InterfaceC3331q6
        public final int getId() {
            return this.f65542a;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public final int hashCode() {
            int iHashCode = Integer.hashCode(this.f65542a) * 31;
            List<String> list = this.f65543b;
            int iA = C3265m8.a(this.f65544c, (iHashCode + (list == null ? 0 : list.hashCode())) * 31, 31);
            List<String> list2 = this.f65545d;
            int iA2 = C3214j8.a(this.f65552k, C3248l8.a(this.f65551j, C3248l8.a(this.f65550i, C3231k8.a(this.f65549h, (this.f65548g.hashCode() + C3248l8.a(this.f65547f, C3248l8.a(this.f65546e, (iA + (list2 == null ? 0 : list2.hashCode())) * 31, 31), 31)) * 31, 31), 31), 31), 31);
            String str = this.f65553l;
            int iA3 = C3248l8.a(this.o, C3248l8.a(this.n, C3248l8.a(this.f65554m, (iA2 + (str == null ? 0 : str.hashCode())) * 31, 31), 31), 31);
            String str2 = this.f65555p;
            int iHashCode2 = (iA3 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f65556q;
            int iC = x8.h.c(this.f65557r, (iHashCode2 + (str3 != null ? str3.hashCode() : 0)) * 31, 31);
            boolean z11 = this.f65558s;
            int i5 = z11;
            if (z11 != 0) {
                i5 = 1;
            }
            return iC + i5;
        }

        @Override // io.branch.search.internal.InterfaceC3331q6
        @Nullable
        public final String sourcePackageName() {
            return this.f65546e;
        }

        @NotNull
        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Custom(id=");
            sb2.append(this.f65542a);
            sb2.append(", impressionUrls=");
            sb2.append(this.f65543b);
            sb2.append(", linkingRules=");
            sb2.append(this.f65544c);
            sb2.append(", clickTrackingUrls=");
            sb2.append(this.f65545d);
            sb2.append(", packageName=");
            sb2.append(this.f65546e);
            sb2.append(", targetPackageName=");
            sb2.append(this.f65547f);
            sb2.append(", userHandle=");
            sb2.append(this.f65548g);
            sb2.append(", userId=");
            sb2.append(this.f65549h);
            sb2.append(", sessionId=");
            sb2.append(this.f65550i);
            sb2.append(", requestId=");
            sb2.append(this.f65551j);
            sb2.append(", resultId=");
            sb2.append(this.f65552k);
            sb2.append(", entityId=");
            sb2.append(this.f65553l);
            sb2.append(", apiName=");
            sb2.append(this.f65554m);
            sb2.append(", containerType=");
            sb2.append(this.n);
            sb2.append(", contentType=");
            sb2.append(this.o);
            sb2.append(", bundleSourceId=");
            sb2.append(this.f65555p);
            sb2.append(", adState=");
            sb2.append(this.f65556q);
            sb2.append(", impressionExtra=");
            sb2.append(this.f65557r);
            sb2.append(", externalOrganic=");
            return a2.c.p(sb2, this.f65558s, ')');
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(@NotNull Parcel out, int i5) {
            Intrinsics.g(out, "out");
            out.writeInt(this.f65542a);
            out.writeStringList(this.f65543b);
            Iterator itK = fq.c.k(this.f65544c, out);
            while (itK.hasNext()) {
                out.writeParcelable((Parcelable) itK.next(), i5);
            }
            out.writeStringList(this.f65545d);
            out.writeString(this.f65546e);
            out.writeString(this.f65547f);
            out.writeParcelable(this.f65548g, i5);
            out.writeLong(this.f65549h);
            out.writeString(this.f65550i);
            out.writeString(this.f65551j);
            out.writeInt(this.f65552k);
            out.writeString(this.f65553l);
            out.writeString(this.f65554m);
            out.writeString(this.n);
            out.writeString(this.o);
            out.writeString(this.f65555p);
            out.writeString(this.f65556q);
            Map<String, String> map = this.f65557r;
            out.writeInt(map.size());
            for (Map.Entry<String, String> entry : map.entrySet()) {
                out.writeString(entry.getKey());
                out.writeString(entry.getValue());
            }
            out.writeInt(this.f65558s ? 1 : 0);
        }

        @Override // io.branch.search.internal.InterfaceC3331q6
        public final void a(@NotNull Context context, @NotNull b50.f handler, @NotNull X1 x12) {
            AbstractC3394u2.f fVar;
            b bVar = this;
            X1 entityType = x12;
            Intrinsics.g(context, "context");
            Intrinsics.g(handler, "handler");
            Intrinsics.g(entityType, "entityType");
            y40.p.Companion.getClass();
            InterfaceC3445x2 interfaceC3445x2 = (InterfaceC3445x2) y40.o.a();
            if (handler.getOnlyDoReporting()) {
                interfaceC3445x2.a(bVar.a("report_only_click", (JSONObject) null, entityType));
                return;
            }
            c cVar = bVar.new c();
            for (AbstractC3394u2 abstractC3394u2 : bVar.f65544c) {
                F4 f42 = new F4(context);
                abstractC3394u2.getClass();
                C3431w5.Companion.getClass();
                C3431w5 c3431w5 = new C3431w5(f42);
                if (!abstractC3394u2.a(c3431w5, cVar).f66300a) {
                    a(interfaceC3445x2, bVar, abstractC3394u2, entityType, false, abstractC3394u2.f65959a);
                    fVar = new AbstractC3394u2.f(false);
                    bVar = this;
                    entityType = x12;
                } else {
                    bVar = this;
                    entityType = x12;
                    a(interfaceC3445x2, bVar, abstractC3394u2, entityType, true, abstractC3394u2.f65959a);
                    try {
                        fVar = abstractC3394u2.a(c3431w5, cVar, handler);
                    } catch (ActivityNotFoundException e3) {
                        String str = "could not open " + b.this.f65546e;
                        C3296o5.a aVar = C3296o5.f65426a;
                        C3296o5.a(new F6("BranchLinkHandler.validateAndOpen", str, null, e3, null));
                        fVar = new AbstractC3394u2.f(false);
                    }
                }
                if (fVar.f65970a) {
                    return;
                }
            }
            String str2 = bVar.f65550i;
            String str3 = bVar.f65553l;
            if (str3 == null) {
                str3 = bVar.f65546e + AbstractJsonLexerKt.COLON + bVar.f65548g;
            }
            C3296o5.a aVar2 = C3296o5.f65426a;
            C3296o5.a(new F6(str2, "LINK_FAILED_TO_OPEN", str3, null));
            interfaceC3445x2.a(bVar.a("failed_click", (JSONObject) null, entityType));
        }

        public static final void a(InterfaceC3445x2 client, b this$0, AbstractC3394u2 rule, X1 entityType, boolean z11, JSONObject jSONObject) {
            String str;
            Intrinsics.g(client, "$client");
            Intrinsics.g(this$0, "this$0");
            Intrinsics.g(rule, "$rule");
            Intrinsics.g(entityType, "$entityType");
            if (z11) {
                if (rule instanceof AbstractC3394u2.g) {
                    str = "shortcut";
                } else if (rule instanceof AbstractC3394u2.k) {
                    str = "view_intent";
                } else if (rule instanceof AbstractC3394u2.c) {
                    str = "custom_intent";
                } else if (rule instanceof AbstractC3394u2.e) {
                    str = "launch_intent";
                } else if (rule instanceof AbstractC3394u2.a) {
                    str = "app_open";
                } else if (rule instanceof AbstractC3394u2.j) {
                    str = "uri_intent";
                } else {
                    str = "unknown";
                }
                client.a(this$0.a(str, jSONObject, entityType));
                return;
            }
            String str2 = this$0.f65550i;
            String string = jSONObject.toString();
            C3296o5.a aVar = C3296o5.f65426a;
            C3296o5.a(new F6(str2, "LINK_VALIDATION", string, null));
        }

        @Override // io.branch.search.internal.InterfaceC3331q6
        public final void a(@NotNull View view) {
            Intrinsics.g(view, "view");
            y40.p.Companion.getClass();
            ((InterfaceC3445x2) y40.o.a()).a(view, this);
        }

        @Override // io.branch.search.internal.InterfaceC3331q6
        public final boolean a(@NotNull Context context, @NotNull X1 entityType) {
            Intrinsics.g(context, "context");
            Intrinsics.g(entityType, "entityType");
            List<AbstractC3394u2> list = this.f65544c;
            if (!(list instanceof Collection) || !list.isEmpty()) {
                Iterator<T> it = list.iterator();
                while (it.hasNext()) {
                    if (((AbstractC3394u2) it.next()).b()) {
                        return true;
                    }
                }
            }
            d dVar = new d();
            List<AbstractC3394u2> list2 = this.f65544c;
            if ((list2 instanceof Collection) && list2.isEmpty()) {
                return false;
            }
            for (AbstractC3394u2 abstractC3394u2 : list2) {
                F4 f42 = new F4(context);
                abstractC3394u2.getClass();
                C3431w5.Companion.getClass();
                if (abstractC3394u2.a(new C3431w5(f42), dVar).f66300a) {
                    return true;
                }
            }
            return false;
        }

        @Override // io.branch.search.internal.InterfaceC3331q6, io.branch.search.internal.X
        @Nullable
        public final List<String> a() {
            return this.f65543b;
        }
    }
}
