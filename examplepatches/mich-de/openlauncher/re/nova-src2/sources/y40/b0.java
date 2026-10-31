package y40;

import io.branch.search.internal.E2;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class b0 {

    @NotNull
    public static final z Companion = new z();

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f96653a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f96654b;

    /* renamed from: c, reason: collision with root package name */
    public final Function2 f96655c;

    public b0(String str, boolean z11, Function2 function2) {
        this.f96653a = str;
        this.f96654b = z11;
        this.f96655c = function2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        a0 a0Var;
        if (continuationImpl instanceof a0) {
            a0Var = (a0) continuationImpl;
            int i5 = a0Var.f96652v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a0Var.f96652v = i5 - Integer.MIN_VALUE;
            } else {
                a0Var = new a0(this, continuationImpl);
            }
        }
        Object objInvoke = a0Var.f96650t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = a0Var.f96652v;
        try {
            if (i11 == 0) {
                ResultKt.b(objInvoke);
                Function2 function2 = this.f96655c;
                Intrinsics.d(function2);
                a0Var.f96652v = 1;
                objInvoke = function2.invoke(this, a0Var);
                if (objInvoke == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objInvoke);
            }
            return (w) objInvoke;
        } catch (Exception e3) {
            v vVar = w.Companion;
            EmptyList emptyList = EmptyList.f71733a;
            E2.Companion.getClass();
            return v.b(vVar, emptyList, E2.b.a(e3));
        }
    }
}
