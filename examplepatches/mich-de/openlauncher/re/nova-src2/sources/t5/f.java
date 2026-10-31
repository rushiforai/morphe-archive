package t5;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.ExceptionsKt;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public abstract class f {
    /* JADX WARN: Removed duplicated region for block: B:27:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:33:0x0087 -> B:25:0x0067). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:34:0x008a -> B:25:0x0067). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(List list, o0 o0Var, ContinuationImpl continuationImpl) throws Throwable {
        d dVar;
        List list2;
        Ref.ObjectRef objectRef;
        Iterator it;
        Throwable th2;
        if (continuationImpl instanceof d) {
            dVar = (d) continuationImpl;
            int i5 = dVar.f88558w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f88558w = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(continuationImpl);
            }
        }
        Object obj = dVar.f88557v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar.f88558w;
        if (i11 == 0) {
            ArrayList arrayListX = b.c0.x(obj);
            e eVar = new e(list, arrayListX, null);
            dVar.f88555t = arrayListX;
            dVar.f88558w = 1;
            if (((k) o0Var).a(eVar, dVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            list2 = arrayListX;
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                it = dVar.f88556u;
                objectRef = (Ref.ObjectRef) dVar.f88555t;
                try {
                    ResultKt.b(obj);
                } catch (Throwable th3) {
                    Object obj2 = objectRef.f71863a;
                    if (obj2 == null) {
                        objectRef.f71863a = th3;
                    } else {
                        ExceptionsKt.a((Throwable) obj2, th3);
                    }
                }
                while (it.hasNext()) {
                    Function1 function1 = (Function1) it.next();
                    dVar.f88555t = objectRef;
                    dVar.f88556u = it;
                    dVar.f88558w = 2;
                    if (function1.invoke(dVar) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                }
                th2 = (Throwable) objectRef.f71863a;
                if (th2 != null) {
                    return Unit.f71706a;
                }
                throw th2;
            }
            list2 = (List) dVar.f88555t;
            ResultKt.b(obj);
        }
        objectRef = new Ref.ObjectRef();
        it = list2.iterator();
        while (it.hasNext()) {
        }
        th2 = (Throwable) objectRef.f71863a;
        if (th2 != null) {
        }
    }
}
