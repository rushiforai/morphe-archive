package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tlc {
    public static final nn3 m = new nn3(1);
    public static final nn3 n = new nn3(2);
    public static final nn3 o = new nn3(3);
    public static final nn3 p = new nn3(4);
    public static final nn3 q = new nn3(5);
    public static final nn3 r = new nn3(0);
    public final dk7 c;
    public final gsa d;
    public final float g;
    public ulc j;
    public float k;
    public boolean l;
    public float a = 0.0f;
    public float b = Float.MAX_VALUE;
    public boolean e = false;
    public long f = 0;
    public final ArrayList h = new ArrayList();
    public final ArrayList i = new ArrayList();

    public tlc(dk7 dk7Var, gsa gsaVar) {
        this.c = dk7Var;
        this.d = gsaVar;
        if (gsaVar == o || gsaVar == p || gsaVar == q) {
            this.g = 0.1f;
        } else if (gsaVar == r) {
            this.g = 0.00390625f;
        } else if (gsaVar == m || gsaVar == n) {
            this.g = 0.002f;
        } else {
            this.g = 1.0f;
        }
        this.j = null;
        this.k = Float.MAX_VALUE;
        this.l = false;
    }

    public final void a(float f) {
        this.d.o0(this.c, f);
        int i = 0;
        while (true) {
            ArrayList arrayList = this.i;
            if (i >= arrayList.size()) {
                for (int size = arrayList.size() - 1; size >= 0; size--) {
                    if (arrayList.get(size) == null) {
                        arrayList.remove(size);
                    }
                }
                return;
            }
            if (arrayList.get(i) != null) {
                arrayList.get(i).getClass();
                rd6.m();
                return;
            }
            i++;
        }
    }
}
