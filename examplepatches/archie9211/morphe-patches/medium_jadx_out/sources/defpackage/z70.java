package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class z70 extends e1 {
    public int c = -1;
    public final /* synthetic */ a80 d;

    public z70(a80 a80Var) {
        this.d = a80Var;
    }

    @Override // defpackage.e1
    public final void a() {
        int i;
        Object[] objArr;
        do {
            i = this.c + 1;
            this.c = i;
            objArr = this.d.a;
            if (i >= objArr.length) {
                break;
            }
        } while (objArr[i] == null);
        if (i >= objArr.length) {
            this.a = 2;
            return;
        }
        Object obj = objArr[i];
        obj.getClass();
        this.b = obj;
        this.a = 1;
    }
}
