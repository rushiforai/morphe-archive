package io.branch.search.internal;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONObject;

@DebugMetadata(c = "io.branch.search.internal.data.remote.source.AnalyticsDataSource$javaAsyncPost$1", f = "AnalyticsDataSource.kt", l = {22}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class U extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f63397a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ V f63398b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f63399c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ JSONObject f63400d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ JSONObject f63401e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Function2<Boolean, J2, Unit> f63402f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public U(V v11, String str, JSONObject jSONObject, JSONObject jSONObject2, Function2<? super Boolean, ? super J2, Unit> function2, Continuation<? super U> continuation) {
        super(2, continuation);
        this.f63398b = v11;
        this.f63399c = str;
        this.f63400d = jSONObject;
        this.f63401e = jSONObject2;
        this.f63402f = function2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new U(this.f63398b, this.f63399c, this.f63400d, this.f63401e, this.f63402f, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((U) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f63397a;
        if (i5 == 0) {
            ResultKt.b(obj);
            V v11 = this.f63398b;
            String str = this.f63399c;
            JSONObject jSONObject = this.f63400d;
            JSONObject jSONObject2 = this.f63401e;
            this.f63397a = 1;
            obj = v11.f63464a.a(str, jSONObject, jSONObject2, this);
            if (obj == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        J2 j22 = (J2) obj;
        this.f63402f.invoke(Boolean.valueOf(j22 == null), j22);
        return Unit.f71706a;
    }
}
