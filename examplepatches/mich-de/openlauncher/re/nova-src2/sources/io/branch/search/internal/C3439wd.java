package io.branch.search.internal;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.multiprocess.ServiceConnector$getService$2", f = "Interfaces.kt", l = {TTAdConstant.DEEPLINK_FALLBACK_TYPE_CODE, 283}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.wd, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3439wd extends SuspendLambda implements Function2<t70.j0, Continuation<? super InterfaceC3315p7>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public c80.a f66241a;

    /* renamed from: b, reason: collision with root package name */
    public C3456xd f66242b;

    /* renamed from: c, reason: collision with root package name */
    public int f66243c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ C3456xd f66244d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3439wd(C3456xd c3456xd, Continuation<? super C3439wd> continuation) {
        super(2, continuation);
        this.f66244d = c3456xd;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3439wd(this.f66244d, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C3439wd(this.f66244d, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x0061, code lost:
    
        if (r6 == r0) goto L27;
     */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(@NotNull Object obj) {
        C3456xd c3456xd;
        Object obj2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f66243c;
        try {
            try {
                if (i5 == 0) {
                    ResultKt.b(obj);
                    c3456xd = this.f66244d;
                    c80.a aVar = c3456xd.f66294b;
                    this.f66241a = aVar;
                    this.f66242b = c3456xd;
                    this.f66243c = 1;
                    c80.d dVar = (c80.d) aVar;
                    Object objE = dVar.e(this);
                    obj2 = dVar;
                    if (objE != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                }
                if (i5 != 1) {
                    if (i5 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return (InterfaceC3315p7) obj;
                }
                c3456xd = this.f66242b;
                Object obj3 = this.f66241a;
                ResultKt.b(obj);
                obj2 = obj3;
                if (c3456xd.f66297e) {
                    ((c80.d) obj2).g(null);
                    return null;
                }
                if (!c3456xd.f66296d) {
                    C3456xd.a(c3456xd);
                }
                Unit unit = Unit.f71706a;
                ((c80.d) obj2).g(null);
                t70.r rVar = this.f66244d.f66295c;
                this.f66241a = null;
                this.f66242b = null;
                this.f66243c = 2;
                obj = rVar.l(this);
            } catch (Throwable th2) {
                ((c80.d) obj2).g(null);
                throw th2;
            }
        } catch (Exception unused) {
            return null;
        }
    }
}
