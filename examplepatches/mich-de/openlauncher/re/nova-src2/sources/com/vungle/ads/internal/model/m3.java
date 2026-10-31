package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class m3 {

    @NotNull
    public static final l3 Companion = new l3();

    /* renamed from: a, reason: collision with root package name */
    public final String f47094a;

    public /* synthetic */ m3(int i5, String str) {
        if ((i5 & 1) == 0) {
            this.f47094a = null;
        } else {
            this.f47094a = str;
        }
    }

    public static final void a(m3 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (!output.shouldEncodeElementDefault(serialDesc, 0) && self.f47094a == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 0, StringSerializer.INSTANCE, self.f47094a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof m3) && Intrinsics.b(this.f47094a, ((m3) obj).f47094a);
    }

    public final int hashCode() {
        String str = this.f47094a;
        if (str == null) {
            return 0;
        }
        return str.hashCode();
    }

    public final String toString() {
        return h6.c1.t(com.iab.omid.library.vungle.internal.l.a("RtbRequest(sdkUserAgent="), this.f47094a, ')');
    }

    public m3(String str) {
        this.f47094a = str;
    }
}
