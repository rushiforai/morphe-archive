package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class d8f implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ long b;
    public final /* synthetic */ String c;

    public /* synthetic */ d8f(String str, int i, long j) {
        this.a = i;
        this.b = j;
        this.c = str;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) throws Exception {
        gnb gnbVarB0;
        int i = this.a;
        String str = this.c;
        long j = this.b;
        anb anbVar = (anb) obj;
        switch (i) {
            case 0:
                anbVar.getClass();
                gnbVarB0 = anbVar.B0("UPDATE workspec SET schedule_requested_at=? WHERE id=?");
                try {
                    gnbVarB0.c(1, j);
                    gnbVarB0.M(2, str);
                    gnbVarB0.w0();
                    int iS = dl7.s(anbVar);
                    gnbVarB0.close();
                    return Integer.valueOf(iS);
                } finally {
                }
            default:
                anbVar.getClass();
                gnbVarB0 = anbVar.B0("UPDATE workspec SET last_enqueue_time=? WHERE id=?");
                try {
                    gnbVarB0.c(1, j);
                    gnbVarB0.M(2, str);
                    gnbVarB0.w0();
                    gnbVarB0.close();
                    return c1e.a;
                } finally {
                }
        }
    }
}
