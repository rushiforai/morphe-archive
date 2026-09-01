package defpackage;

import android.graphics.RectF;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k6d extends up1 {
    public final HashMap d;
    public final /* synthetic */ l6d e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k6d(l6d l6dVar) {
        super(0);
        this.e = l6dVar;
        this.d = new HashMap();
    }

    @Override // defpackage.up1
    public final void d(f4f f4fVar) {
        ArrayList arrayList = this.e.b;
        if ((f4fVar.a.d() & 519) != 0) {
            this.d.remove(f4fVar);
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                a5a a5aVar = (a5a) arrayList.get(size);
                int i = a5aVar.e;
                boolean z = i > 0;
                int i2 = i - 1;
                a5aVar.e = i2;
                if (z && i2 == 0) {
                    a5aVar.c();
                }
            }
        }
    }

    @Override // defpackage.up1
    public final void e(f4f f4fVar) {
        ArrayList arrayList = this.e.b;
        if ((f4fVar.a.d() & 519) != 0) {
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                ((a5a) arrayList.get(size)).e++;
            }
        }
    }

    @Override // defpackage.up1
    public final z4f f(z4f z4fVar, List list) {
        ArrayList arrayList = this.e.b;
        RectF rectF = new RectF(1.0f, 1.0f, 1.0f, 1.0f);
        int i = 0;
        for (int size = list.size() - 1; size >= 0; size--) {
            f4f f4fVar = (f4f) list.get(size);
            Integer num = (Integer) this.d.get(f4fVar);
            if (num != null) {
                int iIntValue = num.intValue();
                float fA = f4fVar.a.a();
                if ((iIntValue & 1) != 0) {
                    rectF.left = fA;
                }
                if ((iIntValue & 2) != 0) {
                    rectF.top = fA;
                }
                if ((iIntValue & 4) != 0) {
                    rectF.right = fA;
                }
                if ((iIntValue & 8) != 0) {
                    rectF.bottom = fA;
                }
                i |= iIntValue;
            }
        }
        b36.b(z4fVar.a.i(519), z4fVar.a.i(64));
        for (int size2 = arrayList.size() - 1; size2 >= 0; size2--) {
            a5a a5aVar = (a5a) arrayList.get(size2);
            b36 b36Var = a5aVar.d;
            ArrayList arrayList2 = a5aVar.a;
            for (int size3 = arrayList2.size() - 1; size3 >= 0; size3--) {
                ((ev1) arrayList2.get(size3)).getClass();
                if ((0 & i) != 0) {
                    throw null;
                }
            }
        }
        return z4fVar;
    }

    @Override // defpackage.up1
    public final mya g(f4f f4fVar, mya myaVar) {
        if ((f4fVar.a.d() & 519) != 0) {
            b36 b36Var = (b36) myaVar.c;
            b36 b36Var2 = (b36) myaVar.b;
            int i = b36Var.a != b36Var2.a ? 1 : 0;
            if (b36Var.b != b36Var2.b) {
                i |= 2;
            }
            if (b36Var.c != b36Var2.c) {
                i |= 4;
            }
            if (b36Var.d != b36Var2.d) {
                i |= 8;
            }
            this.d.put(f4fVar, Integer.valueOf(i));
        }
        return myaVar;
    }
}
