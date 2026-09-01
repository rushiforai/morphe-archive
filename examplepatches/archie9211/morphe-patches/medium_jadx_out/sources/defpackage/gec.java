package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gec extends ond {
    public final short c;
    public final short d;

    public gec(ond ondVar, int i, int i2) {
        super(ondVar);
        this.c = (short) i;
        this.d = (short) i2;
    }

    @Override // defpackage.ond
    public final void a(qr0 qr0Var, byte[] bArr) {
        qr0Var.b(this.c, this.d);
    }

    public final String toString() {
        short s = this.d;
        return "<" + Integer.toBinaryString((this.c & ((1 << s) - 1)) | (1 << s) | (1 << s)).substring(1) + '>';
    }
}
