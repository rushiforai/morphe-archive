package r20;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final String f85344a;

    /* renamed from: b, reason: collision with root package name */
    public final String f85345b;

    /* renamed from: c, reason: collision with root package name */
    public final String f85346c;

    /* renamed from: d, reason: collision with root package name */
    public final String f85347d;

    public c(String str, String str2, String str3, String str4) {
        this.f85344a = str;
        this.f85345b = str2;
        this.f85346c = str3;
        this.f85347d = str4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f85344a, cVar.f85344a) && Intrinsics.b(this.f85345b, cVar.f85345b) && Intrinsics.b(this.f85346c, cVar.f85346c) && Intrinsics.b(this.f85347d, cVar.f85347d);
    }

    public final int hashCode() {
        return this.f85347d.hashCode() + c0.e(c0.e(this.f85344a.hashCode() * 31, 31, this.f85345b), 31, this.f85346c);
    }

    public final String toString() {
        return c0.s(c0.w("UserInfo(userId=", this.f85344a, ", login=", this.f85345b, ", displayName="), this.f85346c, ", iconUrl=", this.f85347d, ")");
    }
}
