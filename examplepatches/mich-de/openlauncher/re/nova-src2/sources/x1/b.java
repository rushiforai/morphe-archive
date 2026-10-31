package x1;

import b2.t;
import com.stripe.android.link.ui.verification.VerificationViewState;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kw.g1;
import p1.a0;

/* loaded from: classes2.dex */
public final /* synthetic */ class b implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94927a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function0 f94928b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f94929c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f94930d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f94931e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f94932f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f94933g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Object f94934h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Object f94935i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Object f94936j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Object f94937k;

    public /* synthetic */ b(t tVar, VerificationViewState verificationViewState, g1 g1Var, Function0 function0, Function0 function02, Function0 function03, Function0 function04, Function0 function05, Function0 function06, int i5) {
        this.f94930d = tVar;
        this.f94931e = verificationViewState;
        this.f94932f = g1Var;
        this.f94928b = function0;
        this.f94933g = function02;
        this.f94934h = function03;
        this.f94935i = function04;
        this.f94936j = function05;
        this.f94937k = function06;
        this.f94929c = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f94927a) {
            case 0:
                ((Integer) obj2).getClass();
                ((e) this.f94930d).c(this.f94931e, this.f94932f, (Integer) this.f94937k, this.f94933g, this.f94934h, this.f94928b, this.f94935i, this.f94936j, (p1.o) obj, a0.l(this.f94929c) | 1);
                break;
            default:
                ((Integer) obj2).getClass();
                ps.k.f((t) this.f94930d, (VerificationViewState) this.f94931e, (g1) this.f94932f, this.f94928b, (Function0) this.f94933g, (Function0) this.f94934h, (Function0) this.f94935i, (Function0) this.f94936j, (Function0) this.f94937k, (p1.o) obj, a0.l(this.f94929c | 1));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ b(e eVar, Object obj, Object obj2, Integer num, Object obj3, Object obj4, Function0 function0, Object obj5, Object obj6, int i5) {
        this.f94930d = eVar;
        this.f94931e = obj;
        this.f94932f = obj2;
        this.f94937k = num;
        this.f94933g = obj3;
        this.f94934h = obj4;
        this.f94928b = function0;
        this.f94935i = obj5;
        this.f94936j = obj6;
        this.f94929c = i5;
    }
}
