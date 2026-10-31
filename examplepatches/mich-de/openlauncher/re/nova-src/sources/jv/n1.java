package jv;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class n1 implements o1 {

    /* renamed from: a, reason: collision with root package name */
    public final uu.b f70112a;

    public n1(uu.b bVar) {
        this.f70112a = bVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof n1) && Intrinsics.b(this.f70112a, ((n1) obj).f70112a);
    }

    public final int hashCode() {
        uu.b bVar = this.f70112a;
        if (bVar == null) {
            return 0;
        }
        return bVar.hashCode();
    }

    public final String toString() {
        return "FormFieldValuesChanged(formValues=" + this.f70112a + ")";
    }
}
