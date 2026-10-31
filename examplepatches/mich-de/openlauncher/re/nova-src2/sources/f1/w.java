package f1;

import l1.x6;

/* loaded from: classes2.dex */
public final class w {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54062a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f54063b;

    public /* synthetic */ w(Object obj, int i5) {
        this.f54062a = i5;
        this.f54063b = obj;
    }

    public final void a(float f11) {
        switch (this.f54062a) {
            case 0:
                y yVar = (y) this.f54063b;
                u uVar = (u) yVar.o;
                float fJ = yVar.j(f11);
                y yVar2 = uVar.f54012a;
                yVar2.f54117g.p(fJ);
                yVar2.f54118h.p(0.0f);
                break;
            case 1:
                ((g0.h) this.f54063b).f56549a.invoke(Float.valueOf(f11));
                break;
            case 2:
                ((gy.w0) this.f54063b).f58564a.invoke(Float.valueOf(f11));
                break;
            case 3:
                ((hy.e0) this.f54063b).f60946a.invoke(Float.valueOf(f11));
                break;
            case 4:
                ((x6) this.f54063b).a(f11);
                break;
            default:
                y yVar3 = (y) this.f54063b;
                m1.p pVar = (m1.p) yVar3.o;
                float fK = yVar3.k(f11);
                y yVar4 = pVar.f75738a;
                yVar4.f54117g.p(fK);
                yVar4.f54118h.p(0.0f);
                break;
        }
    }
}
