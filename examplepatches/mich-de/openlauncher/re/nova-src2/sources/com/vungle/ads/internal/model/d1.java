package com.vungle.ads.internal.model;

import b.u4;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class d1 {

    @NotNull
    public static final c1 Companion = new c1();

    /* renamed from: a, reason: collision with root package name */
    public final double f46985a;

    /* renamed from: b, reason: collision with root package name */
    public final int f46986b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f46987c;

    /* renamed from: d, reason: collision with root package name */
    public final String f46988d;

    /* renamed from: e, reason: collision with root package name */
    public final String f46989e;

    /* renamed from: f, reason: collision with root package name */
    public final String f46990f;

    /* renamed from: g, reason: collision with root package name */
    public final String f46991g;

    public d1(double d5, int i5, boolean z11, String parentAuctionId, String creativeId, String adUnitId, String str) {
        Intrinsics.g(parentAuctionId, "parentAuctionId");
        Intrinsics.g(creativeId, "creativeId");
        Intrinsics.g(adUnitId, "adUnitId");
        this.f46985a = d5;
        this.f46986b = i5;
        this.f46987c = z11;
        this.f46988d = parentAuctionId;
        this.f46989e = creativeId;
        this.f46990f = adUnitId;
        this.f46991g = str;
    }

    public static final void a(d1 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        output.encodeDoubleElement(serialDesc, 0, self.f46985a);
        output.encodeIntElement(serialDesc, 1, self.f46986b);
        output.encodeBooleanElement(serialDesc, 2, self.f46987c);
        output.encodeStringElement(serialDesc, 3, self.f46988d);
        output.encodeStringElement(serialDesc, 4, self.f46989e);
        output.encodeStringElement(serialDesc, 5, self.f46990f);
        if (!output.shouldEncodeElementDefault(serialDesc, 6) && self.f46991g == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 6, StringSerializer.INSTANCE, self.f46991g);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d1)) {
            return false;
        }
        d1 d1Var = (d1) obj;
        return Double.valueOf(this.f46985a).equals(Double.valueOf(d1Var.f46985a)) && this.f46986b == d1Var.f46986b && this.f46987c == d1Var.f46987c && Intrinsics.b(this.f46988d, d1Var.f46988d) && Intrinsics.b(this.f46989e, d1Var.f46989e) && Intrinsics.b(this.f46990f, d1Var.f46990f) && Intrinsics.b(this.f46991g, d1Var.f46991g);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iA = u4.a(this.f46986b, Double.hashCode(this.f46985a) * 31, 31);
        boolean z11 = this.f46987c;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        int iE = b.c0.e(b.c0.e(b.c0.e((iA + i5) * 31, 31, this.f46988d), 31, this.f46989e), 31, this.f46990f);
        String str = this.f46991g;
        return iE + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("CSBParam(bidfloor=");
        sbA.append(this.f46985a);
        sbA.append(", phase=");
        sbA.append(this.f46986b);
        sbA.append(", isVXWinner=");
        sbA.append(this.f46987c);
        sbA.append(", parentAuctionId=");
        sbA.append(this.f46988d);
        sbA.append(", creativeId=");
        sbA.append(this.f46989e);
        sbA.append(", adUnitId=");
        sbA.append(this.f46990f);
        sbA.append(", ext=");
        return h6.c1.t(sbA, this.f46991g, ')');
    }

    public /* synthetic */ d1(int i5, double d5, int i11, boolean z11, String str, String str2, String str3, String str4) {
        if (63 != (i5 & 63)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 63, b1.f46941a.getDescriptor());
        }
        this.f46985a = d5;
        this.f46986b = i11;
        this.f46987c = z11;
        this.f46988d = str;
        this.f46989e = str2;
        this.f46990f = str3;
        if ((i5 & 64) == 0) {
            this.f46991g = null;
        } else {
            this.f46991g = str4;
        }
    }
}
