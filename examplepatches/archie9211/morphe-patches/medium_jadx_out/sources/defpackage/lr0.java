package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lr0 extends ond {
    public final short c;
    public final short d;

    public lr0(ond ondVar, int i, int i2) {
        super(ondVar);
        this.c = (short) i;
        this.d = (short) i2;
    }

    @Override // defpackage.ond
    public final void a(qr0 qr0Var, byte[] bArr) {
        int i = 0;
        while (true) {
            short s = this.d;
            if (i >= s) {
                return;
            }
            if (i == 0 || (i == 31 && s <= 62)) {
                qr0Var.b(31, 5);
                if (s > 62) {
                    qr0Var.b(s - 31, 16);
                } else if (i == 0) {
                    qr0Var.b(Math.min((int) s, 31), 5);
                } else {
                    qr0Var.b(s - 31, 5);
                }
            }
            qr0Var.b(bArr[this.c + i], 8);
            i++;
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("<");
        sb.append((int) this.c);
        sb.append("::");
        sb.append((r1 + this.d) - 1);
        sb.append('>');
        return sb.toString();
    }
}
