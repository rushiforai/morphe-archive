package defpackage;

import com.medium.android.postpublishing.ui.publicationSelection.PublicationData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class w61 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ int d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    public /* synthetic */ w61(int i, x45 x45Var, r28 r28Var, String str, boolean z) {
        this.a = 1;
        this.b = str;
        this.c = z;
        this.e = x45Var;
        this.f = r28Var;
        this.d = i;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.d;
        Object obj3 = this.b;
        Object obj4 = this.f;
        Object obj5 = this.e;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                bo.b((dr9) obj5, (mkd) obj4, this.c, (String) obj3, (x12) obj, iY);
                break;
            case 1:
                x12 x12Var = (x12) obj;
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                lk7.c(iY2, x12Var, (x45) obj5, (r28) obj4, (String) obj3, this.c);
                break;
            case 2:
                ((Integer) obj2).getClass();
                int iY3 = tr7.y(i2 | 1);
                pba.g((rba) obj5, this.c, (nba) obj4, (r28) obj3, (x12) obj, iY3);
                break;
            case 3:
                ((Integer) obj2).getClass();
                int iY4 = tr7.y(i2 | 1);
                xz5.t((PublicationData) obj5, (qvc) obj4, this.c, (wda) obj3, (x12) obj, iY4);
                break;
            case 4:
                ((Integer) obj2).getClass();
                int iY5 = tr7.y(i2 | 1);
                xz5.v((vga) obj5, (wda) obj4, (sda) obj3, this.c, (x12) obj, iY5);
                break;
            case 5:
                ((Integer) obj2).getClass();
                int iY6 = tr7.y(i2 | 1);
                ek7.c((pia) obj5, (nla) obj4, this.c, (r28) obj3, (x12) obj, iY6);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY7 = tr7.y(i2 | 1);
                hk7.k(this.c, (m45) obj5, (m45) obj4, (r28) obj3, (x12) obj, iY7);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ w61(rba rbaVar, boolean z, nba nbaVar, r28 r28Var, int i) {
        this.a = 2;
        this.e = rbaVar;
        this.c = z;
        this.f = nbaVar;
        this.b = r28Var;
        this.d = i;
    }

    public /* synthetic */ w61(vga vgaVar, wda wdaVar, sda sdaVar, boolean z, int i) {
        this.a = 4;
        this.e = vgaVar;
        this.f = wdaVar;
        this.b = sdaVar;
        this.c = z;
        this.d = i;
    }

    public /* synthetic */ w61(Object obj, Object obj2, boolean z, Object obj3, int i, int i2) {
        this.a = i2;
        this.e = obj;
        this.f = obj2;
        this.c = z;
        this.b = obj3;
        this.d = i;
    }

    public /* synthetic */ w61(boolean z, m45 m45Var, m45 m45Var2, r28 r28Var, int i) {
        this.a = 6;
        this.c = z;
        this.e = m45Var;
        this.f = m45Var2;
        this.b = r28Var;
        this.d = i;
    }
}
