package m3;

import b.u4;
import h6.c1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final Object f75842a;

    /* renamed from: b, reason: collision with root package name */
    public final int f75843b;

    /* renamed from: c, reason: collision with root package name */
    public int f75844c;

    /* renamed from: d, reason: collision with root package name */
    public final String f75845d;

    public c(Object obj, int i5, int i11, String str) {
        this.f75842a = obj;
        this.f75843b = i5;
        this.f75844c = i11;
        this.f75845d = str;
    }

    public final e a(int i5) {
        int i11 = this.f75844c;
        if (i11 != Integer.MIN_VALUE) {
            i5 = i11;
        }
        if (!(i5 != Integer.MIN_VALUE)) {
            s3.a.c("Item.end should be set first");
        }
        return new e(this.f75842a, this.f75843b, i5, this.f75845d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f75842a, cVar.f75842a) && this.f75843b == cVar.f75843b && this.f75844c == cVar.f75844c && Intrinsics.b(this.f75845d, cVar.f75845d);
    }

    public final int hashCode() {
        Object obj = this.f75842a;
        return this.f75845d.hashCode() + u4.a(this.f75844c, u4.a(this.f75843b, (obj == null ? 0 : obj.hashCode()) * 31, 31), 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("MutableRange(item=");
        sb2.append(this.f75842a);
        sb2.append(", start=");
        sb2.append(this.f75843b);
        sb2.append(", end=");
        sb2.append(this.f75844c);
        sb2.append(", tag=");
        return c1.t(sb2, this.f75845d, ')');
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ c(b bVar, int i5, int i11, int i12) {
        String str;
        i11 = (i12 & 4) != 0 ? Integer.MIN_VALUE : i11;
        if ((i12 & 8) != 0) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } else {
            str = "androidx.compose.foundation.text.inlineContent";
        }
        this(bVar, i5, i11, str);
    }
}
