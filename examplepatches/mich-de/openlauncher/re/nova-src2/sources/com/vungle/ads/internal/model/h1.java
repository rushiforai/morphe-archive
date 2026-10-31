package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class h1 {

    @NotNull
    public static final g1 Companion = new g1();

    /* renamed from: a, reason: collision with root package name */
    public final String f47015a;

    /* renamed from: b, reason: collision with root package name */
    public final String f47016b;

    /* renamed from: c, reason: collision with root package name */
    public final long f47017c;

    /* renamed from: d, reason: collision with root package name */
    public final String f47018d;

    public /* synthetic */ h1(int i5, String str, String str2, long j11, String str3) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, f1.f47004a.getDescriptor());
        }
        this.f47015a = str;
        this.f47016b = str2;
        this.f47017c = j11;
        this.f47018d = str3;
    }

    public static final void a(h1 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        output.encodeStringElement(serialDesc, 0, self.f47015a);
        output.encodeStringElement(serialDesc, 1, self.f47016b);
        output.encodeLongElement(serialDesc, 2, self.f47017c);
        output.encodeStringElement(serialDesc, 3, self.f47018d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h1)) {
            return false;
        }
        h1 h1Var = (h1) obj;
        return Intrinsics.b(this.f47015a, h1Var.f47015a) && Intrinsics.b(this.f47016b, h1Var.f47016b) && this.f47017c == h1Var.f47017c && Intrinsics.b(this.f47018d, h1Var.f47018d);
    }

    public final int hashCode() {
        return this.f47018d.hashCode() + b.c0.d(b.c0.e(this.f47015a.hashCode() * 31, 31, this.f47016b), 31, this.f47017c);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("GDPR(consentStatus=");
        sbA.append(this.f47015a);
        sbA.append(", consentSource=");
        sbA.append(this.f47016b);
        sbA.append(", consentTimestamp=");
        sbA.append(this.f47017c);
        sbA.append(", consentMessageVersion=");
        return h6.c1.t(sbA, this.f47018d, ')');
    }

    public h1(long j11, String consentStatus, String consentSource, String consentMessageVersion) {
        Intrinsics.g(consentStatus, "consentStatus");
        Intrinsics.g(consentSource, "consentSource");
        Intrinsics.g(consentMessageVersion, "consentMessageVersion");
        this.f47015a = consentStatus;
        this.f47016b = consentSource;
        this.f47017c = j11;
        this.f47018d = consentMessageVersion;
    }
}
