.class public final Le/e/a/PlaybackOrder110;
.super Ljava/lang/Object;
.source "PlaybackOrder110.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static next(IZ[Z)I
    .registers 6

    .line 5
    array-length v0, p2

    const/4 v1, -0x1

    if-nez v0, :cond_5

    return v1

    :cond_5
    const/4 v0, 0x0

    :goto_6
    array-length v2, p2

    if-lt v0, v2, :cond_a

    return v1

    :cond_a
    if-eqz p1, :cond_e

    const/4 v2, 0x1

    goto :goto_f

    :cond_e
    move v2, v1

    :goto_f
    add-int/2addr p0, v2

    array-length v2, p2

    add-int/2addr p0, v2

    array-length v2, p2

    rem-int/2addr p0, v2

    aget-boolean v2, p2, p0

    if-nez v2, :cond_19

    return p0

    :cond_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_6
.end method

.method public static order(Ljava/util/List;Ljava/lang/Object;ZLjava/util/Random;)Ljava/util/ArrayList;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;TT;Z",
            "Ljava/util/Random;",
            ")",
            "Ljava/util/ArrayList<",
            "TT;>;"
        }
    .end annotation

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    if-eqz p2, :cond_11

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-static {v0, p3}, Ljava/util/Collections;->shuffle(Ljava/util/List;Ljava/util/Random;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_11
    return-object v0
.end method
