package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m42 implements gnb {
    public final gnb a;

    public m42(gnb gnbVar) {
        this.a = gnbVar;
    }

    @Override // defpackage.gnb
    public final void M(int i, String str) {
        str.getClass();
        this.a.M(i, str);
    }

    @Override // defpackage.gnb
    public final boolean P() {
        return this.a.P();
    }

    @Override // defpackage.gnb
    public final void c(int i, long j) {
        this.a.c(i, j);
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        gnb gnbVar = this.a;
        gnbVar.reset();
        gnbVar.l();
    }

    @Override // defpackage.gnb
    public final void d(int i, byte[] bArr) {
        this.a.d(i, bArr);
    }

    @Override // defpackage.gnb
    public final String d0(int i) {
        return this.a.d0(i);
    }

    @Override // defpackage.gnb
    public final void g(int i) {
        this.a.g(i);
    }

    @Override // defpackage.gnb
    public final byte[] getBlob(int i) {
        return this.a.getBlob(i);
    }

    @Override // defpackage.gnb
    public final int getColumnCount() {
        return this.a.getColumnCount();
    }

    @Override // defpackage.gnb
    public final String getColumnName(int i) {
        return this.a.getColumnName(i);
    }

    @Override // defpackage.gnb
    public final long getLong(int i) {
        return this.a.getLong(i);
    }

    @Override // defpackage.gnb
    public final boolean isNull(int i) {
        return this.a.isNull(i);
    }

    @Override // defpackage.gnb
    public final void l() {
        this.a.l();
    }

    @Override // defpackage.gnb
    public final void reset() {
        this.a.reset();
    }

    @Override // defpackage.gnb
    public final boolean w0() {
        return this.a.w0();
    }
}
