package b50;

import android.os.UserHandle;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f17556a;

    /* renamed from: b, reason: collision with root package name */
    public final UserHandle f17557b;

    public a(String packageName, UserHandle user) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(user, "user");
        this.f17556a = packageName;
        this.f17557b = user;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f17556a, aVar.f17556a) && Intrinsics.b(this.f17557b, aVar.f17557b);
    }

    public final int hashCode() {
        return this.f17557b.hashCode() + (this.f17556a.hashCode() * 31);
    }

    public final String toString() {
        return "AppInfo(packageName=" + this.f17556a + ", user=" + this.f17557b + ')';
    }
}
