package np;

import androidx.recyclerview.widget.u1;
import b.c0;
import b.c9;
import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.EnumMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KClass;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.LinkedHashMapSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.ReferenceArraySerializer;
import kotlinx.serialization.internal.StringSerializer;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import pp.b0;
import pp.e0;
import pp.f0;
import pp.l;
import pp.o;
import pp.u;
import pp.x;

@Serializable
/* loaded from: classes.dex */
public final class d {

    @NotNull
    public static final c Companion = new c();
    public static final KSerializer[] D;
    public boolean A;
    public List B;
    public final Map C;

    /* renamed from: a, reason: collision with root package name */
    public final LocalDate f78486a;

    /* renamed from: b, reason: collision with root package name */
    public final String f78487b;

    /* renamed from: c, reason: collision with root package name */
    public final int f78488c;

    /* renamed from: d, reason: collision with root package name */
    public final String f78489d;

    /* renamed from: e, reason: collision with root package name */
    public final int f78490e;

    /* renamed from: f, reason: collision with root package name */
    public final String f78491f;

    /* renamed from: g, reason: collision with root package name */
    public final String f78492g;

    /* renamed from: h, reason: collision with root package name */
    public k f78493h;

    /* renamed from: i, reason: collision with root package name */
    public long f78494i;

    /* renamed from: j, reason: collision with root package name */
    public l f78495j;

    /* renamed from: k, reason: collision with root package name */
    public l f78496k;

    /* renamed from: l, reason: collision with root package name */
    public int f78497l;

    /* renamed from: m, reason: collision with root package name */
    public int f78498m;
    public int n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public final Map f78499p;

    /* renamed from: q, reason: collision with root package name */
    public final Map f78500q;

    /* renamed from: r, reason: collision with root package name */
    public List f78501r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f78502s;

    /* renamed from: t, reason: collision with root package name */
    public boolean f78503t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f78504u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f78505v;

    /* renamed from: w, reason: collision with root package name */
    public String f78506w;

    /* renamed from: x, reason: collision with root package name */
    public String[] f78507x;

    /* renamed from: y, reason: collision with root package name */
    public final op.c f78508y;

    /* renamed from: z, reason: collision with root package name */
    public final op.l f78509z;

    static {
        KSerializer kSerializerCreateSimpleEnumSerializer = EnumsKt.createSimpleEnumSerializer("com.novalauncher.novalytics.SubmitStatus", k.values());
        KSerializer kSerializerCreateSimpleEnumSerializer2 = EnumsKt.createSimpleEnumSerializer("com.novalauncher.novalytics.stats.events.HadSearch", l.values());
        KSerializer kSerializerCreateSimpleEnumSerializer3 = EnumsKt.createSimpleEnumSerializer("com.novalauncher.novalytics.stats.events.HadSearch", l.values());
        KSerializer kSerializerCreateSimpleEnumSerializer4 = EnumsKt.createSimpleEnumSerializer("com.novalauncher.novalytics.stats.events.ResultType", b0.values());
        IntSerializer intSerializer = IntSerializer.INSTANCE;
        LinkedHashMapSerializer linkedHashMapSerializer = new LinkedHashMapSerializer(kSerializerCreateSimpleEnumSerializer4, intSerializer);
        LinkedHashMapSerializer linkedHashMapSerializer2 = new LinkedHashMapSerializer(EnumsKt.createSimpleEnumSerializer("com.novalauncher.novalytics.stats.events.SearchOpenMethod", f0.values()), intSerializer);
        KClass orCreateKotlinClass = Reflection.f71864a.getOrCreateKotlinClass(String.class);
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        D = new KSerializer[]{null, null, null, null, null, null, null, kSerializerCreateSimpleEnumSerializer, null, kSerializerCreateSimpleEnumSerializer2, kSerializerCreateSimpleEnumSerializer3, null, null, null, null, linkedHashMapSerializer, linkedHashMapSerializer2, null, null, null, null, null, null, new ReferenceArraySerializer(orCreateKotlinClass, stringSerializer), null, null, null, new ArrayListSerializer(stringSerializer), new LinkedHashMapSerializer(stringSerializer, op.e.f80553a)};
    }

