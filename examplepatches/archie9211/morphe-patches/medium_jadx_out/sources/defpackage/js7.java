package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class js7 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ int b;
    public final /* synthetic */ List c;
    public final /* synthetic */ x45 d;
    public final /* synthetic */ r28 e;
    public final /* synthetic */ yrb f;
    public final /* synthetic */ long g;
    public final /* synthetic */ long h;
    public final /* synthetic */ float i;
    public final /* synthetic */ b55 j;
    public final /* synthetic */ int k;
    public final /* synthetic */ int l;

    public /* synthetic */ js7(int i, List list, x45 x45Var, r28 r28Var, yrb yrbVar, long j, long j2, float f, b55 b55Var, int i2, int i3) {
        this.b = i;
        this.c = list;
        this.d = x45Var;
        this.e = r28Var;
        this.f = yrbVar;
        this.g = j;
        this.h = j2;
        this.i = f;
        this.j = b55Var;
        this.k = i2;
        this.l = i3;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.k;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                int iY = tr7.y(i2 | 1);
                ns7.b(this.i, this.b, iY, this.l, this.g, this.h, (x12) obj, this.d, this.j, this.e, this.f, this.c);
                break;
            default:
                ((Integer) obj2).getClass();
                int iY2 = tr7.y(i2 | 1);
                ns7.a(this.i, this.b, iY2, this.l, this.g, this.h, (x12) obj, this.d, this.j, this.e, this.f, this.c);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ js7(x45 x45Var, r28 r28Var, int i, yrb yrbVar, long j, long j2, float f, b55 b55Var, List list, int i2, int i3) {
        this.d = x45Var;
        this.e = r28Var;
        this.b = i;
        this.f = yrbVar;
        this.g = j;
        this.h = j2;
        this.i = f;
        this.j = b55Var;
        this.c = list;
        this.k = i2;
        this.l = i3;
    }
}
