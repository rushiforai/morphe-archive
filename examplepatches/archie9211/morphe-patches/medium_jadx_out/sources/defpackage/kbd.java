package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kbd implements cs1 {
    public final /* synthetic */ u8d a;
    public final /* synthetic */ odd b;

    public kbd(u8d u8dVar, odd oddVar) {
        this.a = u8dVar;
        this.b = oddVar;
    }

    @Override // defpackage.cs1
    public final void A(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        throw new ei8("Mute action is not handled in Tag screen");
    }

    @Override // defpackage.cs1
    public final void B(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        n92 n92Var = null;
        odd oddVar = this.b;
        if (z) {
            vx0.c0(f76.F(oddVar), null, null, new add(oddVar, str, sourceParameter, n92Var, 0), 3);
        } else {
            vx0.c0(f76.F(oddVar), null, null, new add(oddVar, str, sourceParameter, n92Var, 4), 3);
        }
    }

    @Override // defpackage.cs1
    public final void p(String str, SourceParameter sourceParameter) {
        str.getClass();
        this.a.g(str, gp7.u(sourceParameter));
    }

    @Override // defpackage.cs1
    public final void y(String str, SourceParameter sourceParameter) {
        str.getClass();
        odd oddVar = this.b;
        if (oddVar.F.add(str)) {
            oddVar.n.g(str, oddVar.c, gp7.u(sourceParameter), oddVar.P);
        }
    }
}
