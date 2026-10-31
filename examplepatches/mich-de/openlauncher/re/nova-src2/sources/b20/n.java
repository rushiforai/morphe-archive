package b20;

import com.instabridge.mobilesdk.internal.ui.screens.CommonsKt;
import f1.e2;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class n implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17091a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f17092b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f17093c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f17094d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f17095e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f17096f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f17097g;

    public /* synthetic */ n(b2.t tVar, List list, Integer num, long j11, int i5, int i11) {
        this.f17096f = tVar;
        this.f17097g = list;
        this.f17092b = num;
        this.f17093c = j11;
        this.f17094d = i5;
        this.f17095e = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f17091a) {
            case 0:
                ((Integer) obj2).getClass();
                r.a((b2.t) this.f17096f, (List) this.f17097g, (Integer) this.f17092b, this.f17093c, (p1.o) obj, p1.a0.l(this.f17094d | 1), this.f17095e);
                return Unit.f71706a;
            case 1:
                int iIntValue = ((Integer) obj2).intValue();
                return CommonsKt.OutlinedCta_cf5BqRc$lambda$3((String) this.f17096f, (Integer) this.f17092b, this.f17093c, (Function0) this.f17097g, this.f17094d, this.f17095e, (p1.o) obj, iIntValue);
            default:
                ((Integer) obj2).getClass();
                e2.a((n2.c) this.f17097g, (String) this.f17092b, (b2.t) this.f17096f, this.f17093c, (p1.o) obj, p1.a0.l(this.f17094d | 1), this.f17095e);
                return Unit.f71706a;
        }
    }

    public /* synthetic */ n(String str, Integer num, long j11, Function0 function0, int i5, int i11) {
        this.f17096f = str;
        this.f17092b = num;
        this.f17093c = j11;
        this.f17097g = function0;
        this.f17094d = i5;
        this.f17095e = i11;
    }

    public /* synthetic */ n(n2.c cVar, String str, b2.t tVar, long j11, int i5, int i11) {
        this.f17097g = cVar;
        this.f17092b = str;
        this.f17096f = tVar;
        this.f17093c = j11;
        this.f17094d = i5;
        this.f17095e = i11;
    }
}
