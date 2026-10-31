package io.ktor.utils.io;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class k0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f66604a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ m f66605b;

    public /* synthetic */ k0(m mVar, int i5) {
        this.f66604a = i5;
        this.f66605b = mVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f66604a) {
            case 0:
                m mVar = this.f66605b;
                Throwable th2 = (Throwable) obj;
                if (th2 != null && mVar._closedCause == null) {
                    mVar.a(th2);
                }
                break;
            default:
                m mVar2 = this.f66605b;
                Throwable th3 = (Throwable) obj;
                if (th3 != null && !mVar2.h()) {
                    mVar2.a(th3);
                }
                break;
        }
        return Unit.f71706a;
    }
}
