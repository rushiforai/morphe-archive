package defpackage;

import com.drew.metadata.exif.makernotes.OlympusImageProcessingMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class i29 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ rg1 b;
    public final /* synthetic */ j29 c;

    public /* synthetic */ i29(rg1 rg1Var, j29 j29Var, int i) {
        this.a = i;
        this.b = rg1Var;
        this.c = j29Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        j29 j29Var = this.c;
        int i2 = 1;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i) {
            case 0:
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    jt7.a(false, pxf.E(1300114504, new i29(this.b, j29Var, i2), p65Var), p65Var, 48, 1);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            default:
                p65 p65Var2 = (p65) x12Var;
                if (p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    ye1 ye1Var = j29Var.e;
                    if (ye1Var == null) {
                        g76.g0("catalogListener");
                        throw null;
                    }
                    k40.v(this.b, ye1Var, j29Var.b, j29Var.c, null, p65Var2, OlympusImageProcessingMakernoteDirectory.TagFacesDetected);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
        }
    }
}
