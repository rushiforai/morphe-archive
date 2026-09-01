package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class did implements nsb {
    public final /* synthetic */ nsb a;
    public final j83 b;
    public final j83 c;

    public did(nsb nsbVar, final eid eidVar) {
        this.a = nsbVar;
        final int i = 0;
        this.b = bjc.b(new m45() { // from class: cid
            @Override // defpackage.m45
            public final Object invoke() {
                int i2 = i;
                eid eidVar2 = eidVar;
                switch (i2) {
                    case 0:
                        return Boolean.valueOf(eidVar2.a.g() < eidVar2.b.g());
                    default:
                        return Boolean.valueOf(eidVar2.a.g() > 0.0f);
                }
            }
        });
        final int i2 = 1;
        this.c = bjc.b(new m45() { // from class: cid
            @Override // defpackage.m45
            public final Object invoke() {
                int i22 = i2;
                eid eidVar2 = eidVar;
                switch (i22) {
                    case 0:
                        return Boolean.valueOf(eidVar2.a.g() < eidVar2.b.g());
                    default:
                        return Boolean.valueOf(eidVar2.a.g() > 0.0f);
                }
            }
        });
    }

    @Override // defpackage.nsb
    public final boolean a() {
        return this.a.a();
    }

    @Override // defpackage.nsb
    public final Object b(s78 s78Var, b55 b55Var, n92 n92Var) {
        return this.a.b(s78Var, b55Var, n92Var);
    }

    @Override // defpackage.nsb
    public final boolean c() {
        return ((Boolean) this.c.getValue()).booleanValue();
    }

    @Override // defpackage.nsb
    public final boolean d() {
        return ((Boolean) this.b.getValue()).booleanValue();
    }

    @Override // defpackage.nsb
    public final float e(float f) {
        return this.a.e(f);
    }
}
