package kw;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;

/* loaded from: classes4.dex */
public final /* synthetic */ class s implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72599a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f72600b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f72601c;

    public /* synthetic */ s(String str, String str2, int i5) {
        this.f72599a = i5;
        this.f72600b = str;
        this.f72601c = str2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5 = this.f72599a;
        String str = this.f72601c;
        String str2 = this.f72600b;
        j3.b0 semantics = (j3.b0) obj;
        switch (i5) {
            case 0:
                Intrinsics.g(semantics, "$this$semantics");
                j3.y.k(str2, semantics);
                j3.a0 a0Var = j3.w.f68853b;
                KProperty kProperty = j3.y.f68878a[0];
                a0Var.a(semantics, str);
                break;
            default:
                Intrinsics.g(semantics, "$this$semantics");
                if (str2 != null) {
                    str = str2;
                }
                KProperty[] kPropertyArr = j3.y.f68878a;
                ((j3.k) semantics).f(j3.w.K, str);
                break;
        }
        return Unit.f71706a;
    }
}
