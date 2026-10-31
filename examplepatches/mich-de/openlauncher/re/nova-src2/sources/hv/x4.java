package hv;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class x4 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f60673a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b2.t f60674b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f60675c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f60676d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f60677e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f60678f;

    public /* synthetic */ x4(b2.t tVar, String str, String str2, int i5, int i11) {
        this.f60674b = tVar;
        this.f60675c = str;
        this.f60676d = str2;
        this.f60677e = i5;
        this.f60678f = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f60673a) {
            case 0:
                ((Integer) obj2).getClass();
                y4.a(p1.a0.l(this.f60677e | 1), this.f60678f, this.f60674b, this.f60675c, this.f60676d, (p1.o) obj);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(this.f60678f | 1);
                ys.p.b(this.f60677e, iL, this.f60674b, this.f60675c, this.f60676d, (p1.o) obj);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ x4(String str, String str2, b2.t tVar, int i5, int i11) {
        this.f60675c = str;
        this.f60676d = str2;
        this.f60674b = tVar;
        this.f60677e = i5;
        this.f60678f = i11;
    }
}
