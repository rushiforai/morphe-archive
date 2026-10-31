package kw;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class t implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72618a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f72619b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f72620c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f72621d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ boolean f72622e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Function1 f72623f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ int f72624g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ int f72625h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Object f72626i;

    public /* synthetic */ t(b2.t tVar, String str, boolean z11, String str2, boolean z12, Function1 function1, int i5, int i11) {
        this.f72626i = tVar;
        this.f72619b = str;
        this.f72621d = z11;
        this.f72620c = str2;
        this.f72622e = z12;
        this.f72623f = function1;
        this.f72624g = i5;
        this.f72625h = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f72618a) {
            case 0:
                ((Integer) obj2).getClass();
                android.support.v4.media.session.b.d((b2.t) this.f72626i, this.f72619b, this.f72621d, this.f72620c, this.f72622e, this.f72623f, (p1.o) obj, p1.a0.l(this.f72624g | 1), this.f72625h);
                break;
            default:
                ((Integer) obj2).getClass();
                w00.g0.b(this.f72619b, this.f72620c, this.f72621d, this.f72622e, this.f72623f, (Function2) this.f72626i, (p1.o) obj, p1.a0.l(this.f72624g | 1), this.f72625h);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ t(String str, String str2, boolean z11, boolean z12, Function1 function1, Function2 function2, int i5, int i11) {
        this.f72619b = str;
        this.f72620c = str2;
        this.f72621d = z11;
        this.f72622e = z12;
        this.f72623f = function1;
        this.f72626i = function2;
        this.f72624g = i5;
        this.f72625h = i11;
    }
}
