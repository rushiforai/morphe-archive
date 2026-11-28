.class public final Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloser;
.super Ljava/lang/Object;
.source "ClosingFuture.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/ClosingFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ValueAndCloser"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final state:Lcom/google/common/util/concurrent/ClosingFuture$State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ClosingFuture$State<",
            "+TV;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/google/common/util/concurrent/ClosingFuture$State;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "state"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/ClosingFuture$State<",
            "+TV;>;)V"
        }
    .end annotation

    .line 328
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 329
    iput-object p1, p0, Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloser;->state:Lcom/google/common/util/concurrent/ClosingFuture$State;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/util/concurrent/ClosingFuture$State;Lcom/google/common/util/concurrent/ClosingFuture$1;)V
    .registers 3

    .line 324
    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloser;-><init>(Lcom/google/common/util/concurrent/ClosingFuture$State;)V

    return-void
.end method


# virtual methods
.method public closeAsync()V
    .registers 1

    .line 358
    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloser;->state:Lcom/google/common/util/concurrent/ClosingFuture$State;

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ClosingFuture$State;->close()V

    return-void
.end method

.method public get()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .line 344
    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloser;->state:Lcom/google/common/util/concurrent/ClosingFuture$State;

    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->future:Lcom/google/common/util/concurrent/FluentFuture;

    invoke-static {p0}, Lcom/google/common/util/concurrent/Futures;->getDone(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
