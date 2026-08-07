.class public interface abstract Lcom/momo/rtcbase/Predicate;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public and(Lcom/momo/rtcbase/Predicate;)Lcom/momo/rtcbase/Predicate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/momo/rtcbase/Predicate<",
            "-TT;>;)",
            "Lcom/momo/rtcbase/Predicate<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/momo/rtcbase/Predicate$2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/momo/rtcbase/Predicate$2;-><init>(Lcom/momo/rtcbase/Predicate;Lcom/momo/rtcbase/Predicate;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public negate()Lcom/momo/rtcbase/Predicate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/momo/rtcbase/Predicate<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/momo/rtcbase/Predicate$3;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/momo/rtcbase/Predicate$3;-><init>(Lcom/momo/rtcbase/Predicate;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public or(Lcom/momo/rtcbase/Predicate;)Lcom/momo/rtcbase/Predicate;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/momo/rtcbase/Predicate<",
            "-TT;>;)",
            "Lcom/momo/rtcbase/Predicate<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/momo/rtcbase/Predicate$1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/momo/rtcbase/Predicate$1;-><init>(Lcom/momo/rtcbase/Predicate;Lcom/momo/rtcbase/Predicate;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public abstract test(Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation
.end method
