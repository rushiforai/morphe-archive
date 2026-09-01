package j$.time.temporal;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class m implements l {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;

    public /* synthetic */ m(int i, int i2) {
        this.a = i2;
        this.b = i;
    }

    @Override // j$.time.temporal.l
    public final Temporal k(Temporal temporal) {
        int i = this.a;
        int i2 = this.b;
        switch (i) {
            case 0:
                int iH = temporal.h(a.DAY_OF_WEEK);
                if (iH == i2) {
                    return temporal;
                }
                return temporal.c(iH - i2 >= 0 ? 7 - r0 : -r0, ChronoUnit.DAYS);
            default:
                int iH2 = temporal.h(a.DAY_OF_WEEK);
                if (iH2 == i2) {
                    return temporal;
                }
                return temporal.q(i2 - iH2 >= 0 ? 7 - r2 : -r2, ChronoUnit.DAYS);
        }
    }
}
