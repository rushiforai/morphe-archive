package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mv extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ nv b;
    public final /* synthetic */ long c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mv(nv nvVar, long j, int i) {
        super(1);
        this.a = i;
        this.b = nvVar;
        this.c = j;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        tj4 tj4Var;
        int i = this.a;
        long j = this.c;
        nv nvVar = this.b;
        switch (i) {
            case 0:
                zrd zrdVar = (zrd) obj;
                if (!g76.L(zrdVar.a(), nvVar.r.a())) {
                    upc upcVar = (upc) nvVar.r.d.g(zrdVar.a());
                    j = upcVar != null ? ((s46) upcVar.getValue()).a : 0L;
                } else if (!s46.a(nvVar.s, -9223372034707292160L)) {
                    j = nvVar.s;
                }
                upc upcVar2 = (upc) nvVar.r.d.g(zrdVar.c());
                j = upcVar2 != null ? ((s46) upcVar2.getValue()).a : 0L;
                mfc mfcVar = (mfc) nvVar.q.getValue();
                return (mfcVar == null || (tj4Var = (tj4) mfcVar.a.invoke(new s46(j), new s46(j))) == null) ? f76.P(0.0f, 400.0f, null, 5) : tj4Var;
            default:
                if (g76.L(obj, nvVar.r.a())) {
                    j = s46.a(nvVar.s, -9223372034707292160L) ? j : nvVar.s;
                } else {
                    upc upcVar3 = (upc) nvVar.r.d.g(obj);
                    if (upcVar3 != null) {
                        j = ((s46) upcVar3.getValue()).a;
                    }
                }
                return new s46(j);
        }
    }
}
