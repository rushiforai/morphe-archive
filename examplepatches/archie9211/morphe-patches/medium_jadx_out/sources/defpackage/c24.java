package defpackage;

import com.drew.metadata.exif.ExifDirectoryBase;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class c24 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ f24 b;
    public final /* synthetic */ pr0 c;

    public /* synthetic */ c24(f24 f24Var, pr0 pr0Var, int i) {
        this.a = i;
        this.b = f24Var;
        this.c = pr0Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        pr0 pr0Var = this.c;
        f24 f24Var = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    kt7.a(false, pxf.E(456311075, new c24(f24Var, pr0Var, i2), p65Var), p65Var, 48);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            default:
                b24 b24Var = f24Var.e;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    int i3 = e24.a[f24Var.d.ordinal()];
                    if (i3 == 1) {
                        p65Var2.Y(391857970);
                        lg9 lg9Var = f24Var.c.d;
                        String strR = vo7.R(p65Var2, R.string.read_saved_stories);
                        boolean zH = p65Var2.h(f24Var) | p65Var2.h(pr0Var);
                        Object objM = p65Var2.M();
                        if (zH || objM == w12.a) {
                            objM = new nh2(f24Var, pr0Var);
                            p65Var2.j0(objM);
                        }
                        jq7.a(b24Var, null, null, null, null, strR, lg9Var, (m45) objM, p65Var2, 0, 30);
                        p65Var2.p(false);
                    } else {
                        if (i3 != 2) {
                            throw ho2.L(p65Var2, 428280349, false);
                        }
                        p65Var2.Y(392487983);
                        jq7.a(b24Var, null, null, null, null, null, null, null, p65Var2, 0, ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE);
                        p65Var2.p(false);
                    }
                } else {
                    p65Var2.S();
                }
                return c1eVar;
        }
    }
}
