package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tif implements pm0 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ tif(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.pm0
    public final void a(boolean z) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                Boolean boolValueOf = Boolean.valueOf(z);
                tjf tjfVar = ((ee5) obj).m;
                tjfVar.sendMessage(tjfVar.obtainMessage(1, boolValueOf));
                break;
            default:
                ujf ujfVar = (ujf) obj;
                if (z) {
                    kvf kvfVar = (kvf) ujfVar.b;
                    kvfVar.c.removeCallbacks(kvfVar.d);
                }
                break;
        }
    }
}
