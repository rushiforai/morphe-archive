package o7;

import android.net.Uri;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final Uri f79646a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f79647b;

    public e(boolean z11, Uri uri) {
        this.f79646a = uri;
        this.f79647b = z11;
    }

    public final Uri a() {
        return this.f79646a;
    }

    public final boolean b() {
        return this.f79647b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!e.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        Intrinsics.e(obj, "null cannot be cast to non-null type androidx.work.Constraints.ContentUriTrigger");
        e eVar = (e) obj;
        return Intrinsics.b(this.f79646a, eVar.f79646a) && this.f79647b == eVar.f79647b;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f79647b) + (this.f79646a.hashCode() * 31);
    }
}
