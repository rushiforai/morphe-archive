package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oob implements nob {
    public static final mya e = new mya(new sw8(20), 3, new qna(21));
    public final Map a;
    public final f78 b;
    public qob c;
    public final eb8 d;

    public oob(Map map) {
        this.a = map;
        long[] jArr = hqb.a;
        this.b = new f78();
        this.d = new eb8(25, this);
    }

    @Override // defpackage.nob
    public final void e(Object obj, mz1 mz1Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(533563200);
        if ((i & 6) == 0) {
            i2 = (p65Var.h(obj) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.h(mz1Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.h(this) ? 256 : 128;
        }
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            p65Var.b0(obj);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                eb8 eb8Var = this.d;
                if (!((Boolean) eb8Var.invoke(obj)).booleanValue()) {
                    rd6.v("Type of the key ", obj, " is not supported. On Android you can only use types which can be stored inside the Bundle.");
                    return;
                }
                Map map = (Map) this.a.get(obj);
                sn3 sn3Var = sob.a;
                tob tobVar = new tob(new rob(map, eb8Var));
                p65Var.j0(tobVar);
                objM = tobVar;
            }
            tob tobVar2 = (tob) objM;
            int i3 = 8;
            k40.d(new o10[]{sob.a.a(tobVar2), d67.a.a(tobVar2)}, mz1Var, p65Var, (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 8);
            boolean zH = p65Var.h(this) | p65Var.h(obj) | p65Var.h(tobVar2);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                objM2 = new pi9(this, obj, tobVar2, i3);
                p65Var.j0(objM2);
            }
            kyd.h(c1e.a, (x45) objM2, p65Var);
            if (p65Var.y && p65Var.G.i == p65Var.z) {
                p65Var.z = -1;
                p65Var.y = false;
            }
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 27, this, obj, mz1Var);
        }
    }

    @Override // defpackage.nob
    public final void f(Object obj) {
        if (this.b.k(obj) == null) {
            this.a.remove(obj);
        }
    }
}
