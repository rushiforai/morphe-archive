package c3;

import androidx.compose.ui.platform.ComposeView;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;
import l1.b8;

/* loaded from: classes2.dex */
public final class y1 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f19475j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ int f19476k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Object f19477l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ y1(Object obj, int i5, int i11) {
        super(2);
        this.f19475j = i11;
        this.f19477l = obj;
        this.f19476k = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f19475j;
        p1.o oVar = (p1.o) obj;
        ((Number) obj2).intValue();
        switch (i5) {
            case 0:
                ((ComposeView) this.f19477l).Content(oVar, p1.a0.l(this.f19476k | 1));
                break;
            default:
                b8.d((Function2) this.f19477l, oVar, p1.a0.l(this.f19476k | 1));
                break;
        }
        return Unit.f71706a;
    }
}
