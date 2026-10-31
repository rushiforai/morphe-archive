package b0;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;
import p1.y2;

/* loaded from: classes2.dex */
public final class n0 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f16193j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ y2 f16194k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ n0(y2 y2Var, int i5) {
        super(1);
        this.f16193j = i5;
        this.f16194k = y2Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f16193j) {
            case 0:
                ((i2.s0) ((i2.a0) obj)).a(((Number) this.f16194k.getValue()).floatValue());
                return Unit.f71706a;
            case 1:
                return new y3.k((((y3.c) obj).mo96roundToPx0680j_4(((y3.f) this.f16194k.getValue()).f96602a) << 32) | (0 & 4294967295L));
            default:
                ((i2.s0) ((i2.a0) obj)).a(((Number) this.f16194k.getValue()).floatValue());
                return Unit.f71706a;
        }
    }
}
