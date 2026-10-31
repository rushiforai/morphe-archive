package e20;

import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a0 {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f52005a;

    /* renamed from: b, reason: collision with root package name */
    public final k f52006b;

    public a0(ArrayList arrayList, k kVar) {
        this.f52005a = arrayList;
        this.f52006b = kVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a0)) {
            return false;
        }
        a0 a0Var = (a0) obj;
        return this.f52005a.equals(a0Var.f52005a) && Intrinsics.b(this.f52006b, a0Var.f52006b);
    }

    public final int hashCode() {
        return this.f52006b.hashCode() + (this.f52005a.hashCode() * 31);
    }

    public final String toString() {
        return "ConditionCardTuple(conditionRecords=" + this.f52005a + ", cardRecord=" + this.f52006b + ")";
    }
}
