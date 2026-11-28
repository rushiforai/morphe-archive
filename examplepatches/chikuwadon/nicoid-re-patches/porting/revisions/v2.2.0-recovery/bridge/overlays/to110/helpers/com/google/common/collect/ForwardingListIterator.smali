.class public abstract Lcom/google/common/collect/ForwardingListIterator;
.super Lcom/google/common/collect/ForwardingIterator;
.source "ForwardingListIterator.java"

# interfaces
.implements Ljava/util/ListIterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ForwardingIterator<",
        "TE;>;",
        "Ljava/util/ListIterator<",
        "TE;>;"
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .registers 1

    .line 44
    invoke-direct {p0}, Lcom/google/common/collect/ForwardingIterator;-><init>()V

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "element"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .line 51
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingListIterator;->delegate()Ljava/util/ListIterator;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/ListIterator;->add(Ljava/lang/Object;)V

    return-void
.end method

.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 1

    .line 39
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingListIterator;->delegate()Ljava/util/ListIterator;

    move-result-object p0

    return-object p0
.end method

.method protected bridge synthetic delegate()Ljava/util/Iterator;
    .registers 1

    .line 39
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingListIterator;->delegate()Ljava/util/ListIterator;

    move-result-object p0

    return-object p0
.end method

.method protected abstract delegate()Ljava/util/ListIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ListIterator<",
            "TE;>;"
        }
    .end annotation
.end method

.method public hasPrevious()Z
    .registers 1

    .line 56
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingListIterator;->delegate()Ljava/util/ListIterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result p0

    return p0
.end method

.method public nextIndex()I
    .registers 1

    .line 61
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingListIterator;->delegate()Ljava/util/ListIterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/ListIterator;->nextIndex()I

    move-result p0

    return p0
.end method

.method public previous()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 68
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingListIterator;->delegate()Ljava/util/ListIterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public previousIndex()I
    .registers 1

    .line 73
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingListIterator;->delegate()Ljava/util/ListIterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/ListIterator;->previousIndex()I

    move-result p0

    return p0
.end method

.method public set(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "element"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .line 78
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingListIterator;->delegate()Ljava/util/ListIterator;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/ListIterator;->set(Ljava/lang/Object;)V

    return-void
.end method
