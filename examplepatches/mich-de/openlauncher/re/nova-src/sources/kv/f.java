package kv;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class f implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72304a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f72305b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ g f72306c;

    public /* synthetic */ f(boolean z11, g gVar, int i5) {
        this.f72304a = i5;
        this.f72305b = z11;
        this.f72306c = gVar;
    }

    /* JADX WARN: Type inference failed for: r0v4, types: [kotlin.jvm.functions.Function0, kotlin.jvm.internal.FunctionReferenceImpl] */
    /* JADX WARN: Type inference failed for: r0v8, types: [kotlin.jvm.functions.Function0, kotlin.jvm.internal.FunctionReferenceImpl] */
    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f72304a) {
            case 0:
                if (this.f72305b) {
                    this.f72306c.f72309c.invoke();
                }
                break;
            default:
                if (this.f72305b) {
                    this.f72306c.f72309c.invoke();
                }
                break;
        }
        return Unit.f71706a;
    }
}
