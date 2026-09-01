package defpackage;

import java.util.ArrayList;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class z48 extends cqe {
    public final ArrayList a;
    public final Map b;

    public z48(ArrayList arrayList) {
        this.a = arrayList;
        this.b = ei7.V(arrayList);
    }

    @Override // defpackage.cqe
    public final boolean a(n98 n98Var) {
        return this.b.containsKey(n98Var);
    }

    public final String toString() {
        return "MultiFieldValueClassRepresentation(underlyingPropertyNamesToTypes=" + this.a + ')';
    }
}
