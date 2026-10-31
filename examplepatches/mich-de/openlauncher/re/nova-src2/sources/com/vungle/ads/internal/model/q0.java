package com.vungle.ads.internal.model;

import android.util.Base64;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.zip.GZIPInputStream;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializersKt;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class q0 {

    @NotNull
    public static final p0 Companion = new p0();

    /* renamed from: a, reason: collision with root package name */
    public final Integer f47119a;

    /* renamed from: b, reason: collision with root package name */
    public final String f47120b;

    /* renamed from: c, reason: collision with root package name */
    public final List f47121c;

    /* renamed from: d, reason: collision with root package name */
    public final Json f47122d;

    /* renamed from: e, reason: collision with root package name */
    public final i0 f47123e;

    public /* synthetic */ q0(int i5, Integer num, String str, List list, i0 i0Var) {
        String strB;
        i0 i0Var2 = null;
        if ((i5 & 1) == 0) {
            this.f47119a = null;
        } else {
            this.f47119a = num;
        }
        if ((i5 & 2) == 0) {
            this.f47120b = null;
        } else {
            this.f47120b = str;
        }
        if ((i5 & 4) == 0) {
            this.f47121c = null;
        } else {
            this.f47121c = list;
        }
        Json jsonJson$default = JsonKt.Json$default(null, o0.f47105a, 1, null);
        this.f47122d = jsonJson$default;
        if ((i5 & 8) != 0) {
            this.f47123e = i0Var;
            return;
        }
        if (this.f47120b != null && (strB = b()) != null) {
            KSerializer<Object> kSerializerSerializer = SerializersKt.serializer(jsonJson$default.getSerializersModule(), Reflection.b(i0.class));
            Intrinsics.e(kSerializerSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<T of kotlinx.serialization.internal.Platform_commonKt.cast>");
            i0Var2 = (i0) jsonJson$default.decodeFromString(kSerializerSerializer, strB);
        }
        this.f47123e = i0Var2;
    }

    public static final void a(q0 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        i0 i0Var;
        String strB;
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47119a != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, IntSerializer.INSTANCE, self.f47119a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f47120b != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.f47120b);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.f47121c != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, new ArrayListSerializer(StringSerializer.INSTANCE), self.f47121c);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 3)) {
            i0 i0Var2 = self.f47123e;
            if (self.f47120b == null || (strB = self.b()) == null) {
                i0Var = null;
            } else {
                Json json = self.f47122d;
                KSerializer<Object> kSerializerSerializer = SerializersKt.serializer(json.getSerializersModule(), Reflection.b(i0.class));
                Intrinsics.e(kSerializerSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<T of kotlinx.serialization.internal.Platform_commonKt.cast>");
                i0Var = (i0) json.decodeFromString(kSerializerSerializer, strB);
            }
            if (Intrinsics.b(i0Var2, i0Var)) {
                return;
            }
        }
        output.encodeNullableSerializableElement(serialDesc, 3, c.f46966a, self.f47123e);
    }

    public final String b() throws IOException {
        byte[] bArrDecode = Base64.decode(this.f47120b, 0);
        if (bArrDecode == null) {
            return null;
        }
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArrDecode);
        try {
            GZIPInputStream gZIPInputStream = new GZIPInputStream(byteArrayInputStream, 1024);
            try {
                byte[] bArr = new byte[1024];
                while (true) {
                    int i5 = gZIPInputStream.read(bArr);
                    if (i5 == -1) {
                        Unit unit = Unit.f71706a;
                        gZIPInputStream.close();
                        byteArrayInputStream.close();
                        String string = byteArrayOutputStream.toString();
                        Intrinsics.f(string, "result.toString()");
                        return string;
                    }
                    byteArrayOutputStream.write(bArr, 0, i5);
                }
            } finally {
            }
        } finally {
        }
    }

    public final Integer c() {
        return this.f47119a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q0)) {
            return false;
        }
        q0 q0Var = (q0) obj;
        return Intrinsics.b(this.f47119a, q0Var.f47119a) && Intrinsics.b(this.f47120b, q0Var.f47120b) && Intrinsics.b(this.f47121c, q0Var.f47121c);
    }

    public final int hashCode() {
        Integer num = this.f47119a;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        String str = this.f47120b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        List list = this.f47121c;
        return iHashCode2 + (list != null ? list.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("BidPayload(version=");
        sbA.append(this.f47119a);
        sbA.append(", adunit=");
        sbA.append(this.f47120b);
        sbA.append(", impression=");
        return fq.c.e(sbA, this.f47121c, ')');
    }

    public final i0 a() {
        return this.f47123e;
    }
}
