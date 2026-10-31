package ky;

import b2.t;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import p1.a0;

/* loaded from: classes4.dex */
public final /* synthetic */ class n implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72819a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t f72820b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f72821c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function1 f72822d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ boolean f72823e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ boolean f72824f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ boolean f72825g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ int f72826h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ int f72827i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Object f72828j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Object f72829k;

    public /* synthetic */ n(t tVar, y20.d dVar, String str, String str2, Function1 function1, boolean z11, boolean z12, boolean z13, int i5, int i11) {
        this.f72820b = tVar;
        this.f72828j = dVar;
        this.f72821c = str;
        this.f72829k = str2;
        this.f72822d = function1;
        this.f72823e = z11;
        this.f72824f = z12;
        this.f72825g = z13;
        this.f72826h = i5;
        this.f72827i = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f72819a) {
            case 0:
                ((Integer) obj2).getClass();
                x7.f.d((x1.e) this.f72828j, this.f72823e, this.f72820b, this.f72824f, this.f72825g, (Function2) this.f72829k, this.f72821c, this.f72822d, (p1.o) obj, a0.l(this.f72826h | 1), this.f72827i);
                break;
            default:
                ((Integer) obj2).getClass();
                m00.l.c(this.f72820b, (y20.d) this.f72828j, this.f72821c, (String) this.f72829k, this.f72822d, this.f72823e, this.f72824f, this.f72825g, (p1.o) obj, a0.l(this.f72826h | 1), this.f72827i);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ n(x1.e eVar, boolean z11, t tVar, boolean z12, boolean z13, Function2 function2, String str, Function1 function1, int i5, int i11) {
        this.f72828j = eVar;
        this.f72823e = z11;
        this.f72820b = tVar;
        this.f72824f = z12;
        this.f72825g = z13;
        this.f72829k = function2;
        this.f72821c = str;
        this.f72822d = function1;
        this.f72826h = i5;
        this.f72827i = i11;
    }
}
