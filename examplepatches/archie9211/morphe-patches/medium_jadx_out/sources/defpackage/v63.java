package defpackage;

import com.medium.proto.model.SectionModel;
import com.medium.proto.obv.post.DeltaType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v63 implements z63 {
    public final int a;
    public final SectionModel b;
    public final DeltaType c;

    public v63(int i, SectionModel sectionModel) {
        sectionModel.getClass();
        this.a = i;
        this.b = sectionModel;
        this.c = DeltaType.UPDATE_SECTION_AT;
    }

    @Override // defpackage.z63
    public final DeltaType a() {
        return this.c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v63)) {
            return false;
        }
        v63 v63Var = (v63) obj;
        return this.a == v63Var.a && g76.L(this.b, v63Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a * 31);
    }

    public final String toString() {
        return "UpdateSectionAt(index=" + this.a + ", sectionModel=" + this.b + ")";
    }
}
