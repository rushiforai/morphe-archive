package io.branch.search.internal;

import android.content.SharedPreferences;
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

@DebugMetadata(c = "io.branch.search.internal.bundle.data.SharedPreferencesBundleJobScheduleDataSource$get$2", f = "SharedPreferencesBundleJobScheduleDataSource.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class Td extends SuspendLambda implements Function2<t70.j0, Continuation<? super Bc>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Sd f63390a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Td(Sd sd2, Continuation<? super Td> continuation) {
        super(2, continuation);
        this.f63390a = sd2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new Td(this.f63390a, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new Td(this.f63390a, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        String string = ((SharedPreferences) this.f63390a.f63357b.getValue()).getString("scheduled_job_timestamp_key", null);
        if (string == null) {
            return null;
        }
        JSONObject jSONObject = new JSONObject(string);
        return new Bc(jSONObject.optLong("scheduleTimestamp"), jSONObject.optLong("minDelay"));
    }
}
