package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class osa extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ float b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ osa(int i, float f) {
        super(0);
        this.a = i;
        this.b = f;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        float f = this.b;
        switch (i) {
            case 0:
                return Float.valueOf(f);
            case 1:
                return "Sample rate value provided " + f + " is below 0, setting it to 0.";
            default:
                return "Sample rate value provided " + f + " is above 100, setting it to 100.";
        }
    }
}
