package j60;

import bn.s0;
import h60.h;
import i60.f;
import io.noties.markwon.core.spans.LinkSpan;
import k60.b;
import k60.c;
import k60.d;
import k60.e;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f69067a;

    public final Object a(s0 s0Var, h hVar) {
        switch (this.f69067a) {
            case 0:
                return new k60.a((f) s0Var.f18279b, 0);
            case 1:
                return new c((f) s0Var.f18279b);
            case 2:
                return new d((f) s0Var.f18279b, 0);
            case 3:
                return new e(0);
            case 4:
                return new k60.f((f) s0Var.f18279b, ((Integer) i60.d.f61414d.a(hVar)).intValue());
            case 5:
                return new LinkSpan((f) s0Var.f18279b, (String) i60.d.f61415e.a(hVar), (br.c) s0Var.f18281d);
            case 6:
                f fVar = (f) s0Var.f18279b;
                return i60.c.f61408a == i60.d.f61411a.a(hVar) ? new b(fVar, ((Integer) i60.d.f61412b.a(hVar)).intValue()) : new k60.h(fVar, String.valueOf(i60.d.f61413c.a(hVar)).concat(". "));
            case 7:
                return new e(1);
            default:
                return new k60.a((f) s0Var.f18279b, 1);
        }
    }
}
