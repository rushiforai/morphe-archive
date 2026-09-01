package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class l80 {
    public float a;
    public float b;

    public en4 a(float f) {
        double dB = b(f);
        double d = fn4.a;
        double d2 = d - 1.0d;
        return new en4(f, (float) (Math.exp((d / d2) * dB) * ((double) (this.a * this.b))), (long) (Math.exp(dB / d2) * 1000.0d));
    }

    public double b(float f) {
        float[] fArr = lp.a;
        return Math.log(((double) (Math.abs(f) * 0.35f)) / ((double) (this.a * this.b)));
    }
}