    public d(int i5, LocalDate localDate, String str, int i11, String str2, int i12, String str3, String str4, k kVar, long j11, l lVar, l lVar2, int i13, int i14, int i15, int i16, Map map, Map map2, List list, boolean z11, boolean z12, boolean z13, boolean z14, String str5, String[] strArr, op.c cVar, op.l lVar3, boolean z15, List list2, Map map3) {
        if (117 != (i5 & Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE)) {
            PluginExceptionsKt.throwMissingFieldException(i5, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, b.f78485a.getDescriptor());
        }
        this.f78486a = localDate;
        if ((i5 & 2) == 0) {
            this.f78487b = "com.teslacoilsw.launcher";
        } else {
            this.f78487b = str;
        }
        this.f78488c = i11;
        if ((i5 & 8) == 0) {
            this.f78489d = "no_id";
        } else {
            this.f78489d = str2;
        }
        this.f78490e = i12;
        this.f78491f = str3;
        this.f78492g = str4;
        if ((i5 & 128) == 0) {
            this.f78493h = k.f78519b;
        } else {
            this.f78493h = kVar;
        }
        if ((i5 & 256) == 0) {
            this.f78494i = 0L;
        } else {
            this.f78494i = j11;
        }
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0) {
            this.f78495j = l.f82757a;
        } else {
            this.f78495j = lVar;
        }
        if ((i5 & 1024) == 0) {
            this.f78496k = l.f82757a;
        } else {
            this.f78496k = lVar2;
        }
        if ((i5 & 2048) == 0) {
            this.f78497l = 0;
        } else {
            this.f78497l = i13;
        }
        if ((i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) == 0) {
            this.f78498m = 0;
        } else {
            this.f78498m = i14;
        }
        if ((i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) == 0) {
            this.n = 0;
        } else {
            this.n = i15;
        }
        if ((i5 & ReaderJsonLexerKt.BATCH_SIZE) == 0) {
            this.o = 0;
        } else {
            this.o = i16;
        }
        this.f78499p = (32768 & i5) == 0 ? new EnumMap(b0.class) : map;
        this.f78500q = (65536 & i5) == 0 ? new EnumMap(f0.class) : map2;
        this.f78501r = (131072 & i5) == 0 ? EmptyList.f71733a : list;
        if ((262144 & i5) == 0) {
            this.f78502s = false;
        } else {
            this.f78502s = z11;
        }
        if ((524288 & i5) == 0) {
            this.f78503t = false;
        } else {
            this.f78503t = z12;
        }
        if ((1048576 & i5) == 0) {
            this.f78504u = false;
        } else {
            this.f78504u = z13;
        }
        if ((2097152 & i5) == 0) {
            this.f78505v = false;
        } else {
            this.f78505v = z14;
        }
        this.f78506w = (4194304 & i5) == 0 ? null : str5;
        if ((8388608 & i5) == 0) {
            this.f78507x = new String[0];
        } else {
            this.f78507x = strArr;
        }
        this.f78508y = (16777216 & i5) == 0 ? new op.c() : cVar;
        this.f78509z = (33554432 & i5) == 0 ? new op.l() : lVar3;
        if ((67108864 & i5) == 0) {
            this.A = false;
        } else {
            this.A = z15;
        }
        this.B = (134217728 & i5) == 0 ? EmptyList.f71733a : list2;
        this.C = (i5 & 268435456) == 0 ? new LinkedHashMap() : map3;
    }

    public static void c(d dVar, e0 e0Var) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        Map map = dVar.f78499p;
        Map map2 = dVar.f78500q;
        if (jCurrentTimeMillis - dVar.f78494i > TTAdConstant.AD_MAX_EVENT_TIME) {
            dVar.f78495j = l.f82757a;
        }
        dVar.f78494i = jCurrentTimeMillis;
        l lVar = dVar.f78496k;
        l lVar2 = l.f82757a;
        if (lVar == lVar2) {
            dVar.f78498m++;
            dVar.f78496k = l.f82758b;
        }
        if (dVar.f78495j == lVar2) {
            dVar.f78497l++;
            dVar.f78495j = l.f82758b;
        }
        f0 f0VarB = e0Var.b();
        Integer num = (Integer) map2.get(e0Var.b());
        map2.put(f0VarB, Integer.valueOf((num != null ? num.intValue() : 0) + 1));
        if (e0Var.c() == null) {
            if (e0Var.a().a() > 0) {
                dVar.o++;
                return;
            }
            return;
        }
        l lVar3 = dVar.f78496k;
        l lVar4 = l.f82759c;
        if (lVar3 != lVar4) {
            dVar.n++;
            dVar.f78496k = lVar4;
        }
        if (dVar.f78495j != lVar4) {
            dVar.f78495j = lVar4;
        }
        Object obj = e0Var.c().f71683a;
        Integer num2 = (Integer) map.get(e0Var.c().f71683a);
        map.put(obj, Integer.valueOf((num2 != null ? num2.intValue() : 0) + 1));
    }

    public final void a(o oVar) {
        op.l lVar = this.f78509z;
        lVar.getClass();
        op.k kVar = (op.k) lVar.f80562a.computeIfAbsent(oVar.a(), new com.google.firebase.crashlytics.internal.persistence.d(new nq.a(6), 5));
        kVar.f80560a++;
        if (oVar.b()) {
            return;
        }
        kVar.f80561b++;
    }

    public final void b(x xVar) {
        op.c cVar = this.f78508y;
        cVar.getClass();
        Object objComputeIfAbsent = cVar.f80550a.computeIfAbsent(xVar.b(), new com.google.firebase.crashlytics.internal.persistence.d(new nq.a(5), 4));
        Intrinsics.f(objComputeIfAbsent, "computeIfAbsent(...)");
        Map map = (Map) objComputeIfAbsent;
        op.a aVar = (op.a) map.get(xVar.a());
        if (aVar != null) {
            aVar.d(aVar.b() + 1);
            if (xVar.c()) {
                aVar.c(aVar.a() + 1);
                return;
            }
            return;
        }
        u uVarA = xVar.a();
        op.a aVar2 = new op.a();
        if (xVar.c()) {
            aVar2.c(aVar2.a() + 1);
        }
        map.put(uVarA, aVar2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return Intrinsics.b(this.f78486a, dVar.f78486a) && Intrinsics.b(this.f78487b, dVar.f78487b) && this.f78488c == dVar.f78488c && Intrinsics.b(this.f78489d, dVar.f78489d) && this.f78490e == dVar.f78490e && Intrinsics.b(this.f78491f, dVar.f78491f) && Intrinsics.b(this.f78492g, dVar.f78492g) && this.f78493h == dVar.f78493h && this.f78494i == dVar.f78494i && this.f78495j == dVar.f78495j && this.f78496k == dVar.f78496k && this.f78497l == dVar.f78497l && this.f78498m == dVar.f78498m && this.n == dVar.n && this.o == dVar.o && Intrinsics.b(this.f78499p, dVar.f78499p) && Intrinsics.b(this.f78500q, dVar.f78500q) && Intrinsics.b(this.f78501r, dVar.f78501r) && this.f78502s == dVar.f78502s && this.f78503t == dVar.f78503t && this.f78504u == dVar.f78504u && this.f78505v == dVar.f78505v && Intrinsics.b(this.f78506w, dVar.f78506w) && Intrinsics.b(this.f78507x, dVar.f78507x) && Intrinsics.b(this.f78508y, dVar.f78508y) && Intrinsics.b(this.f78509z, dVar.f78509z) && this.A == dVar.A && Intrinsics.b(this.B, dVar.B) && Intrinsics.b(this.C, dVar.C);
    }

    public final int hashCode() {
        int iF = c9.f(c9.f(c9.f(c9.f(u4.c(x8.h.c(this.f78500q, x8.h.c(this.f78499p, u4.a(this.o, u4.a(this.n, u4.a(this.f78498m, u4.a(this.f78497l, (this.f78496k.hashCode() + ((this.f78495j.hashCode() + c0.d((this.f78493h.hashCode() + c0.e(c0.e(u4.a(this.f78490e, c0.e(u4.a(this.f78488c, c0.e(this.f78486a.hashCode() * 31, 31, this.f78487b), 31), 31, this.f78489d), 31), 31, this.f78491f), 31, this.f78492g)) * 31, 31, this.f78494i)) * 31)) * 31, 31), 31), 31), 31), 31), 31), 31, this.f78501r), 31, this.f78502s), 31, this.f78503t), 31, this.f78504u), 31, this.f78505v);
        String str = this.f78506w;
        return this.C.hashCode() + u4.c(c9.f((this.f78509z.hashCode() + ((this.f78508y.hashCode() + ((((iF + (str == null ? 0 : str.hashCode())) * 31) + Arrays.hashCode(this.f78507x)) * 31)) * 31)) * 31, 31, this.A), 31, this.B);
    }

    public final String toString() {
        k kVar = this.f78493h;
        long j11 = this.f78494i;
        l lVar = this.f78495j;
        l lVar2 = this.f78496k;
        int i5 = this.f78497l;
        int i11 = this.f78498m;
        int i12 = this.n;
        int i13 = this.o;
        List list = this.f78501r;
        boolean z11 = this.f78502s;
        boolean z12 = this.f78503t;
        boolean z13 = this.f78504u;
        boolean z14 = this.f78505v;
        String str = this.f78506w;
        String string = Arrays.toString(this.f78507x);
        boolean z15 = this.A;
        List list2 = this.B;
        StringBuilder sb2 = new StringBuilder("DailyStats(date=");
        sb2.append(this.f78486a);
        sb2.append(", applicationId=");
        sb2.append(this.f78487b);
        sb2.append(", applicationVersion=");
        sb2.append(this.f78488c);
        sb2.append(", installationId=");
        sb2.append(this.f78489d);
        sb2.append(", androidSdkInt=");
        sb2.append(this.f78490e);
        sb2.append(", deviceBrand=");
        sb2.append(this.f78491f);
        sb2.append(", deviceModel=");
        sb2.append(this.f78492g);
        sb2.append(", submitted=");
        sb2.append(kVar);
        sb2.append(", lastEventTimeMillis=");
        sb2.append(j11);
        sb2.append(", sessionHadSearch=");
        sb2.append(lVar);
        sb2.append(", windowHadSearch=");
        sb2.append(lVar2);
        sb2.append(", search_sessions=");
        sb2.append(i5);
        sb2.append(", search_windows=");
        sb2.append(i11);
        sb2.append(", search_windows_with_click=");
        sb2.append(i12);
        sb2.append(", search_no_clicks_when_micro_shown=");
        sb2.append(i13);
        sb2.append(", search_clicks=");
        sb2.append(this.f78499p);
        sb2.append(", search_opens=");
        sb2.append(this.f78500q);
        sb2.append(", card_update_events=");
        sb2.append(list);
        sb2.append(", micro_results_enabled=");
        sb2.append(z11);
        sb2.append(", shortcut_search_enabled=");
        sb2.append(z12);
        sb2.append(", card_view_enabled=");
        sb2.append(z13);
        sb2.append(", contacts_enabled=");
        sb2.append(z14);
        c0.D(sb2, ", web_suggestions=", str, ", search_more_providers=", string);
        sb2.append(", click_records=");
        sb2.append(this.f78508y);
        sb2.append(", impression_records=");
        sb2.append(this.f78509z);
        sb2.append(", smart_folders_enabled=");
        sb2.append(z15);
        sb2.append(", smart_folder_types=");
        sb2.append(list2);
        sb2.append(", smart_folders_edits=");
        sb2.append(this.C);
        sb2.append(")");
        return sb2.toString();
    }

    public d(LocalDate date, String applicationId, int i5, String installationId, int i11, String deviceBrand, String deviceModel, k submitted, long j11, l sessionHadSearch, l windowHadSearch, int i12, int i13, int i14, int i15, EnumMap enumMap, EnumMap enumMap2, List card_update_events, boolean z11, boolean z12, boolean z13, boolean z14, String str, String[] search_more_providers, op.c click_records, op.l impression_records, boolean z15, List smart_folder_types, LinkedHashMap linkedHashMap) {
        Intrinsics.g(date, "date");
        Intrinsics.g(applicationId, "applicationId");
        Intrinsics.g(installationId, "installationId");
        Intrinsics.g(deviceBrand, "deviceBrand");
        Intrinsics.g(deviceModel, "deviceModel");
        Intrinsics.g(submitted, "submitted");
        Intrinsics.g(sessionHadSearch, "sessionHadSearch");
        Intrinsics.g(windowHadSearch, "windowHadSearch");
        Intrinsics.g(card_update_events, "card_update_events");
        Intrinsics.g(search_more_providers, "search_more_providers");
        Intrinsics.g(click_records, "click_records");
        Intrinsics.g(impression_records, "impression_records");
        Intrinsics.g(smart_folder_types, "smart_folder_types");
        this.f78486a = date;
        this.f78487b = applicationId;
        this.f78488c = i5;
        this.f78489d = installationId;
        this.f78490e = i11;
        this.f78491f = deviceBrand;
        this.f78492g = deviceModel;
        this.f78493h = submitted;
        this.f78494i = j11;
        this.f78495j = sessionHadSearch;
        this.f78496k = windowHadSearch;
        this.f78497l = i12;
        this.f78498m = i13;
        this.n = i14;
        this.o = i15;
        this.f78499p = enumMap;
        this.f78500q = enumMap2;
        this.f78501r = card_update_events;
        this.f78502s = z11;
        this.f78503t = z12;
        this.f78504u = z13;
        this.f78505v = z14;
        this.f78506w = str;
        this.f78507x = search_more_providers;
        this.f78508y = click_records;
        this.f78509z = impression_records;
        this.A = z15;
        this.B = smart_folder_types;
        this.C = linkedHashMap;
    }
}
