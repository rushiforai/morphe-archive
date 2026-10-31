package y20;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e implements g {

    /* renamed from: a, reason: collision with root package name */
    public final CharSequence f96595a;

    public e(CharSequence charSequence) {
        this.f96595a = charSequence;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof e) && Intrinsics.b(this.f96595a, ((e) obj).f96595a);
    }

    public final int hashCode() {
        return this.f96595a.hashCode();
    }

    public final String toString() {
        return "PlainText(text=" + ((Object) this.f96595a) + ")";
    }
}
