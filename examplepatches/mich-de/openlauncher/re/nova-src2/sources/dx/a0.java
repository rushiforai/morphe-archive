package dx;

import b.c9;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a0 implements b0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f49681a;

    /* renamed from: b, reason: collision with root package name */
    public final u f49682b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f49683c;

    /* renamed from: d, reason: collision with root package name */
    public final x0 f49684d;

    public a0(String candidateId, u presentationKind, boolean z11, x0 x0Var) {
        Intrinsics.g(candidateId, "candidateId");
        Intrinsics.g(presentationKind, "presentationKind");
        this.f49681a = candidateId;
        this.f49682b = presentationKind;
        this.f49683c = z11;
        this.f49684d = x0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a0)) {
            return false;
        }
        a0 a0Var = (a0) obj;
        return Intrinsics.b(this.f49681a, a0Var.f49681a) && this.f49682b == a0Var.f49682b && this.f49683c == a0Var.f49683c && this.f49684d == a0Var.f49684d;
    }

    public final int hashCode() {
        return this.f49684d.hashCode() + c9.f((this.f49682b.hashCode() + (this.f49681a.hashCode() * 31)) * 31, 31, this.f49683c);
    }

    public final String toString() {
        return "Showing(candidateId=" + this.f49681a + ", presentationKind=" + this.f49682b + ", refreshWanted=" + this.f49683c + ", warmth=" + this.f49684d + ")";
    }
}
