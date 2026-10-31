package io.branch.search.internal;

import android.content.SharedPreferences;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;
import org.json.JSONObject;

@DebugMetadata(c = "io.branch.search.internal.bundle.data.SharedPreferencesBundleJobScheduleDataSource$put$2", f = "SharedPreferencesBundleJobScheduleDataSource.kt", l = {}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class Ud extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Sd f63457a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Bc f63458b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Ud(Sd sd2, Bc bc2, Continuation<? super Ud> continuation) {
        super(2, continuation);
        this.f63457a = sd2;
        this.f63458b = bc2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new Ud(this.f63457a, this.f63458b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new Ud(this.f63457a, this.f63458b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) throws JSONException {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        SharedPreferences.Editor editorEdit = ((SharedPreferences) this.f63457a.f63357b.getValue()).edit();
        Bc bc2 = this.f63458b;
        Intrinsics.g(bc2, "<this>");
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("scheduleTimestamp", bc2.f62149a);
        jSONObject.put("minDelay", bc2.f62150b);
        String string = jSONObject.toString();
        Intrinsics.f(string, "JSONObject().apply {\n   …\", minDelay)\n}.toString()");
        editorEdit.putString("scheduled_job_timestamp_key", string).apply();
        return Unit.f71706a;
    }
}
