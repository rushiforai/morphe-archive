package io.branch.search.internal;

import java.io.IOException;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;

@DebugMetadata(c = "io.branch.search.internal.data.remote.source.AutoSuggestDataSource$getAutoSuggestions$2", f = "AutoSuggestDataSource.kt", l = {42}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class Y0 extends SuspendLambda implements Function2<t70.j0, Continuation<? super List<? extends String>>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f63699a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Z0 f63700b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f63701c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ C3123e1 f63702d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ String f63703e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Y0(Z0 z02, String str, C3123e1 c3123e1, String str2, Continuation<? super Y0> continuation) {
        super(2, continuation);
        this.f63700b = z02;
        this.f63701c = str;
        this.f63702d = c3123e1;
        this.f63703e = str2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new Y0(this.f63700b, this.f63701c, this.f63702d, this.f63703e, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((Y0) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) throws JSONException, IOException {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f63699a;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        ResultKt.b(obj);
        Z0 z02 = this.f63700b;
        String str = this.f63701c;
        C3123e1 c3123e1 = this.f63702d;
        String str2 = this.f63703e;
        this.f63699a = 1;
        Object objA = Z0.a(z02, str, c3123e1, str2, this);
        return objA == coroutineSingletons ? coroutineSingletons : objA;
    }
}
