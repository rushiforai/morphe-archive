package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class aj6 extends mj6 implements xi6 {
    public final vq6 o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public aj6(ph6 ph6Var, String str, String str2, Object obj) {
        super(ph6Var, str, str2, null, obj);
        str.getClass();
        str2.getClass();
        yw6 yw6Var = yw6.PUBLICATION;
        this.o = vx0.d0(yw6Var, new yi6(this, 0));
        vx0.d0(yw6Var, new yi6(this, 1));
    }

    @Override // defpackage.mj6
    public final jj6 F() {
        return (zi6) this.o.getValue();
    }

    @Override // defpackage.fj6
    public final zi6 b() {
        return (zi6) this.o.getValue();
    }

    @Override // defpackage.xi6
    public final Object get(Object obj) {
        return ((zi6) this.o.getValue()).call(obj);
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        return get(obj);
    }

    @Override // defpackage.fj6
    public final jj6 b() {
        return (zi6) this.o.getValue();
    }

    public aj6(ph6 ph6Var, r4a r4aVar) {
        super(ph6Var, r4aVar);
        yw6 yw6Var = yw6.PUBLICATION;
        this.o = vx0.d0(yw6Var, new yi6(this, 0));
        vx0.d0(yw6Var, new yi6(this, 1));
    }
}
