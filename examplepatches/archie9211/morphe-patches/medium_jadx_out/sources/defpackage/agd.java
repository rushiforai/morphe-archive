package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class agd extends ufd {
    public final /* synthetic */ int e = 1;
    public final /* synthetic */ m45 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public agd(String str, m45 m45Var) {
        super(str, true);
        this.f = m45Var;
    }

    @Override // defpackage.ufd
    public final long a() {
        int i = this.e;
        m45 m45Var = this.f;
        switch (i) {
            case 0:
                m45Var.invoke();
                return -1L;
            default:
                return ((Number) m45Var.invoke()).longValue();
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public agd(String str, boolean z, m45 m45Var) {
        super(str, z);
        this.f = m45Var;
    }
}
