package defpackage;

import com.medium.proto.model.MarkupModel;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e1e implements ni7 {
    public final MarkupModel a;

    public e1e(MarkupModel markupModel) {
        this.a = markupModel;
    }

    @Override // defpackage.ni7
    public final MarkupModel b() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof e1e) && this.a.equals(((e1e) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "UnknownMarkupSpan(markupModel=" + this.a + ")";
    }
}
