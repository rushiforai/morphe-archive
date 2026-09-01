package defpackage;

import androidx.work.impl.yX.VrhD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class exa implements r82 {
    public final /* synthetic */ int a = 1;
    public final qu b;
    public final boolean c;
    public final xu d;
    public final Object e;

    public exa(String str, qu quVar, qu quVar2, vu vuVar, boolean z) {
        this.b = quVar;
        this.d = quVar2;
        this.e = vuVar;
        this.c = z;
    }

    @Override // defpackage.r82
    public final v72 a(rc7 rc7Var, bc7 bc7Var, tn0 tn0Var) {
        switch (this.a) {
            case 0:
                return new dxa(rc7Var, tn0Var, this);
            default:
                return new z4b(rc7Var, tn0Var, this);
        }
    }

    public String toString() {
        switch (this.a) {
            case 0:
                return VrhD.lTNtWCJRzHNG + this.d + ", size=" + ((xu) this.e) + '}';
            default:
                return super.toString();
        }
    }

    public exa(String str, xu xuVar, pu puVar, qu quVar, boolean z) {
        this.d = xuVar;
        this.e = puVar;
        this.b = quVar;
        this.c = z;
    }
}
