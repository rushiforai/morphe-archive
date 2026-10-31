package com.vungle.ads.internal.model;

import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class b3 {

    @NotNull
    public static final a3 Companion = new a3();

    /* renamed from: a, reason: collision with root package name */
    public boolean f46945a;

    /* renamed from: b, reason: collision with root package name */
    public String f46946b;

    /* renamed from: c, reason: collision with root package name */
    public Integer f46947c;

    /* renamed from: d, reason: collision with root package name */
    public float f46948d;

    /* renamed from: e, reason: collision with root package name */
    public String f46949e;

    /* renamed from: f, reason: collision with root package name */
    public int f46950f;

    /* renamed from: g, reason: collision with root package name */
    public String f46951g;

    /* renamed from: h, reason: collision with root package name */
    public String f46952h;

    /* renamed from: i, reason: collision with root package name */
    public String f46953i;

    /* renamed from: j, reason: collision with root package name */
    public String f46954j;

    /* renamed from: k, reason: collision with root package name */
    public String f46955k;

    /* renamed from: l, reason: collision with root package name */
    public float f46956l;

    /* renamed from: m, reason: collision with root package name */
    public int f46957m;
    public boolean n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f46958p;

    /* renamed from: q, reason: collision with root package name */
    public String f46959q;

    /* renamed from: r, reason: collision with root package name */
    public String f46960r;

    /* renamed from: s, reason: collision with root package name */
    public Long f46961s;

    /* renamed from: t, reason: collision with root package name */
    public Long f46962t;

    /* renamed from: u, reason: collision with root package name */
    public Long f46963u;

    /* renamed from: v, reason: collision with root package name */
    public Long f46964v;

    /* renamed from: w, reason: collision with root package name */
    public String f46965w;

    public /* synthetic */ b3(int i5, boolean z11, String str, Integer num, float f11, String str2, int i11, String str3, String str4, String str5, String str6, String str7, float f12, int i12, boolean z12, int i13, boolean z13, String str8, String str9, Long l9, Long l11, Long l12, Long l13, String str10) {
        if ((i5 & 1) == 0) {
            this.f46945a = false;
        } else {
            this.f46945a = z11;
        }
        if ((i5 & 2) == 0) {
            this.f46946b = null;
        } else {
            this.f46946b = str;
        }
        if ((i5 & 4) == 0) {
            this.f46947c = null;
        } else {
            this.f46947c = num;
        }
        if ((i5 & 8) == 0) {
            this.f46948d = 0.0f;
        } else {
            this.f46948d = f11;
        }
        if ((i5 & 16) == 0) {
            this.f46949e = null;
        } else {
            this.f46949e = str2;
        }
        if ((i5 & 32) == 0) {
            this.f46950f = 0;
        } else {
            this.f46950f = i11;
        }
        if ((i5 & 64) == 0) {
            this.f46951g = null;
        } else {
            this.f46951g = str3;
        }
        if ((i5 & 128) == 0) {
            this.f46952h = null;
        } else {
            this.f46952h = str4;
        }
        if ((i5 & 256) == 0) {
            this.f46953i = null;
        } else {
            this.f46953i = str5;
        }
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0) {
            this.f46954j = null;
        } else {
            this.f46954j = str6;
        }
        if ((i5 & 1024) == 0) {
            this.f46955k = null;
        } else {
            this.f46955k = str7;
        }
        if ((i5 & 2048) == 0) {
            this.f46956l = 0.0f;
        } else {
            this.f46956l = f12;
        }
        if ((i5 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) == 0) {
            this.f46957m = 1;
        } else {
            this.f46957m = i12;
        }
        if ((i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) == 0) {
            this.n = false;
        } else {
            this.n = z12;
        }
        if ((i5 & ReaderJsonLexerKt.BATCH_SIZE) == 0) {
            this.o = 1;
        } else {
            this.o = i13;
        }
        if ((32768 & i5) == 0) {
            this.f46958p = false;
        } else {
            this.f46958p = z13;
        }
        if ((65536 & i5) == 0) {
            this.f46959q = null;
        } else {
            this.f46959q = str8;
        }
        if ((131072 & i5) == 0) {
            this.f46960r = null;
        } else {
            this.f46960r = str9;
        }
        if ((262144 & i5) == 0) {
            this.f46961s = null;
        } else {
            this.f46961s = l9;
        }
        if ((524288 & i5) == 0) {
            this.f46962t = null;
        } else {
            this.f46962t = l11;
        }
        if ((1048576 & i5) == 0) {
            this.f46963u = null;
        } else {
            this.f46963u = l12;
        }
        if ((2097152 & i5) == 0) {
            this.f46964v = null;
        } else {
            this.f46964v = l13;
        }
        if ((i5 & 4194304) == 0) {
            this.f46965w = null;
        } else {
            this.f46965w = str10;
        }
    }

    public static final void a(b3 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Float fValueOf = Float.valueOf(0.0f);
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f46945a) {
            output.encodeBooleanElement(serialDesc, 0, self.f46945a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f46946b != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.f46946b);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.f46947c != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, IntSerializer.INSTANCE, self.f46947c);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || !Float.valueOf(self.f46948d).equals(fValueOf)) {
            output.encodeFloatElement(serialDesc, 3, self.f46948d);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.f46949e != null) {
            output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.f46949e);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || self.f46950f != 0) {
            output.encodeIntElement(serialDesc, 5, self.f46950f);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 6) || self.f46951g != null) {
            output.encodeNullableSerializableElement(serialDesc, 6, StringSerializer.INSTANCE, self.f46951g);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 7) || self.f46952h != null) {
            output.encodeNullableSerializableElement(serialDesc, 7, StringSerializer.INSTANCE, self.f46952h);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 8) || self.f46953i != null) {
            output.encodeNullableSerializableElement(serialDesc, 8, StringSerializer.INSTANCE, self.f46953i);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 9) || self.f46954j != null) {
            output.encodeNullableSerializableElement(serialDesc, 9, StringSerializer.INSTANCE, self.f46954j);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 10) || self.f46955k != null) {
            output.encodeNullableSerializableElement(serialDesc, 10, StringSerializer.INSTANCE, self.f46955k);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 11) || !Float.valueOf(self.f46956l).equals(fValueOf)) {
            output.encodeFloatElement(serialDesc, 11, self.f46956l);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 12) || self.f46957m != 1) {
            output.encodeIntElement(serialDesc, 12, self.f46957m);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 13) || self.n) {
            output.encodeBooleanElement(serialDesc, 13, self.n);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 14) || self.o != 1) {
            output.encodeIntElement(serialDesc, 14, self.o);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 15) || self.f46958p) {
            output.encodeBooleanElement(serialDesc, 15, self.f46958p);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 16) || self.f46959q != null) {
            output.encodeNullableSerializableElement(serialDesc, 16, StringSerializer.INSTANCE, self.f46959q);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 17) || self.f46960r != null) {
            output.encodeNullableSerializableElement(serialDesc, 17, StringSerializer.INSTANCE, self.f46960r);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 18) || self.f46961s != null) {
            output.encodeNullableSerializableElement(serialDesc, 18, LongSerializer.INSTANCE, self.f46961s);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 19) || self.f46962t != null) {
            output.encodeNullableSerializableElement(serialDesc, 19, LongSerializer.INSTANCE, self.f46962t);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 20) || self.f46963u != null) {
            output.encodeNullableSerializableElement(serialDesc, 20, LongSerializer.INSTANCE, self.f46963u);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 21) || self.f46964v != null) {
            output.encodeNullableSerializableElement(serialDesc, 21, LongSerializer.INSTANCE, self.f46964v);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 22) && self.f46965w == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 22, StringSerializer.INSTANCE, self.f46965w);
    }

    public final void b(String str) {
        this.f46946b = str;
    }

    public final void c(String str) {
        this.f46949e = str;
    }

    public final void d(String str) {
        this.f46951g = str;
    }

    public final void e(String str) {
        this.f46952h = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b3)) {
            return false;
        }
        b3 b3Var = (b3) obj;
        return this.f46945a == b3Var.f46945a && Intrinsics.b(this.f46946b, b3Var.f46946b) && Intrinsics.b(this.f46947c, b3Var.f46947c) && Float.valueOf(this.f46948d).equals(Float.valueOf(b3Var.f46948d)) && Intrinsics.b(this.f46949e, b3Var.f46949e) && this.f46950f == b3Var.f46950f && Intrinsics.b(this.f46951g, b3Var.f46951g) && Intrinsics.b(this.f46952h, b3Var.f46952h) && Intrinsics.b(this.f46953i, b3Var.f46953i) && Intrinsics.b(this.f46954j, b3Var.f46954j) && Intrinsics.b(this.f46955k, b3Var.f46955k) && Float.valueOf(this.f46956l).equals(Float.valueOf(b3Var.f46956l)) && this.f46957m == b3Var.f46957m && this.n == b3Var.n && this.o == b3Var.o && this.f46958p == b3Var.f46958p && Intrinsics.b(this.f46959q, b3Var.f46959q) && Intrinsics.b(this.f46960r, b3Var.f46960r) && Intrinsics.b(this.f46961s, b3Var.f46961s) && Intrinsics.b(this.f46962t, b3Var.f46962t) && Intrinsics.b(this.f46963u, b3Var.f46963u) && Intrinsics.b(this.f46964v, b3Var.f46964v) && Intrinsics.b(this.f46965w, b3Var.f46965w);
    }

    public final void f(String str) {
        this.f46959q = str;
    }

    public final void g(String str) {
        this.f46965w = str;
    }

    public final void h(String str) {
        this.f46954j = str;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [int] */
    /* JADX WARN: Type inference failed for: r0v41 */
    /* JADX WARN: Type inference failed for: r0v42 */
    /* JADX WARN: Type inference failed for: r3v28, types: [boolean] */
    public final int hashCode() {
        boolean z11 = this.f46945a;
        ?? r02 = z11;
        if (z11) {
            r02 = 1;
        }
        int i5 = r02 * 31;
        String str = this.f46946b;
        int iHashCode = (i5 + (str == null ? 0 : str.hashCode())) * 31;
        Integer num = this.f46947c;
        int iD = a80.m.d(this.f46948d, (iHashCode + (num == null ? 0 : num.hashCode())) * 31, 31);
        String str2 = this.f46949e;
        int iA = u4.a(this.f46950f, (iD + (str2 == null ? 0 : str2.hashCode())) * 31, 31);
        String str3 = this.f46951g;
        int iHashCode2 = (iA + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f46952h;
        int iHashCode3 = (iHashCode2 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f46953i;
        int iHashCode4 = (iHashCode3 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.f46954j;
        int iHashCode5 = (iHashCode4 + (str6 == null ? 0 : str6.hashCode())) * 31;
        String str7 = this.f46955k;
        int iA2 = u4.a(this.f46957m, a80.m.d(this.f46956l, (iHashCode5 + (str7 == null ? 0 : str7.hashCode())) * 31, 31), 31);
        ?? r32 = this.n;
        int i11 = r32;
        if (r32 != 0) {
            i11 = 1;
        }
        int iA3 = u4.a(this.o, (iA2 + i11) * 31, 31);
        boolean z12 = this.f46958p;
        int i12 = (iA3 + (z12 ? 1 : z12 ? 1 : 0)) * 31;
        String str8 = this.f46959q;
        int iHashCode6 = (i12 + (str8 == null ? 0 : str8.hashCode())) * 31;
        String str9 = this.f46960r;
        int iHashCode7 = (iHashCode6 + (str9 == null ? 0 : str9.hashCode())) * 31;
        Long l9 = this.f46961s;
        int iHashCode8 = (iHashCode7 + (l9 == null ? 0 : l9.hashCode())) * 31;
        Long l11 = this.f46962t;
        int iHashCode9 = (iHashCode8 + (l11 == null ? 0 : l11.hashCode())) * 31;
        Long l12 = this.f46963u;
        int iHashCode10 = (iHashCode9 + (l12 == null ? 0 : l12.hashCode())) * 31;
        Long l13 = this.f46964v;
        int iHashCode11 = (iHashCode10 + (l13 == null ? 0 : l13.hashCode())) * 31;
        String str10 = this.f46965w;
        return iHashCode11 + (str10 != null ? str10.hashCode() : 0);
    }

    public final void i(String str) {
        this.f46953i = str;
    }

    public final void j(String str) {
        this.f46955k = str;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("VungleExt(isGooglePlayServicesAvailable=");
        sb2.append(this.f46945a);
        sb2.append(", appSetId=");
        sb2.append(this.f46946b);
        sb2.append(", appSetIdScope=");
        sb2.append(this.f46947c);
        sb2.append(", batteryLevel=");
        sb2.append(this.f46948d);
        sb2.append(", batteryState=");
        sb2.append(this.f46949e);
        sb2.append(", batterySaverEnabled=");
        sb2.append(this.f46950f);
        sb2.append(", connectionType=");
        sb2.append(this.f46951g);
        sb2.append(", connectionTypeDetail=");
        sb2.append(this.f46952h);
        sb2.append(", locale=");
        sb2.append(this.f46953i);
        sb2.append(", language=");
        sb2.append(this.f46954j);
        sb2.append(", timeZone=");
        sb2.append(this.f46955k);
        sb2.append(", volumeLevel=");
        sb2.append(this.f46956l);
        sb2.append(", soundEnabled=");
        sb2.append(this.f46957m);
        sb2.append(", isTv=");
        sb2.append(this.n);
        sb2.append(", sdCardAvailable=");
        sb2.append(this.o);
        sb2.append(", isSideloadEnabled=");
        sb2.append(this.f46958p);
        sb2.append(", gaid=");
        sb2.append(this.f46959q);
        sb2.append(", amazonAdvertisingId=");
        sb2.append(this.f46960r);
        sb2.append(", sit=");
        sb2.append(this.f46961s);
        sb2.append(", oit=");
        sb2.append(this.f46962t);
        sb2.append(", ort=");
        sb2.append(this.f46963u);
        sb2.append(", obt=");
        sb2.append(this.f46964v);
        sb2.append(", gpVersion=");
        return h6.c1.t(sb2, this.f46965w, ')');
    }

    public b3(boolean z11, String str, Integer num, float f11, String str2, int i5, String str3, String str4, String str5, String str6, String str7, float f12, int i11, boolean z12, int i12, boolean z13, String str8, String str9, Long l9, Long l11, Long l12, Long l13, String str10) {
        this.f46945a = z11;
        this.f46946b = str;
        this.f46947c = num;
        this.f46948d = f11;
        this.f46949e = str2;
        this.f46950f = i5;
        this.f46951g = str3;
        this.f46952h = str4;
        this.f46953i = str5;
        this.f46954j = str6;
        this.f46955k = str7;
        this.f46956l = f12;
        this.f46957m = i11;
        this.n = z12;
        this.o = i12;
        this.f46958p = z13;
        this.f46959q = str8;
        this.f46960r = str9;
        this.f46961s = l9;
        this.f46962t = l11;
        this.f46963u = l12;
        this.f46964v = l13;
        this.f46965w = str10;
    }

    public final void b(float f11) {
        this.f46956l = f11;
    }

    public final void c(int i5) {
        this.f46957m = i5;
    }

    public final void d(Long l9) {
        this.f46961s = l9;
    }

    public final void b(boolean z11) {
        this.n = z11;
    }

    public final void c(Long l9) {
        this.f46963u = l9;
    }

    public final void b(int i5) {
        this.o = i5;
    }

    public final void b(Long l9) {
        this.f46962t = l9;
    }

    public final void a(boolean z11) {
        this.f46945a = z11;
    }

    public final void a(Integer num) {
        this.f46947c = num;
    }

    public final void a(float f11) {
        this.f46948d = f11;
    }

    public final void a(int i5) {
        this.f46950f = i5;
    }

    public final void a() {
        this.f46958p = false;
    }

    public final void a(String str) {
        this.f46960r = str;
    }

    public final void a(Long l9) {
        this.f46964v = l9;
    }

    public /* synthetic */ b3() {
        this(false, null, null, 0.0f, null, 0, null, null, null, null, null, 0.0f, 1, false, 1, false, null, null, null, null, null, null, null);
    }
}
