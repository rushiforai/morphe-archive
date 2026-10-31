package b4;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class c extends Lambda implements Function1 {

    /* renamed from: k, reason: collision with root package name */
    public static final c f17450k;

    /* renamed from: l, reason: collision with root package name */
    public static final c f17451l;

    /* renamed from: m, reason: collision with root package name */
    public static final c f17452m;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f17453j;

    static {
        int i5 = 1;
        f17450k = new c(i5, 0);
        f17451l = new c(i5, 1);
        f17452m = new c(i5, 2);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c(int i5, int i11) {
        super(i5);
        this.f17453j = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f17453j) {
            case 0:
                m mVar = (m) obj;
                mVar.getHandler().post(new b(mVar.f17495q, 0));
                break;
            case 1:
                break;
            default:
                break;
        }
        return Unit.f71706a;
    }
}
