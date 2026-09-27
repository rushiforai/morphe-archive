.class public final Lkotlin/sequences/SequencesKt__SequencesKt$sequenceOf$1$1;
.super Ljava/lang/Object;
.source "Sequences.kt"

# interfaces
.implements Ljava/util/Iterator;
.implements Lkotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkotlin/sequences/SequencesKt__SequencesKt;->sequenceOf(Ljava/lang/Object;)Lkotlin/sequences/Sequence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "TT;>;",
        "Lkotlin/jvm/internal/markers/KMappedMarker;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0013\n\u0000\n\u0002\u0010(\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u0008\u0012\u0004\u0012\u00028\u00000\u0001J\u000f\u0010\u0004\u001a\u00028\u0000H\u0096\u0082\u0004\u00a2\u0006\u0002\u0010\u0005J\n\u0010\u0006\u001a\u00020\u0003H\u0096\u0082\u0004R\u000f\u0010\u0002\u001a\u00020\u0003X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0007"
    }
    d2 = {
        "kotlin/sequences/SequencesKt__SequencesKt$sequenceOf$1$1",
        "",
        "_hasNext",
        "",
        "next",
        "()Ljava/lang/Object;",
        "hasNext",
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
.field final synthetic $element:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private _hasNext:Z


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iput-object p1, p0, Lkotlin/sequences/SequencesKt__SequencesKt$sequenceOf$1$1;->$element:Ljava/lang/Object;

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    .line 50
    iput-boolean p1, p0, Lkotlin/sequences/SequencesKt__SequencesKt$sequenceOf$1$1;->_hasNext:Z

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 1

    .line 58
    iget-boolean p0, p0, Lkotlin/sequences/SequencesKt__SequencesKt$sequenceOf$1$1;->_hasNext:Z

    return p0
.end method

.method public next()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 53
    iget-boolean v0, p0, Lkotlin/sequences/SequencesKt__SequencesKt$sequenceOf$1$1;->_hasNext:Z

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    .line 54
    iput-boolean v0, p0, Lkotlin/sequences/SequencesKt__SequencesKt$sequenceOf$1$1;->_hasNext:Z

    .line 55
    iget-object p0, p0, Lkotlin/sequences/SequencesKt__SequencesKt$sequenceOf$1$1;->$element:Ljava/lang/Object;

    return-object p0

    .line 53
    :cond_a
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
