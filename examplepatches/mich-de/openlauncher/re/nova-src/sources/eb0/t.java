package eb0;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes5.dex */
public final class t extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f52647j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ d f52648k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ t(d dVar, int i5) {
        super(1);
        this.f52647j = i5;
        this.f52648k = dVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f52647j) {
            case 0:
                this.f52648k.cancel();
                break;
            case 1:
                this.f52648k.cancel();
                break;
            default:
                this.f52648k.cancel();
                break;
        }
        return Unit.f71706a;
    }
}
