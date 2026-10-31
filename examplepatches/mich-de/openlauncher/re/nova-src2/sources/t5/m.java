package t5;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class m extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f88651j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ c0 f88652k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ m(c0 c0Var, int i5) {
        super(0);
        this.f88651j = i5;
        this.f88652k = c0Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f88651j) {
            case 0:
                return ((k1) this.f88652k.f88552j.getValue()).c();
            default:
                return this.f88652k.f88543a.a();
        }
    }
}
