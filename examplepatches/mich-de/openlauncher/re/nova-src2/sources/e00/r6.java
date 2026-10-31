package e00;

import java.util.List;
import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;

/* loaded from: classes4.dex */
public final /* synthetic */ class r6 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50945a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f50946b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f50947c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f50948d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ boolean f50949e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f50950f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f50951g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Object f50952h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Object f50953i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Function f50954j;

    public /* synthetic */ r6(String str, String str2, int i5, boolean z11, Function0 function0, Function0 function02, Function3 function3, int i11, int i12) {
        this.f50950f = str;
        this.f50951g = str2;
        this.f50946b = i5;
        this.f50949e = z11;
        this.f50952h = function0;
        this.f50953i = function02;
        this.f50954j = function3;
        this.f50947c = i11;
        this.f50948d = i12;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f50945a) {
            case 0:
                ((Integer) obj2).getClass();
                w6.b((String) this.f50950f, (String) this.f50951g, this.f50946b, this.f50949e, (Function0) this.f50952h, (Function0) this.f50953i, (Function3) this.f50954j, (p1.o) obj, p1.a0.l(this.f50947c | 1), this.f50948d);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(7);
                io.sentry.config.a.l((List) this.f50950f, (List) this.f50951g, (List) this.f50952h, (List) this.f50953i, this.f50946b, this.f50947c, this.f50948d, (Function2) this.f50954j, this.f50949e, (p1.o) obj, iL);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ r6(List list, List list2, List list3, List list4, int i5, int i11, int i12, Function2 function2, boolean z11, int i13) {
        this.f50950f = list;
        this.f50951g = list2;
        this.f50952h = list3;
        this.f50953i = list4;
        this.f50946b = i5;
        this.f50947c = i11;
        this.f50948d = i12;
        this.f50954j = function2;
        this.f50949e = z11;
    }
}
