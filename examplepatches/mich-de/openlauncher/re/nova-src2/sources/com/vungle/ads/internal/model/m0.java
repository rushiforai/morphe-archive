package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class m0 {

    @NotNull
    public static final l0 Companion = new l0();

    /* renamed from: a, reason: collision with root package name */
    public final String f47089a;

    /* renamed from: b, reason: collision with root package name */
    public final String f47090b;

    /* renamed from: c, reason: collision with root package name */
    public final String f47091c;

    public /* synthetic */ m0(int i5, String str, String str2, String str3) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, k0.f47071a.getDescriptor());
        }
        this.f47089a = str;
        this.f47090b = str2;
        this.f47091c = str3;
    }

    public static final void a(m0 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        output.encodeStringElement(serialDesc, 0, self.f47089a);
        output.encodeStringElement(serialDesc, 1, self.f47090b);
        output.encodeStringElement(serialDesc, 2, self.f47091c);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m0)) {
            return false;
        }
        m0 m0Var = (m0) obj;
        return Intrinsics.b(this.f47089a, m0Var.f47089a) && Intrinsics.b(this.f47090b, m0Var.f47090b) && Intrinsics.b(this.f47091c, m0Var.f47091c);
    }

    public final int hashCode() {
        return this.f47091c.hashCode() + b.c0.e(this.f47089a.hashCode() * 31, 31, this.f47090b);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("AppNode(bundle=");
        sbA.append(this.f47089a);
        sbA.append(", ver=");
        sbA.append(this.f47090b);
        sbA.append(", appId=");
        return h6.c1.t(sbA, this.f47091c, ')');
    }

    public m0(String bundle, String ver, String appId) {
        Intrinsics.g(bundle, "bundle");
        Intrinsics.g(ver, "ver");
        Intrinsics.g(appId, "appId");
        this.f47089a = bundle;
        this.f47090b = ver;
        this.f47091c = appId;
    }
}
