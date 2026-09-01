package defpackage;

import android.graphics.Path;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class e58 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;
    public final /* synthetic */ int c;
    public final /* synthetic */ Object d;

    public /* synthetic */ e58(Object obj, int i, int i2, int i3) {
        this.a = i3;
        this.d = obj;
        this.b = i;
        this.c = i2;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.c;
        int i3 = this.b;
        Object obj2 = this.d;
        switch (i) {
            case 0:
                br brVar = (br) obj2;
                y19 y19Var = (y19) obj;
                wq wqVar = y19Var.a;
                int iD = y19Var.d(i3);
                int iD2 = y19Var.d(i2);
                CharSequence charSequence = wqVar.e;
                if (iD < 0 || iD > iD2 || iD2 > charSequence.length()) {
                    StringBuilder sbB = ev6.B(iD, iD2, "start(", ") or end(", ") is out of range [0..");
                    sbB.append(charSequence.length());
                    sbB.append("], or start > end!");
                    c26.a(sbB.toString());
                }
                Path path = new Path();
                ojd ojdVar = wqVar.d;
                ojdVar.f.getSelectionPath(iD, iD2, path);
                int i4 = ojdVar.h;
                if (i4 != 0 && !path.isEmpty()) {
                    path.offset(0.0f, i4);
                }
                br brVar2 = new br(path);
                brVar2.h((((long) Float.floatToRawIntBits(0.0f)) << 32) | (((long) Float.floatToRawIntBits(y19Var.f)) & 4294967295L));
                b09.l(brVar, brVar2);
                return c1eVar;
            default:
                s99 s99Var = (s99) obj;
                s99Var.getClass();
                int i5 = 0;
                int i6 = 0;
                for (Object obj3 : (ArrayList) obj2) {
                    int i7 = i5 + 1;
                    if (i5 < 0) {
                        d46.i0();
                        throw null;
                    }
                    t99 t99Var = (t99) obj3;
                    s99.j(s99Var, t99Var, 0, i6);
                    i6 += t99Var.b;
                    if (i5 != i3 - 1) {
                        i6 += i2;
                    }
                    i5 = i7;
                }
                return c1eVar;
        }
    }
}
