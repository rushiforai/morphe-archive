package com.vungle.ads.internal.model;

import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.List;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class i {

    @NotNull
    public static final h Companion = new h();
    public final f0 A;
    public final Boolean B;
    public final Boolean C;
    public final Integer D;

    /* renamed from: a, reason: collision with root package name */
    public final String f47021a;

    /* renamed from: b, reason: collision with root package name */
    public final String f47022b;

    /* renamed from: c, reason: collision with root package name */
    public final String f47023c;

    /* renamed from: d, reason: collision with root package name */
    public final Integer f47024d;

    /* renamed from: e, reason: collision with root package name */
    public final Integer f47025e;

    /* renamed from: f, reason: collision with root package name */
    public final String f47026f;

    /* renamed from: g, reason: collision with root package name */
    public final Boolean f47027g;

    /* renamed from: h, reason: collision with root package name */
    public final Boolean f47028h;

    /* renamed from: i, reason: collision with root package name */
    public final String f47029i;

    /* renamed from: j, reason: collision with root package name */
    public final String f47030j;

    /* renamed from: k, reason: collision with root package name */
    public final Integer f47031k;

    /* renamed from: l, reason: collision with root package name */
    public final Integer f47032l;

    /* renamed from: m, reason: collision with root package name */
    public final Map f47033m;
    public final String n;
    public final String o;

    /* renamed from: p, reason: collision with root package name */
    public final String f47034p;

    /* renamed from: q, reason: collision with root package name */
    public final List f47035q;

    /* renamed from: r, reason: collision with root package name */
    public final List f47036r;

    /* renamed from: s, reason: collision with root package name */
    public final z f47037s;

    /* renamed from: t, reason: collision with root package name */
    public final String f47038t;

    /* renamed from: u, reason: collision with root package name */
    public final v f47039u;

    /* renamed from: v, reason: collision with root package name */
    public final String f47040v;

    /* renamed from: w, reason: collision with root package name */
    public final String f47041w;

    /* renamed from: x, reason: collision with root package name */
    public final Integer f47042x;

    /* renamed from: y, reason: collision with root package name */
    public final Integer f47043y;

    /* renamed from: z, reason: collision with root package name */
    public final f f47044z;

    public /* synthetic */ i(int i5, String str, String str2, String str3, Integer num, Integer num2, String str4, Boolean bool, Boolean bool2, String str5, String str6, Integer num3, Integer num4, Map map, String str7, String str8, String str9, List list, List list2, z zVar, String str10, v vVar, String str11, String str12, Integer num5, Integer num6, f fVar, f0 f0Var, Boolean bool3, Boolean bool4, Integer num7) {
        if ((i5 & 1) == 0) {
            this.f47021a = null;
        } else {
            this.f47021a = str;
        }
        if ((i5 & 2) == 0) {
            this.f47022b = null;
        } else {
            this.f47022b = str2;
        }
        if ((i5 & 4) == 0) {
            this.f47023c = null;
        } else {
            this.f47023c = str3;
        }
        if ((i5 & 8) == 0) {
            this.f47024d = null;
        } else {
            this.f47024d = num;
        }
        if ((i5 & 16) == 0) {
            this.f47025e = null;
        } else {
            this.f47025e = num2;
        }
        if ((i5 & 32) == 0) {
            this.f47026f = null;
        } else {
            this.f47026f = str4;
        }
        if ((i5 & 64) == 0) {
            this.f47027g = null;
        } else {
            this.f47027g = bool;
        }
        if ((i5 & 128) == 0) {
            this.f47028h = null;
        } else {
            this.f47028h = bool2;
        }
        if ((i5 & 256) == 0) {
            this.f47029i = null;
        } else {
            this.f47029i = str5;
        }
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0) {
            this.f47030j = null;
        } else {
            this.f47030j = str6;
        }
        if ((i5 & 1024) == 0) {
            this.f47031k = null;
        } else {
            this.f47031k = num3;
        }
        if ((i5 & 2048) == 0) {
            this.f47032l = null;
        } else {
            this.f47032l = num4;
        }
        if ((i5 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) == 0) {
            this.f47033m = null;
        } else {
            this.f47033m = map;
        }
        if ((i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) == 0) {
            this.n = null;
        } else {
            this.n = str7;
        }
        if ((i5 & ReaderJsonLexerKt.BATCH_SIZE) == 0) {
            this.o = null;
        } else {
            this.o = str8;
        }
        if ((32768 & i5) == 0) {
            this.f47034p = null;
        } else {
            this.f47034p = str9;
        }
        if ((65536 & i5) == 0) {
            this.f47035q = null;
        } else {
            this.f47035q = list;
        }
        if ((131072 & i5) == 0) {
            this.f47036r = null;
        } else {
            this.f47036r = list2;
        }
        if ((262144 & i5) == 0) {
            this.f47037s = null;
        } else {
            this.f47037s = zVar;
        }
        if ((524288 & i5) == 0) {
            this.f47038t = null;
        } else {
            this.f47038t = str10;
        }
        if ((1048576 & i5) == 0) {
            this.f47039u = null;
        } else {
            this.f47039u = vVar;
        }
        if ((2097152 & i5) == 0) {
            this.f47040v = null;
        } else {
            this.f47040v = str11;
        }
        if ((4194304 & i5) == 0) {
            this.f47041w = null;
        } else {
            this.f47041w = str12;
        }
        if ((8388608 & i5) == 0) {
            this.f47042x = 0;
        } else {
            this.f47042x = num5;
        }
        if ((16777216 & i5) == 0) {
            this.f47043y = 0;
        } else {
            this.f47043y = num6;
        }
        if ((33554432 & i5) == 0) {
            this.f47044z = null;
        } else {
            this.f47044z = fVar;
        }
        if ((67108864 & i5) == 0) {
            this.A = null;
        } else {
            this.A = f0Var;
        }
        this.B = (134217728 & i5) == 0 ? Boolean.FALSE : bool3;
        if ((268435456 & i5) == 0) {
            this.C = null;
        } else {
            this.C = bool4;
        }
        if ((i5 & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) == 0) {
            this.D = 0;
        } else {
            this.D = num7;
        }
    }

    public static final void a(i self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Integer num;
        Integer num2;
        Integer num3;
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47021a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, StringSerializer.INSTANCE, self.f47021a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f47022b != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.f47022b);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.f47023c != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, StringSerializer.INSTANCE, self.f47023c);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.f47024d != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, IntSerializer.INSTANCE, self.f47024d);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.f47025e != null) {
            output.encodeNullableSerializableElement(serialDesc, 4, IntSerializer.INSTANCE, self.f47025e);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || self.f47026f != null) {
            output.encodeNullableSerializableElement(serialDesc, 5, StringSerializer.INSTANCE, self.f47026f);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 6) || self.f47027g != null) {
            output.encodeNullableSerializableElement(serialDesc, 6, BooleanSerializer.INSTANCE, self.f47027g);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 7) || self.f47028h != null) {
            output.encodeNullableSerializableElement(serialDesc, 7, BooleanSerializer.INSTANCE, self.f47028h);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 8) || self.f47029i != null) {
            output.encodeNullableSerializableElement(serialDesc, 8, StringSerializer.INSTANCE, self.f47029i);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 9) || self.f47030j != null) {
            output.encodeNullableSerializableElement(serialDesc, 9, StringSerializer.INSTANCE, self.f47030j);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 10) || self.f47031k != null) {
            output.encodeNullableSerializableElement(serialDesc, 10, IntSerializer.INSTANCE, self.f47031k);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 11) || self.f47032l != null) {
            output.encodeNullableSerializableElement(serialDesc, 11, IntSerializer.INSTANCE, self.f47032l);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 12) || self.f47033m != null) {
            output.encodeNullableSerializableElement(serialDesc, 12, w.f47172a, self.f47033m);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 13) || self.n != null) {
            output.encodeNullableSerializableElement(serialDesc, 13, StringSerializer.INSTANCE, self.n);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 14) || self.o != null) {
            output.encodeNullableSerializableElement(serialDesc, 14, StringSerializer.INSTANCE, self.o);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 15) || self.f47034p != null) {
            output.encodeNullableSerializableElement(serialDesc, 15, StringSerializer.INSTANCE, self.f47034p);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 16) || self.f47035q != null) {
            output.encodeNullableSerializableElement(serialDesc, 16, new ArrayListSerializer(StringSerializer.INSTANCE), self.f47035q);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 17) || self.f47036r != null) {
            output.encodeNullableSerializableElement(serialDesc, 17, new ArrayListSerializer(StringSerializer.INSTANCE), self.f47036r);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 18) || self.f47037s != null) {
            output.encodeNullableSerializableElement(serialDesc, 18, x.f47193a, self.f47037s);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 19) || self.f47038t != null) {
            output.encodeNullableSerializableElement(serialDesc, 19, StringSerializer.INSTANCE, self.f47038t);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 20) || self.f47039u != null) {
            output.encodeNullableSerializableElement(serialDesc, 20, t.f47148a, self.f47039u);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 21) || self.f47040v != null) {
            output.encodeNullableSerializableElement(serialDesc, 21, StringSerializer.INSTANCE, self.f47040v);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 22) || self.f47041w != null) {
            output.encodeNullableSerializableElement(serialDesc, 22, StringSerializer.INSTANCE, self.f47041w);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 23) || (num3 = self.f47042x) == null || num3.intValue() != 0) {
            output.encodeNullableSerializableElement(serialDesc, 23, IntSerializer.INSTANCE, self.f47042x);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 24) || (num2 = self.f47043y) == null || num2.intValue() != 0) {
            output.encodeNullableSerializableElement(serialDesc, 24, IntSerializer.INSTANCE, self.f47043y);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 25) || self.f47044z != null) {
            output.encodeNullableSerializableElement(serialDesc, 25, d.f46981a, self.f47044z);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 26) || self.A != null) {
            output.encodeNullableSerializableElement(serialDesc, 26, d0.f46983a, self.A);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 27) || !Intrinsics.b(self.B, Boolean.FALSE)) {
            output.encodeNullableSerializableElement(serialDesc, 27, BooleanSerializer.INSTANCE, self.B);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 28) || self.C != null) {
            output.encodeNullableSerializableElement(serialDesc, 28, BooleanSerializer.INSTANCE, self.C);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 29) || (num = self.D) == null || num.intValue() != 0) {
            output.encodeNullableSerializableElement(serialDesc, 29, IntSerializer.INSTANCE, self.D);
        }
    }

    public final Integer b() {
        return this.f47032l;
    }

    public final Integer c() {
        return this.f47024d;
    }

    public final String d() {
        return this.f47030j;
    }

    public final List e() {
        return this.f47036r;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        return Intrinsics.b(this.f47021a, iVar.f47021a) && Intrinsics.b(this.f47022b, iVar.f47022b) && Intrinsics.b(this.f47023c, iVar.f47023c) && Intrinsics.b(this.f47024d, iVar.f47024d) && Intrinsics.b(this.f47025e, iVar.f47025e) && Intrinsics.b(this.f47026f, iVar.f47026f) && Intrinsics.b(this.f47027g, iVar.f47027g) && Intrinsics.b(this.f47028h, iVar.f47028h) && Intrinsics.b(this.f47029i, iVar.f47029i) && Intrinsics.b(this.f47030j, iVar.f47030j) && Intrinsics.b(this.f47031k, iVar.f47031k) && Intrinsics.b(this.f47032l, iVar.f47032l) && Intrinsics.b(this.f47033m, iVar.f47033m) && Intrinsics.b(this.n, iVar.n) && Intrinsics.b(this.o, iVar.o) && Intrinsics.b(this.f47034p, iVar.f47034p) && Intrinsics.b(this.f47035q, iVar.f47035q) && Intrinsics.b(this.f47036r, iVar.f47036r) && Intrinsics.b(this.f47037s, iVar.f47037s) && Intrinsics.b(this.f47038t, iVar.f47038t) && Intrinsics.b(this.f47039u, iVar.f47039u) && Intrinsics.b(this.f47040v, iVar.f47040v) && Intrinsics.b(this.f47041w, iVar.f47041w) && Intrinsics.b(this.f47042x, iVar.f47042x) && Intrinsics.b(this.f47043y, iVar.f47043y) && Intrinsics.b(this.f47044z, iVar.f47044z) && Intrinsics.b(this.A, iVar.A) && Intrinsics.b(this.B, iVar.B) && Intrinsics.b(this.C, iVar.C) && Intrinsics.b(this.D, iVar.D);
    }

    public final Integer f() {
        return this.D;
    }

    public final Integer g() {
        return this.f47042x;
    }

    public final Integer h() {
        return this.f47043y;
    }

    public final int hashCode() {
        String str = this.f47021a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f47022b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f47023c;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Integer num = this.f47024d;
        int iHashCode4 = (iHashCode3 + (num == null ? 0 : num.hashCode())) * 31;
        Integer num2 = this.f47025e;
        int iHashCode5 = (iHashCode4 + (num2 == null ? 0 : num2.hashCode())) * 31;
        String str4 = this.f47026f;
        int iHashCode6 = (iHashCode5 + (str4 == null ? 0 : str4.hashCode())) * 31;
        Boolean bool = this.f47027g;
        int iHashCode7 = (iHashCode6 + (bool == null ? 0 : bool.hashCode())) * 31;
        Boolean bool2 = this.f47028h;
        int iHashCode8 = (iHashCode7 + (bool2 == null ? 0 : bool2.hashCode())) * 31;
        String str5 = this.f47029i;
        int iHashCode9 = (iHashCode8 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.f47030j;
        int iHashCode10 = (iHashCode9 + (str6 == null ? 0 : str6.hashCode())) * 31;
        Integer num3 = this.f47031k;
        int iHashCode11 = (iHashCode10 + (num3 == null ? 0 : num3.hashCode())) * 31;
        Integer num4 = this.f47032l;
        int iHashCode12 = (iHashCode11 + (num4 == null ? 0 : num4.hashCode())) * 31;
        Map map = this.f47033m;
        int iHashCode13 = (iHashCode12 + (map == null ? 0 : map.hashCode())) * 31;
        String str7 = this.n;
        int iHashCode14 = (iHashCode13 + (str7 == null ? 0 : str7.hashCode())) * 31;
        String str8 = this.o;
        int iHashCode15 = (iHashCode14 + (str8 == null ? 0 : str8.hashCode())) * 31;
        String str9 = this.f47034p;
        int iHashCode16 = (iHashCode15 + (str9 == null ? 0 : str9.hashCode())) * 31;
        List list = this.f47035q;
        int iHashCode17 = (iHashCode16 + (list == null ? 0 : list.hashCode())) * 31;
        List list2 = this.f47036r;
        int iHashCode18 = (iHashCode17 + (list2 == null ? 0 : list2.hashCode())) * 31;
        z zVar = this.f47037s;
        int iHashCode19 = (iHashCode18 + (zVar == null ? 0 : zVar.hashCode())) * 31;
        String str10 = this.f47038t;
        int iHashCode20 = (iHashCode19 + (str10 == null ? 0 : str10.hashCode())) * 31;
        v vVar = this.f47039u;
        int iHashCode21 = (iHashCode20 + (vVar == null ? 0 : vVar.hashCode())) * 31;
        String str11 = this.f47040v;
        int iHashCode22 = (iHashCode21 + (str11 == null ? 0 : str11.hashCode())) * 31;
        String str12 = this.f47041w;
        int iHashCode23 = (iHashCode22 + (str12 == null ? 0 : str12.hashCode())) * 31;
        Integer num5 = this.f47042x;
        int iHashCode24 = (iHashCode23 + (num5 == null ? 0 : num5.hashCode())) * 31;
        Integer num6 = this.f47043y;
        int iHashCode25 = (iHashCode24 + (num6 == null ? 0 : num6.hashCode())) * 31;
        f fVar = this.f47044z;
        int iHashCode26 = (iHashCode25 + (fVar == null ? 0 : fVar.hashCode())) * 31;
        f0 f0Var = this.A;
        int iHashCode27 = (iHashCode26 + (f0Var == null ? 0 : f0Var.hashCode())) * 31;
        Boolean bool3 = this.B;
        int iHashCode28 = (iHashCode27 + (bool3 == null ? 0 : bool3.hashCode())) * 31;
        Boolean bool4 = this.C;
        int iHashCode29 = (iHashCode28 + (bool4 == null ? 0 : bool4.hashCode())) * 31;
        Integer num7 = this.D;
        return iHashCode29 + (num7 != null ? num7.hashCode() : 0);
    }

    public final Integer i() {
        return this.f47031k;
    }

    public final v j() {
        return this.f47039u;
    }

    public final Map k() {
        return this.f47033m;
    }

    public final Boolean l() {
        return this.B;
    }

    public final String m() {
        return this.n;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AdUnit(id=");
        sb2.append(this.f47021a);
        sb2.append(", adType=");
        sb2.append(this.f47022b);
        sb2.append(", adSource=");
        sb2.append(this.f47023c);
        sb2.append(", expiry=");
        sb2.append(this.f47024d);
        sb2.append(", expiryDuration=");
        sb2.append(this.f47025e);
        sb2.append(", deeplinkUrl=");
        sb2.append(this.f47026f);
        sb2.append(", clickCoordinatesEnabled=");
        sb2.append(this.f47027g);
        sb2.append(", adLoadOptimizationEnabled=");
        sb2.append(this.f47028h);
        sb2.append(", mediationName=");
        sb2.append(this.f47029i);
        sb2.append(", info=");
        sb2.append(this.f47030j);
        sb2.append(", sleep=");
        sb2.append(this.f47031k);
        sb2.append(", errorCode=");
        sb2.append(this.f47032l);
        sb2.append(", tpat=");
        sb2.append(this.f47033m);
        sb2.append(", vmURL=");
        sb2.append(this.n);
        sb2.append(", vmVersion=");
        sb2.append(this.o);
        sb2.append(", adMarketId=");
        sb2.append(this.f47034p);
        sb2.append(", notification=");
        sb2.append(this.f47035q);
        sb2.append(", loadAdUrls=");
        sb2.append(this.f47036r);
        sb2.append(", viewAbility=");
        sb2.append(this.f47037s);
        sb2.append(", templateType=");
        sb2.append(this.f47038t);
        sb2.append(", templateSettings=");
        sb2.append(this.f47039u);
        sb2.append(", creativeId=");
        sb2.append(this.f47040v);
        sb2.append(", advAppId=");
        sb2.append(this.f47041w);
        sb2.append(", showClose=");
        sb2.append(this.f47042x);
        sb2.append(", showCloseIncentivized=");
        sb2.append(this.f47043y);
        sb2.append(", adSizeInfo=");
        sb2.append(this.f47044z);
        sb2.append(", webViewSettings=");
        sb2.append(this.A);
        sb2.append(", usePreloading=");
        sb2.append(this.B);
        sb2.append(", partialDownloadEnabled=");
        sb2.append(this.C);
        sb2.append(", maxDownloadRetryAttempts=");
        return a2.c.o(sb2, this.D, ')');
    }

    public final String a() {
        return this.f47026f;
    }
}
