package defpackage;

import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class p83 {
    public static final zi5 c = new zi5(15);
    public static int d = 1;
    public static final int e;
    public static final int f;
    public static final int g;
    public static final int h;
    public static final int i;
    public static final int j;
    public static final int k;
    public static final int l;
    public static final p83 m;
    public static final p83 n;
    public static final p83 o;
    public static final p83 p;
    public static final p83 q;
    public static final ArrayList r;
    public static final ArrayList s;
    public final List a;
    public final int b;

    static {
        o83 o83Var;
        int iN = zi5.n();
        e = iN;
        int iN2 = zi5.n();
        f = iN2;
        int iN3 = zi5.n();
        g = iN3;
        int iN4 = zi5.n();
        h = iN4;
        int iN5 = zi5.n();
        i = iN5;
        int iN6 = zi5.n();
        j = iN6;
        int iN7 = zi5.n() - 1;
        k = iN7;
        int i2 = iN | iN2 | iN3;
        l = i2;
        m = new p83(iN7);
        n = new p83(iN5 | iN6);
        new p83(iN);
        new p83(iN2);
        new p83(iN3);
        o = new p83(i2);
        new p83(iN4);
        p = new p83(iN5);
        q = new p83(iN6);
        new p83(iN2 | iN5 | iN6);
        Field[] fields = p83.class.getFields();
        fields.getClass();
        ArrayList arrayList = new ArrayList();
        for (Field field : fields) {
            if (Modifier.isStatic(field.getModifiers())) {
                arrayList.add(field);
            }
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator it2 = arrayList.iterator();
        while (true) {
            o83 o83Var2 = null;
            if (!it2.hasNext()) {
                break;
            }
            Field field2 = (Field) it2.next();
            Object obj = field2.get(null);
            p83 p83Var = obj instanceof p83 ? (p83) obj : null;
            if (p83Var != null) {
                int i3 = p83Var.b;
                String name = field2.getName();
                name.getClass();
                o83Var2 = new o83(i3, name);
            }
            if (o83Var2 != null) {
                arrayList2.add(o83Var2);
            }
        }
        r = arrayList2;
        Field[] fields2 = p83.class.getFields();
        fields2.getClass();
        ArrayList arrayList3 = new ArrayList();
        for (Field field3 : fields2) {
            if (Modifier.isStatic(field3.getModifiers())) {
                arrayList3.add(field3);
            }
        }
        ArrayList<Field> arrayList4 = new ArrayList();
        for (Object obj2 : arrayList3) {
            if (g76.L(((Field) obj2).getType(), Integer.TYPE)) {
                arrayList4.add(obj2);
            }
        }
        ArrayList arrayList5 = new ArrayList();
        for (Field field4 : arrayList4) {
            Object obj3 = field4.get(null);
            obj3.getClass();
            int iIntValue = ((Integer) obj3).intValue();
            if (iIntValue == ((-iIntValue) & iIntValue)) {
                String name2 = field4.getName();
                name2.getClass();
                o83Var = new o83(iIntValue, name2);
            } else {
                o83Var = null;
            }
            if (o83Var != null) {
                arrayList5.add(o83Var);
            }
        }
        s = arrayList5;
    }

    public p83(int i2, List list) {
        list.getClass();
        this.a = list;
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            i2 &= ~((n83) it2.next()).a();
        }
        this.b = i2;
    }

    public final boolean a(int i2) {
        return (this.b & i2) != 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!p83.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        obj.getClass();
        p83 p83Var = (p83) obj;
        return g76.L(this.a, p83Var.a) && this.b == p83Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + this.b;
    }

    public final String toString() throws IOException {
        Object next;
        Iterator it2 = r.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (((o83) next).a == this.b) {
                break;
            }
        }
        o83 o83Var = (o83) next;
        String strF0 = o83Var != null ? o83Var.b : null;
        if (strF0 == null) {
            ArrayList arrayList = new ArrayList();
            for (o83 o83Var2 : s) {
                String str = a(o83Var2.a) ? o83Var2.b : null;
                if (str != null) {
                    arrayList.add(str);
                }
            }
            strF0 = bu1.F0(arrayList, " | ", null, null, null, 62);
        }
        StringBuilder sbU = lv8.u("DescriptorKindFilter(", strF0, ", ");
        sbU.append(this.a);
        sbU.append(')');
        return sbU.toString();
    }

    public /* synthetic */ p83(int i2) {
        this(i2, ey3.a);
    }
}
