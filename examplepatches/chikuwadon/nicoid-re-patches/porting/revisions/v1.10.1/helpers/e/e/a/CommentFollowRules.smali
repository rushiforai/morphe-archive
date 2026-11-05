.class public final Le/e/a/CommentFollowRules;
.super Ljava/lang/Object;
.source "CommentFollowRules.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static nearest([JJ)I
    .registers 14
    .param p0, "positions"    # [J
    .param p1, "playbackMs"    # J

    .line 5
    if-nez p0, :cond_4

    const/4 v0, -0x1

    return v0

    :cond_4
    const-wide/16 v0, -0x1

    .local v0, "best":J
    const/4 v2, -0x1

    .line 6
    .local v2, "index":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_8
    array-length v4, p0

    if-ge v3, v4, :cond_2d

    aget-wide v4, p0, v3

    .local v4, "time":J
    const-wide/16 v6, 0x0

    cmp-long v8, v4, v6

    if-ltz v8, :cond_2a

    const-wide v8, 0x7fffffffffffffffL

    cmp-long v10, v4, v8

    if-eqz v10, :cond_2a

    invoke-static {v6, v7, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    cmp-long v8, v4, v6

    if-gtz v8, :cond_2a

    cmp-long v6, v4, v0

    if-ltz v6, :cond_2a

    move-wide v0, v4

    move v2, v3

    .end local v4    # "time":J
    :cond_2a
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 7
    .end local v3    # "i":I
    :cond_2d
    return v2
.end method
