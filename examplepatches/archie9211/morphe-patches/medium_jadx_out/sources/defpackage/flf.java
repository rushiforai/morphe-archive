package defpackage;

import android.text.TextUtils;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class flf implements iof {
    public final /* synthetic */ int a;
    public final /* synthetic */ zjf b;
    public final /* synthetic */ ujf c;

    public /* synthetic */ flf(ujf ujfVar, zjf zjfVar, int i) {
        this.a = i;
        this.b = zjfVar;
        this.c = ujfVar;
    }

    @Override // defpackage.iof
    /* JADX INFO: renamed from: a */
    public final void mo105a(String str) {
        int i = this.a;
        zjf zjfVar = this.b;
        switch (i) {
            case 0:
                zjfVar.b(hp7.K(str));
                break;
            default:
                zjfVar.b(hp7.K(str));
                break;
        }
    }

    @Override // defpackage.iof
    public final void h(xnf xnfVar) {
        switch (this.a) {
            case 0:
                nrf nrfVar = (nrf) xnfVar;
                boolean zIsEmpty = TextUtils.isEmpty(nrfVar.e);
                zjf zjfVar = this.b;
                if (!zIsEmpty) {
                    zjfVar.j(new zjf(nrfVar.e, nrfVar.d, (lxf) null));
                } else {
                    this.c.s(new zpf(nrfVar.b, nrfVar.a, Long.valueOf(nrfVar.c)), null, null, Boolean.FALSE, null, zjfVar, this);
                }
                break;
            default:
                rrf rrfVar = (rrf) xnfVar;
                this.c.s(new zpf(rrfVar.b, rrfVar.a, Long.valueOf(rrfVar.c)), null, null, Boolean.valueOf(rrfVar.d), null, this.b, this);
                break;
        }
    }
}
