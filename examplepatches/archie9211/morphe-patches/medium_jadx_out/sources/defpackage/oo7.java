package defpackage;

import com.medium.android.core.navigation.NotificationFilterType;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class oo7 implements m45 {
    public final /* synthetic */ int a;

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
                return c1eVar;
            case 9:
                mkd mkdVar = mkd.d;
                return new bu7(mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar, mkdVar);
            case 10:
                return jp7.a;
            case 11:
                return ap7.a;
            case 12:
                mkd mkdVar2 = mkd.d;
                return new eu7(mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2, mkdVar2);
            case 13:
                return c1eVar;
            case 14:
                return Long.valueOf(System.currentTimeMillis());
            case 15:
                return UUID.randomUUID();
            case 16:
                return new ipb();
            case 17:
                w16 w16Var = new w16();
                w16Var.a(n1b.a.b(ca8.class), new ss7(17));
                return w16Var.b();
            case 18:
                float f = fc8.a;
                return j03.a;
            case 19:
                return by2.a;
            case 20:
                return Integer.valueOf(((t0) NotificationFilterType.getEntries()).getSize());
            case 21:
                wuc wucVar = wuc.h;
                xzb[] xzbVarArr = new xzb[0];
                if (muc.b0("kotlin.Unit")) {
                    ay0.e("Blank serial names are prohibited");
                    return null;
                }
                if (wucVar == wuc.e) {
                    ay0.e("For StructureKind.CLASS please use 'buildClassSerialDescriptor' instead");
                    return null;
                }
                vn1 vn1Var = new vn1("kotlin.Unit");
                return new a0c("kotlin.Unit", wucVar, vn1Var.b.size(), k80.Q0(xzbVarArr), vn1Var);
            case 22:
                return c1eVar;
            case 23:
                return new tp8();
            case 24:
                return new z31(new up8());
            case 25:
                return c1eVar;
            case 26:
                return new dx8();
            case 27:
            case 28:
                return c1eVar;
            default:
                r13 r13Var = xg3.a;
                return vz2.c;
        }
    }

    public /* synthetic */ oo7(int i) {
        this.a = i;
    }
}
