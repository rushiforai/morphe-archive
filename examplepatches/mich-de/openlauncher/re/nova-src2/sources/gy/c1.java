package gy;

import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function4;

/* loaded from: classes4.dex */
public final /* synthetic */ class c1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58258a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f58259b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ float f58260c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ float f58261d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ i0.i f58262e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ b2.t f58263f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f58264g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Object f58265h;

    public /* synthetic */ c1(boolean z11, float f11, hy.h hVar, float f12, i0.i iVar, b2.t tVar, Function4 function4, int i5) {
        this.f58259b = z11;
        this.f58260c = f11;
        this.f58264g = hVar;
        this.f58261d = f12;
        this.f58262e = iVar;
        this.f58263f = tVar;
        this.f58265h = function4;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f58258a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(1);
                t1.c(this.f58259b, this.f58260c, (List) this.f58264g, (j) this.f58265h, this.f58261d, this.f58262e, this.f58263f, (p1.o) obj, iL);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL2 = p1.a0.l(1);
                hy.u.c(this.f58259b, this.f58260c, (hy.h) this.f58264g, this.f58261d, this.f58262e, this.f58263f, (Function4) this.f58265h, (p1.o) obj, iL2);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ c1(boolean z11, float f11, List list, j jVar, float f12, i0.i iVar, b2.t tVar, int i5) {
        this.f58259b = z11;
        this.f58260c = f11;
        this.f58264g = list;
        this.f58265h = jVar;
        this.f58261d = f12;
        this.f58262e = iVar;
        this.f58263f = tVar;
    }
}
