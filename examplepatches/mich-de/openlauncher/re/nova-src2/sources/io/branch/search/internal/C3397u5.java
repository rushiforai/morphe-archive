package io.branch.search.internal;

import io.branch.search.internal.C3363s5;
import java.io.IOException;
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
import org.json.JSONObject;

@DebugMetadata(c = "io.branch.search.internal.analytics.DefaultCrashLoopHandler$saveLoopDetectionConfigValues$1", f = "CrashLoopHandler.kt", l = {179}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.u5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3397u5 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public c80.a f66002a;

    /* renamed from: b, reason: collision with root package name */
    public C3363s5 f66003b;

    /* renamed from: c, reason: collision with root package name */
    public C3282n8 f66004c;

    /* renamed from: d, reason: collision with root package name */
    public String f66005d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f66006e;

    /* renamed from: f, reason: collision with root package name */
    public int f66007f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ C3363s5 f66008g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ C3282n8 f66009h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ boolean f66010i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ String f66011j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3397u5(C3363s5 c3363s5, C3282n8 c3282n8, boolean z11, String str, Continuation<? super C3397u5> continuation) {
        super(2, continuation);
        this.f66008g = c3363s5;
        this.f66009h = c3282n8;
        this.f66010i = z11;
        this.f66011j = str;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3397u5(this.f66008g, this.f66009h, this.f66010i, this.f66011j, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((C3397u5) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        C3363s5 c3363s5;
        C3282n8 c3282n8;
        boolean z11;
        String str;
        c80.a aVar;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f66007f;
        if (i5 == 0) {
            ResultKt.b(obj);
            c3363s5 = this.f66008g;
            c80.a aVar2 = c3363s5.f65728d;
            C3282n8 c3282n82 = this.f66009h;
            boolean z12 = this.f66010i;
            String str2 = this.f66011j;
            this.f66002a = aVar2;
            this.f66003b = c3363s5;
            this.f66004c = c3282n82;
            this.f66005d = str2;
            this.f66006e = z12;
            this.f66007f = 1;
            c80.d dVar = (c80.d) aVar2;
            if (dVar.e(this) == coroutineSingletons) {
                return coroutineSingletons;
            }
            c3282n8 = c3282n82;
            z11 = z12;
            str = str2;
            aVar = dVar;
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z11 = this.f66006e;
            str = this.f66005d;
            c3282n8 = this.f66004c;
            c3363s5 = this.f66003b;
            aVar = this.f66002a;
            ResultKt.b(obj);
        }
        try {
            C3363s5.b bVar = new C3363s5.b(c3363s5.f65730f.getAndSet(c3282n8.K), c3363s5.f65731g.getAndSet(c3282n8.M), c3363s5.f65732h.getAndSet(c3282n8.L));
            C3363s5.b.Companion.getClass();
            boolean z13 = c3282n8.K;
            int i11 = c3282n8.M;
            long j11 = c3282n8.L;
            if (!new C3363s5.b(z13, i11, j11).equals(bVar) || z11) {
                try {
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put("handler_enabled", z13);
                    jSONObject.put("detection_cap", i11);
                    jSONObject.put("hindsight", j11);
                    C3141f2 c3141f2 = c3363s5.f65727c;
                    String string = jSONObject.toString();
                    Intrinsics.f(string, "payload.toString()");
                    c3141f2.a("loop_config.json", string);
                } catch (IOException e3) {
                    C3296o5.a(str, e3, "DefaultCrashLoopHandler.saveLoopConfigValues");
                }
            }
            return Unit.f71706a;
        } finally {
            ((c80.d) aVar).g(null);
        }
    }
}
