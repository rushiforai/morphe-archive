package w70;

import kotlin.ExceptionsKt;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function3;

/* loaded from: classes.dex */
public abstract /* synthetic */ class a0 {
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(k2 k2Var, Function3 function3, Throwable th2, ContinuationImpl continuationImpl) {
        v vVar;
        if (continuationImpl instanceof v) {
            vVar = (v) continuationImpl;
            int i5 = vVar.f94046v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                vVar.f94046v = i5 - Integer.MIN_VALUE;
            } else {
                vVar = new v(continuationImpl);
            }
        }
        Object obj = vVar.f94045u;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = vVar.f94046v;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                vVar.f94044t = th2;
                vVar.f94046v = 1;
                if (function3.invoke(k2Var, th2, vVar) == obj2) {
                    return obj2;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                th2 = vVar.f94044t;
                ResultKt.b(obj);
            }
            return Unit.f71706a;
        } catch (Throwable th3) {
            if (th2 != null && th2 != th3) {
                ExceptionsKt.a(th3, th2);
            }
            throw th3;
        }
    }
}
