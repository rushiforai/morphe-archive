.class public final Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;
.super Lkotlin/coroutines/jvm/internal/BaseContinuationImpl;
.source "TailCallAsyncStackTraceEntry.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0011\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\u0008\u0001\u0018\u00002\u00020\u0001BI\u0008F\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u000e\u0010\u0008\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\t\u0012\u000e\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\u000c\u00a2\u0006\u0004\u0008\r\u0010\u000eJ!\u0010\u0018\u001a\u0004\u0018\u00010\n2\u000e\u0010\u0019\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\u001aH\u0094\u0080\u0004\u00a2\u0006\u0002\u0010\u001bJ\n\u0010\u001c\u001a\u00020\u001dH\u0096\u0080\u0004R\u0015\u0010\u0002\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010R\u0015\u0010\u0004\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0010R\u0015\u0010\u0005\u001a\u00020\u0003X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0010R\u0015\u0010\u0006\u001a\u00020\u0007X\u0086\u0084\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0014R\u001f\u0010\u0008\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\tX\u0086\u0084\u0008\u00a2\u0006\n\n\u0002\u0010\u0017\u001a\u0004\u0008\u0015\u0010\u0016R\u0017\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\n0\u000cX\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u0015\u0010\u001e\u001a\u00020\u001f8VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008 \u0010!\u00ca\u0001\u0002\u0008#\u00a8\u0006\""
    }
    d2 = {
        "Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;",
        "Lkotlin/coroutines/jvm/internal/BaseContinuationImpl;",
        "declaringClass",
        "",
        "methodName",
        "fileName",
        "lineNumber",
        "",
        "spilledVariables",
        "",
        "",
        "continuation",
        "Lkotlin/coroutines/Continuation;",
        "<init>",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/Object;Lkotlin/coroutines/Continuation;)V",
        "getDeclaringClass",
        "()Ljava/lang/String;",
        "getMethodName",
        "getFileName",
        "getLineNumber",
        "()I",
        "getSpilledVariables",
        "()[Ljava/lang/Object;",
        "[Ljava/lang/Object;",
        "invokeSuspend",
        "result",
        "Lkotlin/Result;",
        "(Ljava/lang/Object;)Ljava/lang/Object;",
        "getStackTraceElement",
        "Ljava/lang/StackTraceElement;",
        "context",
        "Lkotlin/coroutines/CoroutineContext;",
        "getContext",
        "()Lkotlin/coroutines/CoroutineContext;",
        "kotlin-stdlib",
        "Lkotlin/PublishedApi;"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final continuation:Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final declaringClass:Ljava/lang/String;

.field private final fileName:Ljava/lang/String;

.field private final lineNumber:I

.field private final methodName:Ljava/lang/String;

.field private final spilledVariables:[Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/Object;Lkotlin/coroutines/Continuation;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I[",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const-string v0, "declaringClass"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "methodName"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "fileName"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "spilledVariables"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "continuation"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    invoke-direct {p0, p6}, Lkotlin/coroutines/jvm/internal/BaseContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 58
    iput-object p1, p0, Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;->declaringClass:Ljava/lang/String;

    .line 59
    iput-object p2, p0, Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;->methodName:Ljava/lang/String;

    .line 60
    iput-object p3, p0, Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;->fileName:Ljava/lang/String;

    .line 61
    iput p4, p0, Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;->lineNumber:I

    .line 69
    iput-object p5, p0, Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;->spilledVariables:[Ljava/lang/Object;

    .line 70
    iput-object p6, p0, Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;->continuation:Lkotlin/coroutines/Continuation;

    return-void
.end method


# virtual methods
.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 1

    .line 84
    iget-object p0, p0, Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;->continuation:Lkotlin/coroutines/Continuation;

    invoke-interface {p0}, Lkotlin/coroutines/Continuation;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object p0

    return-object p0
.end method

.method public final getDeclaringClass()Ljava/lang/String;
    .registers 1

    .line 58
    iget-object p0, p0, Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;->declaringClass:Ljava/lang/String;

    return-object p0
.end method

.method public final getFileName()Ljava/lang/String;
    .registers 1

    .line 60
    iget-object p0, p0, Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;->fileName:Ljava/lang/String;

    return-object p0
.end method

.method public final getLineNumber()I
    .registers 1

    .line 61
    iget p0, p0, Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;->lineNumber:I

    return p0
.end method

.method public final getMethodName()Ljava/lang/String;
    .registers 1

    .line 59
    iget-object p0, p0, Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;->methodName:Ljava/lang/String;

    return-object p0
.end method

.method public final getSpilledVariables()[Ljava/lang/Object;
    .registers 1

    .line 69
    iget-object p0, p0, Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;->spilledVariables:[Ljava/lang/Object;

    return-object p0
.end method

.method public getStackTraceElement()Ljava/lang/StackTraceElement;
    .registers 5

    .line 78
    sget-object v0, Lkotlin/coroutines/jvm/internal/ModuleNameRetriever;->INSTANCE:Lkotlin/coroutines/jvm/internal/ModuleNameRetriever;

    move-object v1, p0

    check-cast v1, Lkotlin/coroutines/Continuation;

    invoke-virtual {v0, v1}, Lkotlin/coroutines/jvm/internal/ModuleNameRetriever;->getModuleName(Lkotlin/coroutines/Continuation;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_e

    .line 79
    iget-object v0, p0, Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;->declaringClass:Ljava/lang/String;

    goto :goto_24

    :cond_e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v0, 0x2f

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;->declaringClass:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 80
    :goto_24
    new-instance v1, Ljava/lang/StackTraceElement;

    iget-object v2, p0, Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;->methodName:Ljava/lang/String;

    iget-object v3, p0, Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;->fileName:Ljava/lang/String;

    iget p0, p0, Lkotlin/coroutines/jvm/internal/TailCallBaseContinuationImpl;->lineNumber:I

    invoke-direct {v1, v0, v2, v3, p0}, Ljava/lang/StackTraceElement;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1
.end method

.method protected invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 74
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    return-object p1
.end method
