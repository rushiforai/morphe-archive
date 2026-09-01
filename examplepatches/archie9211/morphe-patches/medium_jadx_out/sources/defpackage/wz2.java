package defpackage;

import android.view.View;
import android.view.ViewPropertyAnimator;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wz2 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ ArrayList b;
    public final /* synthetic */ c03 c;

    public /* synthetic */ wz2(c03 c03Var, ArrayList arrayList, int i) {
        this.a = i;
        this.c = c03Var;
        this.b = arrayList;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        ArrayList arrayList = this.b;
        switch (i) {
            case 0:
                Iterator it2 = arrayList.iterator();
                while (true) {
                    boolean zHasNext = it2.hasNext();
                    c03 c03Var = this.c;
                    if (!zHasNext) {
                        arrayList.clear();
                        c03Var.m.remove(arrayList);
                    } else {
                        b03 b03Var = (b03) it2.next();
                        pr0 pr0Var = b03Var.a;
                        int i2 = b03Var.b;
                        int i3 = b03Var.c;
                        int i4 = b03Var.d;
                        int i5 = b03Var.e;
                        c03Var.getClass();
                        View view = pr0Var.a;
                        int i6 = i4 - i2;
                        int i7 = i5 - i3;
                        if (i6 != 0) {
                            view.animate().translationX(0.0f);
                        }
                        if (i7 != 0) {
                            view.animate().translationY(0.0f);
                        }
                        ViewPropertyAnimator viewPropertyAnimatorAnimate = view.animate();
                        c03Var.p.add(pr0Var);
                        viewPropertyAnimatorAnimate.setDuration(c03Var.e).setListener(new yz2(c03Var, pr0Var, i6, view, i7, viewPropertyAnimatorAnimate)).start();
                    }
                    break;
                }
                break;
            case 1:
                Iterator it3 = arrayList.iterator();
                while (true) {
                    boolean zHasNext2 = it3.hasNext();
                    c03 c03Var2 = this.c;
                    if (!zHasNext2) {
                        arrayList.clear();
                        c03Var2.n.remove(arrayList);
                        break;
                    } else {
                        a03 a03Var = (a03) it3.next();
                        ArrayList arrayList2 = c03Var2.r;
                        long j = c03Var2.f;
                        pr0 pr0Var2 = a03Var.a;
                        View view2 = pr0Var2 == null ? null : pr0Var2.a;
                        pr0 pr0Var3 = a03Var.b;
                        View view3 = pr0Var3 != null ? pr0Var3.a : null;
                        if (view2 != null) {
                            ViewPropertyAnimator duration = view2.animate().setDuration(j);
                            arrayList2.add(a03Var.a);
                            duration.translationX(a03Var.e - a03Var.c);
                            duration.translationY(a03Var.f - a03Var.d);
                            duration.alpha(0.0f).setListener(new zz2(c03Var2, a03Var, duration, view2, 0)).start();
                        }
                        if (view3 != null) {
                            ViewPropertyAnimator viewPropertyAnimatorAnimate2 = view3.animate();
                            arrayList2.add(a03Var.b);
                            viewPropertyAnimatorAnimate2.translationX(0.0f).translationY(0.0f).setDuration(j).alpha(1.0f).setListener(new zz2(c03Var2, a03Var, viewPropertyAnimatorAnimate2, view3, 1)).start();
                        }
                    }
                }
                break;
            default:
                Iterator it4 = arrayList.iterator();
                while (true) {
                    boolean zHasNext3 = it4.hasNext();
                    c03 c03Var3 = this.c;
                    if (!zHasNext3) {
                        arrayList.clear();
                        c03Var3.l.remove(arrayList);
                    } else {
                        pr0 pr0Var4 = (pr0) it4.next();
                        c03Var3.getClass();
                        View view4 = pr0Var4.a;
                        ViewPropertyAnimator viewPropertyAnimatorAnimate3 = view4.animate();
                        c03Var3.o.add(pr0Var4);
                        viewPropertyAnimatorAnimate3.alpha(1.0f).setDuration(c03Var3.c).setListener(new xz2(c03Var3, pr0Var4, view4, viewPropertyAnimatorAnimate3)).start();
                    }
                    break;
                }
                break;
        }
    }
}
