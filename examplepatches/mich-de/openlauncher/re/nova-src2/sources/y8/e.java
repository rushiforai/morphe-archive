package y8;

import android.view.View;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class e implements i {

    /* renamed from: a, reason: collision with root package name */
    public final View f96843a;

    public e(View view) {
        this.f96843a = view;
    }

    public final View b() {
        return this.f96843a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof e) {
            return Intrinsics.b(this.f96843a, ((e) obj).f96843a);
        }
        return false;
    }

    public final int hashCode() {
        return Boolean.hashCode(true) + (this.f96843a.hashCode() * 31);
    }
}
