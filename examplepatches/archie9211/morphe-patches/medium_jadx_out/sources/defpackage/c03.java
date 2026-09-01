package defpackage;

import android.animation.TimeInterpolator;
import android.animation.ValueAnimator;
import android.view.View;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c03 extends pxa {
    public static TimeInterpolator s;
    public boolean g;
    public ArrayList h;
    public ArrayList i;
    public ArrayList j;
    public ArrayList k;
    public ArrayList l;
    public ArrayList m;
    public ArrayList n;
    public ArrayList o;
    public ArrayList p;
    public ArrayList q;
    public ArrayList r;

    public static void h(ArrayList arrayList) {
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            ((pr0) arrayList.get(size)).a.animate().cancel();
        }
    }

    @Override // defpackage.pxa
    public final boolean a(pr0 pr0Var, pr0 pr0Var2, yqa yqaVar, yqa yqaVar2) {
        int i;
        int i2;
        int i3 = yqaVar.b;
        int i4 = yqaVar.c;
        if (pr0Var2.n()) {
            int i5 = yqaVar.b;
            i2 = yqaVar.c;
            i = i5;
        } else {
            i = yqaVar2.b;
            i2 = yqaVar2.c;
        }
        if (pr0Var == pr0Var2) {
            return g(pr0Var, i3, i4, i, i2);
        }
        View view = pr0Var.a;
        float translationX = view.getTranslationX();
        float translationY = view.getTranslationY();
        float alpha = view.getAlpha();
        l(pr0Var);
        view.setTranslationX(translationX);
        view.setTranslationY(translationY);
        view.setAlpha(alpha);
        View view2 = pr0Var2.a;
        l(pr0Var2);
        view2.setTranslationX(-((int) ((i - i3) - translationX)));
        view2.setTranslationY(-((int) ((i2 - i4) - translationY)));
        view2.setAlpha(0.0f);
        ArrayList arrayList = this.k;
        a03 a03Var = new a03();
        a03Var.a = pr0Var;
        a03Var.b = pr0Var2;
        a03Var.c = i3;
        a03Var.d = i4;
        a03Var.e = i;
        a03Var.f = i2;
        arrayList.add(a03Var);
        return true;
    }

    @Override // defpackage.pxa
    public final void d(pr0 pr0Var) {
        ArrayList arrayList = this.l;
        ArrayList arrayList2 = this.m;
        ArrayList arrayList3 = this.n;
        View view = pr0Var.a;
        view.animate().cancel();
        ArrayList arrayList4 = this.j;
        int size = arrayList4.size();
        while (true) {
            size--;
            if (size < 0) {
                break;
            }
            if (((b03) arrayList4.get(size)).a == pr0Var) {
                view.setTranslationY(0.0f);
                view.setTranslationX(0.0f);
                c(pr0Var);
                arrayList4.remove(size);
            }
        }
        j(this.k, pr0Var);
        if (this.h.remove(pr0Var)) {
            view.setAlpha(1.0f);
            c(pr0Var);
        }
        if (this.i.remove(pr0Var)) {
            view.setAlpha(1.0f);
            c(pr0Var);
        }
        for (int size2 = arrayList3.size() - 1; size2 >= 0; size2--) {
            ArrayList arrayList5 = (ArrayList) arrayList3.get(size2);
            j(arrayList5, pr0Var);
            if (arrayList5.isEmpty()) {
                arrayList3.remove(size2);
            }
        }
        for (int size3 = arrayList2.size() - 1; size3 >= 0; size3--) {
            ArrayList arrayList6 = (ArrayList) arrayList2.get(size3);
            int size4 = arrayList6.size() - 1;
            while (true) {
                if (size4 < 0) {
                    break;
                }
                if (((b03) arrayList6.get(size4)).a == pr0Var) {
                    view.setTranslationY(0.0f);
                    view.setTranslationX(0.0f);
                    c(pr0Var);
                    arrayList6.remove(size4);
                    if (arrayList6.isEmpty()) {
                        arrayList2.remove(size3);
                    }
                } else {
                    size4--;
                }
            }
        }
        for (int size5 = arrayList.size() - 1; size5 >= 0; size5--) {
            ArrayList arrayList7 = (ArrayList) arrayList.get(size5);
            if (arrayList7.remove(pr0Var)) {
                view.setAlpha(1.0f);
                c(pr0Var);
                if (arrayList7.isEmpty()) {
                    arrayList.remove(size5);
                }
            }
        }
        this.q.remove(pr0Var);
        this.o.remove(pr0Var);
        this.r.remove(pr0Var);
        this.p.remove(pr0Var);
        i();
    }

    @Override // defpackage.pxa
    public final void e() {
        ArrayList arrayList = this.k;
        ArrayList arrayList2 = this.n;
        ArrayList arrayList3 = this.l;
        ArrayList arrayList4 = this.m;
        ArrayList arrayList5 = this.i;
        ArrayList arrayList6 = this.h;
        ArrayList arrayList7 = this.j;
        int size = arrayList7.size();
        while (true) {
            size--;
            if (size < 0) {
                break;
            }
            b03 b03Var = (b03) arrayList7.get(size);
            View view = b03Var.a.a;
            view.setTranslationY(0.0f);
            view.setTranslationX(0.0f);
            c(b03Var.a);
            arrayList7.remove(size);
        }
        for (int size2 = arrayList6.size() - 1; size2 >= 0; size2--) {
            c((pr0) arrayList6.get(size2));
            arrayList6.remove(size2);
        }
        int size3 = arrayList5.size();
        while (true) {
            size3--;
            if (size3 < 0) {
                break;
            }
            pr0 pr0Var = (pr0) arrayList5.get(size3);
            pr0Var.a.setAlpha(1.0f);
            c(pr0Var);
            arrayList5.remove(size3);
        }
        for (int size4 = arrayList.size() - 1; size4 >= 0; size4--) {
            a03 a03Var = (a03) arrayList.get(size4);
            pr0 pr0Var2 = a03Var.a;
            if (pr0Var2 != null) {
                k(a03Var, pr0Var2);
            }
            pr0 pr0Var3 = a03Var.b;
            if (pr0Var3 != null) {
                k(a03Var, pr0Var3);
            }
        }
        arrayList.clear();
        if (f()) {
            for (int size5 = arrayList4.size() - 1; size5 >= 0; size5--) {
                ArrayList arrayList8 = (ArrayList) arrayList4.get(size5);
                for (int size6 = arrayList8.size() - 1; size6 >= 0; size6--) {
                    b03 b03Var2 = (b03) arrayList8.get(size6);
                    View view2 = b03Var2.a.a;
                    view2.setTranslationY(0.0f);
                    view2.setTranslationX(0.0f);
                    c(b03Var2.a);
                    arrayList8.remove(size6);
                    if (arrayList8.isEmpty()) {
                        arrayList4.remove(arrayList8);
                    }
                }
            }
            for (int size7 = arrayList3.size() - 1; size7 >= 0; size7--) {
                ArrayList arrayList9 = (ArrayList) arrayList3.get(size7);
                for (int size8 = arrayList9.size() - 1; size8 >= 0; size8--) {
                    pr0 pr0Var4 = (pr0) arrayList9.get(size8);
                    pr0Var4.a.setAlpha(1.0f);
                    c(pr0Var4);
                    arrayList9.remove(size8);
                    if (arrayList9.isEmpty()) {
                        arrayList3.remove(arrayList9);
                    }
                }
            }
            for (int size9 = arrayList2.size() - 1; size9 >= 0; size9--) {
                ArrayList arrayList10 = (ArrayList) arrayList2.get(size9);
                for (int size10 = arrayList10.size() - 1; size10 >= 0; size10--) {
                    a03 a03Var2 = (a03) arrayList10.get(size10);
                    pr0 pr0Var5 = a03Var2.a;
                    if (pr0Var5 != null) {
                        k(a03Var2, pr0Var5);
                    }
                    pr0 pr0Var6 = a03Var2.b;
                    if (pr0Var6 != null) {
                        k(a03Var2, pr0Var6);
                    }
                    if (arrayList10.isEmpty()) {
                        arrayList2.remove(arrayList10);
                    }
                }
            }
            h(this.q);
            h(this.p);
            h(this.o);
            h(this.r);
            ArrayList arrayList11 = this.b;
            if (arrayList11.size() <= 0) {
                arrayList11.clear();
            } else {
                arrayList11.get(0).getClass();
                rd6.m();
            }
        }
    }

    @Override // defpackage.pxa
    public final boolean f() {
        return (this.i.isEmpty() && this.k.isEmpty() && this.j.isEmpty() && this.h.isEmpty() && this.p.isEmpty() && this.q.isEmpty() && this.o.isEmpty() && this.r.isEmpty() && this.m.isEmpty() && this.l.isEmpty() && this.n.isEmpty()) ? false : true;
    }

    public final boolean g(pr0 pr0Var, int i, int i2, int i3, int i4) {
        View view = pr0Var.a;
        int translationX = i + ((int) view.getTranslationX());
        int translationY = i2 + ((int) pr0Var.a.getTranslationY());
        l(pr0Var);
        int i5 = i3 - translationX;
        int i6 = i4 - translationY;
        if (i5 == 0 && i6 == 0) {
            c(pr0Var);
            return false;
        }
        if (i5 != 0) {
            view.setTranslationX(-i5);
        }
        if (i6 != 0) {
            view.setTranslationY(-i6);
        }
        ArrayList arrayList = this.j;
        b03 b03Var = new b03();
        b03Var.a = pr0Var;
        b03Var.b = translationX;
        b03Var.c = translationY;
        b03Var.d = i3;
        b03Var.e = i4;
        arrayList.add(b03Var);
        return true;
    }

    public final void i() {
        if (f()) {
            return;
        }
        ArrayList arrayList = this.b;
        if (arrayList.size() <= 0) {
            arrayList.clear();
        } else {
            arrayList.get(0).getClass();
            rd6.m();
        }
    }

    public final void j(ArrayList arrayList, pr0 pr0Var) {
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            a03 a03Var = (a03) arrayList.get(size);
            if (k(a03Var, pr0Var) && a03Var.a == null && a03Var.b == null) {
                arrayList.remove(a03Var);
            }
        }
    }

    public final boolean k(a03 a03Var, pr0 pr0Var) {
        if (a03Var.b == pr0Var) {
            a03Var.b = null;
        } else {
            if (a03Var.a != pr0Var) {
                return false;
            }
            a03Var.a = null;
        }
        View view = pr0Var.a;
        View view2 = pr0Var.a;
        view.setAlpha(1.0f);
        view2.setTranslationX(0.0f);
        view2.setTranslationY(0.0f);
        c(pr0Var);
        return true;
    }

    public final void l(pr0 pr0Var) {
        if (s == null) {
            s = new ValueAnimator().getInterpolator();
        }
        pr0Var.a.animate().setInterpolator(s);
        d(pr0Var);
    }
}
