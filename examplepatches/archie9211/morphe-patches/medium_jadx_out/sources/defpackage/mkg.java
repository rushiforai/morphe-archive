package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mkg extends ggg {
    public final /* synthetic */ amg h;

    public mkg(amg amgVar) {
        this.h = amgVar;
    }

    @Override // defpackage.ggg
    public final String c() {
        ohg ohgVar = (ohg) this.h.a.get();
        return ohgVar == null ? "Completer object has been garbage collected, future will fail soon" : ev6.x("tag=[", String.valueOf(ohgVar.a), "]");
    }
}
