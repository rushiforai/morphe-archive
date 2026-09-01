package defpackage;

import com.drew.imaging.eps.ld.PdtluglzAX;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lavc;", "Lu28;", "Lbvc;", "ui"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final /* data */ class avc extends u28 {
    public final zj3 b;

    public avc(zj3 zj3Var) {
        this.b = zj3Var;
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof avc)) {
            return false;
        }
        avc avcVar = (avc) obj;
        lr lrVar = hlg.i;
        return lrVar.equals(lrVar) && g76.L(this.b, avcVar.b);
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new bvc(hlg.i, this.b);
    }

    public final int hashCode() {
        int i = ((PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION * 31) + 1237) * 31;
        zj3 zj3Var = this.b;
        return i + (zj3Var == null ? 0 : zj3Var.hashCode());
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        bvc bvcVar = (bvc) q28Var;
        lr lrVar = hlg.i;
        if (!g76.L(bvcVar.p, lrVar)) {
            bvcVar.p = lrVar;
            if (bvcVar.q) {
                bvcVar.K0();
            }
        }
        bvcVar.o = this.b;
    }

    public final String toString() {
        return "StylusHoverIconModifierElement(icon=" + hlg.i + PdtluglzAX.RgByPMcR + this.b + ')';
    }
}
