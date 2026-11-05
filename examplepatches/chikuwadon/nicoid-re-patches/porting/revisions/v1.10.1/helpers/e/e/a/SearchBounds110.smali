.class public final Le/e/a/SearchBounds110;
.super Ljava/lang/Object;
.source "SearchBounds110.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parse(Ljava/lang/String;)J
    .registers 3

    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d

    const-wide/16 v0, -0x1

    return-wide v0

    :cond_d
    const-string v0, "[0-9]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_21

    :try_start_15
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_19
    .catch Ljava/lang/NumberFormatException; {:try_start_15 .. :try_end_19} :catch_1a

    return-wide v0

    :catch_1a
    move-exception p0

    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0

    :cond_21
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0
.end method

.method public static sort(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 5
    const-string v0, "hotMylist"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "registeredAt"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    const-string p0, "startTime"

    goto :goto_41

    :cond_13
    const-string v0, "duration"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    const-string p0, "lengthSeconds"

    goto :goto_41

    :cond_1e
    const-string v0, "viewCount"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    const-string p0, "viewCounter"

    goto :goto_41

    :cond_29
    const-string v0, "commentCount"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    const-string p0, "commentCounter"

    goto :goto_41

    :cond_34
    const-string v0, "mylistCount"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3f

    const-string p0, "mylistCounter"

    goto :goto_41

    :cond_3f
    const-string p0, "lastCommentTime"

    :goto_41
    return-object p0

    :cond_42
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Trending sort is unavailable"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static valid(JJ)Z
    .registers 7

    .line 4
    const-wide/16 v0, -0x1

    cmp-long v2, p0, v0

    if-ltz v2, :cond_1a

    cmp-long v0, p2, v0

    if-ltz v0, :cond_1a

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-ltz v2, :cond_18

    cmp-long v0, p2, v0

    if-ltz v0, :cond_18

    cmp-long p0, p0, p2

    if-gtz p0, :cond_1a

    :cond_18
    const/4 p0, 0x1

    return p0

    :cond_1a
    const/4 p0, 0x0

    return p0
.end method
