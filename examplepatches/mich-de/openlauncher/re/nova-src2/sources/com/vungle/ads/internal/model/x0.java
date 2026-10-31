package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class x0 {

    @NotNull
    public static final w0 Companion = new w0();

    /* renamed from: a, reason: collision with root package name */
    public final String f47195a;

    public /* synthetic */ x0(int i5, String str) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, v0.f47166a.getDescriptor());
        }
        this.f47195a = str;
    }

    public static final void a(x0 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        output.encodeStringElement(serialDesc, 0, self.f47195a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof x0) && Intrinsics.b(this.f47195a, ((x0) obj).f47195a);
    }

    public final int hashCode() {
        return this.f47195a.hashCode();
    }

    public final String toString() {
        return h6.c1.t(com.iab.omid.library.vungle.internal.l.a("CCPA(status="), this.f47195a, ')');
    }

    public x0(String status) {
        Intrinsics.g(status, "status");
        this.f47195a = status;
    }
}
