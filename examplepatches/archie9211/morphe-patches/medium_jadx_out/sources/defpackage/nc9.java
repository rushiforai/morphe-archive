package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nc9 implements gnb {
    public final gnb a;
    public final long b;
    public final /* synthetic */ uc9 c;

    public nc9(uc9 uc9Var, gnb gnbVar) {
        gnbVar.getClass();
        this.c = uc9Var;
        this.a = gnbVar;
        this.b = no7.o();
    }

    @Override // defpackage.gnb
    public final void M(int i, String str) {
        str.getClass();
        if (this.c.e) {
            qk7.z(21, "Statement is recycled");
            throw null;
        }
        if (this.b == no7.o()) {
            this.a.M(i, str);
        } else {
            qk7.z(21, "Attempted to use statement on a different thread");
            throw null;
        }
    }

    @Override // defpackage.gnb
    public final boolean P() {
        return getLong(0) != 0;
    }

    @Override // defpackage.gnb
    public final void c(int i, long j) {
        if (this.c.e) {
            qk7.z(21, "Statement is recycled");
            throw null;
        }
        if (this.b == no7.o()) {
            this.a.c(i, j);
        } else {
            qk7.z(21, "Attempted to use statement on a different thread");
            throw null;
        }
    }

    @Override // java.lang.AutoCloseable
    public final void close() throws Exception {
        if (this.c.e) {
            qk7.z(21, "Statement is recycled");
            throw null;
        }
        if (this.b == no7.o()) {
            this.a.close();
        } else {
            qk7.z(21, "Attempted to use statement on a different thread");
            throw null;
        }
    }

    @Override // defpackage.gnb
    public final void d(int i, byte[] bArr) {
        if (this.c.e) {
            qk7.z(21, "Statement is recycled");
            throw null;
        }
        if (this.b == no7.o()) {
            this.a.d(i, bArr);
        } else {
            qk7.z(21, "Attempted to use statement on a different thread");
            throw null;
        }
    }

    @Override // defpackage.gnb
    public final String d0(int i) {
        if (this.c.e) {
            qk7.z(21, "Statement is recycled");
            throw null;
        }
        if (this.b == no7.o()) {
            return this.a.d0(i);
        }
        qk7.z(21, "Attempted to use statement on a different thread");
        throw null;
    }

    @Override // defpackage.gnb
    public final void g(int i) {
        if (this.c.e) {
            qk7.z(21, "Statement is recycled");
            throw null;
        }
        if (this.b == no7.o()) {
            this.a.g(i);
        } else {
            qk7.z(21, "Attempted to use statement on a different thread");
            throw null;
        }
    }

    @Override // defpackage.gnb
    public final byte[] getBlob(int i) {
        if (this.c.e) {
            qk7.z(21, "Statement is recycled");
            throw null;
        }
        if (this.b == no7.o()) {
            return this.a.getBlob(i);
        }
        qk7.z(21, "Attempted to use statement on a different thread");
        throw null;
    }

    @Override // defpackage.gnb
    public final int getColumnCount() {
        if (this.c.e) {
            qk7.z(21, "Statement is recycled");
            throw null;
        }
        if (this.b == no7.o()) {
            return this.a.getColumnCount();
        }
        qk7.z(21, "Attempted to use statement on a different thread");
        throw null;
    }

    @Override // defpackage.gnb
    public final String getColumnName(int i) {
        if (this.c.e) {
            qk7.z(21, "Statement is recycled");
            throw null;
        }
        if (this.b == no7.o()) {
            return this.a.getColumnName(i);
        }
        qk7.z(21, "Attempted to use statement on a different thread");
        throw null;
    }

    @Override // defpackage.gnb
    public final long getLong(int i) {
        if (this.c.e) {
            qk7.z(21, "Statement is recycled");
            throw null;
        }
        if (this.b == no7.o()) {
            return this.a.getLong(i);
        }
        qk7.z(21, "Attempted to use statement on a different thread");
        throw null;
    }

    @Override // defpackage.gnb
    public final boolean isNull(int i) {
        if (this.c.e) {
            qk7.z(21, "Statement is recycled");
            throw null;
        }
        if (this.b == no7.o()) {
            return this.a.isNull(i);
        }
        qk7.z(21, "Attempted to use statement on a different thread");
        throw null;
    }

    @Override // defpackage.gnb
    public final void l() {
        if (this.c.e) {
            qk7.z(21, "Statement is recycled");
            throw null;
        }
        if (this.b == no7.o()) {
            this.a.l();
        } else {
            qk7.z(21, "Attempted to use statement on a different thread");
            throw null;
        }
    }

    @Override // defpackage.gnb
    public final void reset() {
        if (this.c.e) {
            qk7.z(21, "Statement is recycled");
            throw null;
        }
        if (this.b == no7.o()) {
            this.a.reset();
        } else {
            qk7.z(21, "Attempted to use statement on a different thread");
            throw null;
        }
    }

    @Override // defpackage.gnb
    public final boolean w0() {
        if (this.c.e) {
            qk7.z(21, "Statement is recycled");
            throw null;
        }
        if (this.b == no7.o()) {
            return this.a.w0();
        }
        qk7.z(21, "Attempted to use statement on a different thread");
        throw null;
    }
}
