package x50;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import kotlin.reflect.KType;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final KClass f95106a;

    /* renamed from: b, reason: collision with root package name */
    public final KType f95107b;

    public a(KClass type, KType kType) {
        Intrinsics.g(type, "type");
        this.f95106a = type;
        this.f95107b = kType;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        KType kType = this.f95107b;
        if (kType == null) {
            a aVar = (a) obj;
            if (aVar.f95107b == null) {
                return Intrinsics.b(this.f95106a, aVar.f95106a);
            }
        }
        return Intrinsics.b(kType, ((a) obj).f95107b);
    }

    public final int hashCode() {
        KType kType = this.f95107b;
        return kType != null ? kType.hashCode() : this.f95106a.hashCode();
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("TypeInfo(");
        Object obj = this.f95107b;
        if (obj == null) {
            obj = this.f95106a;
        }
        sb2.append(obj);
        sb2.append(')');
        return sb2.toString();
    }
}
