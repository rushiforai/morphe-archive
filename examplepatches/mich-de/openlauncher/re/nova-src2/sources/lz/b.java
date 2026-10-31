package lz;

import android.os.UserHandle;
import b.c0;
import com.android.launcher3.util.ComponentKey;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final String f75163a;

    /* renamed from: b, reason: collision with root package name */
    public final UserHandle f75164b;

    /* renamed from: c, reason: collision with root package name */
    public final String f75165c;

    public b(UserHandle userHandle, String str, String str2) {
        this.f75163a = str;
        this.f75164b = userHandle;
        this.f75165c = str2;
    }

    public static final b a(ComponentKey componentKey) {
        return new b(componentKey.f21252b, componentKey.f21251a.getPackageName(), componentKey.f21251a.getClassName());
    }

    public final String b() {
        return this.f75165c;
    }

    public final String c() {
        return this.f75163a;
    }

    public final UserHandle d() {
        return this.f75164b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f75163a, bVar.f75163a) && Intrinsics.b(this.f75164b, bVar.f75164b) && Intrinsics.b(this.f75165c, bVar.f75165c);
    }

    public final int hashCode() {
        return this.f75165c.hashCode() + ((this.f75164b.hashCode() + (this.f75163a.hashCode() * 31)) * 961);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AppTarget(packageName=");
        sb2.append(this.f75163a);
        sb2.append(", user=");
        sb2.append(this.f75164b);
        sb2.append(", shortcutInfo=null, className=");
        return c0.q(sb2, this.f75165c, ")");
    }
}
