package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fw8 extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ fw8(int i, Object obj) {
        super(1);
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                if (obj != ((y68) obj2)) {
                    break;
                }
                break;
            case 1:
                ((x51) obj2).resumeWith(obj);
                break;
            case 2:
                if (obj != ((g78) obj2)) {
                    break;
                }
                break;
            case 3:
                gyb.g((jyb) obj, ((vkb) obj2).a);
                break;
            case 4:
                gyb.b((jyb) obj, (String) obj2);
                break;
            case 5:
                ((List) obj).add((Float) ((pu6) obj2).invoke());
                break;
            case 6:
                tjb tjbVar = (tjb) obj;
                j3c j3cVar = (j3c) obj2;
                tjbVar.m(tjbVar.s.b() * j3cVar.b);
                tjbVar.n(j3cVar.c);
                tjbVar.e(j3cVar.d);
                tjbVar.d(j3cVar.e);
                tjbVar.p(j3cVar.f);
                break;
            case 7:
                tjb tjbVar2 = (tjb) obj;
                cec cecVar = (cec) obj2;
                tjbVar2.k(cecVar.o);
                tjbVar2.l(cecVar.p);
                tjbVar2.c(cecVar.q);
                tjbVar2.t(0.0f);
                tjbVar2.v(0.0f);
                tjbVar2.m(cecVar.r);
                tjbVar2.h(0.0f);
                tjbVar2.i(0.0f);
                tjbVar2.j(cecVar.s);
                float f = cecVar.t;
                if (tjbVar2.m != f) {
                    tjbVar2.a |= RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH;
                    tjbVar2.m = f;
                }
                tjbVar2.s(cecVar.u);
                tjbVar2.n(cecVar.v);
                tjbVar2.e(cecVar.w);
                tjbVar2.g(null);
                tjbVar2.d(cecVar.x);
                tjbVar2.p(cecVar.y);
                int i2 = cecVar.z;
                if (tjbVar2.q != i2) {
                    tjbVar2.a |= 32768;
                    tjbVar2.q = i2;
                }
                int i3 = cecVar.A;
                if (tjbVar2.v != i3) {
                    tjbVar2.a |= 524288;
                    tjbVar2.v = i3;
                }
                break;
            default:
                Throwable th = (Throwable) obj;
                u4d u4dVar = (u4d) obj2;
                x51 x51Var = u4dVar.c;
                if (x51Var != null) {
                    x51Var.l(th);
                }
                u4dVar.c = null;
                break;
        }
        return c1eVar;
    }
}
