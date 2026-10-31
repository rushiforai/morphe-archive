package mo;

import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import p1.a0;
import p10.y1;
import p10.z1;

/* loaded from: classes3.dex */
public final /* synthetic */ class a implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f76507a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f76508b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f76509c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f76510d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f76511e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Function f76512f;

    public /* synthetic */ a(String str, boolean z11, long j11, Function0 function0, int i5) {
        this.f76511e = str;
        this.f76508b = z11;
        this.f76509c = j11;
        this.f76512f = function0;
        this.f76510d = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f76507a) {
            case 0:
                ((Integer) obj2).intValue();
                d.d((String) this.f76511e, this.f76508b, this.f76509c, (Function0) this.f76512f, (p1.o) obj, a0.l(this.f76510d | 1));
                break;
            default:
                ((Integer) obj2).getClass();
                int iL = a0.l(1);
                y1.u(this.f76508b, this.f76509c, this.f76510d, (z1) this.f76511e, (Function1) this.f76512f, (p1.o) obj, iL);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ a(boolean z11, long j11, int i5, z1 z1Var, Function1 function1, int i11) {
        this.f76508b = z11;
        this.f76509c = j11;
        this.f76510d = i5;
        this.f76511e = z1Var;
        this.f76512f = function1;
    }
}
