package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ws implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ l78 b;

    public /* synthetic */ ws(l78 l78Var, int i) {
        this.a = i;
        this.b = l78Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        l78 l78Var = this.b;
        switch (i) {
            case 0:
                l78Var.setValue((hp6) obj);
                break;
            case 1:
                l78Var.setValue((kb9) obj);
                break;
            case 2:
                l78Var.setValue((hp6) obj);
                break;
            case 3:
                ogd ogdVar = (ogd) obj;
                l78Var.setValue(ogdVar.c ? ogdVar.b : ogdVar.a);
                break;
            case 4:
                List list = (List) obj;
                if (l78Var != null) {
                    l78Var.setValue(list);
                }
                break;
            case 5:
                uid uidVar = (uid) obj;
                uidVar.getClass();
                l78Var.setValue(uidVar);
                break;
            case 6:
                Float f = (Float) obj;
                f.getClass();
                ((x45) l78Var.getValue()).invoke(f);
                break;
            case 7:
                e90 e90Var = (e90) obj;
                e90Var.getClass();
                l78Var.setValue(e90Var.a);
                break;
            case 8:
                String str = (String) obj;
                str.getClass();
                l78Var.setValue(str);
                break;
            case 9:
                String str2 = (String) obj;
                str2.getClass();
                l78Var.setValue(str2);
                break;
            case 10:
                ((d90) obj).getClass();
                l78Var.setValue(Boolean.TRUE);
                break;
            case 11:
                ((e90) obj).getClass();
                l78Var.setValue(Boolean.FALSE);
                break;
            case 12:
                ((c90) obj).getClass();
                l78Var.setValue(Boolean.TRUE);
                break;
            case 13:
                d28 d28Var = (d28) obj;
                d28Var.getClass();
                l78Var.setValue(d28Var);
                break;
            case 14:
                Integer num = (Integer) obj;
                num.getClass();
                l78Var.setValue(num);
                break;
            case 15:
                hp6 hp6Var = (hp6) obj;
                hp6Var.getClass();
                int iD = (int) (4294967295L & hp6Var.d(0L));
                l78Var.setValue(Boolean.valueOf(Float.intBitsToFloat(iD) > 0.0f && Float.intBitsToFloat(iD) > 0.0f));
                break;
            case 16:
                pt7 pt7Var = (pt7) obj;
                pt7Var.getClass();
                l78Var.setValue(pt7Var);
                break;
            case 17:
                kb9 kb9Var = (kb9) obj;
                l78Var.setValue(kb9Var != null ? kb9Var.a : null);
                break;
            case 18:
                l78Var.setValue((hp6) obj);
                break;
            case 19:
                zr4 zr4Var = (zr4) obj;
                zr4Var.getClass();
                l78Var.setValue(Boolean.valueOf(zr4Var.getHasFocus()));
                break;
            case 20:
                qjd qjdVar = (qjd) obj;
                qjdVar.getClass();
                if (qjdVar.b.f > 2 && ((Boolean) l78Var.getValue()).booleanValue()) {
                    l78Var.setValue(Boolean.FALSE);
                }
                break;
            case 21:
                l78Var.setValue(Boolean.valueOf(!((Boolean) obj).booleanValue()));
                break;
            case 22:
                hp6 hp6Var2 = (hp6) obj;
                hp6Var2.getClass();
                int iJ = (int) (4294967295L & hp6Var2.j());
                if (((Integer) l78Var.getValue()) == null && iJ != 0) {
                    l78Var.setValue(Integer.valueOf(iJ));
                }
                break;
            case 23:
                qjd qjdVar2 = (qjd) obj;
                qjdVar2.getClass();
                if (qjdVar2.d()) {
                    l78Var.setValue(vw8.COLLAPSED);
                }
                break;
            case 24:
                Float f2 = (Float) obj;
                f2.getClass();
                break;
            case 25:
                zl3 zl3Var = (zl3) obj;
                long j = ((uu1) l78Var.getValue()).a;
                float fZ = zl3Var.Z(34.0f);
                float fZ2 = zl3Var.Z(14.0f);
                float f3 = fZ2 / 2.0f;
                ho2.n(zl3Var, j, (((long) Float.floatToRawIntBits(f3)) << 32) | (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (zl3Var.k0() & 4294967295L)))) & 4294967295L), (((long) Float.floatToRawIntBits(fZ - f3)) << 32) | (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (zl3Var.k0() & 4294967295L)))) & 4294967295L), fZ2, 1, 480);
                break;
            case 26:
                l78Var.setValue(Boolean.valueOf(!((Boolean) obj).booleanValue()));
                break;
            case 27:
                break;
            case 28:
                ((x45) l78Var.getValue()).invoke((ip8) obj);
                break;
            default:
                l78Var.setValue((hp6) obj);
                break;
        }
        return c1eVar;
    }
}
