package pu;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class c0 implements m3.o {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f83016a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function0 f83017b;

    public /* synthetic */ c0(Function0 function0, int i5) {
        this.f83016a = i5;
        this.f83017b = function0;
    }

    @Override // m3.o
    public final void a(m3.n it) {
        switch (this.f83016a) {
            case 0:
                Intrinsics.g(it, "it");
                this.f83017b.invoke();
                break;
            default:
                Intrinsics.g(it, "it");
                this.f83017b.invoke();
                break;
        }
    }
}
