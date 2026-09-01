package defpackage;

import com.medium.android.postpublishing.ui.publicationSelection.c;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class dma implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ r28 d;
    public final /* synthetic */ j55 e;

    public /* synthetic */ dma(boolean z, x45 x45Var, r28 r28Var, boolean z2, int i) {
        this.b = z;
        this.e = x45Var;
        this.d = r28Var;
        this.c = z2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        j55 j55Var = this.e;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(385);
                c.a(this.b, (x45) j55Var, this.d, this.c, (x12) obj, iY);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(1);
                fo7.y(this.b, this.c, (m45) j55Var, this.d, (x12) obj, iY2);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ dma(boolean z, boolean z2, m45 m45Var, r28 r28Var, int i) {
        this.b = z;
        this.c = z2;
        this.e = m45Var;
        this.d = r28Var;
    }
}
