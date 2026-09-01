package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kx implements Appendable {
    public final StringBuilder a;
    public final ArrayList b;
    public final ArrayList c;

    public kx() {
        this.a = new StringBuilder(16);
        this.b = new ArrayList();
        this.c = new ArrayList();
        new ArrayList();
    }

    public final void a(b07 b07Var, int i, int i2) {
        this.c.add(new jx(b07Var, i, i2, 8));
    }

    @Override // java.lang.Appendable
    public final Appendable append(CharSequence charSequence, int i, int i2) {
        boolean z = charSequence instanceof mx;
        StringBuilder sb = this.a;
        if (!z) {
            sb.append(charSequence, i, i2);
            return this;
        }
        mx mxVar = (mx) charSequence;
        int length = sb.length();
        sb.append((CharSequence) mxVar.b, i, i2);
        List listA = ox.a(mxVar, i, i2, null);
        if (listA != null) {
            int size = listA.size();
            for (int i3 = 0; i3 < size; i3++) {
                lx lxVar = (lx) listA.get(i3);
                this.c.add(new jx(lxVar.a, lxVar.b + length, lxVar.c + length, lxVar.d));
            }
        }
        return this;
    }

    public final void b(skc skcVar, int i, int i2) {
        this.c.add(new jx(skcVar, i, i2, 8));
    }

    public final void c(mx mxVar) {
        StringBuilder sb = this.a;
        int length = sb.length();
        sb.append(mxVar.b);
        List list = mxVar.a;
        if (list != null) {
            int size = list.size();
            for (int i = 0; i < size; i++) {
                lx lxVar = (lx) list.get(i);
                this.c.add(new jx(lxVar.a, lxVar.b + length, lxVar.c + length, lxVar.d));
            }
        }
    }

    public final void d(String str) {
        this.a.append(str);
    }

    public final void e() {
        ArrayList arrayList = this.b;
        if (arrayList.isEmpty()) {
            c26.c("Nothing to pop.");
        }
        ((jx) arrayList.remove(arrayList.size() - 1)).c = this.a.length();
    }

    public final void f(int i) {
        ArrayList arrayList = this.b;
        if (i >= arrayList.size()) {
            c26.c(i + " should be less than " + arrayList.size());
        }
        while (arrayList.size() - 1 >= i) {
            e();
        }
    }

    public final int g(b07 b07Var) {
        jx jxVar = new jx(b07Var, this.a.length(), 0, 12);
        this.b.add(jxVar);
        this.c.add(jxVar);
        return r5.size() - 1;
    }

    public final int h(skc skcVar) {
        jx jxVar = new jx(skcVar, this.a.length(), 0, 12);
        this.b.add(jxVar);
        this.c.add(jxVar);
        return r5.size() - 1;
    }

    public final mx i() {
        StringBuilder sb = this.a;
        String string = sb.toString();
        ArrayList arrayList = this.c;
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        int size = arrayList.size();
        for (int i = 0; i < size; i = lv8.i(sb, (jx) arrayList.get(i), arrayList2, i, 1)) {
        }
        return new mx(string, arrayList2);
    }

    public kx(mx mxVar) {
        this();
        c(mxVar);
    }

    @Override // java.lang.Appendable
    public final Appendable append(CharSequence charSequence) {
        if (charSequence instanceof mx) {
            c((mx) charSequence);
            return this;
        }
        this.a.append(charSequence);
        return this;
    }

    @Override // java.lang.Appendable
    public final Appendable append(char c) {
        this.a.append(c);
        return this;
    }
}
