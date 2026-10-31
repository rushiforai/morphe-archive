package c3;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.U;
import java.util.Iterator;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final /* synthetic */ class m3 implements h6.y {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19383a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f19384b;

    public /* synthetic */ m3(Object obj, int i5) {
        this.f19383a = i5;
        this.f19384b = obj;
    }

    @Override // h6.y
    public final void d(h6.a0 a0Var, h6.s sVar) {
        switch (this.f19383a) {
            case 0:
                a aVar = (a) this.f19384b;
                if (sVar == h6.s.ON_DESTROY) {
                    aVar.disposeComposition();
                    break;
                }
                break;
            case 1:
                c7.a aVar2 = (c7.a) this.f19384b;
                if (sVar != h6.s.ON_START) {
                    if (sVar == h6.s.ON_STOP) {
                        aVar2.f19824h = false;
                        break;
                    }
                } else {
                    aVar2.f19824h = true;
                    break;
                }
                break;
            case 2:
                U.b.a((v70.x) this.f19384b, a0Var, sVar);
                break;
            case 3:
                dx.i0 i0Var = (dx.i0) this.f19384b;
                i0Var.f49713d = i0Var.f49710a.getLifecycle().b();
                i0Var.c();
                break;
            case 4:
                dx.w wVar = (dx.w) this.f19384b;
                int i5 = hx.n.f60902a[sVar.ordinal()];
                if (i5 == 1) {
                    wVar.f49814h.invoke();
                    break;
                } else if (i5 == 2) {
                    wVar.f49815i.invoke();
                    break;
                }
                break;
            case 5:
                ((Function1) this.f19384b).invoke(sVar);
                break;
            case 6:
                p6.t tVar = (p6.t) this.f19384b;
                tVar.f82267r = sVar.a();
                if (tVar.f82254c != null) {
                    Iterator it = b70.g.K1(tVar.f82258g).iterator();
                    while (it.hasNext()) {
                        p6.n nVar = (p6.n) it.next();
                        nVar.getClass();
                        nVar.f82194d = sVar.a();
                        nVar.c();
                    }
                    break;
                }
                break;
            default:
                p1.o2 o2Var = (p1.o2) this.f19384b;
                if (sVar == h6.s.ON_RESUME) {
                    o2Var.p(o2Var.m() + 1);
                    break;
                }
                break;
        }
    }
}
