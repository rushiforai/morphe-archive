package k0;

import b.c9;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class u1 {

    /* renamed from: a, reason: collision with root package name */
    public float f70754a = 0.0f;

    /* renamed from: b, reason: collision with root package name */
    public boolean f70755b = true;

    /* renamed from: c, reason: collision with root package name */
    public d f70756c = null;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u1)) {
            return false;
        }
        u1 u1Var = (u1) obj;
        return Float.compare(this.f70754a, u1Var.f70754a) == 0 && this.f70755b == u1Var.f70755b && Intrinsics.b(this.f70756c, u1Var.f70756c);
    }

    public final int hashCode() {
        int iF = c9.f(Float.hashCode(this.f70754a) * 31, 31, this.f70755b);
        d dVar = this.f70756c;
        return (iF + (dVar == null ? 0 : dVar.hashCode())) * 31;
    }

    public final String toString() {
        return "RowColumnParentData(weight=" + this.f70754a + ", fill=" + this.f70755b + ", crossAxisAlignment=" + this.f70756c + ", flowLayoutData=null)";
    }
}
