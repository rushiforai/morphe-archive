package hv;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class j3 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f60351a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f60352b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f60353c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f60354d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f60355e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f60356f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f60357g;

    public /* synthetic */ j3(String str, b2.t tVar, boolean z11, boolean z12, int i5, int i11) {
        this.f60352b = str;
        this.f60357g = tVar;
        this.f60353c = z11;
        this.f60354d = z12;
        this.f60355e = i5;
        this.f60356f = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f60351a) {
            case 0:
                ((Integer) obj2).getClass();
                io.sentry.config.a.i(this.f60352b, (b2.t) this.f60357g, this.f60353c, this.f60354d, (p1.o) obj, p1.a0.l(this.f60355e | 1), this.f60356f);
                break;
            default:
                ((Integer) obj2).getClass();
                ps.f.b(this.f60352b, this.f60353c, this.f60354d, (Function0) this.f60357g, (p1.o) obj, p1.a0.l(this.f60355e | 1), this.f60356f);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ j3(String str, boolean z11, boolean z12, Function0 function0, int i5, int i11) {
        this.f60352b = str;
        this.f60353c = z11;
        this.f60354d = z12;
        this.f60357g = function0;
        this.f60355e = i5;
        this.f60356f = i11;
    }
}
