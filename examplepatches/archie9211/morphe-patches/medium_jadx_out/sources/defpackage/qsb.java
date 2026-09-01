package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lqsb;", "Lu28;", "Lvrb;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class qsb extends u28 {
    public final yrb b;
    public final boolean c;

    public qsb(yrb yrbVar, boolean z) {
        this.b = yrbVar;
        this.c = z;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof qsb)) {
            return false;
        }
        qsb qsbVar = (qsb) obj;
        return g76.L(this.b, qsbVar.b) && this.c == qsbVar.c;
    }

    @Override // defpackage.u28
    public final q28 f() {
        vrb vrbVar = new vrb();
        vrbVar.o = this.b;
        vrbVar.p = this.c;
        return vrbVar;
    }

    public final int hashCode() {
        return (((this.b.hashCode() * 31) + 1237) * 31) + (this.c ? 1231 : 1237);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        vrb vrbVar = (vrb) q28Var;
        vrbVar.o = this.b;
        vrbVar.p = this.c;
    }
}
