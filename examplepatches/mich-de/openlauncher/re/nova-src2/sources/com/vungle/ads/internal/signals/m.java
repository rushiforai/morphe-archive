package com.vungle.ads.internal.signals;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class m {

    @NotNull
    public static final l Companion = new l();

    /* renamed from: a, reason: collision with root package name */
    public final Long f47516a;

    /* renamed from: b, reason: collision with root package name */
    public final long f47517b;

    /* renamed from: c, reason: collision with root package name */
    public String f47518c;

    /* renamed from: d, reason: collision with root package name */
    public final long f47519d;

    /* renamed from: e, reason: collision with root package name */
    public String f47520e;

    /* renamed from: f, reason: collision with root package name */
    public long f47521f;

    /* renamed from: g, reason: collision with root package name */
    public int f47522g;

    /* renamed from: h, reason: collision with root package name */
    public long f47523h;

    /* renamed from: i, reason: collision with root package name */
    public long f47524i;

    public /* synthetic */ m(int i5, String str, long j11, String str2, long j12, int i11) {
        if (2 != (i5 & 2)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 2, k.f47514a.getDescriptor());
        }
        this.f47516a = 0L;
        this.f47517b = 0L;
        if ((i5 & 1) == 0) {
            this.f47518c = null;
        } else {
            this.f47518c = str;
        }
        this.f47519d = j11;
        if ((i5 & 4) == 0) {
            this.f47520e = null;
        } else {
            this.f47520e = str2;
        }
        if ((i5 & 8) == 0) {
            this.f47521f = 0L;
        } else {
            this.f47521f = j12;
        }
        if ((i5 & 16) == 0) {
            this.f47522g = 0;
        } else {
            this.f47522g = i11;
        }
        this.f47523h = 0L;
        this.f47524i = 0L;
        this.f47519d = a(0L, 0L);
    }

    public static final void a(m self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.f47518c != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, StringSerializer.INSTANCE, self.f47518c);
        }
        output.encodeLongElement(serialDesc, 1, self.f47519d);
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.f47520e != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, StringSerializer.INSTANCE, self.f47520e);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.f47521f != 0) {
            output.encodeLongElement(serialDesc, 3, self.f47521f);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 4) && self.f47522g == 0) {
            return;
        }
        output.encodeIntElement(serialDesc, 4, self.f47522g);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m)) {
            return false;
        }
        m mVar = (m) obj;
        return Intrinsics.b(this.f47516a, mVar.f47516a) && this.f47517b == mVar.f47517b;
    }

    public final int hashCode() {
        Long l9 = this.f47516a;
        return Long.hashCode(this.f47517b) + ((l9 == null ? 0 : l9.hashCode()) * 31);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("SignaledAd(lastAdLoadTime=");
        sbA.append(this.f47516a);
        sbA.append(", loadAdTime=");
        return a2.c.n(sbA, this.f47517b, ')');
    }

    public final void a(String str) {
        this.f47520e = str;
    }

    public final void a(int i5) {
        this.f47522g = i5;
    }

    public final void a(long j11) {
        this.f47523h = j11;
    }

    public m(Long l9, long j11) {
        this.f47516a = l9;
        this.f47517b = j11;
        this.f47519d = a(l9, j11);
    }

    public static long a(Long l9, long j11) {
        if (l9 == null) {
            return -1L;
        }
        long jLongValue = j11 - l9.longValue();
        if (jLongValue < 0) {
            return -1L;
        }
        return jLongValue;
    }
}
