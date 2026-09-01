package defpackage;

import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qr implements zk7 {
    public final /* synthetic */ int a;
    public final Object b;
    public final Object c;

    public /* synthetic */ qr(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.zk7
    public final int a(y66 y66Var, List list, int i) {
        switch (this.a) {
            case 0:
                return ev6.c(this, y66Var, list, i);
            case 1:
                due dueVar = (due) this.b;
                int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
                ViewGroup.LayoutParams layoutParams = dueVar.getLayoutParams();
                layoutParams.getClass();
                dueVar.measure(iMakeMeasureSpec, zt.f(0, i, layoutParams.height));
                return dueVar.getMeasuredWidth();
            default:
                return ev6.c(this, y66Var, list, i);
        }
    }

    @Override // defpackage.zk7
    public final al7 b(bl7 bl7Var, List list, long j) {
        ArrayList arrayList;
        int i;
        int i2;
        f09 f09Var;
        int i3 = this.a;
        fy3 fy3Var = fy3.a;
        Object obj = this.b;
        Object obj2 = this.c;
        switch (i3) {
            case 0:
                ((dd9) obj).setParentLayoutDirection((ip6) obj2);
                return bl7Var.q0(0, 0, fy3Var, fn.h);
            case 1:
                due dueVar = (due) obj;
                if (dueVar.getChildCount() == 0) {
                    return bl7Var.q0(f72.j(j), f72.i(j), fy3Var, fn.l);
                }
                if (f72.j(j) != 0) {
                    dueVar.getChildAt(0).setMinimumWidth(f72.j(j));
                }
                if (f72.i(j) != 0) {
                    dueVar.getChildAt(0).setMinimumHeight(f72.i(j));
                }
                int iJ = f72.j(j);
                int iH = f72.h(j);
                ViewGroup.LayoutParams layoutParams = dueVar.getLayoutParams();
                layoutParams.getClass();
                int iF = zt.f(iJ, iH, layoutParams.width);
                int i4 = f72.i(j);
                int iG = f72.g(j);
                ViewGroup.LayoutParams layoutParams2 = dueVar.getLayoutParams();
                layoutParams2.getClass();
                dueVar.measure(iF, zt.f(i4, iG, layoutParams2.height));
                return bl7Var.q0(dueVar.getMeasuredWidth(), dueVar.getMeasuredHeight(), fy3Var, new tt(dueVar, (aq6) obj2, 1));
            default:
                ArrayList arrayList2 = new ArrayList(list.size());
                int size = list.size();
                for (int i5 = 0; i5 < size; i5++) {
                    Object obj3 = list.get(i5);
                    if (!(((tk7) obj3).w() instanceof ckd)) {
                        arrayList2.add(obj3);
                    }
                }
                List list2 = (List) ((m45) obj2).invoke();
                if (list2 != null) {
                    ArrayList arrayList3 = new ArrayList(list2.size());
                    int size2 = list2.size();
                    int i6 = 0;
                    while (i6 < size2) {
                        zwa zwaVar = (zwa) list2.get(i6);
                        if (zwaVar != null) {
                            float f = zwaVar.b;
                            float f2 = zwaVar.a;
                            tk7 tk7Var = (tk7) arrayList2.get(i6);
                            int iFloor = (int) Math.floor(zwaVar.c - f2);
                            float f3 = zwaVar.d - f;
                            i = size2;
                            i2 = i6;
                            f09Var = new f09(tk7Var.s(h72.b(0, iFloor, 0, (int) Math.floor(f3), 5)), new k46((((long) Math.round(f)) & 4294967295L) | (((long) Math.round(f2)) << 32)));
                        } else {
                            i = size2;
                            i2 = i6;
                            f09Var = null;
                        }
                        if (f09Var != null) {
                            arrayList3.add(f09Var);
                        }
                        i6 = i2 + 1;
                        size2 = i;
                    }
                    arrayList = arrayList3;
                } else {
                    arrayList = null;
                }
                ArrayList arrayList4 = new ArrayList(list.size());
                int size3 = list.size();
                for (int i7 = 0; i7 < size3; i7++) {
                    Object obj4 = list.get(i7);
                    if (((tk7) obj4).w() instanceof ckd) {
                        arrayList4.add(obj4);
                    }
                }
                return bl7Var.q0(f72.h(j), f72.g(j), fy3Var, new pda(arrayList, 28, flb.m0(arrayList4, (m45) obj)));
        }
    }

    @Override // defpackage.zk7
    public final int c(y66 y66Var, List list, int i) {
        switch (this.a) {
            case 0:
                return ev6.g(this, y66Var, list, i);
            case 1:
                due dueVar = (due) this.b;
                int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
                ViewGroup.LayoutParams layoutParams = dueVar.getLayoutParams();
                layoutParams.getClass();
                dueVar.measure(iMakeMeasureSpec, zt.f(0, i, layoutParams.height));
                return dueVar.getMeasuredWidth();
            default:
                return ev6.g(this, y66Var, list, i);
        }
    }

    @Override // defpackage.zk7
    public final int d(y66 y66Var, List list, int i) {
        switch (this.a) {
            case 0:
                return ev6.a(this, y66Var, list, i);
            case 1:
                due dueVar = (due) this.b;
                ViewGroup.LayoutParams layoutParams = dueVar.getLayoutParams();
                layoutParams.getClass();
                dueVar.measure(zt.f(0, i, layoutParams.width), View.MeasureSpec.makeMeasureSpec(0, 0));
                return dueVar.getMeasuredHeight();
            default:
                return ev6.a(this, y66Var, list, i);
        }
    }

    @Override // defpackage.zk7
    public final int e(y66 y66Var, List list, int i) {
        switch (this.a) {
            case 0:
                return ev6.e(this, y66Var, list, i);
            case 1:
                due dueVar = (due) this.b;
                ViewGroup.LayoutParams layoutParams = dueVar.getLayoutParams();
                layoutParams.getClass();
                dueVar.measure(zt.f(0, i, layoutParams.width), View.MeasureSpec.makeMeasureSpec(0, 0));
                return dueVar.getMeasuredHeight();
            default:
                return ev6.e(this, y66Var, list, i);
        }
    }
}
