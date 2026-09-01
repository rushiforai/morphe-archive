package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n62 implements o62 {
    public boolean a;
    public String b;
    public String c;
    public float d;
    public float e;

    @Override // defpackage.o62
    public final float value() {
        float f = this.d;
        if (f >= this.e) {
            this.a = true;
        }
        if (this.a) {
            return f;
        }
        float f2 = f + 1.0f;
        this.d = f2;
        return f2;
    }
}
