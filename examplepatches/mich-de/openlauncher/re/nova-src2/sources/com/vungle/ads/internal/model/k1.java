package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class k1 {

    @NotNull
    public static final j1 Companion = new j1();

    /* renamed from: a, reason: collision with root package name */
    public final String f47073a;

    public /* synthetic */ k1(int i5, String str) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, i1.f47055a.getDescriptor());
        }
        this.f47073a = str;
    }

    public static final void a(k1 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        output.encodeStringElement(serialDesc, 0, self.f47073a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof k1) && Intrinsics.b(this.f47073a, ((k1) obj).f47073a);
    }

    public final int hashCode() {
        return this.f47073a.hashCode();
    }

    public final String toString() {
        return h6.c1.t(com.iab.omid.library.vungle.internal.l.a("IAB(tcf="), this.f47073a, ')');
    }

    public k1(String tcf) {
        Intrinsics.g(tcf, "tcf");
        this.f47073a = tcf;
    }
}
