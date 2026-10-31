package h;

import g2.s;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class d extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f58695j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ boolean f58696k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Object f58697l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d(Object obj, boolean z11, int i5) {
        super(0);
        this.f58695j = i5;
        this.f58697l = obj;
        this.f58696k = z11;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f58695j) {
            case 0:
                ((f) this.f58697l).setEnabled(this.f58696k);
                break;
            case 1:
                ((Function1) this.f58697l).invoke(Boolean.valueOf(!this.f58696k));
                break;
            default:
                if (this.f58696k) {
                    s sVar = (s) this.f58697l;
                    sVar.getClass();
                    sVar.a(new g2.n());
                }
                break;
        }
        return Unit.f71706a;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(boolean z11, s sVar) {
        super(0);
        this.f58695j = 2;
        this.f58696k = z11;
        this.f58697l = sVar;
    }
}
