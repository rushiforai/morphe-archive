package g;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class u extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f56436j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ a0 f56437k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ u(a0 a0Var, int i5) {
        super(0);
        this.f56436j = i5;
        this.f56437k = a0Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f56436j) {
            case 0:
                this.f56437k.d();
                break;
            default:
                this.f56437k.c();
                break;
        }
        return Unit.f71706a;
    }
}
