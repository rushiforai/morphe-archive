package jv;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class n implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70109a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ou.d f70110b;

    public /* synthetic */ n(ou.d dVar, int i5) {
        this.f70109a = i5;
        this.f70110b = dVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        String code = (String) obj;
        switch (this.f70109a) {
            case 0:
                Intrinsics.g(code, "code");
                return this.f70110b.c(code);
            default:
                return Boolean.valueOf(!(code != null && this.f70110b.c(code).equals(ou.l.f80925b)));
        }
    }
}
