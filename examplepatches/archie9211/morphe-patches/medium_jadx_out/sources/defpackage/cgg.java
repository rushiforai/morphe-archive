package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cgg extends lfg {
    public final mgg d;

    public cgg(mgg mggVar, int i) {
        super(mggVar.size(), i);
        this.d = mggVar;
    }

    @Override // defpackage.lfg
    public final Object b(int i) {
        return this.d.get(i);
    }
}
