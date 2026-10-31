package b20;

import gy.v0;
import kotlin.Function;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;

/* loaded from: classes4.dex */
public final /* synthetic */ class w implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17119a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f17120b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f17121c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function f17122d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f17123e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f17124f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ int f17125g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ int f17126h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Object f17127i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Object f17128j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Object f17129k;

    public /* synthetic */ w(Number number, x1.e eVar, x1.e eVar2, b2.t tVar, String str, Function2 function2, Function2 function22, Function1 function1, int i5, int i11) {
        this.f17119a = 2;
        this.f17128j = number;
        this.f17121c = eVar;
        this.f17123e = eVar2;
        this.f17127i = tVar;
        this.f17120b = str;
        this.f17124f = function2;
        this.f17129k = function22;
        this.f17122d = function1;
        this.f17125g = i5;
        this.f17126h = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f17119a) {
            case 0:
                ((Integer) obj2).getClass();
                lb0.b.f((b2.t) this.f17127i, (Function3) this.f17128j, (String) this.f17120b, (String) this.f17121c, (String) this.f17123e, (Function2) this.f17124f, (Function2) this.f17129k, (Function0) this.f17122d, (p1.o) obj, p1.a0.l(this.f17125g | 1), this.f17126h);
                break;
            case 1:
                int iIntValue = ((Integer) obj2).intValue();
                break;
            case 2:
                ((Integer) obj2).getClass();
                v0.b((Number) this.f17128j, (x1.e) this.f17121c, (x1.e) this.f17123e, (b2.t) this.f17127i, (String) this.f17120b, (Function2) this.f17124f, (Function2) this.f17129k, (Function1) this.f17122d, (p1.o) obj, p1.a0.l(this.f17125g | 1), this.f17126h);
                break;
            default:
                ((Integer) obj2).getClass();
                hw.r.a((hw.n) this.f17127i, (hw.o) this.f17128j, (hw.s) this.f17120b, (Float) this.f17121c, (hw.m) this.f17123e, (hw.g) this.f17124f, (hw.h) this.f17129k, (x1.e) this.f17122d, (p1.o) obj, p1.a0.l(this.f17125g | 1), this.f17126h);
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ w(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, Function function, int i5, int i11, int i12) {
        this.f17119a = i12;
        this.f17127i = obj;
        this.f17128j = obj2;
        this.f17120b = obj3;
        this.f17121c = obj4;
        this.f17123e = obj5;
        this.f17124f = obj6;
        this.f17129k = obj7;
        this.f17122d = function;
        this.f17125g = i5;
        this.f17126h = i11;
    }

    public /* synthetic */ w(String str, String str2, Function0 function0, String str3, Function0 function02, String str4, Function0 function03, Function2 function2, int i5, int i11) {
        this.f17119a = 1;
        this.f17120b = str;
        this.f17121c = str2;
        this.f17122d = function0;
        this.f17123e = str3;
        this.f17127i = function02;
        this.f17128j = str4;
        this.f17129k = function03;
        this.f17124f = function2;
        this.f17125g = i5;
        this.f17126h = i11;
    }
}
