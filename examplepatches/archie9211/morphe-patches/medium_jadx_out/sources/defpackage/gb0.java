package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gb0 implements jb0 {
    public final boolean a;
    public final va0 b;
    public final za0 c;
    public final SourceParameter d;

    public gb0(boolean z, va0 va0Var, za0 za0Var, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        this.a = z;
        this.b = va0Var;
        this.c = za0Var;
        this.d = sourceParameter;
    }

    @Override // defpackage.jb0
    public final boolean a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gb0)) {
            return false;
        }
        gb0 gb0Var = (gb0) obj;
        return this.a == gb0Var.a && this.b.equals(gb0Var.b) && this.c.equals(gb0Var.c) && g76.L(this.d, gb0Var.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ((this.c.hashCode() + ((this.b.hashCode() + ((this.a ? 1231 : 1237) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "Content(isRefreshing=" + this.a + ", audienceAllTimeUiModel=" + this.b + ", audienceGrowthUiModel=" + this.c + ", sourceParameter=" + this.d + ")";
    }
}
