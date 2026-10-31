package c3;

import android.view.View;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.KotlinNothingValueException;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class d1 implements t70.j0 {

    /* renamed from: a, reason: collision with root package name */
    public final View f19251a;

    /* renamed from: b, reason: collision with root package name */
    public final r3.a0 f19252b;

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f19253c;

    /* renamed from: d, reason: collision with root package name */
    public final AtomicReference f19254d = new AtomicReference(null);

    public d1(View view, r3.a0 a0Var, t70.j0 j0Var) {
        this.f19251a = view;
        this.f19252b = a0Var;
        this.f19253c = j0Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(c1.r rVar, ContinuationImpl continuationImpl) {
        b1 b1Var;
        if (continuationImpl instanceof b1) {
            b1Var = (b1) continuationImpl;
            int i5 = b1Var.f19229v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b1Var.f19229v = i5 - Integer.MIN_VALUE;
            } else {
                b1Var = new b1(this, continuationImpl);
            }
        }
        Object obj = b1Var.f19227t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b1Var.f19229v;
        if (i11 == 0) {
            ResultKt.b(obj);
            b0.e eVar = new b0.e(2, rVar, this);
            ar.a aVar = new ar.a(this, (Continuation) null, 29);
            b1Var.f19229v = 1;
            if (t70.k0.d(new androidx.room.p(eVar, this.f19254d, aVar, (Continuation) null), b1Var) == coroutineSingletons) {
                return;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        throw new KotlinNothingValueException();
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.f19253c.getCoroutineContext();
    }
}
