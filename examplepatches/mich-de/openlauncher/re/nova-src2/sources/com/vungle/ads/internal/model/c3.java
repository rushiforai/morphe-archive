package com.vungle.ads.internal.model;

import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class c3 {

    @NotNull
    public static final y2 Companion = new y2();

    /* renamed from: a, reason: collision with root package name */
    public final String f46970a;

    /* renamed from: b, reason: collision with root package name */
    public final String f46971b;

    /* renamed from: c, reason: collision with root package name */
    public final String f46972c;

    /* renamed from: d, reason: collision with root package name */
    public final String f46973d;

    /* renamed from: e, reason: collision with root package name */
    public final String f46974e;

    /* renamed from: f, reason: collision with root package name */
    public int f46975f;

    /* renamed from: g, reason: collision with root package name */
    public int f46976g;

    /* renamed from: h, reason: collision with root package name */
    public String f46977h;

    /* renamed from: i, reason: collision with root package name */
    public String f46978i;

    /* renamed from: j, reason: collision with root package name */
    public Integer f46979j;

    /* renamed from: k, reason: collision with root package name */
    public b3 f46980k;

    public /* synthetic */ c3(int i5, String str, String str2, String str3, String str4, String str5, int i11, int i12, String str6, String str7, Integer num, b3 b3Var) {
        if (119 != (i5 & Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE)) {
            PluginExceptionsKt.throwMissingFieldException(i5, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE, x2.f47196a.getDescriptor());
        }
        this.f46970a = str;
        this.f46971b = str2;
        this.f46972c = str3;
        if ((i5 & 8) == 0) {
            this.f46973d = null;
        } else {
            this.f46973d = str4;
        }
        this.f46974e = str5;
        this.f46975f = i11;
        this.f46976g = i12;
        if ((i5 & 128) == 0) {
            this.f46977h = null;
        } else {
            this.f46977h = str6;
        }
        if ((i5 & 256) == 0) {
            this.f46978i = null;
        } else {
            this.f46978i = str7;
        }
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0) {
            this.f46979j = null;
        } else {
            this.f46979j = num;
        }
        if ((i5 & 1024) == 0) {
            this.f46980k = null;
        } else {
            this.f46980k = b3Var;
        }
    }

    public static c3 a(c3 c3Var) {
        String make = c3Var.f46970a;
        String model = c3Var.f46971b;
        String osv = c3Var.f46972c;
        String str = c3Var.f46973d;
        String os2 = c3Var.f46974e;
        int i5 = c3Var.f46975f;
        int i11 = c3Var.f46976g;
        String str2 = c3Var.f46977h;
        String str3 = c3Var.f46978i;
        Integer num = c3Var.f46979j;
        b3 b3Var = c3Var.f46980k;
        Intrinsics.g(make, "make");
        Intrinsics.g(model, "model");
        Intrinsics.g(osv, "osv");
        Intrinsics.g(os2, "os");
        return new c3(make, model, osv, str, os2, i5, i11, str2, str3, num, b3Var);
    }

    public final void b(int i5) {
        this.f46975f = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c3)) {
            return false;
        }
        c3 c3Var = (c3) obj;
        return Intrinsics.b(this.f46970a, c3Var.f46970a) && Intrinsics.b(this.f46971b, c3Var.f46971b) && Intrinsics.b(this.f46972c, c3Var.f46972c) && Intrinsics.b(this.f46973d, c3Var.f46973d) && Intrinsics.b(this.f46974e, c3Var.f46974e) && this.f46975f == c3Var.f46975f && this.f46976g == c3Var.f46976g && Intrinsics.b(this.f46977h, c3Var.f46977h) && Intrinsics.b(this.f46978i, c3Var.f46978i) && Intrinsics.b(this.f46979j, c3Var.f46979j) && Intrinsics.b(this.f46980k, c3Var.f46980k);
    }

    public final int hashCode() {
        int iE = b.c0.e(b.c0.e(this.f46970a.hashCode() * 31, 31, this.f46971b), 31, this.f46972c);
        String str = this.f46973d;
        int iA = u4.a(this.f46976g, u4.a(this.f46975f, b.c0.e((iE + (str == null ? 0 : str.hashCode())) * 31, 31, this.f46974e), 31), 31);
        String str2 = this.f46977h;
        int iHashCode = (iA + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f46978i;
        int iHashCode2 = (iHashCode + (str3 == null ? 0 : str3.hashCode())) * 31;
        Integer num = this.f46979j;
        int iHashCode3 = (iHashCode2 + (num == null ? 0 : num.hashCode())) * 31;
        b3 b3Var = this.f46980k;
        return iHashCode3 + (b3Var != null ? b3Var.hashCode() : 0);
    }

    public final String toString() {
        return "DeviceNode(make=" + this.f46970a + ", model=" + this.f46971b + ", osv=" + this.f46972c + ", carrier=" + this.f46973d + ", os=" + this.f46974e + ", w=" + this.f46975f + ", h=" + this.f46976g + ", ua=" + this.f46977h + ", ifa=" + this.f46978i + ", lmt=" + this.f46979j + ", ext=" + this.f46980k + ')';
    }

    public c3(String make, String model, String osv, String str, String os2, int i5, int i11, String str2, String str3, Integer num, b3 b3Var) {
        Intrinsics.g(make, "make");
        Intrinsics.g(model, "model");
        Intrinsics.g(osv, "osv");
        Intrinsics.g(os2, "os");
        this.f46970a = make;
        this.f46971b = model;
        this.f46972c = osv;
        this.f46973d = str;
        this.f46974e = os2;
        this.f46975f = i5;
        this.f46976g = i11;
        this.f46977h = str2;
        this.f46978i = str3;
        this.f46979j = num;
        this.f46980k = b3Var;
    }

    public static final void a(c3 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        output.encodeStringElement(serialDesc, 0, self.f46970a);
        output.encodeStringElement(serialDesc, 1, self.f46971b);
        output.encodeStringElement(serialDesc, 2, self.f46972c);
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.f46973d != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, StringSerializer.INSTANCE, self.f46973d);
        }
        output.encodeStringElement(serialDesc, 4, self.f46974e);
        output.encodeIntElement(serialDesc, 5, self.f46975f);
        output.encodeIntElement(serialDesc, 6, self.f46976g);
        if (output.shouldEncodeElementDefault(serialDesc, 7) || self.f46977h != null) {
            output.encodeNullableSerializableElement(serialDesc, 7, StringSerializer.INSTANCE, self.f46977h);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 8) || self.f46978i != null) {
            output.encodeNullableSerializableElement(serialDesc, 8, StringSerializer.INSTANCE, self.f46978i);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 9) || self.f46979j != null) {
            output.encodeNullableSerializableElement(serialDesc, 9, IntSerializer.INSTANCE, self.f46979j);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 10) && self.f46980k == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 10, z2.f47205a, self.f46980k);
    }

    public final void b(String str) {
        this.f46977h = str;
    }

    public final void a(int i5) {
        this.f46976g = i5;
    }

    public final void a(String str) {
        this.f46978i = str;
    }

    public final void a(Integer num) {
        this.f46979j = num;
    }

    public final void a(b3 b3Var) {
        this.f46980k = b3Var;
    }

    public /* synthetic */ c3(String str, String str2, String str3, String str4, String str5, int i5, int i11, String str6) {
        this(str, str2, str3, str4, str5, i5, i11, str6, null, null, null);
    }
}
