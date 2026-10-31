package e10;

import android.graphics.drawable.Drawable;
import com.android.launcher3.BubbleTextView;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class m extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ BubbleTextView f51648t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f51649u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(BubbleTextView bubbleTextView, Ref.ObjectRef objectRef, Continuation continuation) {
        super(2, continuation);
        this.f51648t = bubbleTextView;
        this.f51649u = objectRef;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new m(this.f51648t, this.f51649u, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((m) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        this.f51648t.t((Drawable) this.f51649u.f71863a);
        return Unit.f71706a;
    }
}
