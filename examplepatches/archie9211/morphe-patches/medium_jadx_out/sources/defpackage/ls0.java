package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ls0 implements js0 {
    public final /* synthetic */ sb2 a;
    public final /* synthetic */ v7c b;
    public final /* synthetic */ js0 c;

    public ls0(sb2 sb2Var, v7c v7cVar, js0 js0Var) {
        this.a = sb2Var;
        this.b = v7cVar;
        this.c = js0Var;
    }

    @Override // defpackage.js0
    public final void a() {
        vx0.c0(this.a, null, null, new l0(new n7(12), this.b, this.c, null, 18), 3);
    }

    @Override // defpackage.js0
    public final void b(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        js0 js0Var = this.c;
        vx0.c0(this.a, null, null, new l0(new n(js0Var, 21, sourceParameter), this.b, js0Var, null, 18), 3);
    }

    @Override // defpackage.js0
    public final void c(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        js0 js0Var = this.c;
        vx0.c0(this.a, null, null, new l0(new le0(js0Var, str, sourceParameter, 5), this.b, js0Var, null, 18), 3);
    }
}
