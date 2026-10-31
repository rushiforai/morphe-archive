package m3;

import b.u4;
import h6.c1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final Object f75852a;

    /* renamed from: b, reason: collision with root package name */
    public final int f75853b;

    /* renamed from: c, reason: collision with root package name */
    public final int f75854c;

    /* renamed from: d, reason: collision with root package name */
    public final String f75855d;

    public e(Object obj, int i5, int i11, String str) {
        this.f75852a = obj;
        this.f75853b = i5;
        this.f75854c = i11;
        this.f75855d = str;
        if (i5 <= i11) {
            return;
        }
        s3.a.a("Reversed range is not supported");
    }

    public static e a(e eVar, b bVar, int i5, int i11) {
        Object obj = bVar;
        if ((i11 & 1) != 0) {
            obj = eVar.f75852a;
        }
        int i12 = eVar.f75853b;
        if ((i11 & 4) != 0) {
            i5 = eVar.f75854c;
        }
        String str = eVar.f75855d;
        eVar.getClass();
        return new e(obj, i12, i5, str);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return Intrinsics.b(this.f75852a, eVar.f75852a) && this.f75853b == eVar.f75853b && this.f75854c == eVar.f75854c && Intrinsics.b(this.f75855d, eVar.f75855d);
    }

    public final int hashCode() {
        Object obj = this.f75852a;
        return this.f75855d.hashCode() + u4.a(this.f75854c, u4.a(this.f75853b, (obj == null ? 0 : obj.hashCode()) * 31, 31), 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Range(item=");
        sb2.append(this.f75852a);
        sb2.append(", start=");
        sb2.append(this.f75853b);
        sb2.append(", end=");
        sb2.append(this.f75854c);
        sb2.append(", tag=");
        return c1.t(sb2, this.f75855d, ')');
    }

    public e(Object obj, int i5, int i11) {
        this(obj, i5, i11, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }
}
