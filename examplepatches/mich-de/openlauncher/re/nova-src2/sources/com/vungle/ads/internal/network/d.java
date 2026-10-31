package com.vungle.ads.internal.network;

import b.u4;
import h6.c1;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.LinkedHashMapSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class d {

    @NotNull
    public static final c Companion = new c();

    /* renamed from: a, reason: collision with root package name */
    public final g f47232a;

    /* renamed from: b, reason: collision with root package name */
    public final Map f47233b;

    /* renamed from: c, reason: collision with root package name */
    public final String f47234c;

    /* renamed from: d, reason: collision with root package name */
    public int f47235d;

    /* renamed from: e, reason: collision with root package name */
    public int f47236e;

    /* renamed from: f, reason: collision with root package name */
    public String f47237f;

    public /* synthetic */ d(int i5, g gVar, Map map, String str, int i11, int i12, String str2) {
        if (16 != (i5 & 16)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 16, b.f47226a.getDescriptor());
        }
        this.f47232a = (i5 & 1) == 0 ? g.GET : gVar;
        if ((i5 & 2) == 0) {
            this.f47233b = null;
        } else {
            this.f47233b = map;
        }
        if ((i5 & 4) == 0) {
            this.f47234c = null;
        } else {
            this.f47234c = str;
        }
        if ((i5 & 8) == 0) {
            this.f47235d = 0;
        } else {
            this.f47235d = i11;
        }
        this.f47236e = i12;
        if ((i5 & 32) == 0) {
            this.f47237f = null;
        } else {
            this.f47237f = str2;
        }
    }

    public static d a(d dVar, int i5) {
        g method = dVar.f47232a;
        Map map = dVar.f47233b;
        String str = dVar.f47234c;
        int i11 = dVar.f47236e;
        String str2 = dVar.f47237f;
        Intrinsics.g(method, "method");
        return new d(method, map, str, i5, i11, str2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return this.f47232a == dVar.f47232a && Intrinsics.b(this.f47233b, dVar.f47233b) && Intrinsics.b(this.f47234c, dVar.f47234c) && this.f47235d == dVar.f47235d && this.f47236e == dVar.f47236e && Intrinsics.b(this.f47237f, dVar.f47237f);
    }

    public final int hashCode() {
        int iHashCode = this.f47232a.hashCode() * 31;
        Map map = this.f47233b;
        int iHashCode2 = (iHashCode + (map == null ? 0 : map.hashCode())) * 31;
        String str = this.f47234c;
        int iA = u4.a(this.f47236e, u4.a(this.f47235d, (iHashCode2 + (str == null ? 0 : str.hashCode())) * 31, 31), 31);
        String str2 = this.f47237f;
        return iA + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("FailedTpat(method=");
        sbA.append(this.f47232a);
        sbA.append(", headers=");
        sbA.append(this.f47233b);
        sbA.append(", body=");
        sbA.append(this.f47234c);
        sbA.append(", retryAttempt=");
        sbA.append(this.f47235d);
        sbA.append(", retryCount=");
        sbA.append(this.f47236e);
        sbA.append(", tpatKey=");
        return c1.t(sbA, this.f47237f, ')');
    }

    public static final void a(d self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47232a != g.GET) {
            output.encodeSerializableElement(serialDesc, 0, e.f47239a, self.f47232a);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.f47233b != null) {
            StringSerializer stringSerializer = StringSerializer.INSTANCE;
            output.encodeNullableSerializableElement(serialDesc, 1, new LinkedHashMapSerializer(stringSerializer, stringSerializer), self.f47233b);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.f47234c != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, StringSerializer.INSTANCE, self.f47234c);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.f47235d != 0) {
            output.encodeIntElement(serialDesc, 3, self.f47235d);
        }
        output.encodeIntElement(serialDesc, 4, self.f47236e);
        if (!output.shouldEncodeElementDefault(serialDesc, 5) && self.f47237f == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 5, StringSerializer.INSTANCE, self.f47237f);
    }

    public d(g method, Map map, String str, int i5, int i11, String str2) {
        Intrinsics.g(method, "method");
        this.f47232a = method;
        this.f47233b = map;
        this.f47234c = str;
        this.f47235d = i5;
        this.f47236e = i11;
        this.f47237f = str2;
    }

    public final int a() {
        return this.f47235d;
    }
}
