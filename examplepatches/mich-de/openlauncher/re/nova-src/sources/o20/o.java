package o20;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public final String f79449a;

    /* renamed from: b, reason: collision with root package name */
    public final String f79450b;

    /* renamed from: c, reason: collision with root package name */
    public final String f79451c;

    /* renamed from: d, reason: collision with root package name */
    public final int f79452d;

    public o(int i5, String str, String str2, String str3) {
        this.f79449a = str;
        this.f79450b = str2;
        this.f79451c = str3;
        this.f79452d = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o)) {
            return false;
        }
        o oVar = (o) obj;
        return Intrinsics.b(this.f79449a, oVar.f79449a) && Intrinsics.b(this.f79450b, oVar.f79450b) && Intrinsics.b(this.f79451c, oVar.f79451c) && this.f79452d == oVar.f79452d;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f79452d) + c0.e(c0.e(this.f79449a.hashCode() * 31, 31, this.f79450b), 31, this.f79451c);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("SlackGroupInfo(name=", this.f79449a, ", handle=", this.f79450b, ", description=");
        sbW.append(this.f79451c);
        sbW.append(", memberCount=");
        sbW.append(this.f79452d);
        sbW.append(")");
        return sbW.toString();
    }
}
