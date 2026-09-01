package defpackage;

import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class tn8 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;
    public final /* synthetic */ int c;
    public final /* synthetic */ int d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    public /* synthetic */ tn8(Object obj, int i, Object obj2, int i2, int i3, int i4) {
        this.a = i4;
        this.e = obj;
        this.b = i;
        this.f = obj2;
        this.c = i2;
        this.d = i3;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = 0;
        int i3 = this.d;
        int i4 = this.c;
        Object obj2 = this.f;
        int i5 = this.b;
        Object obj3 = this.e;
        switch (i) {
            case 0:
                f17 f17Var = (f17) obj2;
                s99 s99Var = (s99) obj;
                s99Var.getClass();
                int iH = (f72.h(((f72) obj3).a) - i5) / 2;
                if (iH < 0) {
                    iH = 0;
                }
                ListIterator listIterator = f17Var.listIterator(0);
                while (true) {
                    wn5 wn5Var = (wn5) listIterator;
                    if (!wn5Var.hasNext()) {
                        return c1eVar;
                    }
                    Object next = wn5Var.next();
                    int i6 = i2 + 1;
                    if (i2 < 0) {
                        d46.i0();
                        throw null;
                    }
                    t99 t99Var = (t99) next;
                    if (i2 > 0) {
                        iH += i4;
                    }
                    s99.j(s99Var, t99Var, iH, (i3 - t99Var.b) / 2);
                    iH += t99Var.a;
                    i2 = i6;
                }
                break;
            default:
                s99 s99Var2 = (s99) obj;
                s99.j(s99Var2, (t99) obj3, 0, i5);
                s99.j(s99Var2, (t99) obj2, i4, i3);
                return c1eVar;
        }
    }
}
