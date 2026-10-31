package com.vungle.ads.internal.signals;

import b.c0;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.vungle.ads.internal.model.q3;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class c {

    @NotNull
    public static final b Companion = new b();

    /* renamed from: a, reason: collision with root package name */
    public final int f47485a;

    /* renamed from: b, reason: collision with root package name */
    public final String f47486b;

    /* renamed from: c, reason: collision with root package name */
    public long f47487c;

    /* renamed from: d, reason: collision with root package name */
    public List f47488d;

    /* renamed from: e, reason: collision with root package name */
    public long f47489e;

    /* renamed from: f, reason: collision with root package name */
    public int f47490f;

    /* renamed from: g, reason: collision with root package name */
    public List f47491g;

    /* renamed from: h, reason: collision with root package name */
    public int f47492h;

    /* renamed from: i, reason: collision with root package name */
    public int f47493i;

    /* renamed from: j, reason: collision with root package name */
    public int f47494j;

    /* renamed from: k, reason: collision with root package name */
    public int f47495k;

    /* renamed from: l, reason: collision with root package name */
    public int f47496l;

    public c(int i5) {
        this.f47485a = i5;
        this.f47486b = c0.j("randomUUID().toString()");
        this.f47487c = System.currentTimeMillis() / 1000;
        this.f47488d = new ArrayList();
        this.f47491g = new ArrayList();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0032  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(c self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        output.encodeIntElement(serialDesc, 0, self.f47485a);
        if (output.shouldEncodeElementDefault(serialDesc, 1)) {
            output.encodeStringElement(serialDesc, 1, self.f47486b);
        } else {
            String str = self.f47486b;
            String string = UUID.randomUUID().toString();
            Intrinsics.f(string, "randomUUID().toString()");
            if (!Intrinsics.b(str, string)) {
            }
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.f47487c != System.currentTimeMillis() / 1000) {
            output.encodeLongElement(serialDesc, 2, self.f47487c);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || !Intrinsics.b(self.f47488d, new ArrayList())) {
            output.encodeSerializableElement(serialDesc, 3, new ArrayListSerializer(k.f47514a), self.f47488d);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.f47489e != 0) {
            output.encodeLongElement(serialDesc, 4, self.f47489e);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || self.f47490f != 0) {
            output.encodeIntElement(serialDesc, 5, self.f47490f);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 6) || !Intrinsics.b(self.f47491g, new ArrayList())) {
            output.encodeSerializableElement(serialDesc, 6, new ArrayListSerializer(q3.f47133a), self.f47491g);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 7) || self.f47492h != 0) {
            output.encodeIntElement(serialDesc, 7, self.f47492h);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 8) || self.f47493i != 0) {
            output.encodeIntElement(serialDesc, 8, self.f47493i);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 9) || self.f47494j != 0) {
            output.encodeIntElement(serialDesc, 9, self.f47494j);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 10) || self.f47495k != 0) {
            output.encodeIntElement(serialDesc, 10, self.f47495k);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 11) && self.f47496l == 0) {
            return;
        }
        output.encodeIntElement(serialDesc, 11, self.f47496l);
    }

    public final List b() {
        return this.f47488d;
    }

    public final List c() {
        return this.f47491g;
    }

    public final void d(int i5) {
        this.f47495k = i5;
    }

    public final void e(int i5) {
        this.f47493i = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof c) && this.f47485a == ((c) obj).f47485a;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f47485a);
    }

    public final String toString() {
        return a2.c.m(com.iab.omid.library.vungle.internal.l.a("SessionData(sessionCount="), this.f47485a, ')');
    }

    public final void b(int i5) {
        this.f47496l = i5;
    }

    public final void c(int i5) {
        this.f47494j = i5;
    }

    public final String a() {
        return this.f47486b;
    }

    public final void a(ArrayList arrayList) {
        Intrinsics.g(arrayList, "<set-?>");
        this.f47491g = arrayList;
    }

    public /* synthetic */ c(int i5, int i11, String str, long j11, List list, long j12, int i12, List list2, int i13, int i14, int i15, int i16, int i17) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, a.f47483a.getDescriptor());
        }
        this.f47485a = i11;
        if ((i5 & 2) == 0) {
            this.f47486b = c0.j("randomUUID().toString()");
        } else {
            this.f47486b = str;
        }
        if ((i5 & 4) == 0) {
            this.f47487c = System.currentTimeMillis() / 1000;
        } else {
            this.f47487c = j11;
        }
        if ((i5 & 8) == 0) {
            this.f47488d = new ArrayList();
        } else {
            this.f47488d = list;
        }
        if ((i5 & 16) == 0) {
            this.f47489e = 0L;
        } else {
            this.f47489e = j12;
        }
        if ((i5 & 32) == 0) {
            this.f47490f = 0;
        } else {
            this.f47490f = i12;
        }
        if ((i5 & 64) == 0) {
            this.f47491g = new ArrayList();
        } else {
            this.f47491g = list2;
        }
        if ((i5 & 128) == 0) {
            this.f47492h = 0;
        } else {
            this.f47492h = i13;
        }
        if ((i5 & 256) == 0) {
            this.f47493i = 0;
        } else {
            this.f47493i = i14;
        }
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0) {
            this.f47494j = 0;
        } else {
            this.f47494j = i15;
        }
        if ((i5 & 1024) == 0) {
            this.f47495k = 0;
        } else {
            this.f47495k = i16;
        }
        if ((i5 & 2048) == 0) {
            this.f47496l = 0;
        } else {
            this.f47496l = i17;
        }
    }

    public final void a(int i5) {
        this.f47492h = i5;
    }
}
