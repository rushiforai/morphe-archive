package defpackage;

import j$.util.Objects;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class qgg extends bzf {
    public final lig a;

    public qgg(lig ligVar) {
        this.a = ligVar;
    }

    @Override // defpackage.bzf
    public final boolean a() {
        return ((isg) this.a.c).z() != ntg.RAW;
    }

    public final boolean equals(Object obj) {
        isg isgVar = (isg) this.a.c;
        if (!(obj instanceof qgg)) {
            return false;
        }
        lig ligVar = ((qgg) obj).a;
        ntg ntgVarZ = isgVar.z();
        isg isgVar2 = (isg) ligVar.c;
        return ntgVarZ.equals(isgVar2.z()) && isgVar.B().equals(isgVar2.B()) && isgVar.A().equals(isgVar2.A());
    }

    public final int hashCode() {
        lig ligVar = this.a;
        return Objects.hash((isg) ligVar.c, (qvg) ligVar.b);
    }

    public final String toString() {
        isg isgVar = (isg) this.a.c;
        String strB = isgVar.B();
        int i = tgg.a[isgVar.z().ordinal()];
        return ev6.y("(typeUrl=", strB, ", outputPrefixType=", i != 1 ? i != 2 ? i != 3 ? i != 4 ? "UNKNOWN" : "CRUNCHY" : "RAW" : "LEGACY" : "TINK", eoLmc.IFnWcxOTdHz);
    }
}
