package n1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FloatCompanionObject;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class e extends Lambda implements Function1 {

    /* renamed from: k, reason: collision with root package name */
    public static final e f77635k;

    /* renamed from: l, reason: collision with root package name */
    public static final e f77636l;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f77637j;

    static {
        int i5 = 1;
        f77635k = new e(i5, 0);
        f77636l = new e(i5, 1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e(int i5, int i11) {
        super(i5);
        this.f77637j = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f77637j) {
            case 0:
                k2.c cVar = (k2.c) obj;
                k2.d drawContext = cVar.getDrawContext();
                long jMo111getSizeNHjbRc = drawContext.mo111getSizeNHjbRc();
                drawContext.getCanvas().save();
                try {
                    drawContext.getTransform().mo136clipRectN_I0leg(-3.4028235E38f, 0.0f, Float.MAX_VALUE, Float.MAX_VALUE, 1);
                    cVar.drawContent();
                    a2.c.x(drawContext, jMo111getSizeNHjbRc);
                    return Unit.f71706a;
                } catch (Throwable th2) {
                    a2.c.x(drawContext, jMo111getSizeNHjbRc);
                    throw th2;
                }
            default:
                Float fValueOf = Float.valueOf(((Number) obj).floatValue());
                FloatCompanionObject floatCompanionObject = FloatCompanionObject.f71855a;
                return new q(new c0.e(fValueOf, c0.f.f18784i, null, 12));
        }
    }
}
