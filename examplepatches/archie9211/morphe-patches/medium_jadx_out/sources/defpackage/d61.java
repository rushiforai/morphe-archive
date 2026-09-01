package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d61 implements gb2, hb2 {
    public static final hpe b = new hpe(13);
    public static final d61 c = new d61(1);
    public static final d61 d = new d61(2);
    public final /* synthetic */ int a;

    public /* synthetic */ d61(int i) {
        this.a = i;
    }

    @Override // defpackage.ib2
    public final Object N(b55 b55Var, Object obj) {
        switch (this.a) {
        }
        return b55Var.invoke(obj, this);
    }

    @Override // defpackage.ib2
    public final ib2 T(hb2 hb2Var) {
        switch (this.a) {
        }
        return flb.n0(this, hb2Var);
    }

    @Override // defpackage.gb2
    public final hb2 getKey() {
        switch (this.a) {
            case 0:
                return b;
            case 1:
                return c;
            default:
                return this;
        }
    }

    @Override // defpackage.ib2
    public final ib2 j0(ib2 ib2Var) {
        switch (this.a) {
        }
        return flb.p0(this, ib2Var);
    }

    @Override // defpackage.ib2
    public final gb2 o0(hb2 hb2Var) {
        switch (this.a) {
        }
        return flb.i0(this, hb2Var);
    }
}
