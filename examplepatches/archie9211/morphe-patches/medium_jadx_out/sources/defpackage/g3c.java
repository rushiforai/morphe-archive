package defpackage;

import android.graphics.Shader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class g3c extends ez0 {
    public eoc a;
    public long b = 9205357640488583168L;

    @Override // defpackage.ez0
    public final void a(float f, long j, uq uqVar) {
        eoc eocVar = this.a;
        if (eocVar == null || !dfc.a(this.b, j)) {
            if (dfc.e(j)) {
                this.a = null;
                this.b = 9205357640488583168L;
                eocVar = null;
            } else {
                eocVar = this.a;
                if (eocVar == null) {
                    eocVar = new eoc();
                    this.a = eocVar;
                }
                eocVar.a = b(j);
                this.a = eocVar;
                this.b = j;
            }
        }
        long j2 = op8.j(uqVar.a.getColor());
        long j3 = uu1.b;
        if (!ezd.a(j2, j3)) {
            uqVar.e(j3);
        }
        if (!g76.L(uqVar.c, eocVar != null ? (Shader) eocVar.a : null)) {
            uqVar.h(eocVar != null ? (Shader) eocVar.a : null);
        }
        if (r4.getAlpha() / 255.0f == f) {
            return;
        }
        uqVar.c(f);
    }

    public abstract Shader b(long j);
}
