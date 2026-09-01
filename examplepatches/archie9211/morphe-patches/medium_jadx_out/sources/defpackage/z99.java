package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z99 extends co6 implements m45 {
    public final /* synthetic */ String a;
    public final /* synthetic */ int b;
    public final /* synthetic */ int c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z99(String str, int i, int i2) {
        super(0);
        this.a = str;
        this.b = i;
        this.c = i2;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        StringBuilder sbT = y30.t(this.b, "Number of bytes read for operation='", this.a, "' doesn't match with expected: expected=", ", actual=");
        sbT.append(this.c);
        return sbT.toString();
    }
}
