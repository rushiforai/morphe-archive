package x70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.SuspendFunction;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.FunctionReferenceImpl;

/* loaded from: classes.dex */
public final /* synthetic */ class w extends FunctionReferenceImpl implements Function3, SuspendFunction {

    /* renamed from: d, reason: collision with root package name */
    public static final w f95273d = new w(3, w70.n.class, "emit", "emit(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", 0);

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        return ((w70.n) obj).emit(obj2, (Continuation) obj3);
    }
}
