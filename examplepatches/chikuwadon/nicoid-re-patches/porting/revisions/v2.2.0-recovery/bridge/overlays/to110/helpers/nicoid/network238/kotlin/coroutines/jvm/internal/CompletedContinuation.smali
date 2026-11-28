.class public final Lnicoid/network238/kotlin/coroutines/jvm/internal/CompletedContinuation;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/coroutines/Continuation;


# static fields
.field public static final INSTANCE:Lnicoid/network238/kotlin/coroutines/jvm/internal/CompletedContinuation;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/kotlin/coroutines/jvm/internal/CompletedContinuation;

    invoke-direct {v0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/CompletedContinuation;-><init>()V

    sput-object v0, Lnicoid/network238/kotlin/coroutines/jvm/internal/CompletedContinuation;->INSTANCE:Lnicoid/network238/kotlin/coroutines/jvm/internal/CompletedContinuation;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContext()Lnicoid/network238/kotlin/coroutines/CoroutineContext;
    .registers 3

    new-instance v0, Ljava/lang/IllegalStateException;

    .line 126
    const-string v1, "This continuation is already complete"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 3

    new-instance p1, Ljava/lang/IllegalStateException;

    .line 129
    const-string v0, "This continuation is already complete"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 132
    const-string v0, "This continuation is already complete"

    return-object v0
.end method
