package fr;

import b.c9;
import com.amplitude.eventbridge.EventBridgeChannel;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.annotation.Annotation;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;
import java.util.UUID;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.ranges.IntRange;
import kotlin.text.Charsets;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.PolymorphicSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.internal.LinkedHashMapSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.StringSerializer;
import kotlinx.serialization.json.JsonElement;
import org.jetbrains.annotations.NotNull;

@Serializable
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class g extends t0 {

    @NotNull
    public static final e Companion = new e();

    /* renamed from: l, reason: collision with root package name */
    public static final KSerializer[] f55611l;

    /* renamed from: a, reason: collision with root package name */
    public final String f55612a;

    /* renamed from: b, reason: collision with root package name */
    public final String f55613b;

    /* renamed from: c, reason: collision with root package name */
    public final String f55614c;

    /* renamed from: d, reason: collision with root package name */
    public final double f55615d;

    /* renamed from: e, reason: collision with root package name */
    public final JsonElement f55616e;

    /* renamed from: f, reason: collision with root package name */
    public final String f55617f;

    /* renamed from: g, reason: collision with root package name */
    public final Map f55618g;

    /* renamed from: h, reason: collision with root package name */
    public final r0 f55619h;

    /* renamed from: i, reason: collision with root package name */
    public final s0 f55620i;

    /* renamed from: j, reason: collision with root package name */
    public final Iterable f55621j;

    /* renamed from: k, reason: collision with root package name */
    public final String f55622k;

    static {
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        f55611l = new KSerializer[]{null, null, null, null, null, null, new LinkedHashMapSerializer(stringSerializer, stringSerializer), EnumsKt.createSimpleEnumSerializer("com.stripe.android.core.networking.StripeRequest.Method", r0.values()), EnumsKt.createSimpleEnumSerializer("com.stripe.android.core.networking.StripeRequest.MimeType", s0.values()), new PolymorphicSerializer(Reflection.f71864a.getOrCreateKotlinClass(Iterable.class), new Annotation[0]), null};
    }

    public g(String str, String str2, String str3, double d5, JsonElement jsonElement) {
        this.f55612a = str;
        this.f55613b = str2;
        this.f55614c = str3;
        this.f55615d = d5;
        this.f55616e = jsonElement;
        this.f55617f = h();
        s0 s0Var = s0.f55700b;
        this.f55618g = MapsKt.j0(new Pair("Content-Type", b.c0.k("application/x-www-form-urlencoded; charset=", Charsets.f72000b.name())), new Pair("origin", str3), new Pair("User-Agent", "Stripe/v1 android/22.7.0"));
        this.f55619h = r0.f55695c;
        this.f55620i = s0Var;
        this.f55621j = new IntRange(429, 429, 1);
        this.f55622k = "https://r.stripe.com/0";
    }

    public static String i(int i5, Map map) {
        String strI;
        StringBuilder sb2 = new StringBuilder("{\n");
        TreeMap treeMap = new TreeMap(new com.google.firebase.crashlytics.internal.persistence.c(4));
        treeMap.putAll(map);
        boolean z11 = true;
        for (Map.Entry entry : treeMap.entrySet()) {
            Object key = entry.getKey();
            Object value = entry.getValue();
            if (value instanceof Map) {
                strI = i(i5 + 1, (Map) value);
            } else if (value == null) {
                strI = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            } else {
                strI = "\"" + value + "\"";
            }
            if (!r70.k.U0(strI)) {
                if (z11) {
                    sb2.append(r70.j.D0(i5, "  "));
                    sb2.append("  \"" + key + "\": " + strI);
                    z11 = false;
                } else {
                    sb2.append(",\n");
                    sb2.append(r70.j.D0(i5, "  "));
                    sb2.append("  \"" + key + "\": " + strI);
                }
            }
        }
        sb2.append('\n');
        sb2.append(r70.j.D0(i5, "  "));
        sb2.append("}");
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    @Override // fr.t0
    public final Map a() {
        return this.f55618g;
    }

    @Override // fr.t0
    public final r0 b() {
        return this.f55619h;
    }

    @Override // fr.t0
    public final Iterable d() {
        return this.f55621j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return Intrinsics.b(this.f55612a, gVar.f55612a) && Intrinsics.b(this.f55613b, gVar.f55613b) && Intrinsics.b(this.f55614c, gVar.f55614c) && Double.compare(this.f55615d, gVar.f55615d) == 0 && Intrinsics.b(this.f55616e, gVar.f55616e);
    }

    @Override // fr.t0
    public final String f() {
        return this.f55622k;
    }

    @Override // fr.t0
    public final void g(OutputStream outputStream) throws IOException {
        byte[] bytes = this.f55617f.getBytes(Charsets.f72000b);
        Intrinsics.f(bytes, "getBytes(...)");
        outputStream.write(bytes);
        outputStream.flush();
    }

    public final String h() {
        LinkedHashMap linkedHashMapM0 = MapsKt.m0(u.g(this.f55616e), MapsKt.j0(new Pair("client_id", this.f55613b), new Pair("created", Double.valueOf(this.f55615d)), new Pair("event_name", this.f55612a), new Pair("event_id", UUID.randomUUID().toString())));
        ArrayList arrayList = new ArrayList();
        for (Map.Entry entry : u.a(linkedHashMapM0).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            if (value instanceof Map) {
                arrayList.add(new f(str, i(0, (Map) value)));
            } else {
                arrayList.add(new f(str, value.toString()));
            }
        }
        return b70.g.f1(arrayList, "&", null, null, 0, new f1.o0(11), 30);
    }

    public final int hashCode() {
        return this.f55616e.hashCode() + c9.c(this.f55615d, b.c0.e(b.c0.e(this.f55612a.hashCode() * 31, 31, this.f55613b), 31, this.f55614c), 31);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("AnalyticsRequestV2(eventName=", this.f55612a, ", clientId=", this.f55613b, ", origin=");
        sbW.append(this.f55614c);
        sbW.append(", created=");
        sbW.append(this.f55615d);
        sbW.append(", params=");
        sbW.append(this.f55616e);
        sbW.append(")");
        return sbW.toString();
    }

    public g(int i5, String str, String str2, String str3, double d5, JsonElement jsonElement, String str4, Map map, r0 r0Var, s0 s0Var, Iterable iterable, String str5) {
        if (31 != (i5 & 31)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 31, d.f55597a.getDescriptor());
        }
        this.f55612a = str;
        this.f55613b = str2;
        this.f55614c = str3;
        this.f55615d = d5;
        this.f55616e = jsonElement;
        if ((i5 & 32) == 0) {
            this.f55617f = h();
        } else {
            this.f55617f = str4;
        }
        if ((i5 & 64) == 0) {
            s0 s0Var2 = s0.f55700b;
            this.f55618g = MapsKt.j0(new Pair("Content-Type", b.c0.k("application/x-www-form-urlencoded; charset=", Charsets.f72000b.name())), new Pair("origin", str3), new Pair("User-Agent", "Stripe/v1 android/22.7.0"));
        } else {
            this.f55618g = map;
        }
        if ((i5 & 128) == 0) {
            this.f55619h = r0.f55695c;
        } else {
            this.f55619h = r0Var;
        }
        if ((i5 & 256) == 0) {
            this.f55620i = s0.f55700b;
        } else {
            this.f55620i = s0Var;
        }
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0) {
            this.f55621j = new IntRange(429, 429, 1);
        } else {
            this.f55621j = iterable;
        }
        if ((i5 & 1024) == 0) {
            this.f55622k = "https://r.stripe.com/0";
        } else {
            this.f55622k = str5;
        }
    }
}
