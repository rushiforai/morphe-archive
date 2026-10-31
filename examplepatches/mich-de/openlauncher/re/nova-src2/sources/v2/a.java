package v2;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a implements q {

    /* renamed from: b, reason: collision with root package name */
    public final int f91908b;

    public a(int i5) {
        this.f91908b = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!a.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        Intrinsics.e(obj, "null cannot be cast to non-null type androidx.compose.ui.input.pointer.AndroidPointerIconType");
        return this.f91908b == ((a) obj).f91908b;
    }

    public final int hashCode() {
        return this.f91908b;
    }

    public final String toString() {
        return a2.c.m(new StringBuilder("AndroidPointerIcon(type="), this.f91908b, ')');
    }
}
