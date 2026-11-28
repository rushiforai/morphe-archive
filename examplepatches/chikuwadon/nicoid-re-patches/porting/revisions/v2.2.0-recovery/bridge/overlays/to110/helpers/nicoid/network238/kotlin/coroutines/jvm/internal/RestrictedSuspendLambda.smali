.class public abstract Lnicoid/network238/kotlin/coroutines/jvm/internal/RestrictedSuspendLambda;
.super Lnicoid/network238/kotlin/coroutines/jvm/internal/RestrictedContinuationImpl;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/internal/FunctionBase;


# instance fields
.field private final arity:I


# direct methods
.method public constructor <init>(ILnicoid/network238/kotlin/coroutines/Continuation;)V
    .registers 3

    .line 144
    invoke-direct {p0, p2}, Lnicoid/network238/kotlin/coroutines/jvm/internal/RestrictedContinuationImpl;-><init>(Lnicoid/network238/kotlin/coroutines/Continuation;)V

    .line 142
    iput p1, p0, Lnicoid/network238/kotlin/coroutines/jvm/internal/RestrictedSuspendLambda;->arity:I

    return-void
.end method


# virtual methods
.method public getArity()I
    .registers 2

    .line 142
    iget v0, p0, Lnicoid/network238/kotlin/coroutines/jvm/internal/RestrictedSuspendLambda;->arity:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 148
    invoke-virtual {p0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;->getCompletion()Lnicoid/network238/kotlin/coroutines/Continuation;

    move-result-object v0

    if-nez v0, :cond_0

    .line 149
    invoke-static {p0}, Lnicoid/network238/kotlin/jvm/internal/Reflection;->renderLambdaToString(Lnicoid/network238/kotlin/jvm/internal/FunctionBase;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0

    .line 151
    :cond_0
    invoke-super {p0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
