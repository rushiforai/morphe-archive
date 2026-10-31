package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class a4 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f73013j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ f6 f73014k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Function0 f73015l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a4(f6 f6Var, Function0 function0, int i5) {
        super(1);
        this.f73013j = i5;
        this.f73014k = f6Var;
        this.f73015l = function0;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f73013j) {
            case 0:
                if (!this.f73014k.c()) {
                    this.f73015l.invoke();
                }
                break;
            default:
                if (!this.f73014k.c()) {
                    this.f73015l.invoke();
                }
                break;
        }
        return Unit.f71706a;
    }
}
