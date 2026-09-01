package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aa9 extends co6 implements m45 {
    public final /* synthetic */ short a;
    public final /* synthetic */ y99 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public aa9(short s, y99 y99Var) {
        super(0);
        this.a = s;
        this.b = y99Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        y99 y99Var = this.b;
        short identifier = y99Var.getIdentifier();
        StringBuilder sb = new StringBuilder("Unexpected block type identifier=");
        sb.append((int) this.a);
        sb.append(" met, was expecting ");
        sb.append(y99Var);
        sb.append("(");
        return ho2.H(sb, identifier, ")");
    }
}
