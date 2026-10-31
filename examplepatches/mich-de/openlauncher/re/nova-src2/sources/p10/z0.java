package p10;

import e00.j5;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class z0 {

    /* renamed from: h, reason: collision with root package name */
    public static final String f81980h;

    /* renamed from: i, reason: collision with root package name */
    public static final y5.f f81981i;

    /* renamed from: j, reason: collision with root package name */
    public static final y5.f f81982j;

    /* renamed from: a, reason: collision with root package name */
    public final s f81983a;

    /* renamed from: b, reason: collision with root package name */
    public final t5.g f81984b;

    /* renamed from: c, reason: collision with root package name */
    public final Function0 f81985c;

    /* renamed from: d, reason: collision with root package name */
    public final Function1 f81986d;

    /* renamed from: e, reason: collision with root package name */
    public final FunctionReferenceImpl f81987e;

    /* renamed from: f, reason: collision with root package name */
    public final o00.d f81988f;

    /* renamed from: g, reason: collision with root package name */
    public final j5 f81989g;

    static {
        dx.t.a("rewarded");
        f81980h = "rewarded";
        f81981i = v70.o.h("rewarded_earn_day");
        f81982j = new y5.f("rewarded_earn_count");
    }

    /* JADX WARN: Multi-variable type inference failed */
    public z0(s sVar, t5.g gVar, Function1 function1) {
        v0 v0Var = v0.f81940d;
        w0 w0Var = w0.f81951d;
        o00.d dVar = new o00.d(16);
        j5 j5Var = new j5(2, null, 17);
        this.f81983a = sVar;
        this.f81984b = gVar;
        this.f81985c = v0Var;
        this.f81986d = w0Var;
        this.f81987e = (FunctionReferenceImpl) function1;
        this.f81988f = dVar;
        this.f81989g = j5Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(z0 z0Var, ContinuationImpl continuationImpl) {
        x0 x0Var;
        Ref.IntRef intRef;
        if (continuationImpl instanceof x0) {
            x0Var = (x0) continuationImpl;
            int i5 = x0Var.f81961w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                x0Var.f81961w = i5 - Integer.MIN_VALUE;
            } else {
                x0Var = new x0(z0Var, continuationImpl);
            }
        }
        Object obj = x0Var.f81959u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = x0Var.f81961w;
        if (i11 == 0) {
            ResultKt.b(obj);
            long jLongValue = ((Number) z0Var.f81986d.invoke(z0Var.f81985c.invoke())).longValue();
            Ref.IntRef intRef2 = new Ref.IntRef();
            t5.g gVar = z0Var.f81984b;
            y0 y0Var = new y0(z0Var, jLongValue, intRef2, null);
            x0Var.f81958t = intRef2;
            x0Var.f81961w = 1;
            if (vm.d.e(gVar, y0Var, x0Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            intRef = intRef2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            intRef = x0Var.f81958t;
            ResultKt.b(obj);
        }
        return new Integer(intRef.f71861a);
    }

    public static final int b(z0 z0Var, y5.b bVar) {
        int iIntValue = ((Number) z0Var.f81988f.invoke()).intValue() - c(bVar, ((Number) z0Var.f81986d.invoke(z0Var.f81985c.invoke())).longValue());
        if (iIntValue < 0) {
            return 0;
        }
        return iIntValue;
    }

    public static int c(y5.b bVar, long j11) {
        Integer num;
        Long l9 = (Long) bVar.b(f81981i);
        if (l9 == null || l9.longValue() != j11 || (num = (Integer) bVar.b(f81982j)) == null) {
            return 0;
        }
        return num.intValue();
    }
}
