package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class m01 implements yx {
    public final vm6 a;
    public final y05 b;
    public final Map c;
    public final vq6 d;

    public m01(vm6 vm6Var, y05 y05Var, Map map) {
        vm6Var.getClass();
        y05Var.getClass();
        this.a = vm6Var;
        this.b = y05Var;
        this.c = map;
        this.d = vx0.d0(yw6.PUBLICATION, new v2(4, this));
    }

    @Override // defpackage.yx
    public final jkc d() {
        return jkc.g0;
    }

    @Override // defpackage.yx
    public final y05 e() {
        return this.b;
    }

    @Override // defpackage.yx
    public final Map f() {
        return this.c;
    }

    @Override // defpackage.yx
    public final mn6 getType() {
        Object value = this.d.getValue();
        value.getClass();
        return (mn6) value;
    }
}
