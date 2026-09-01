package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class o12 implements fn6 {
    public final ArrayList a;

    public o12(int i) {
        switch (i) {
            case 1:
                this.a = new ArrayList();
                break;
            default:
                this.a = new ArrayList();
                break;
        }
    }

    public boolean a(int i, r65 r65Var, Object obj) {
        ArrayList arrayList = r65Var.a;
        if (arrayList == null) {
            d(i, r65Var, null);
            return true;
        }
        int size = arrayList.size();
        int i2 = 0;
        while (true) {
            if (i2 >= size) {
                break;
            }
            Object obj2 = arrayList.get(i2);
            if (!(obj2 instanceof k65)) {
                if (!(obj2 instanceof r65)) {
                    ik4.m("Unexpected child source info ", obj2);
                    break;
                }
                if (a(i, (r65) obj2, obj)) {
                    d(0, r65Var, obj2);
                    return true;
                }
            } else if (obj2 == obj) {
                d(0, r65Var, obj2);
                return true;
            }
            i2++;
        }
        return false;
    }

    @Override // defpackage.fn6
    public void b() {
        h((String[]) this.a.toArray(new String[0]));
    }

    @Override // defpackage.fn6
    public en6 c(mn1 mn1Var) {
        return null;
    }

    public void d(int i, r65 r65Var, Object obj) {
        this.a.add(new p12(i, null, null));
    }

    @Override // defpackage.fn6
    public void e(Object obj) {
        if (obj instanceof String) {
            this.a.add((String) obj);
        }
    }

    public void g(int i, Object obj, r65 r65Var, Object obj2) {
        if (g76.L(obj, w12.a)) {
            d(i, r65Var, null);
        }
    }

    public abstract void h(String[] strArr);

    @Override // defpackage.fn6
    public void r(rn1 rn1Var) {
    }

    @Override // defpackage.fn6
    public void f(mn1 mn1Var, n98 n98Var) {
    }
}
