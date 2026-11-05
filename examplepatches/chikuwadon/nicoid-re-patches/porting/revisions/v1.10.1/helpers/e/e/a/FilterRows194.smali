.class public final Le/e/a/FilterRows194;
.super Ljava/lang/Object;
.source "FilterRows194.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static compact(Ljava/lang/Object;Ljava/util/BitSet;)V
    .registers 9
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "removed"    # Ljava/util/BitSet;

    .line 7
    if-nez p1, :cond_3

    return-void

    :cond_3
    move-object v0, p0

    check-cast v0, Ljava/util/ArrayList;

    .local v0, "rows":Ljava/util/ArrayList;
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/util/BitSet;->nextSetBit(I)I

    move-result v1

    .local v1, "first":I
    if-gez v1, :cond_e

    return-void

    :cond_e
    move v2, v1

    .local v2, "write":I
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    .local v3, "size":I
    add-int/lit8 v4, v1, 0x1

    .local v4, "read":I
    :goto_15
    if-ge v4, v3, :cond_2a

    invoke-virtual {p1, v4}, Ljava/util/BitSet;->get(I)Z

    move-result v5

    if-nez v5, :cond_27

    add-int/lit8 v5, v2, 0x1

    .end local v2    # "write":I
    .local v5, "write":I
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v0, v2, v6}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move v2, v5

    .end local v5    # "write":I
    .restart local v2    # "write":I
    :cond_27
    add-int/lit8 v4, v4, 0x1

    goto :goto_15

    .end local v4    # "read":I
    :cond_2a
    invoke-virtual {v0, v2, v3}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->clear()V

    return-void
.end method
