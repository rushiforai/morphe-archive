package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nba {
    public final /* synthetic */ olb a;
    public final /* synthetic */ lca b;

    public nba(olb olbVar, lca lcaVar) {
        this.a = olbVar;
        this.b = lcaVar;
    }

    public final void a(Integer num) {
        this.b.m.d("selected_year", num);
    }

    public final void b(String str) {
        vob vobVar = this.b.m;
        rba rbaVar = (rba) vobVar.a("selected_sort");
        if (rbaVar == null) {
            rbaVar = lca.w;
        }
        rbaVar.getClass();
        if (str != null && rbaVar == rba.MOST_POPULAR) {
            rbaVar = rba.LATEST;
        }
        vobVar.d("selected_sort", rbaVar);
        vobVar.d("selected_tag", str);
    }
}
