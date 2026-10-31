package kw;

import b.u4;
import com.stripe.android.core.strings.ResolvableString;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class z2 implements u2 {

    /* renamed from: a, reason: collision with root package name */
    public final String f72742a;

    /* renamed from: b, reason: collision with root package name */
    public final ResolvableString f72743b;

    /* renamed from: c, reason: collision with root package name */
    public final int f72744c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f72745d;

    public z2(String id2, ResolvableString resolvableString, int i5, boolean z11) {
        Intrinsics.g(id2, "id");
        this.f72742a = id2;
        this.f72743b = resolvableString;
        this.f72744c = i5;
        this.f72745d = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z2)) {
            return false;
        }
        z2 z2Var = (z2) obj;
        return Intrinsics.b(this.f72742a, z2Var.f72742a) && Intrinsics.b(this.f72743b, z2Var.f72743b) && this.f72744c == z2Var.f72744c && this.f72745d == z2Var.f72745d;
    }

    @Override // kw.u2
    public final boolean getEnabled() {
        return this.f72745d;
    }

    @Override // kw.u2
    public final Integer getIcon() {
        return Integer.valueOf(this.f72744c);
    }

    @Override // kw.u2
    public final ResolvableString getLabel() {
        return this.f72743b;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f72745d) + u4.a(this.f72744c, (this.f72743b.hashCode() + (this.f72742a.hashCode() * 31)) * 31, 31);
    }

    public final String toString() {
        return "Item(id=" + this.f72742a + ", label=" + this.f72743b + ", icon=" + this.f72744c + ", enabled=" + this.f72745d + ")";
    }
}
