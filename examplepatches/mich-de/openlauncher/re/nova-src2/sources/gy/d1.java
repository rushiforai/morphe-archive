package gy;

import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class d1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58275a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b2.t f58276b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ j f58277c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f58278d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ float f58279e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ float f58280f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ float f58281g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ int f58282h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Object f58283i;

    public /* synthetic */ d1(b2.t tVar, float f11, i0.i iVar, j jVar, boolean z11, float f12, float f13, int i5) {
        this.f58276b = tVar;
        this.f58279e = f11;
        this.f58283i = iVar;
        this.f58277c = jVar;
        this.f58278d = z11;
        this.f58280f = f12;
        this.f58281g = f13;
        this.f58282h = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f58275a) {
            case 0:
                ((Integer) obj2).getClass();
                t1.d(this.f58276b, this.f58279e, (i0.i) this.f58283i, this.f58277c, this.f58278d, this.f58280f, this.f58281g, (p1.o) obj, p1.a0.l(this.f58282h | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                t1.e(this.f58276b, this.f58277c, this.f58278d, this.f58279e, (List) this.f58283i, this.f58280f, this.f58281g, (p1.o) obj, p1.a0.l(this.f58282h | 1));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ d1(b2.t tVar, j jVar, boolean z11, float f11, List list, float f12, float f13, int i5) {
        this.f58276b = tVar;
        this.f58277c = jVar;
        this.f58278d = z11;
        this.f58279e = f11;
        this.f58283i = list;
        this.f58280f = f12;
        this.f58281g = f13;
        this.f58282h = i5;
    }
}
