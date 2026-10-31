package c3;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class e2 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ boolean f19268j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ a7.e f19269k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ String f19270l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e2(boolean z11, a7.e eVar, String str) {
        super(0);
        this.f19268j = z11;
        this.f19269k = eVar;
        this.f19270l = str;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        if (this.f19268j) {
            this.f19269k.f437a.h(this.f19270l);
        }
        return Unit.f71706a;
    }
}
