package c1;

import i2.h0;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import p1.s2;
import z2.y;

/* loaded from: classes2.dex */
public final /* synthetic */ class b extends FunctionReferenceImpl implements Function1 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ n f19072d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(n nVar) {
        super(1, Intrinsics.Kotlin.class, "localToScreen", "startInput$localToScreen(Landroidx/compose/foundation/text/input/internal/LegacyPlatformTextInputServiceAdapter$LegacyPlatformTextInputNode;[F)V", 0);
        this.f19072d = nVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        float[] fArr = ((h0) obj).f61121a;
        y yVar = (y) ((s2) this.f19072d.f19103d).getValue();
        if (yVar != null) {
            if (!yVar.isAttached()) {
                yVar = null;
            }
            if (yVar != null) {
                yVar.D(fArr);
            }
        }
        return Unit.f71706a;
    }
}
