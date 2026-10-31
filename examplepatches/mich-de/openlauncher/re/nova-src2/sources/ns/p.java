package ns;

import b.c0;
import b.c9;
import b.u4;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.LinkedHashMapSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.StringSerializer;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class p {

    @NotNull
    public static final e Companion = new e();

    /* renamed from: t, reason: collision with root package name */
    public static final KSerializer[] f78549t;

    /* renamed from: u, reason: collision with root package name */
    public static final Json f78550u;

    /* renamed from: a, reason: collision with root package name */
    public final String f78551a;

    /* renamed from: b, reason: collision with root package name */
    public final String f78552b;

    /* renamed from: c, reason: collision with root package name */
    public final l f78553c;

    /* renamed from: d, reason: collision with root package name */
    public final h f78554d;

    /* renamed from: e, reason: collision with root package name */
    public final o f78555e;

    /* renamed from: f, reason: collision with root package name */
    public final String f78556f;

    /* renamed from: g, reason: collision with root package name */
    public final String f78557g;

    /* renamed from: h, reason: collision with root package name */
    public final String f78558h;

    /* renamed from: i, reason: collision with root package name */
    public final String f78559i;

    /* renamed from: j, reason: collision with root package name */
    public final String f78560j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f78561k;

    /* renamed from: l, reason: collision with root package name */
    public final d f78562l;

    /* renamed from: m, reason: collision with root package name */
    public final Map f78563m;
    public final List n;
    public final Map o;

    /* renamed from: p, reason: collision with root package name */
    public final String f78564p;

    /* renamed from: q, reason: collision with root package name */
    public final String f78565q;

    /* renamed from: r, reason: collision with root package name */
    public final Map f78566r;

    /* renamed from: s, reason: collision with root package name */
    public final Map f78567s;

    static {
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        f78549t = new KSerializer[]{null, null, null, null, null, null, null, null, null, null, null, null, new LinkedHashMapSerializer(stringSerializer, BooleanSerializer.INSTANCE), new ArrayListSerializer(stringSerializer), new LinkedHashMapSerializer(stringSerializer, stringSerializer), null, null, new LinkedHashMapSerializer(stringSerializer, stringSerializer), new LinkedHashMapSerializer(stringSerializer, stringSerializer)};
        f78550u = JsonKt.Json$default(null, new nq.a(1), 1, null);
    }

    public p(int i5, String str, String str2, l lVar, h hVar, o oVar, String str3, String str4, String str5, String str6, String str7, boolean z11, d dVar, Map map, List list, Map map2, String str8, String str9, Map map3, Map map4) {
        Map mapN;
        if (32767 != (i5 & 32767)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 32767, a.f78531a.getDescriptor());
        }
        this.f78551a = str;
        this.f78552b = str2;
        this.f78553c = lVar;
        this.f78554d = hVar;
        this.f78555e = oVar;
        this.f78556f = str3;
        this.f78557g = str4;
        this.f78558h = str5;
        this.f78559i = str6;
        this.f78560j = str7;
        this.f78561k = z11;
        this.f78562l = dVar;
        this.f78563m = map;
        this.n = list;
        this.o = map2;
        this.f78564p = (32768 & i5) == 0 ? "mobile_pay" : str8;
        this.f78565q = (65536 & i5) == 0 ? "mobile" : str9;
        if ((131072 & i5) == 0) {
            UUID uuid = fr.c.f55586g;
            mapN = a80.m.n("mobile_session_id", fr.c.f55586g.toString());
        } else {
            mapN = map3;
        }
        this.f78566r = mapN;
        this.f78567s = (i5 & SQLiteDatabase.OPEN_PRIVATECACHE) == 0 ? b70.h.f17594a : map4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p)) {
            return false;
        }
        p pVar = (p) obj;
        return Intrinsics.b(this.f78551a, pVar.f78551a) && Intrinsics.b(this.f78552b, pVar.f78552b) && Intrinsics.b(this.f78553c, pVar.f78553c) && Intrinsics.b(this.f78554d, pVar.f78554d) && Intrinsics.b(this.f78555e, pVar.f78555e) && Intrinsics.b(this.f78556f, pVar.f78556f) && Intrinsics.b(this.f78557g, pVar.f78557g) && Intrinsics.b(this.f78558h, pVar.f78558h) && Intrinsics.b(this.f78559i, pVar.f78559i) && Intrinsics.b(this.f78560j, pVar.f78560j) && this.f78561k == pVar.f78561k && Intrinsics.b(this.f78562l, pVar.f78562l) && Intrinsics.b(this.f78563m, pVar.f78563m) && Intrinsics.b(this.n, pVar.n) && Intrinsics.b(this.o, pVar.o);
    }

    public final int hashCode() {
        int iHashCode = this.f78551a.hashCode() * 31;
        String str = this.f78552b;
        int iHashCode2 = (this.f78554d.hashCode() + ((this.f78553c.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31)) * 31)) * 31;
        o oVar = this.f78555e;
        int iF = c9.f(c0.e(c0.e(c0.e(c0.e(c0.e((iHashCode2 + (oVar == null ? 0 : oVar.hashCode())) * 31, 31, this.f78556f), 31, this.f78557g), 31, this.f78558h), 31, this.f78559i), 31, this.f78560j), 31, this.f78561k);
        d dVar = this.f78562l;
        return this.o.hashCode() + u4.c(x8.h.c(this.f78563m, (iF + (dVar != null ? dVar.hashCode() : 0)) * 31, 31), 31, this.n);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("PopupPayload(publishableKey=", this.f78551a, ", stripeAccount=", this.f78552b, ", merchantInfo=");
        sbW.append(this.f78553c);
        sbW.append(", customerInfo=");
        sbW.append(this.f78554d);
        sbW.append(", paymentInfo=");
        sbW.append(this.f78555e);
        sbW.append(", appId=");
        sbW.append(this.f78556f);
        sbW.append(", locale=");
        c0.D(sbW, this.f78557g, ", paymentUserAgent=", this.f78558h, ", paymentObject=");
        c0.D(sbW, this.f78559i, ", intentMode=", this.f78560j, ", setupFutureUsage=");
        sbW.append(this.f78561k);
        sbW.append(", cardBrandChoice=");
        sbW.append(this.f78562l);
        sbW.append(", flags=");
        sbW.append(this.f78563m);
        sbW.append(", linkFundingSources=");
        sbW.append(this.n);
        sbW.append(", clientAttributionMetadata=");
        sbW.append(this.o);
        sbW.append(")");
        return sbW.toString();
    }

    public p(String publishableKey, String str, l lVar, h hVar, o oVar, String str2, String str3, String str4, String str5, String str6, boolean z11, d dVar, Map map, ArrayList arrayList, LinkedHashMap linkedHashMap) {
        Intrinsics.g(publishableKey, "publishableKey");
        this.f78551a = publishableKey;
        this.f78552b = str;
        this.f78553c = lVar;
        this.f78554d = hVar;
        this.f78555e = oVar;
        this.f78556f = str2;
        this.f78557g = str3;
        this.f78558h = str4;
        this.f78559i = str5;
        this.f78560j = str6;
        this.f78561k = z11;
        this.f78562l = dVar;
        this.f78563m = map;
        this.n = arrayList;
        this.o = linkedHashMap;
        this.f78564p = "mobile_pay";
        this.f78565q = "mobile";
        UUID uuid = fr.c.f55586g;
        this.f78566r = a80.m.n("mobile_session_id", fr.c.f55586g.toString());
        this.f78567s = b70.h.f17594a;
    }
}
