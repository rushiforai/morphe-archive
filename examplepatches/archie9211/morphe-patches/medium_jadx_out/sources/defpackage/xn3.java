package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum xn3 implements sd {
    ED256(-260),
    ED512(-261),
    ED25519(-8),
    ES256(-7),
    ECDH_HKDF_256(-25),
    ES384(-35),
    ES512(-36);

    public final int a;

    xn3(int i) {
        this.a = i;
    }

    @Override // defpackage.sd
    public int getAlgoValue() {
        return this.a;
    }
}
