package c4;

import android.view.View;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;
import l1.l2;
import z2.r1;
import z2.v1;

/* loaded from: classes2.dex */
public final class c extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f19562j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Object f19563k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ int f19564l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ Object f19565m;
    public final /* synthetic */ Object n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(View view, y3.c cVar, Function0 function0, int i5) {
        super(2);
        this.f19562j = 1;
        this.f19565m = view;
        this.n = cVar;
        this.f19563k = function0;
        this.f19564l = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f19562j;
        p1.o oVar = (p1.o) obj;
        ((Number) obj2).intValue();
        switch (i5) {
            case 0:
                p7.u.g((Function0) this.f19563k, (y) this.f19565m, (x1.e) this.n, oVar, p1.a0.l(this.f19564l | 1));
                break;
            case 1:
                l2.b((View) this.f19565m, (y3.c) this.n, (Function0) this.f19563k, oVar, p1.a0.l(this.f19564l | 1));
                break;
            default:
                r1.b((v1) this.f19563k, (b2.t) this.f19565m, (Function2) this.n, oVar, p1.a0.l(this.f19564l | 1));
                break;
        }
        return Unit.f71706a;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c(Object obj, Object obj2, Function2 function2, int i5, int i11) {
        super(2);
        this.f19562j = i11;
        this.f19563k = obj;
        this.f19565m = obj2;
        this.n = function2;
        this.f19564l = i5;
    }
}
