package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sn3 extends d8a {
    public final /* synthetic */ int b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ sn3(int i, m45 m45Var) {
        super(m45Var);
        this.b = i;
    }

    @Override // defpackage.d8a
    public final o10 a(Object obj) {
        switch (this.b) {
            case 0:
                return new o10(this, obj, obj == null, xsa.h, true);
            default:
                return new o10(this, obj, obj == null, null, false);
        }
    }
}
