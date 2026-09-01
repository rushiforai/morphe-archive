package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0082\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lex6;", "Lu28;", "Lfx6;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final /* data */ class ex6 extends u28 {
    public final cq b;
    public final kx6 c;
    public final lid d;

    public ex6(cq cqVar, kx6 kx6Var, lid lidVar) {
        this.b = cqVar;
        this.c = kx6Var;
        this.d = lidVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof ex6) {
            ex6 ex6Var = (ex6) obj;
            return g76.L(this.b, ex6Var.b) && this.c == ex6Var.c && this.d == ex6Var.d;
        }
        return false;
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new fx6(this.b, this.c, this.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ((this.c.hashCode() + (this.b.hashCode() * 31)) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) throws Throwable {
        fx6 fx6Var = (fx6) q28Var;
        if (fx6Var.n) {
            fx6Var.o.e();
            fx6Var.o.k(fx6Var);
        }
        cq cqVar = this.b;
        fx6Var.o = cqVar;
        if (fx6Var.n) {
            if (cqVar.a != null) {
                e26.c("Expected textInputModifierNode to be null");
            }
            cqVar.a = fx6Var;
        }
        fx6Var.p = this.c;
        fx6Var.q = this.d;
    }

    public final String toString() {
        return "LegacyAdaptingPlatformTextInputModifier(serviceAdapter=" + this.b + ", legacyTextFieldState=" + this.c + ", textFieldSelectionManager=" + this.d + ')';
    }
}
