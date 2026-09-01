package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vsd implements kud {
    public final kxd a;
    public final boolean b;
    public final ac6 c;

    public vsd(Object obj, kxd kxdVar, boolean z) {
        ac6 ac6Var = obj instanceof ac6 ? (ac6) obj : null;
        this.c = ac6Var;
        if (ac6Var == null) {
            ik4.i("Type adapter ", obj.getClass().getName(), " must implement JsonSerializer or JsonDeserializer");
            throw null;
        }
        this.a = kxdVar;
        this.b = z;
    }

    @Override // defpackage.kud
    public final jud a(ch5 ch5Var, kxd kxdVar) {
        kxd kxdVar2 = this.a;
        if (kxdVar2.equals(kxdVar) || (this.b && kxdVar2.d() == kxdVar.c())) {
            return new wsd(this.c, ch5Var, kxdVar, this, true);
        }
        return null;
    }
}
