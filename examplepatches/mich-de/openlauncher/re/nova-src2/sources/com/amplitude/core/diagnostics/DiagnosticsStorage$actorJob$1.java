package com.amplitude.core.diagnostics;

import com.amplitude.core.diagnostics.DiagnosticsStorage;
import java.io.File;
import java.util.concurrent.CancellationException;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.k0;
import v70.m;
import v70.p;
import v70.r;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
@DebugMetadata(c = "com.amplitude.core.diagnostics.DiagnosticsStorage$actorJob$1", f = "DiagnosticsStorage.kt", l = {65}, m = "invokeSuspend")
/* loaded from: classes2.dex */
public final class DiagnosticsStorage$actorJob$1 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
    private /* synthetic */ Object L$0;
    int label;
    final /* synthetic */ DiagnosticsStorage this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public DiagnosticsStorage$actorJob$1(DiagnosticsStorage diagnosticsStorage, Continuation<? super DiagnosticsStorage$actorJob$1> continuation) {
        super(2, continuation);
        this.this$0 = diagnosticsStorage;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        DiagnosticsStorage$actorJob$1 diagnosticsStorage$actorJob$1 = new DiagnosticsStorage$actorJob$1(this.this$0, continuation);
        diagnosticsStorage$actorJob$1.L$0 = obj;
        return diagnosticsStorage$actorJob$1;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x002b  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0040  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:12:0x0039 -> B:14:0x003c). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(@NotNull Object obj) {
        j0 j0Var;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.label;
        if (i5 == 0) {
            ResultKt.b(obj);
            j0Var = (j0) this.L$0;
            if (k0.f(j0Var)) {
            }
            return Unit.f71706a;
        }
        if (i5 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        j0Var = (j0) this.L$0;
        ResultKt.b(obj);
        Object objM = ((r) obj).f92194a;
        if (!(objM instanceof p)) {
            DiagnosticsStorage.Operation operation = (DiagnosticsStorage.Operation) r.a(objM);
            if (operation != null) {
                DiagnosticsStorage diagnosticsStorage = this.this$0;
                try {
                } catch (CancellationException e3) {
                    throw e3;
                } catch (Exception e11) {
                    diagnosticsStorage.logger.error("DiagnosticsStorage: Error processing operation: " + e11.getMessage());
                }
                if (operation instanceof DiagnosticsStorage.Operation.SaveSnapshot) {
                    File fileActiveStorageDirectory = diagnosticsStorage.activeStorageDirectory();
                    diagnosticsStorage.ensureDirectoryExists(fileActiveStorageDirectory);
                    diagnosticsStorage.persistSnapshot(((DiagnosticsStorage.Operation.SaveSnapshot) operation).getSnapshot(), fileActiveStorageDirectory);
                } else if (operation instanceof DiagnosticsStorage.Operation.DeleteActiveFiles) {
                    diagnosticsStorage.removeActiveFiles();
                }
            }
            if (k0.f(j0Var)) {
                m mVar = this.this$0.channel;
                this.L$0 = j0Var;
                this.label = 1;
                objM = mVar.m(this);
                if (objM == coroutineSingletons) {
                    return coroutineSingletons;
                }
                if (!(objM instanceof p)) {
                }
            }
        }
        return Unit.f71706a;
    }

    @Override // kotlin.jvm.functions.Function2
    @Nullable
    public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
        return ((DiagnosticsStorage$actorJob$1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }
}
