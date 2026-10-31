package com.vungle.ads.internal.model;

import b.c9;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.util.List;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.LinkedHashMapSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class w2 {

    @NotNull
    public static final c2 Companion = new c2();

    /* renamed from: a, reason: collision with root package name */
    public final b2 f47175a;

    /* renamed from: b, reason: collision with root package name */
    public final f2 f47176b;

    /* renamed from: c, reason: collision with root package name */
    public final i2 f47177c;

    /* renamed from: d, reason: collision with root package name */
    public final s2 f47178d;

    /* renamed from: e, reason: collision with root package name */
    public final List f47179e;

    /* renamed from: f, reason: collision with root package name */
    public final v2 f47180f;

    /* renamed from: g, reason: collision with root package name */
    public final String f47181g;

    /* renamed from: h, reason: collision with root package name */
    public final Boolean f47182h;

    /* renamed from: i, reason: collision with root package name */
    public final Boolean f47183i;

    /* renamed from: j, reason: collision with root package name */
    public final Integer f47184j;

    /* renamed from: k, reason: collision with root package name */
    public final Boolean f47185k;

    /* renamed from: l, reason: collision with root package name */
    public final Integer f47186l;

    /* renamed from: m, reason: collision with root package name */
    public final Boolean f47187m;
    public final Boolean n;
    public final Boolean o;

    /* renamed from: p, reason: collision with root package name */
    public Long f47188p;

    /* renamed from: q, reason: collision with root package name */
    public y1 f47189q;

    /* renamed from: r, reason: collision with root package name */
    public Boolean f47190r;

    /* renamed from: s, reason: collision with root package name */
    public final Boolean f47191s;

    /* renamed from: t, reason: collision with root package name */
    public final Map f47192t;

    public /* synthetic */ w2(int i5, b2 b2Var, f2 f2Var, i2 i2Var, s2 s2Var, List list, v2 v2Var, String str, Boolean bool, Boolean bool2, Integer num, Boolean bool3, Integer num2, Boolean bool4, Boolean bool5, Boolean bool6, Long l9, y1 y1Var, Boolean bool7, Boolean bool8, Map map) {
        if ((i5 & 1) == 0) {
            this.f47175a = null;
        } else {
            this.f47175a = b2Var;
        }
        if ((i5 & 2) == 0) {
            this.f47176b = null;
        } else {
            this.f47176b = f2Var;
        }
        if ((i5 & 4) == 0) {
            this.f47177c = null;
        } else {
            this.f47177c = i2Var;
        }
        if ((i5 & 8) == 0) {
            this.f47178d = null;
        } else {
            this.f47178d = s2Var;
        }
        if ((i5 & 16) == 0) {
            this.f47179e = null;
        } else {
            this.f47179e = list;
        }
        if ((i5 & 32) == 0) {
            this.f47180f = null;
        } else {
            this.f47180f = v2Var;
        }
        if ((i5 & 64) == 0) {
            this.f47181g = null;
        } else {
            this.f47181g = str;
        }
        if ((i5 & 128) == 0) {
            this.f47182h = Boolean.TRUE;
        } else {
            this.f47182h = bool;
        }
        if ((i5 & 256) == 0) {
            this.f47183i = null;
        } else {
            this.f47183i = bool2;
        }
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0) {
            this.f47184j = null;
        } else {
            this.f47184j = num;
        }
        if ((i5 & 1024) == 0) {
            this.f47185k = null;
        } else {
            this.f47185k = bool3;
        }
        if ((i5 & 2048) == 0) {
            this.f47186l = null;
        } else {
            this.f47186l = num2;
        }
        if ((i5 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) == 0) {
            this.f47187m = null;
        } else {
            this.f47187m = bool4;
        }
        if ((i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) == 0) {
            this.n = null;
        } else {
            this.n = bool5;
        }
        if ((i5 & ReaderJsonLexerKt.BATCH_SIZE) == 0) {
            this.o = null;
        } else {
            this.o = bool6;
        }
        if ((32768 & i5) == 0) {
            this.f47188p = null;
        } else {
            this.f47188p = l9;
        }
        if ((65536 & i5) == 0) {
            this.f47189q = null;
        } else {
            this.f47189q = y1Var;
        }
        if ((131072 & i5) == 0) {
            this.f47190r = null;
        } else {
            this.f47190r = bool7;
        }
        if ((262144 & i5) == 0) {
            this.f47191s = null;
        } else {
            this.f47191s = bool8;
        }
        if ((i5 & 524288) == 0) {
            this.f47192t = null;
        } else {
            this.f47192t = map;
        }
    }

    public static final void a(w2 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47175a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, z1.f47203a, self.f47175a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f47176b != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, d2.f46992a, self.f47176b);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.f47177c != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, g2.f47010a, self.f47177c);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.f47178d != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, q2.f47131a, self.f47178d);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.f47179e != null) {
            output.encodeNullableSerializableElement(serialDesc, 4, new ArrayListSerializer(h3.f47019a), self.f47179e);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || self.f47180f != null) {
            output.encodeNullableSerializableElement(serialDesc, 5, t2.f47155a, self.f47180f);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 6) || self.f47181g != null) {
            output.encodeNullableSerializableElement(serialDesc, 6, StringSerializer.INSTANCE, self.f47181g);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 7) || !Intrinsics.b(self.f47182h, Boolean.TRUE)) {
            output.encodeNullableSerializableElement(serialDesc, 7, BooleanSerializer.INSTANCE, self.f47182h);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 8) || self.f47183i != null) {
            output.encodeNullableSerializableElement(serialDesc, 8, BooleanSerializer.INSTANCE, self.f47183i);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 9) || self.f47184j != null) {
            output.encodeNullableSerializableElement(serialDesc, 9, IntSerializer.INSTANCE, self.f47184j);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 10) || self.f47185k != null) {
            output.encodeNullableSerializableElement(serialDesc, 10, BooleanSerializer.INSTANCE, self.f47185k);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 11) || self.f47186l != null) {
            output.encodeNullableSerializableElement(serialDesc, 11, IntSerializer.INSTANCE, self.f47186l);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 12) || self.f47187m != null) {
            output.encodeNullableSerializableElement(serialDesc, 12, BooleanSerializer.INSTANCE, self.f47187m);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 13) || self.n != null) {
            output.encodeNullableSerializableElement(serialDesc, 13, BooleanSerializer.INSTANCE, self.n);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 14) || self.o != null) {
            output.encodeNullableSerializableElement(serialDesc, 14, BooleanSerializer.INSTANCE, self.o);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 15) || self.f47188p != null) {
            output.encodeNullableSerializableElement(serialDesc, 15, LongSerializer.INSTANCE, self.f47188p);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 16) || self.f47189q != null) {
            output.encodeNullableSerializableElement(serialDesc, 16, w1.f47173a, self.f47189q);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 17) || self.f47190r != null) {
            output.encodeNullableSerializableElement(serialDesc, 17, BooleanSerializer.INSTANCE, self.f47190r);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 18) || self.f47191s != null) {
            output.encodeNullableSerializableElement(serialDesc, 18, BooleanSerializer.INSTANCE, self.f47191s);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 19) && self.f47192t == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 19, new LinkedHashMapSerializer(StringSerializer.INSTANCE, IntSerializer.INSTANCE), self.f47192t);
    }

    public final f2 b() {
        return this.f47176b;
    }

    public final i2 c() {
        return this.f47177c;
    }

    public final List d() {
        return this.f47179e;
    }

    public final Map e() {
        return this.f47192t;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w2)) {
            return false;
        }
        w2 w2Var = (w2) obj;
        return Intrinsics.b(this.f47175a, w2Var.f47175a) && Intrinsics.b(this.f47176b, w2Var.f47176b) && Intrinsics.b(this.f47177c, w2Var.f47177c) && Intrinsics.b(this.f47178d, w2Var.f47178d) && Intrinsics.b(this.f47179e, w2Var.f47179e) && Intrinsics.b(this.f47180f, w2Var.f47180f) && Intrinsics.b(this.f47181g, w2Var.f47181g) && Intrinsics.b(this.f47182h, w2Var.f47182h) && Intrinsics.b(this.f47183i, w2Var.f47183i) && Intrinsics.b(this.f47184j, w2Var.f47184j) && Intrinsics.b(this.f47185k, w2Var.f47185k) && Intrinsics.b(this.f47186l, w2Var.f47186l) && Intrinsics.b(this.f47187m, w2Var.f47187m) && Intrinsics.b(this.n, w2Var.n) && Intrinsics.b(this.o, w2Var.o) && Intrinsics.b(this.f47188p, w2Var.f47188p) && Intrinsics.b(this.f47189q, w2Var.f47189q) && Intrinsics.b(this.f47190r, w2Var.f47190r) && Intrinsics.b(this.f47191s, w2Var.f47191s) && Intrinsics.b(this.f47192t, w2Var.f47192t);
    }

    public final int hashCode() {
        b2 b2Var = this.f47175a;
        int iHashCode = (b2Var == null ? 0 : b2Var.hashCode()) * 31;
        f2 f2Var = this.f47176b;
        int iHashCode2 = (iHashCode + (f2Var == null ? 0 : f2Var.hashCode())) * 31;
        i2 i2Var = this.f47177c;
        int iHashCode3 = (iHashCode2 + (i2Var == null ? 0 : i2Var.hashCode())) * 31;
        s2 s2Var = this.f47178d;
        int iHashCode4 = (iHashCode3 + (s2Var == null ? 0 : s2Var.hashCode())) * 31;
        List list = this.f47179e;
        int iHashCode5 = (iHashCode4 + (list == null ? 0 : list.hashCode())) * 31;
        v2 v2Var = this.f47180f;
        int iHashCode6 = (iHashCode5 + (v2Var == null ? 0 : v2Var.hashCode())) * 31;
        String str = this.f47181g;
        int iHashCode7 = (iHashCode6 + (str == null ? 0 : str.hashCode())) * 31;
        Boolean bool = this.f47182h;
        int iHashCode8 = (iHashCode7 + (bool == null ? 0 : bool.hashCode())) * 31;
        Boolean bool2 = this.f47183i;
        int iHashCode9 = (iHashCode8 + (bool2 == null ? 0 : bool2.hashCode())) * 31;
        Integer num = this.f47184j;
        int iHashCode10 = (iHashCode9 + (num == null ? 0 : num.hashCode())) * 31;
        Boolean bool3 = this.f47185k;
        int iHashCode11 = (iHashCode10 + (bool3 == null ? 0 : bool3.hashCode())) * 31;
        Integer num2 = this.f47186l;
        int iHashCode12 = (iHashCode11 + (num2 == null ? 0 : num2.hashCode())) * 31;
        Boolean bool4 = this.f47187m;
        int iHashCode13 = (iHashCode12 + (bool4 == null ? 0 : bool4.hashCode())) * 31;
        Boolean bool5 = this.n;
        int iHashCode14 = (iHashCode13 + (bool5 == null ? 0 : bool5.hashCode())) * 31;
        Boolean bool6 = this.o;
        int iHashCode15 = (iHashCode14 + (bool6 == null ? 0 : bool6.hashCode())) * 31;
        Long l9 = this.f47188p;
        int iHashCode16 = (iHashCode15 + (l9 == null ? 0 : l9.hashCode())) * 31;
        y1 y1Var = this.f47189q;
        int iHashCode17 = (iHashCode16 + (y1Var == null ? 0 : y1Var.hashCode())) * 31;
        Boolean bool7 = this.f47190r;
        int iHashCode18 = (iHashCode17 + (bool7 == null ? 0 : bool7.hashCode())) * 31;
        Boolean bool8 = this.f47191s;
        int iHashCode19 = (iHashCode18 + (bool8 == null ? 0 : bool8.hashCode())) * 31;
        Map map = this.f47192t;
        return iHashCode19 + (map != null ? map.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ConfigPayload(cleverCache=");
        sb2.append(this.f47175a);
        sb2.append(", configSettings=");
        sb2.append(this.f47176b);
        sb2.append(", endpoints=");
        sb2.append(this.f47177c);
        sb2.append(", logMetricsSettings=");
        sb2.append(this.f47178d);
        sb2.append(", placements=");
        sb2.append(this.f47179e);
        sb2.append(", userPrivacy=");
        sb2.append(this.f47180f);
        sb2.append(", configExtension=");
        sb2.append(this.f47181g);
        sb2.append(", disableAdId=");
        sb2.append(this.f47182h);
        sb2.append(", isReportIncentivizedEnabled=");
        sb2.append(this.f47183i);
        sb2.append(", sessionTimeout=");
        sb2.append(this.f47184j);
        sb2.append(", waitForConnectivityForTPAT=");
        sb2.append(this.f47185k);
        sb2.append(", signalSessionTimeout=");
        sb2.append(this.f47186l);
        sb2.append(", signalsDisabled=");
        sb2.append(this.f47187m);
        sb2.append(", fpdEnabled=");
        sb2.append(this.n);
        sb2.append(", rtaDebugging=");
        sb2.append(this.o);
        sb2.append(", configLastValidatedTimestamp=");
        sb2.append(this.f47188p);
        sb2.append(", autoRedirect=");
        sb2.append(this.f47189q);
        sb2.append(", enableOT=");
        sb2.append(this.f47190r);
        sb2.append(", prewarmWebView=");
        sb2.append(this.f47191s);
        sb2.append(", vmTemplates=");
        return c9.l(sb2, this.f47192t, ')');
    }

    public final String a() {
        return this.f47181g;
    }
}
