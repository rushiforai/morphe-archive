package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class w55 extends h41 implements l55, qh6 {
    private final int arity;
    private final int flags;

    public w55(int i, int i2, Class cls, Object obj, String str, String str2) {
        super(obj, cls, str, str2, (i2 & 1) == 1);
        this.arity = i;
        this.flags = 0;
    }

    @Override // defpackage.h41
    public rg6 computeReflected() {
        return n1b.a.a(this);
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof w55) {
            w55 w55Var = (w55) obj;
            return getName().equals(w55Var.getName()) && getSignature().equals(w55Var.getSignature()) && this.flags == w55Var.flags && this.arity == w55Var.arity && g76.L(getBoundReceiver(), w55Var.getBoundReceiver()) && g76.L(getOwner(), w55Var.getOwner());
        }
        if (obj instanceof qh6) {
            return obj.equals(compute());
        }
        return false;
    }

    @Override // defpackage.l55
    public int getArity() {
        return this.arity;
    }

    @Override // defpackage.h41
    public qh6 getReflected() {
        rg6 rg6VarCompute = compute();
        if (rg6VarCompute != this) {
            return (qh6) rg6VarCompute;
        }
        throw new in6();
    }

    public int hashCode() {
        return getSignature().hashCode() + ((getName().hashCode() + (getOwner() == null ? 0 : getOwner().hashCode() * 31)) * 31);
    }

    @Override // defpackage.qh6
    public boolean isExternal() {
        return getReflected().isExternal();
    }

    @Override // defpackage.qh6
    public boolean isInfix() {
        return getReflected().isInfix();
    }

    @Override // defpackage.qh6
    public boolean isInline() {
        return getReflected().isInline();
    }

    @Override // defpackage.qh6
    public boolean isOperator() {
        return getReflected().isOperator();
    }

    @Override // defpackage.rg6, defpackage.qh6
    public boolean isSuspend() {
        return getReflected().isSuspend();
    }

    public String toString() {
        rg6 rg6VarCompute = compute();
        if (rg6VarCompute != this) {
            return rg6VarCompute.toString();
        }
        if ("<init>".equals(getName())) {
            return "constructor (Kotlin reflection is not available)";
        }
        return "function " + getName() + " (Kotlin reflection is not available)";
    }
}
