package l1;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class c4 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f73103j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Function0 f73104k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c4(Function0 function0, int i5) {
        super(0);
        this.f73103j = i5;
        this.f73104k = function0;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f73103j) {
            case 0:
                this.f73104k.invoke();
                return Boolean.TRUE;
            case 1:
                this.f73104k.invoke();
                return Boolean.TRUE;
            case 2:
                return Float.valueOf(kotlin.ranges.a.d0(((Number) this.f73104k.invoke()).floatValue(), 0.0f, 1.0f));
            case 3:
                return Float.valueOf(kotlin.ranges.a.d0(((Number) this.f73104k.invoke()).floatValue(), 0.0f, 1.0f));
            default:
                return Float.valueOf(((Number) this.f73104k.invoke()).floatValue() < 1.0f ? 0.3f : 1.0f);
        }
    }
}
