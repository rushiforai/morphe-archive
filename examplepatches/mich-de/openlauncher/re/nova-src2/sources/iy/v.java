package iy;

import java.io.Serializable;
import kotlin.Function;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class v implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68377a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f68378b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f68379c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f68380d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f68381e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Serializable f68382f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Function f68383g;

    public /* synthetic */ v(long j11, tz.o oVar, Pair pair, boolean z11, boolean z12, Function2 function2, int i5) {
        this.f68379c = j11;
        this.f68381e = oVar;
        this.f68382f = pair;
        this.f68378b = z11;
        this.f68380d = z12;
        this.f68383g = function2;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f68377a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(1);
                p0.c(this.f68379c, (tz.o) this.f68381e, (Pair) this.f68382f, this.f68378b, this.f68380d, (Function2) this.f68383g, (p1.o) obj, iL);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL2 = p1.a0.l(1);
                t2.c.f((String) this.f68381e, (Integer) this.f68382f, this.f68378b, this.f68379c, this.f68380d, (Function0) this.f68383g, (p1.o) obj, iL2);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ v(String str, Integer num, boolean z11, long j11, boolean z12, Function0 function0, int i5) {
        this.f68381e = str;
        this.f68382f = num;
        this.f68378b = z11;
        this.f68379c = j11;
        this.f68380d = z12;
        this.f68383g = function0;
    }
}
