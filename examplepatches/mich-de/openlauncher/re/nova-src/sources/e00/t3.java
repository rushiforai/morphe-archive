package e00;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class t3 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51012a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ k30.c f51013b;

    public /* synthetic */ t3(k30.c cVar, int i5) {
        this.f51012a = i5;
        this.f51013b = cVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        boolean zB;
        k30.c cVar = (k30.c) obj;
        switch (this.f51012a) {
            case 0:
                zB = Intrinsics.b(cVar.f70910a, this.f51013b.f70910a);
                break;
            default:
                zB = Intrinsics.b(cVar.f70910a, this.f51013b.f70910a);
                break;
        }
        return Boolean.valueOf(zB);
    }
}
