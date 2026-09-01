package defpackage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jm6 {
    public static final /* synthetic */ fj6[] l;
    public int a;
    public final km6 b;
    public final km6 c;
    public final ArrayList d;
    public final ArrayList e;
    public final ArrayList f;
    public final ArrayList g;
    public final ArrayList h;
    public final ArrayList i;
    public final ArrayList j;
    public final ArrayList k;

    static {
        c78 c78Var = new c78(jm6.class, "_hasSetter", "get_hasSetter()Z", 0);
        s1b s1bVar = n1b.a;
        l = new fj6[]{s1bVar.e(c78Var), ka1.h(jm6.class, "_hasGetter", "get_hasGetter()Z", 0, s1bVar)};
    }

    public jm6(int i, int i2, int i3, String str) {
        int i4;
        str.getClass();
        this.a = i;
        xl4 xl4Var = cm4.A;
        xl4Var.getClass();
        vl4 vl4Var = new vl4(xl4Var, 1);
        sl4 sl4Var = sl4.b;
        int i5 = vl4Var.b;
        if (i5 != 1 || (i4 = vl4Var.c) != 1) {
            ywb.g(y30.o("BooleanFlagDelegate can work only with boolean flags (bitWidth = 1 and value = 1), but ", vl4Var, " was passed"));
            throw null;
        }
        xl4 xl4Var2 = cm4.z;
        xl4Var2.getClass();
        vl4 vl4Var2 = new vl4(xl4Var2, 1);
        if (vl4Var2.b != 1 || vl4Var2.c != 1) {
            ywb.g(y30.o("BooleanFlagDelegate can work only with boolean flags (bitWidth = 1 and value = 1), but ", vl4Var2, " was passed"));
            throw null;
        }
        int i6 = 1 << vl4Var2.a;
        km6 km6Var = new km6(i2);
        fj6[] fj6VarArr = l;
        fj6VarArr[1].getClass();
        sl4Var.m(this, Integer.valueOf(i6 | this.a));
        this.b = km6Var;
        fj6VarArr[0].getClass();
        this.c = ((((Number) sl4Var.get(this)).intValue() >>> vl4Var.a) & ((1 << i5) - 1)) == i4 ? new km6(i3) : null;
        this.d = new ArrayList(0);
        this.e = new ArrayList(0);
        new ArrayList(0);
        this.f = new ArrayList();
        this.g = new ArrayList(0);
        this.h = new ArrayList(0);
        this.i = new ArrayList(0);
        this.j = new ArrayList(0);
        sz7.a.getClass();
        List listA = rz7.a();
        ArrayList arrayList = new ArrayList(cu1.k0(listA, 10));
        Iterator it2 = listA.iterator();
        while (it2.hasNext()) {
            ((kf6) ((sz7) it2.next())).getClass();
            arrayList.add(new qf6());
        }
        this.k = arrayList;
    }
}
