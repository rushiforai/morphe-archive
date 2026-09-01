package defpackage;

import android.graphics.Matrix;
import android.graphics.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ty7 implements l59, xf5 {
    public final Path a = new Path();
    public final Path b = new Path();
    public final Path c = new Path();
    public final ArrayList d = new ArrayList();
    public final ry7 e;

    public ty7(ry7 ry7Var) {
        this.e = ry7Var;
    }

    public final void a(Path.Op op) {
        Path path = this.b;
        path.reset();
        Path path2 = this.a;
        path2.reset();
        ArrayList arrayList = this.d;
        for (int size = arrayList.size() - 1; size >= 1; size--) {
            l59 l59Var = (l59) arrayList.get(size);
            if (l59Var instanceof f82) {
                f82 f82Var = (f82) l59Var;
                ArrayList arrayList2 = (ArrayList) f82Var.d();
                for (int size2 = arrayList2.size() - 1; size2 >= 0; size2--) {
                    Path pathH = ((l59) arrayList2.get(size2)).h();
                    Matrix matrixD = f82Var.d;
                    mrd mrdVar = f82Var.k;
                    if (mrdVar != null) {
                        matrixD = mrdVar.d();
                    } else {
                        matrixD.reset();
                    }
                    pathH.transform(matrixD);
                    path.addPath(pathH);
                }
            } else {
                path.addPath(l59Var.h());
            }
        }
        int i = 0;
        l59 l59Var2 = (l59) arrayList.get(0);
        if (l59Var2 instanceof f82) {
            f82 f82Var2 = (f82) l59Var2;
            List listD = f82Var2.d();
            while (true) {
                ArrayList arrayList3 = (ArrayList) listD;
                if (i >= arrayList3.size()) {
                    break;
                }
                Path pathH2 = ((l59) arrayList3.get(i)).h();
                Matrix matrixD2 = f82Var2.d;
                mrd mrdVar2 = f82Var2.k;
                if (mrdVar2 != null) {
                    matrixD2 = mrdVar2.d();
                } else {
                    matrixD2.reset();
                }
                pathH2.transform(matrixD2);
                path2.addPath(pathH2);
                i++;
            }
        } else {
            path2.set(l59Var2.h());
        }
        this.c.op(path2, path, op);
    }

    @Override // defpackage.v72
    public final void b(List list, List list2) {
        int i = 0;
        while (true) {
            ArrayList arrayList = this.d;
            if (i >= arrayList.size()) {
                return;
            }
            ((l59) arrayList.get(i)).b(list, list2);
            i++;
        }
    }

    @Override // defpackage.xf5
    public final void d(ListIterator listIterator) {
        while (listIterator.hasPrevious() && listIterator.previous() != this) {
        }
        while (listIterator.hasPrevious()) {
            v72 v72Var = (v72) listIterator.previous();
            if (v72Var instanceof l59) {
                this.d.add((l59) v72Var);
                listIterator.remove();
            }
        }
    }

    @Override // defpackage.l59
    public final Path h() {
        Path path = this.c;
        path.reset();
        ry7 ry7Var = this.e;
        if (!ry7Var.b) {
            int i = sy7.a[ry7Var.a.ordinal()];
            if (i == 1) {
                int i2 = 0;
                while (true) {
                    ArrayList arrayList = this.d;
                    if (i2 >= arrayList.size()) {
                        break;
                    }
                    path.addPath(((l59) arrayList.get(i2)).h());
                    i2++;
                }
            } else {
                if (i == 2) {
                    a(Path.Op.UNION);
                    return path;
                }
                if (i == 3) {
                    a(Path.Op.REVERSE_DIFFERENCE);
                    return path;
                }
                if (i == 4) {
                    a(Path.Op.INTERSECT);
                    return path;
                }
                if (i == 5) {
                    a(Path.Op.XOR);
                    return path;
                }
            }
        }
        return path;
    }
}
