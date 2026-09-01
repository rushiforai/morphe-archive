package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bea implements b55 {
    public final /* synthetic */ lr4 a;
    public final /* synthetic */ akc b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ z52 d;
    public final /* synthetic */ i52 e;
    public final /* synthetic */ i52 f;
    public final /* synthetic */ sr4 g;
    public final /* synthetic */ l78 h;
    public final /* synthetic */ l78 i;

    public bea(lr4 lr4Var, akc akcVar, m45 m45Var, z52 z52Var, i52 i52Var, i52 i52Var2, sr4 sr4Var, l78 l78Var, l78 l78Var2) {
        this.a = lr4Var;
        this.b = akcVar;
        this.c = m45Var;
        this.d = z52Var;
        this.e = i52Var;
        this.f = i52Var2;
        this.g = sr4Var;
        this.h = l78Var;
        this.i = l78Var2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            boolean zH = p65Var.h(this.a) | p65Var.f(this.b) | p65Var.f(this.c);
            Object objM = p65Var.M();
            l78 l78Var = this.i;
            l78 l78Var2 = this.h;
            uob uobVar = w12.a;
            if (zH || objM == uobVar) {
                aea aeaVar = new aea(this.a, this.b, this.c, this.g, l78Var2, l78Var);
                p65Var.j0(aeaVar);
                objM = aeaVar;
            }
            m45 m45Var = (m45) objM;
            String strR = vo7.R(p65Var, (((Boolean) l78Var2.getValue()).booleanValue() || ((Boolean) l78Var.getValue()).booleanValue()) ? R.string.common_done : R.string.common_edit);
            yn7 yn7Var = yn7.M;
            i52 i52Var = this.f;
            boolean zF = p65Var.f(i52Var);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new et0(i52Var, 19);
                p65Var.j0(objM2);
            }
            this.d.getClass();
            mo7.m(384, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, p65Var, null, m45Var, yn7Var, new y52(this.e, (x45) objM2), strR, false, false);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
