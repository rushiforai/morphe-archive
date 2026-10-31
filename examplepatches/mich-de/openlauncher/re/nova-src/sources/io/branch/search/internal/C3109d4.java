package io.branch.search.internal;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;

/* renamed from: io.branch.search.internal.d4, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final /* synthetic */ class C3109d4 extends FunctionReferenceImpl implements Function1<Long, Unit> {

    /* renamed from: a, reason: collision with root package name */
    public static final C3109d4 f64241a = new C3109d4();

    public C3109d4() {
        super(1, C3210j4.class, "defaultPause", "defaultPause(J)V", 1);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) throws InterruptedException {
        try {
            Thread.sleep(((Number) obj).longValue());
        } catch (InterruptedException unused) {
        }
        return Unit.f71706a;
    }
}
