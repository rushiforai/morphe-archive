package o2;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class i extends Lambda implements Function0 {

    /* renamed from: k, reason: collision with root package name */
    public static final i f79278k;

    /* renamed from: l, reason: collision with root package name */
    public static final i f79279l;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f79280j;

    static {
        int i5 = 0;
        f79278k = new i(i5, 0);
        f79279l = new i(i5, 1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i(int i5, int i11) {
        super(i5);
        this.f79280j = i11;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f79280j) {
            case 0:
                return wh.f.n();
            default:
                return Unit.f71706a;
        }
    }
}
