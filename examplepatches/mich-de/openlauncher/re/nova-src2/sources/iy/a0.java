package iy;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import p10.y1;
import p10.z1;

/* loaded from: classes4.dex */
public final /* synthetic */ class a0 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68192a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f68193b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f68194c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f68195d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f68196e;

    public /* synthetic */ a0(long j11, boolean z11, Function1 function1, Function2 function2, int i5) {
        this.f68194c = j11;
        this.f68193b = z11;
        this.f68195d = function1;
        this.f68196e = function2;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f68192a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(3073);
                p0.g(this.f68194c, this.f68193b, (Function1) this.f68195d, (Function2) this.f68196e, (p1.o) obj, iL);
                break;
            case 1:
                ((Integer) obj2).getClass();
                int iL2 = p1.a0.l(1);
                y1.d(this.f68193b, this.f68194c, (z1) this.f68195d, (Function0) this.f68196e, (p1.o) obj, iL2);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL3 = p1.a0.l(1);
                ux.o.g((String) this.f68195d, this.f68193b, this.f68194c, (m3.p0) this.f68196e, (p1.o) obj, iL3);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ a0(String str, boolean z11, long j11, m3.p0 p0Var, int i5) {
        this.f68195d = str;
        this.f68193b = z11;
        this.f68194c = j11;
        this.f68196e = p0Var;
    }

    public /* synthetic */ a0(boolean z11, long j11, z1 z1Var, Function0 function0, int i5) {
        this.f68193b = z11;
        this.f68194c = j11;
        this.f68195d = z1Var;
        this.f68196e = function0;
    }
}
