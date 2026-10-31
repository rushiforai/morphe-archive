package f00;

import kotlin.Unit;
import kotlin.jvm.functions.Function4;
import p1.e1;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements Function4 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53236a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e1 f53237b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e1 f53238c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ e1 f53239d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ e1 f53240e;

    public /* synthetic */ c(e1 e1Var, e1 e1Var2, e1 e1Var3, e1 e1Var4, int i5) {
        this.f53236a = i5;
        this.f53237b = e1Var;
        this.f53238c = e1Var2;
        this.f53239d = e1Var3;
        this.f53240e = e1Var4;
    }

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        int i5 = this.f53236a;
        String str = (String) obj;
        String str2 = (String) obj2;
        Boolean bool = (Boolean) obj3;
        bool.booleanValue();
        Boolean bool2 = (Boolean) obj4;
        bool2.booleanValue();
        switch (i5) {
            case 0:
                this.f53237b.setValue(str);
                this.f53238c.setValue(str2);
                this.f53239d.setValue(bool);
                this.f53240e.setValue(bool2);
                break;
            default:
                this.f53237b.setValue(str);
                this.f53238c.setValue(str2);
                this.f53239d.setValue(bool);
                this.f53240e.setValue(bool2);
                break;
        }
        return Unit.f71706a;
    }
}
