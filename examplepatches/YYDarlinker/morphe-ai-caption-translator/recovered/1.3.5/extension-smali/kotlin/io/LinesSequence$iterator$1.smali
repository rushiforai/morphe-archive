.class public final Lkotlin/io/LinesSequence$iterator$1;
.super Ljava/lang/Object;
.source "ReadWrite.kt"

# interfaces
.implements Ljava/util/Iterator;
.implements Lkotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkotlin/io/LinesSequence;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Ljava/lang/String;",
        ">;",
        "Lkotlin/jvm/internal/markers/KMappedMarker;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0019\n\u0000\n\u0002\u0010(\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001J\n\u0010\u0006\u001a\u00020\u0005H\u0096\u0082\u0004J\n\u0010\u0007\u001a\u00020\u0002H\u0096\u0082\u0004R\u0011\u0010\u0003\u001a\u0004\u0018\u00010\u0002X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0004\u001a\u00020\u0005X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0008"
    }
    d2 = {
        "kotlin/io/LinesSequence$iterator$1",
        "",
        "",
        "nextValue",
        "done",
        "",
        "hasNext",
        "next",
        "kotlin-stdlib"
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
.field private done:Z

.field private nextValue:Ljava/lang/String;

.field final synthetic this$0:Lkotlin/io/LinesSequence;


# direct methods
.method constructor <init>(Lkotlin/io/LinesSequence;)V
    .registers 2

    iput-object p1, p0, Lkotlin/io/LinesSequence$iterator$1;->this$0:Lkotlin/io/LinesSequence;

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 3

    .line 93
    iget-object v0, p0, Lkotlin/io/LinesSequence$iterator$1;->nextValue:Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_19

    iget-boolean v0, p0, Lkotlin/io/LinesSequence$iterator$1;->done:Z

    if-nez v0, :cond_19

    .line 94
    iget-object v0, p0, Lkotlin/io/LinesSequence$iterator$1;->this$0:Lkotlin/io/LinesSequence;

    # getter for: Lkotlin/io/LinesSequence;->reader:Ljava/io/BufferedReader;
    invoke-static {v0}, Lkotlin/io/LinesSequence;->access$getReader$p(Lkotlin/io/LinesSequence;)Ljava/io/BufferedReader;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lkotlin/io/LinesSequence$iterator$1;->nextValue:Ljava/lang/String;

    if-nez v0, :cond_19

    .line 95
    iput-boolean v1, p0, Lkotlin/io/LinesSequence$iterator$1;->done:Z

    .line 97
    :cond_19
    iget-object p0, p0, Lkotlin/io/LinesSequence$iterator$1;->nextValue:Ljava/lang/String;

    if-eqz p0, :cond_1e

    return v1

    :cond_1e
    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 1

    .line 88
    invoke-virtual {p0}, Lkotlin/io/LinesSequence$iterator$1;->next()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public next()Ljava/lang/String;
    .registers 3

    .line 101
    invoke-virtual {p0}, Lkotlin/io/LinesSequence$iterator$1;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 104
    iget-object v0, p0, Lkotlin/io/LinesSequence$iterator$1;->nextValue:Ljava/lang/String;

    const/4 v1, 0x0

    .line 105
    iput-object v1, p0, Lkotlin/io/LinesSequence$iterator$1;->nextValue:Ljava/lang/String;

    .line 106
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    return-object v0

    .line 102
    :cond_f
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public remove()V
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Operation is not supported for read-only collection"

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
