package defpackage;

import android.app.PendingIntent;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ayc implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ lyc b;

    public /* synthetic */ ayc(lyc lycVar, int i) {
        this.a = i;
        this.b = lycVar;
    }

    @Override // defpackage.m45
    public final Object invoke() throws PendingIntent.CanceledException {
        int i = this.a;
        c1e c1eVar = c1e.a;
        lyc lycVar = this.b;
        switch (i) {
            case 0:
                lycVar.a(i03.D);
                break;
            case 1:
                lycVar.a(i03.E);
                break;
            case 2:
                lycVar.a("https://help.medium.com/hc/en-us/articles/13138771169687");
                break;
            case 3:
                lycVar.a("https://help.medium.com/hc/en-us/articles/13138771169687");
                break;
            default:
                lycVar.a("https://help.medium.com/hc/en-us/articles/13138771169687");
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ ayc(lyc lycVar, hu7 hu7Var, int i) {
        this.a = i;
        this.b = lycVar;
    }
}
