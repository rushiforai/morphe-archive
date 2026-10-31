package a20;

import g2.v;
import g2.w;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;
import p1.e1;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f125a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f126b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f127c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f128d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Function1 f129e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Ref.IntRef f130f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ boolean f131g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ boolean f132h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f133i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ e1 f134j;

    public /* synthetic */ c(Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2, Ref.BooleanRef booleanRef, Function1 function1, Ref.IntRef intRef, boolean z11, boolean z12, Ref.BooleanRef booleanRef2, e1 e1Var) {
        this.f126b = objectRef;
        this.f127c = objectRef2;
        this.f128d = booleanRef;
        this.f129e = function1;
        this.f130f = intRef;
        this.f131g = z11;
        this.f132h = z12;
        this.f133i = booleanRef2;
        this.f134j = e1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f125a) {
            case 0:
                String str = (String) obj;
                e1 e1Var = this.f134j;
                e1Var.setValue(str);
                h.c(this.f129e, this.f130f, this.f131g, this.f126b, this.f127c, this.f132h, this.f128d, this.f133i, e1Var, null, null, null, null, str, 7680);
                break;
            default:
                if (((w) ((v) obj)).a()) {
                    Ref.ObjectRef objectRef = this.f126b;
                    String str2 = (String) objectRef.f71863a;
                    Ref.ObjectRef objectRef2 = this.f127c;
                    String str3 = (String) objectRef2.f71863a;
                    Ref.BooleanRef booleanRef = this.f128d;
                    h.c(this.f129e, this.f130f, this.f131g, objectRef, objectRef2, this.f132h, booleanRef, this.f133i, this.f134j, null, str2, str3, Boolean.valueOf(booleanRef.f71859a), null, 8704);
                }
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ c(e1 e1Var, Function1 function1, Ref.IntRef intRef, boolean z11, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2, boolean z12, Ref.BooleanRef booleanRef, Ref.BooleanRef booleanRef2) {
        this.f134j = e1Var;
        this.f129e = function1;
        this.f130f = intRef;
        this.f131g = z11;
        this.f126b = objectRef;
        this.f127c = objectRef2;
        this.f132h = z12;
        this.f128d = booleanRef;
        this.f133i = booleanRef2;
    }
}
