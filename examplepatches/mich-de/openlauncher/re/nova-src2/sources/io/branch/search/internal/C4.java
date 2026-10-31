package io.branch.search.internal;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.UserHandle;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.search.AnalyticsEvent;
import io.branch.search.ui.ClickInfo;
import io.branch.search.ui.ImpressionInfo;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Reflection;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONObject;

/* loaded from: classes.dex */
public abstract class C4 implements InterfaceC3481z4 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f62203a;

    public static final class a extends C4 {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final a f62204b = new a();

        public a() {
            super("ACTIVATE_SDK", 0);
        }
    }

    public static final class b extends C4 {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final b f62205b = new b();

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public static final E4<a> f62206c = new E4<>(Reflection.f71864a.getOrCreateKotlinClass(a.class));

        public static final class a implements Parcelable {

            @NotNull
            public static final Parcelable.Creator<a> CREATOR = new C0314a();

            /* renamed from: a, reason: collision with root package name */
            @NotNull
            public final String f62207a;

            /* renamed from: io.branch.search.internal.C4$b$a$a, reason: collision with other inner class name */
            /* loaded from: classes4.dex */
            public static final class C0314a implements Parcelable.Creator<a> {
                @Override // android.os.Parcelable.Creator
                public final a createFromParcel(Parcel parcel) {
                    Intrinsics.g(parcel, "parcel");
                    return new a(parcel.readString());
                }

                @Override // android.os.Parcelable.Creator
                public final a[] newArray(int i5) {
                    return new a[i5];
                }
            }

            public a(@NotNull String requestId) {
                Intrinsics.g(requestId, "requestId");
                this.f62207a = requestId;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof a) && Intrinsics.b(this.f62207a, ((a) obj).f62207a);
            }

            public final int hashCode() {
                return this.f62207a.hashCode();
            }

            @NotNull
            public final String toString() {
                return Z.a(new StringBuilder("AnalyticsRemoval(requestId="), this.f62207a, ')');
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(@NotNull Parcel out, int i5) {
                Intrinsics.g(out, "out");
                out.writeString(this.f62207a);
            }
        }

        public b() {
            super("ANALYTICS_REMOVAL", 0);
        }
    }

    public static final class c extends C4 {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final c f62208b = new c();

        public c() {
            super("DEACTIVATE_SDK", 0);
        }
    }

    public static final class d extends C4 {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final d f62209b = new d();

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public static final E4<a> f62210c = new E4<>(Reflection.f71864a.getOrCreateKotlinClass(a.class));

        public static final class a implements Parcelable {

            @NotNull
            public static final Parcelable.Creator<a> CREATOR = new C0315a();

            /* renamed from: a, reason: collision with root package name */
            @Nullable
            public final List<String> f62211a;

            /* renamed from: b, reason: collision with root package name */
            public final boolean f62212b;

            /* renamed from: io.branch.search.internal.C4$d$a$a, reason: collision with other inner class name */
            /* loaded from: classes4.dex */
            public static final class C0315a implements Parcelable.Creator<a> {
                @Override // android.os.Parcelable.Creator
                public final a createFromParcel(Parcel parcel) {
                    Intrinsics.g(parcel, "parcel");
                    return new a(parcel.createStringArrayList());
                }

                @Override // android.os.Parcelable.Creator
                public final a[] newArray(int i5) {
                    return new a[i5];
                }
            }

            public a(@Nullable List<String> list) {
                this.f62211a = list;
                this.f62212b = list == null || list.isEmpty();
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof a) && Intrinsics.b(this.f62211a, ((a) obj).f62211a);
            }

            public final int hashCode() {
                List<String> list = this.f62211a;
                if (list == null) {
                    return 0;
                }
                return list.hashCode();
            }

            @NotNull
            public final String toString() {
                return Ob.a(new StringBuilder("ImpressionInfo(impressionTrackingUrl="), this.f62211a, ')');
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(@NotNull Parcel out, int i5) {
                Intrinsics.g(out, "out");
                out.writeStringList(this.f62211a);
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.multiprocess.ContentProviderUpdate$Impression", f = "BncContentProviderPaths.kt", l = {Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE}, m = "handle")
        /* loaded from: classes4.dex */
        public static final class b extends ContinuationImpl {

            /* renamed from: a, reason: collision with root package name */
            public String f62213a;

            /* renamed from: b, reason: collision with root package name */
            public Me f62214b;

            /* renamed from: c, reason: collision with root package name */
            public Iterable f62215c;

            /* renamed from: d, reason: collision with root package name */
            public Iterator f62216d;

            /* renamed from: e, reason: collision with root package name */
            public /* synthetic */ Object f62217e;

            /* renamed from: g, reason: collision with root package name */
            public int f62219g;

            public b(Continuation<? super b> continuation) {
                super(continuation);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                this.f62217e = obj;
                this.f62219g |= Integer.MIN_VALUE;
                return d.this.a(null, null, null, this);
            }
        }

        public d() {
            super("IMPRESSION", 0);
        }

        /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object a(@NotNull String str, @NotNull a aVar, @NotNull Me me2, @NotNull Continuation<? super Unit> continuation) {
            b bVar;
            String str2;
            Iterator it;
            Iterable iterable;
            if (continuation instanceof b) {
                bVar = (b) continuation;
                int i5 = bVar.f62219g;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    bVar.f62219g = i5 - Integer.MIN_VALUE;
                } else {
                    bVar = new b(continuation);
                }
            }
            Object obj = bVar.f62217e;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i11 = bVar.f62219g;
            if (i11 == 0) {
                ResultKt.b(obj);
                List<String> list = aVar.f62211a;
                if (list != null) {
                    ArrayList arrayList = new ArrayList();
                    for (Object obj2 : list) {
                        if (!r70.k.U0((String) obj2)) {
                            arrayList.add(obj2);
                        }
                    }
                    str2 = str;
                    it = arrayList.iterator();
                    iterable = arrayList;
                }
                return Unit.f71706a;
            }
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            it = bVar.f62216d;
            iterable = bVar.f62215c;
            me2 = bVar.f62214b;
            str2 = bVar.f62213a;
            ResultKt.b(obj);
            while (it.hasNext()) {
                String str3 = (String) it.next();
                bVar.f62213a = str2;
                bVar.f62214b = me2;
                bVar.f62215c = iterable;
                bVar.f62216d = it;
                bVar.f62219g = 1;
                if (me2.f62945a.a(str2, str3, bVar) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            return Unit.f71706a;
        }
    }

    public static final class e extends C4 {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final e f62220b = new e();

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public static final E4<a> f62221c = new E4<>(Reflection.f71864a.getOrCreateKotlinClass(a.class));

        public static final class a implements Parcelable {

            @NotNull
            public static final Parcelable.Creator<a> CREATOR = new C0316a();

            /* renamed from: a, reason: collision with root package name */
            @NotNull
            public final String f62222a;

            /* renamed from: b, reason: collision with root package name */
            @Nullable
            public final long[] f62223b;

            /* renamed from: io.branch.search.internal.C4$e$a$a, reason: collision with other inner class name */
            /* loaded from: classes4.dex */
            public static final class C0316a implements Parcelable.Creator<a> {
                @Override // android.os.Parcelable.Creator
                public final a createFromParcel(Parcel parcel) {
                    Intrinsics.g(parcel, "parcel");
                    return new a(parcel.readString(), parcel.createLongArray());
                }

                @Override // android.os.Parcelable.Creator
                public final a[] newArray(int i5) {
                    return new a[i5];
                }
            }

            public a(@NotNull String packageName, @Nullable long[] jArr) {
                Intrinsics.g(packageName, "packageName");
                this.f62222a = packageName;
                this.f62223b = jArr;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(@NotNull Parcel out, int i5) {
                Intrinsics.g(out, "out");
                out.writeString(this.f62222a);
                out.writeLongArray(this.f62223b);
            }
        }

        public e() {
            super("MARK_IGNORE_PACKAGE", 0);
        }
    }

    /* loaded from: classes4.dex */
    public static final class f extends C4 {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final f f62224b = new f();

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public static final E4<ClickInfo> f62225c = new E4<>(Reflection.f71864a.getOrCreateKotlinClass(ClickInfo.class));

        public f() {
            super("ON_CLICKED", 0);
        }
    }

    public static final class g extends C4 {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final g f62226b = new g();

        public g() {
            super("ON_RESUME", 0);
        }
    }

    public static final class h extends C4 {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final h f62227b = new h();

        public h() {
            super("ON_START", 0);
        }
    }

    public static final class i extends C4 {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final i f62228b = new i();

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public static final E4<d> f62229c = new E4<>(Reflection.f71864a.getOrCreateKotlinClass(d.class));

        /* loaded from: classes4.dex */
        public static final class a implements Parcelable {

            @NotNull
            public static final Parcelable.Creator<a> CREATOR = new C0317a();

            /* renamed from: a, reason: collision with root package name */
            @NotNull
            public final String f62230a;

            /* renamed from: b, reason: collision with root package name */
            @NotNull
            public final List<c> f62231b;

            /* renamed from: io.branch.search.internal.C4$i$a$a, reason: collision with other inner class name */
            public static final class C0317a implements Parcelable.Creator<a> {
                @Override // android.os.Parcelable.Creator
                public final a createFromParcel(Parcel parcel) {
                    Intrinsics.g(parcel, "parcel");
                    String string = parcel.readString();
                    int i5 = parcel.readInt();
                    ArrayList arrayList = new ArrayList(i5);
                    int iB = 0;
                    while (iB != i5) {
                        iB = fq.c.b(c.CREATOR, parcel, arrayList, iB, 1);
                    }
                    return new a(string, arrayList);
                }

                @Override // android.os.Parcelable.Creator
                public final a[] newArray(int i5) {
                    return new a[i5];
                }
            }

            public a(@NotNull String api, @NotNull ArrayList resultImpressions) {
                Intrinsics.g(api, "api");
                Intrinsics.g(resultImpressions, "resultImpressions");
                this.f62230a = api;
                this.f62231b = resultImpressions;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof a)) {
                    return false;
                }
                a aVar = (a) obj;
                return Intrinsics.b(this.f62230a, aVar.f62230a) && Intrinsics.b(this.f62231b, aVar.f62231b);
            }

            public final int hashCode() {
                return this.f62231b.hashCode() + (this.f62230a.hashCode() * 31);
            }

            @NotNull
            public final String toString() {
                StringBuilder sb2 = new StringBuilder("ApiImpressions(api=");
                sb2.append(this.f62230a);
                sb2.append(", resultImpressions=");
                return Ob.a(sb2, this.f62231b, ')');
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(@NotNull Parcel out, int i5) {
                Intrinsics.g(out, "out");
                out.writeString(this.f62230a);
                Iterator itK = fq.c.k(this.f62231b, out);
                while (itK.hasNext()) {
                    ((c) itK.next()).writeToParcel(out, i5);
                }
            }
        }

        /* loaded from: classes4.dex */
        public static final class b implements Parcelable {

            @NotNull
            public static final Parcelable.Creator<b> CREATOR = new a();

            /* renamed from: a, reason: collision with root package name */
            public final float f62232a;

            /* renamed from: b, reason: collision with root package name */
            public final long f62233b;

            /* renamed from: c, reason: collision with root package name */
            public final long f62234c;

            public static final class a implements Parcelable.Creator<b> {
                @Override // android.os.Parcelable.Creator
                public final b createFromParcel(Parcel parcel) {
                    Intrinsics.g(parcel, "parcel");
                    return new b(parcel.readFloat(), parcel.readLong(), parcel.readLong());
                }

                @Override // android.os.Parcelable.Creator
                public final b[] newArray(int i5) {
                    return new b[i5];
                }
            }

            public b(float f11, long j11, long j12) {
                this.f62232a = f11;
                this.f62233b = j11;
                this.f62234c = j12;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof b)) {
                    return false;
                }
                b bVar = (b) obj;
                return Float.valueOf(this.f62232a).equals(Float.valueOf(bVar.f62232a)) && this.f62233b == bVar.f62233b && this.f62234c == bVar.f62234c;
            }

            public final int hashCode() {
                return Long.hashCode(this.f62234c) + C3231k8.a(this.f62233b, Float.hashCode(this.f62232a) * 31, 31);
            }

            @NotNull
            public final String toString() {
                StringBuilder sb2 = new StringBuilder("Encounter(maxVisibleArea=");
                sb2.append(this.f62232a);
                sb2.append(", startTimestamp=");
                sb2.append(this.f62233b);
                sb2.append(", duration=");
                return C3380t5.a(sb2, this.f62234c, ')');
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(@NotNull Parcel out, int i5) {
                Intrinsics.g(out, "out");
                out.writeFloat(this.f62232a);
                out.writeLong(this.f62233b);
                out.writeLong(this.f62234c);
            }
        }

        /* loaded from: classes4.dex */
        public static final class c implements Parcelable {

            @NotNull
            public static final Parcelable.Creator<c> CREATOR = new a();

            /* renamed from: a, reason: collision with root package name */
            @NotNull
            public final String f62235a;

            /* renamed from: b, reason: collision with root package name */
            @Nullable
            public final String f62236b;

            /* renamed from: c, reason: collision with root package name */
            public final int f62237c;

            /* renamed from: d, reason: collision with root package name */
            @NotNull
            public final String f62238d;

            /* renamed from: e, reason: collision with root package name */
            @Nullable
            public final String f62239e;

            /* renamed from: f, reason: collision with root package name */
            @Nullable
            public final String f62240f;

            /* renamed from: g, reason: collision with root package name */
            @Nullable
            public final String f62241g;

            /* renamed from: h, reason: collision with root package name */
            @Nullable
            public final String f62242h;

            /* renamed from: i, reason: collision with root package name */
            @Nullable
            public final String f62243i;

            /* renamed from: j, reason: collision with root package name */
            @NotNull
            public final List<b> f62244j;

            /* renamed from: k, reason: collision with root package name */
            @Nullable
            public final Long f62245k;

            /* renamed from: l, reason: collision with root package name */
            @NotNull
            public final Map<String, String> f62246l;

            /* renamed from: m, reason: collision with root package name */
            public final boolean f62247m;

            public static final class a implements Parcelable.Creator<c> {
                @Override // android.os.Parcelable.Creator
                public final c createFromParcel(Parcel parcel) {
                    Parcel parcel2 = parcel;
                    Intrinsics.g(parcel2, "parcel");
                    String string = parcel2.readString();
                    String string2 = parcel2.readString();
                    int i5 = parcel2.readInt();
                    String string3 = parcel2.readString();
                    String string4 = parcel2.readString();
                    String string5 = parcel2.readString();
                    String string6 = parcel2.readString();
                    String string7 = parcel2.readString();
                    String string8 = parcel2.readString();
                    int i11 = parcel2.readInt();
                    ArrayList arrayList = new ArrayList(i11);
                    for (int iB = 0; iB != i11; iB = fq.c.b(b.CREATOR, parcel2, arrayList, iB, 1)) {
                    }
                    Long lValueOf = parcel2.readInt() == 0 ? null : Long.valueOf(parcel2.readLong());
                    int i12 = parcel2.readInt();
                    LinkedHashMap linkedHashMap = new LinkedHashMap(i12);
                    int i13 = 0;
                    while (i13 != i12) {
                        linkedHashMap.put(parcel2.readString(), parcel.readString());
                        i13++;
                        parcel2 = parcel;
                    }
                    return new c(string, string2, i5, string3, string4, string5, string6, string7, string8, arrayList, lValueOf, linkedHashMap, parcel.readInt() != 0);
                }

                @Override // android.os.Parcelable.Creator
                public final c[] newArray(int i5) {
                    return new c[i5];
                }
            }

            public c(@NotNull String requestId, @Nullable String str, int i5, @NotNull String analyticsWindowId, @Nullable String str2, @Nullable String str3, @Nullable String str4, @Nullable String str5, @Nullable String str6, @NotNull ArrayList encounters, @Nullable Long l9, @NotNull Map extras, boolean z11) {
                Intrinsics.g(requestId, "requestId");
                Intrinsics.g(analyticsWindowId, "analyticsWindowId");
                Intrinsics.g(encounters, "encounters");
                Intrinsics.g(extras, "extras");
                this.f62235a = requestId;
                this.f62236b = str;
                this.f62237c = i5;
                this.f62238d = analyticsWindowId;
                this.f62239e = str2;
                this.f62240f = str3;
                this.f62241g = str4;
                this.f62242h = str5;
                this.f62243i = str6;
                this.f62244j = encounters;
                this.f62245k = l9;
                this.f62246l = extras;
                this.f62247m = z11;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof c)) {
                    return false;
                }
                c cVar = (c) obj;
                return Intrinsics.b(this.f62235a, cVar.f62235a) && Intrinsics.b(this.f62236b, cVar.f62236b) && this.f62237c == cVar.f62237c && Intrinsics.b(this.f62238d, cVar.f62238d) && Intrinsics.b(this.f62239e, cVar.f62239e) && Intrinsics.b(this.f62240f, cVar.f62240f) && Intrinsics.b(this.f62241g, cVar.f62241g) && Intrinsics.b(this.f62242h, cVar.f62242h) && Intrinsics.b(this.f62243i, cVar.f62243i) && Intrinsics.b(this.f62244j, cVar.f62244j) && Intrinsics.b(this.f62245k, cVar.f62245k) && Intrinsics.b(this.f62246l, cVar.f62246l) && this.f62247m == cVar.f62247m;
            }

            /* JADX WARN: Multi-variable type inference failed */
            public final int hashCode() {
                int iHashCode = this.f62235a.hashCode() * 31;
                String str = this.f62236b;
                int iA = C3248l8.a(this.f62238d, C3214j8.a(this.f62237c, (iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31), 31);
                String str2 = this.f62239e;
                int iHashCode2 = (iA + (str2 == null ? 0 : str2.hashCode())) * 31;
                String str3 = this.f62240f;
                int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
                String str4 = this.f62241g;
                int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
                String str5 = this.f62242h;
                int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
                String str6 = this.f62243i;
                int iA2 = C3265m8.a(this.f62244j, (iHashCode5 + (str6 == null ? 0 : str6.hashCode())) * 31, 31);
                Long l9 = this.f62245k;
                int iC = x8.h.c(this.f62246l, (iA2 + (l9 != null ? l9.hashCode() : 0)) * 31, 31);
                boolean z11 = this.f62247m;
                int i5 = z11;
                if (z11 != 0) {
                    i5 = 1;
                }
                return iC + i5;
            }

            @NotNull
            public final String toString() {
                StringBuilder sb2 = new StringBuilder("ResultImpression(requestId=");
                sb2.append(this.f62235a);
                sb2.append(", entityId=");
                sb2.append(this.f62236b);
                sb2.append(", resultId=");
                sb2.append(this.f62237c);
                sb2.append(", analyticsWindowId=");
                sb2.append(this.f62238d);
                sb2.append(", packageName=");
                sb2.append(this.f62239e);
                sb2.append(", contentType=");
                sb2.append(this.f62240f);
                sb2.append(", containerType=");
                sb2.append(this.f62241g);
                sb2.append(", bundleSourceId=");
                sb2.append(this.f62242h);
                sb2.append(", autosuggestion=");
                sb2.append(this.f62243i);
                sb2.append(", encounters=");
                sb2.append(this.f62244j);
                sb2.append(", userId=");
                sb2.append(this.f62245k);
                sb2.append(", extras=");
                sb2.append(this.f62246l);
                sb2.append(", externalOrganic=");
                return a2.c.p(sb2, this.f62247m, ')');
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(@NotNull Parcel out, int i5) {
                Intrinsics.g(out, "out");
                out.writeString(this.f62235a);
                out.writeString(this.f62236b);
                out.writeInt(this.f62237c);
                out.writeString(this.f62238d);
                out.writeString(this.f62239e);
                out.writeString(this.f62240f);
                out.writeString(this.f62241g);
                out.writeString(this.f62242h);
                out.writeString(this.f62243i);
                Iterator itK = fq.c.k(this.f62244j, out);
                while (itK.hasNext()) {
                    b bVar = (b) itK.next();
                    bVar.getClass();
                    out.writeFloat(bVar.f62232a);
                    out.writeLong(bVar.f62233b);
                    out.writeLong(bVar.f62234c);
                }
                Long l9 = this.f62245k;
                if (l9 == null) {
                    out.writeInt(0);
                } else {
                    out.writeInt(1);
                    out.writeLong(l9.longValue());
                }
                Map<String, String> map = this.f62246l;
                out.writeInt(map.size());
                for (Map.Entry<String, String> entry : map.entrySet()) {
                    out.writeString(entry.getKey());
                    out.writeString(entry.getValue());
                }
                out.writeInt(this.f62247m ? 1 : 0);
            }
        }

        public static final class d implements Parcelable {

            @NotNull
            public static final Parcelable.Creator<d> CREATOR = new a();

            /* renamed from: a, reason: collision with root package name */
            @NotNull
            public final List<a> f62248a;

            /* renamed from: b, reason: collision with root package name */
            @NotNull
            public final List<ImpressionInfo> f62249b;

            /* renamed from: c, reason: collision with root package name */
            @NotNull
            public final List<F6> f62250c;

            /* loaded from: classes4.dex */
            public static final class a implements Parcelable.Creator<d> {
                @Override // android.os.Parcelable.Creator
                public final d createFromParcel(Parcel parcel) {
                    Intrinsics.g(parcel, "parcel");
                    int i5 = parcel.readInt();
                    ArrayList arrayList = new ArrayList(i5);
                    int iB = 0;
                    int iB2 = 0;
                    while (iB2 != i5) {
                        iB2 = fq.c.b(a.CREATOR, parcel, arrayList, iB2, 1);
                    }
                    int i11 = parcel.readInt();
                    ArrayList arrayList2 = new ArrayList(i11);
                    int iB3 = 0;
                    while (iB3 != i11) {
                        iB3 = fq.c.b(ImpressionInfo.CREATOR, parcel, arrayList2, iB3, 1);
                    }
                    int i12 = parcel.readInt();
                    ArrayList arrayList3 = new ArrayList(i12);
                    while (iB != i12) {
                        iB = fq.c.b(F6.CREATOR, parcel, arrayList3, iB, 1);
                    }
                    return new d(arrayList, arrayList2, arrayList3);
                }

                @Override // android.os.Parcelable.Creator
                public final d[] newArray(int i5) {
                    return new d[i5];
                }
            }

            public d(@NotNull List<a> apiImpressions, @NotNull List<ImpressionInfo> externalImpressions, @NotNull List<F6> failures) {
                Intrinsics.g(apiImpressions, "apiImpressions");
                Intrinsics.g(externalImpressions, "externalImpressions");
                Intrinsics.g(failures, "failures");
                this.f62248a = apiImpressions;
                this.f62249b = externalImpressions;
                this.f62250c = failures;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof d)) {
                    return false;
                }
                d dVar = (d) obj;
                return Intrinsics.b(this.f62248a, dVar.f62248a) && Intrinsics.b(this.f62249b, dVar.f62249b) && Intrinsics.b(this.f62250c, dVar.f62250c);
            }

            public final int hashCode() {
                return this.f62250c.hashCode() + C3265m8.a(this.f62249b, this.f62248a.hashCode() * 31, 31);
            }

            @NotNull
            public final String toString() {
                StringBuilder sb2 = new StringBuilder("SessionImpressions(apiImpressions=");
                sb2.append(this.f62248a);
                sb2.append(", externalImpressions=");
                sb2.append(this.f62249b);
                sb2.append(", failures=");
                return Ob.a(sb2, this.f62250c, ')');
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(@NotNull Parcel out, int i5) {
                Intrinsics.g(out, "out");
                Iterator itK = fq.c.k(this.f62248a, out);
                while (itK.hasNext()) {
                    ((a) itK.next()).writeToParcel(out, i5);
                }
                Iterator itK2 = fq.c.k(this.f62249b, out);
                while (itK2.hasNext()) {
                    ((ImpressionInfo) itK2.next()).writeToParcel(out, i5);
                }
                Iterator itK3 = fq.c.k(this.f62250c, out);
                while (itK3.hasNext()) {
                    ((F6) itK3.next()).writeToParcel(out, i5);
                }
            }
        }

        public i() {
            super("ON_STOP", 0);
        }
    }

    public static final class j extends C4 {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final j f62251b = new j();

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public static final E4<b> f62252c = new E4<>(Reflection.f71864a.getOrCreateKotlinClass(b.class));

        /* loaded from: classes4.dex */
        public static final class a implements Parcelable {

            @NotNull
            public static final Parcelable.Creator<a> CREATOR = new C0318a();

            /* renamed from: a, reason: collision with root package name */
            @NotNull
            public final String f62253a;

            /* renamed from: b, reason: collision with root package name */
            @NotNull
            public final String f62254b;

            /* renamed from: c, reason: collision with root package name */
            @NotNull
            public final String f62255c;

            /* renamed from: d, reason: collision with root package name */
            @Nullable
            public final String f62256d;

            /* renamed from: e, reason: collision with root package name */
            @NotNull
            public final Lazy f62257e;

            /* renamed from: f, reason: collision with root package name */
            @NotNull
            public final Lazy f62258f;

            /* renamed from: io.branch.search.internal.C4$j$a$a, reason: collision with other inner class name */
            public static final class C0318a implements Parcelable.Creator<a> {
                @Override // android.os.Parcelable.Creator
                public final a createFromParcel(Parcel parcel) {
                    Intrinsics.g(parcel, "parcel");
                    return new a(parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString());
                }

                @Override // android.os.Parcelable.Creator
                public final a[] newArray(int i5) {
                    return new a[i5];
                }
            }

            public static final class b extends Lambda implements Function0<JSONObject> {
                public b() {
                    super(0);
                }

                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    String str = a.this.f62256d;
                    if (str != null) {
                        return new JSONObject(str);
                    }
                    return null;
                }
            }

            public static final class c extends Lambda implements Function0<JSONObject> {
                public c() {
                    super(0);
                }

                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    return new JSONObject(a.this.f62253a);
                }
            }

            public a(@NotNull String _clickJson, @NotNull String apiName, @NotNull String handler, @Nullable String str) {
                Intrinsics.g(_clickJson, "_clickJson");
                Intrinsics.g(apiName, "apiName");
                Intrinsics.g(handler, "handler");
                this.f62253a = _clickJson;
                this.f62254b = apiName;
                this.f62255c = handler;
                this.f62256d = str;
                this.f62257e = LazyKt.a(new b());
                this.f62258f = LazyKt.a(new c());
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(@NotNull Parcel out, int i5) {
                Intrinsics.g(out, "out");
                out.writeString(this.f62253a);
                out.writeString(this.f62254b);
                out.writeString(this.f62255c);
                out.writeString(this.f62256d);
            }
        }

        public static final class b implements Parcelable {

            @NotNull
            public static final Parcelable.Creator<b> CREATOR = new a();

            /* renamed from: a, reason: collision with root package name */
            @Nullable
            public final List<String> f62261a;

            /* renamed from: b, reason: collision with root package name */
            @Nullable
            public final c f62262b;

            /* renamed from: c, reason: collision with root package name */
            @Nullable
            public final a f62263c;

            /* renamed from: d, reason: collision with root package name */
            public final boolean f62264d;

            /* loaded from: classes4.dex */
            public static final class a implements Parcelable.Creator<b> {
                @Override // android.os.Parcelable.Creator
                public final b createFromParcel(Parcel parcel) {
                    Intrinsics.g(parcel, "parcel");
                    return new b(parcel.createStringArrayList(), (c) parcel.readParcelable(b.class.getClassLoader()), parcel.readInt() == 0 ? null : a.CREATOR.createFromParcel(parcel));
                }

                @Override // android.os.Parcelable.Creator
                public final b[] newArray(int i5) {
                    return new b[i5];
                }
            }

            public b(@Nullable List<String> list, @Nullable c cVar, @Nullable a aVar) {
                this.f62261a = list;
                this.f62262b = cVar;
                this.f62263c = aVar;
                this.f62264d = (list == null || list.isEmpty()) && cVar == null && aVar == null;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(@Nullable Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof b)) {
                    return false;
                }
                b bVar = (b) obj;
                return Intrinsics.b(this.f62261a, bVar.f62261a) && Intrinsics.b(this.f62262b, bVar.f62262b) && Intrinsics.b(this.f62263c, bVar.f62263c);
            }

            public final int hashCode() {
                List<String> list = this.f62261a;
                int iHashCode = (list == null ? 0 : list.hashCode()) * 31;
                c cVar = this.f62262b;
                int iHashCode2 = (iHashCode + (cVar == null ? 0 : cVar.hashCode())) * 31;
                a aVar = this.f62263c;
                return iHashCode2 + (aVar != null ? aVar.hashCode() : 0);
            }

            @NotNull
            public final String toString() {
                return "ClickInfo(clickTrackingUrls=" + this.f62261a + ", typeToWriteToDB=" + this.f62262b + ", analyticsClick=" + this.f62263c + ')';
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(@NotNull Parcel out, int i5) {
                Intrinsics.g(out, "out");
                out.writeStringList(this.f62261a);
                out.writeParcelable(this.f62262b, i5);
                a aVar = this.f62263c;
                if (aVar == null) {
                    out.writeInt(0);
                } else {
                    out.writeInt(1);
                    aVar.writeToParcel(out, i5);
                }
            }
        }

        /* loaded from: classes4.dex */
        public static abstract class c implements Parcelable {

            public static final class a extends c {

                @NotNull
                public static final Parcelable.Creator<a> CREATOR = new C0319a();

                /* renamed from: a, reason: collision with root package name */
                @NotNull
                public final String f62265a;

                /* renamed from: b, reason: collision with root package name */
                public final long f62266b;

                /* renamed from: c, reason: collision with root package name */
                @NotNull
                public final String f62267c;

                /* renamed from: d, reason: collision with root package name */
                @NotNull
                public final String f62268d;

                /* renamed from: e, reason: collision with root package name */
                @Nullable
                public final String f62269e;

                /* renamed from: f, reason: collision with root package name */
                public final boolean f62270f;

                /* renamed from: io.branch.search.internal.C4$j$c$a$a, reason: collision with other inner class name */
                public static final class C0319a implements Parcelable.Creator<a> {
                    @Override // android.os.Parcelable.Creator
                    public final a createFromParcel(Parcel parcel) {
                        Intrinsics.g(parcel, "parcel");
                        return new a(parcel.readLong(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() != 0);
                    }

                    @Override // android.os.Parcelable.Creator
                    public final a[] newArray(int i5) {
                        return new a[i5];
                    }
                }

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                public a(long j11, @NotNull String sessionId, @NotNull String requestId, @NotNull String packageName, @Nullable String str, boolean z11) {
                    super(0);
                    Intrinsics.g(sessionId, "sessionId");
                    Intrinsics.g(requestId, "requestId");
                    Intrinsics.g(packageName, "packageName");
                    this.f62265a = sessionId;
                    this.f62266b = j11;
                    this.f62267c = requestId;
                    this.f62268d = packageName;
                    this.f62269e = str;
                    this.f62270f = z11;
                }

                @Override // android.os.Parcelable
                public final int describeContents() {
                    return 0;
                }

                public final boolean equals(@Nullable Object obj) {
                    if (this == obj) {
                        return true;
                    }
                    if (!(obj instanceof a)) {
                        return false;
                    }
                    a aVar = (a) obj;
                    return Intrinsics.b(this.f62265a, aVar.f62265a) && this.f62266b == aVar.f62266b && Intrinsics.b(this.f62267c, aVar.f62267c) && Intrinsics.b(this.f62268d, aVar.f62268d) && Intrinsics.b(this.f62269e, aVar.f62269e) && this.f62270f == aVar.f62270f;
                }

                /* JADX WARN: Multi-variable type inference failed */
                public final int hashCode() {
                    int iA = C3248l8.a(this.f62268d, C3248l8.a(this.f62267c, C3231k8.a(this.f62266b, this.f62265a.hashCode() * 31, 31), 31), 31);
                    String str = this.f62269e;
                    int iHashCode = (iA + (str == null ? 0 : str.hashCode())) * 31;
                    boolean z11 = this.f62270f;
                    int i5 = z11;
                    if (z11 != 0) {
                        i5 = 1;
                    }
                    return iHashCode + i5;
                }

                @NotNull
                public final String toString() {
                    StringBuilder sb2 = new StringBuilder("App(sessionId=");
                    sb2.append(this.f62265a);
                    sb2.append(", timestamp=");
                    sb2.append(this.f62266b);
                    sb2.append(", requestId=");
                    sb2.append(this.f62267c);
                    sb2.append(", packageName=");
                    sb2.append(this.f62268d);
                    sb2.append(", entityId=");
                    sb2.append(this.f62269e);
                    sb2.append(", externalOrganic=");
                    return a2.c.p(sb2, this.f62270f, ')');
                }

                @Override // android.os.Parcelable
                public final void writeToParcel(@NotNull Parcel out, int i5) {
                    Intrinsics.g(out, "out");
                    out.writeString(this.f62265a);
                    out.writeLong(this.f62266b);
                    out.writeString(this.f62267c);
                    out.writeString(this.f62268d);
                    out.writeString(this.f62269e);
                    out.writeInt(this.f62270f ? 1 : 0);
                }
            }

            public static final class b extends c {

                @NotNull
                public static final Parcelable.Creator<b> CREATOR = new a();

                /* renamed from: a, reason: collision with root package name */
                @NotNull
                public final String f62271a;

                /* renamed from: b, reason: collision with root package name */
                public final long f62272b;

                /* renamed from: c, reason: collision with root package name */
                @NotNull
                public final String f62273c;

                /* renamed from: d, reason: collision with root package name */
                @NotNull
                public final String f62274d;

                /* renamed from: e, reason: collision with root package name */
                @NotNull
                public final String f62275e;

                /* renamed from: f, reason: collision with root package name */
                public final int f62276f;

                /* renamed from: g, reason: collision with root package name */
                @NotNull
                public final String f62277g;

                /* renamed from: h, reason: collision with root package name */
                @NotNull
                public final UserHandle f62278h;

                /* renamed from: i, reason: collision with root package name */
                public final boolean f62279i;

                public static final class a implements Parcelable.Creator<b> {
                    @Override // android.os.Parcelable.Creator
                    public final b createFromParcel(Parcel parcel) {
                        Intrinsics.g(parcel, "parcel");
                        return new b(parcel.readString(), parcel.readLong(), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt(), parcel.readString(), (UserHandle) parcel.readParcelable(b.class.getClassLoader()), parcel.readInt() != 0);
                    }

                    @Override // android.os.Parcelable.Creator
                    public final b[] newArray(int i5) {
                        return new b[i5];
                    }
                }

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                public b(@NotNull String sessionId, long j11, @NotNull String requestId, @NotNull String packageName, @NotNull String targetPackageName, int i5, @NotNull String entityId, @NotNull UserHandle userHandle, boolean z11) {
                    super(0);
                    Intrinsics.g(sessionId, "sessionId");
                    Intrinsics.g(requestId, "requestId");
                    Intrinsics.g(packageName, "packageName");
                    Intrinsics.g(targetPackageName, "targetPackageName");
                    Intrinsics.g(entityId, "entityId");
                    Intrinsics.g(userHandle, "userHandle");
                    this.f62271a = sessionId;
                    this.f62272b = j11;
                    this.f62273c = requestId;
                    this.f62274d = packageName;
                    this.f62275e = targetPackageName;
                    this.f62276f = i5;
                    this.f62277g = entityId;
                    this.f62278h = userHandle;
                    this.f62279i = z11;
                }

                @Override // android.os.Parcelable
                public final int describeContents() {
                    return 0;
                }

                public final boolean equals(@Nullable Object obj) {
                    if (this == obj) {
                        return true;
                    }
                    if (!(obj instanceof b)) {
                        return false;
                    }
                    b bVar = (b) obj;
                    return Intrinsics.b(this.f62271a, bVar.f62271a) && this.f62272b == bVar.f62272b && Intrinsics.b(this.f62273c, bVar.f62273c) && Intrinsics.b(this.f62274d, bVar.f62274d) && Intrinsics.b(this.f62275e, bVar.f62275e) && this.f62276f == bVar.f62276f && Intrinsics.b(this.f62277g, bVar.f62277g) && Intrinsics.b(this.f62278h, bVar.f62278h) && this.f62279i == bVar.f62279i;
                }

                /* JADX WARN: Multi-variable type inference failed */
                public final int hashCode() {
                    int iHashCode = (this.f62278h.hashCode() + C3248l8.a(this.f62277g, C3214j8.a(this.f62276f, C3248l8.a(this.f62275e, C3248l8.a(this.f62274d, C3248l8.a(this.f62273c, C3231k8.a(this.f62272b, this.f62271a.hashCode() * 31, 31), 31), 31), 31), 31), 31)) * 31;
                    boolean z11 = this.f62279i;
                    int i5 = z11;
                    if (z11 != 0) {
                        i5 = 1;
                    }
                    return iHashCode + i5;
                }

                @NotNull
                public final String toString() {
                    StringBuilder sb2 = new StringBuilder("Search(sessionId=");
                    sb2.append(this.f62271a);
                    sb2.append(", timestamp=");
                    sb2.append(this.f62272b);
                    sb2.append(", requestId=");
                    sb2.append(this.f62273c);
                    sb2.append(", packageName=");
                    sb2.append(this.f62274d);
                    sb2.append(", targetPackageName=");
                    sb2.append(this.f62275e);
                    sb2.append(", resultId=");
                    sb2.append(this.f62276f);
                    sb2.append(", entityId=");
                    sb2.append(this.f62277g);
                    sb2.append(", userHandle=");
                    sb2.append(this.f62278h);
                    sb2.append(", externalOrganic=");
                    return a2.c.p(sb2, this.f62279i, ')');
                }

                @Override // android.os.Parcelable
                public final void writeToParcel(@NotNull Parcel out, int i5) {
                    Intrinsics.g(out, "out");
                    out.writeString(this.f62271a);
                    out.writeLong(this.f62272b);
                    out.writeString(this.f62273c);
                    out.writeString(this.f62274d);
                    out.writeString(this.f62275e);
                    out.writeInt(this.f62276f);
                    out.writeString(this.f62277g);
                    out.writeParcelable(this.f62278h, i5);
                    out.writeInt(this.f62279i ? 1 : 0);
                }
            }

            public c() {
            }

            public /* synthetic */ c(int i5) {
                this();
            }
        }

        public j() {
            super("OPEN", 0);
        }
    }

    public static final class k extends C4 {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final k f62280b = new k();

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public static final E4<a> f62281c = new E4<>(Reflection.f71864a.getOrCreateKotlinClass(a.class));

        public static final class a implements Parcelable {

            @NotNull
            public static final Parcelable.Creator<a> CREATOR = new C0320a();

            /* renamed from: a, reason: collision with root package name */
            @NotNull
            public final List<String> f62282a;

            /* renamed from: b, reason: collision with root package name */
            @Nullable
            public final long[] f62283b;

            /* renamed from: c, reason: collision with root package name */
            public final boolean f62284c;

            /* renamed from: io.branch.search.internal.C4$k$a$a, reason: collision with other inner class name */
            /* loaded from: classes4.dex */
            public static final class C0320a implements Parcelable.Creator<a> {
                @Override // android.os.Parcelable.Creator
                public final a createFromParcel(Parcel parcel) {
                    Intrinsics.g(parcel, "parcel");
                    return new a(parcel.createStringArrayList(), parcel.createLongArray(), parcel.readInt() != 0);
                }

                @Override // android.os.Parcelable.Creator
                public final a[] newArray(int i5) {
                    return new a[i5];
                }
            }

            public a(@NotNull List<String> packageNames, @Nullable long[] jArr, boolean z11) {
                Intrinsics.g(packageNames, "packageNames");
                this.f62282a = packageNames;
                this.f62283b = jArr;
                this.f62284c = z11;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(@NotNull Parcel out, int i5) {
                Intrinsics.g(out, "out");
                out.writeStringList(this.f62282a);
                out.writeLongArray(this.f62283b);
                out.writeInt(this.f62284c ? 1 : 0);
            }
        }

        public k() {
            super("SYNC_IGNORED_PACKAGES", 0);
        }
    }

    public static final class l extends C4 {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final l f62285b = new l();

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public static final E4<AnalyticsEvent> f62286c = new E4<>(Reflection.f71864a.getOrCreateKotlinClass(AnalyticsEvent.class));

        public l() {
            super("TRACK", 0);
        }
    }

    public static final class m extends C4 {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final m f62287b = new m();

        /* renamed from: c, reason: collision with root package name */
        @NotNull
        public static final E4<C3095c7> f62288c = new E4<>(Reflection.f71864a.getOrCreateKotlinClass(C3095c7.class));

        public m() {
            super("OPT_IN_STATUS", 0);
        }
    }

    public static final class n extends C4 {

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final n f62289b = new n();

        public n() {
            super("UNMARK_IGNORE_PACKAGE", 0);
        }
    }

    public C4(String str) {
        this.f62203a = str;
    }

    @Override // io.branch.search.internal.InterfaceC3481z4
    @NotNull
    public final String getPath() {
        return this.f62203a;
    }

    public /* synthetic */ C4(String str, int i5) {
        this(str);
    }
}
