package o20;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final String f79442a;

    /* renamed from: b, reason: collision with root package name */
    public final String f79443b;

    /* renamed from: c, reason: collision with root package name */
    public final String f79444c;

    public m(String str, String str2, String str3) {
        this.f79442a = str;
        this.f79443b = str2;
        this.f79444c = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m)) {
            return false;
        }
        m mVar = (m) obj;
        return Intrinsics.b(this.f79442a, mVar.f79442a) && Intrinsics.b(this.f79443b, mVar.f79443b) && Intrinsics.b(this.f79444c, mVar.f79444c);
    }

    public final int hashCode() {
        return this.f79444c.hashCode() + c0.e(this.f79442a.hashCode() * 31, 31, this.f79443b);
    }

    public final String toString() {
        return c0.q(c0.w("SlackChannelInfo(name=", this.f79442a, ", topic=", this.f79443b, ", uri="), this.f79444c, ")");
    }
}
