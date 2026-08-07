.class public interface abstract Ll/lkc0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C::",
        "Ljava/lang/Comparable;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract asRanges()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/google/common/collect/Range<",
            "TC;>;>;"
        }
    .end annotation
.end method

.method public abstract complement()Ll/lkc0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/lkc0<",
            "TC;>;"
        }
    .end annotation
.end method

.method public abstract encloses(Lcom/google/common/collect/Range;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Range<",
            "TC;>;)Z"
        }
    .end annotation
.end method

.method public abstract isEmpty()Z
.end method

.method public abstract removeAll(Ll/lkc0;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/lkc0<",
            "TC;>;)V"
        }
    .end annotation
.end method

.method public abstract subRangeSet(Lcom/google/common/collect/Range;)Ll/lkc0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Range<",
            "TC;>;)",
            "Ll/lkc0<",
            "TC;>;"
        }
    .end annotation
.end method
