package defpackage;

import java.io.IOException;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kh4 implements ae6 {
    public final ae6 a;
    public final LinkedHashMap b = new LinkedHashMap();

    public kh4(ae6 ae6Var) {
        this.a = ae6Var;
    }

    @Override // defpackage.ae6
    public final ae6 E(String str) {
        str.getClass();
        this.a.E(str);
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 V(boolean z) {
        this.a.V(z);
        return this;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.a.close();
    }

    @Override // defpackage.ae6
    public final ae6 e() {
        this.a.e();
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 i() {
        this.a.i();
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 k() {
        this.a.k();
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 n() {
        this.a.n();
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 s0() {
        this.a.s0();
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 t(long j) {
        this.a.t(j);
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 t0(String str) {
        this.a.t0(str);
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 u(int i) {
        this.a.u(i);
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 x(rc6 rc6Var) {
        this.a.x(rc6Var);
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 z(double d) {
        this.a.z(d);
        return this;
    }
}
