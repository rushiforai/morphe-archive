package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lvff;", "Lu28;", "Lwff;", "ui"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final /* data */ class vff extends u28 {
    public final float b;

    public vff(float f) {
        this.b = f;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof vff) && Float.compare(this.b, ((vff) obj).b) == 0;
    }

    @Override // defpackage.u28
    public final q28 f() {
        wff wffVar = new wff();
        wffVar.o = this.b;
        return wffVar;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.b);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ((wff) q28Var).o = this.b;
    }

    public final String toString() {
        return lv8.s(new StringBuilder("ZIndexElement(zIndex="), this.b, ')');
    }
}
