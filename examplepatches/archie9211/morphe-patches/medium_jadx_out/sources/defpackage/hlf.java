package defpackage;

import android.text.TextUtils;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hlf implements iof {
    public final /* synthetic */ int a;
    public final /* synthetic */ zjf b;
    public final /* synthetic */ ujf c;

    public /* synthetic */ hlf(ujf ujfVar, zjf zjfVar, int i) {
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
                hpf hpfVar = (hpf) xnfVar;
                boolean zIsEmpty = TextUtils.isEmpty(hpfVar.f);
                zjf zjfVar = this.b;
                if (!zIsEmpty) {
                    zjfVar.j(new zjf(hpfVar.f, hpfVar.e, (lxf) null));
                } else {
                    this.c.s(new zpf(hpfVar.b, hpfVar.a, Long.valueOf(hpfVar.d)), null, null, Boolean.valueOf(hpfVar.c), null, zjfVar, this);
                }
                break;
            default:
                irf irfVar = (irf) xnfVar;
                boolean zIsEmpty2 = TextUtils.isEmpty(irfVar.p);
                zjf zjfVar2 = this.b;
                if (!zIsEmpty2) {
                    zjfVar2.j(new zjf(irfVar.p, irfVar.o, irfVar.b()));
                } else {
                    ujf.q(this.c, irfVar, zjfVar2, this);
                }
                break;
        }
    }
}
