.class public final Le/e/a/VideoInfoCounts;
.super Ljava/lang/Object;
.source "VideoInfoCounts.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/VideoInfoCounts$Values;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static read(Le/e/a/VideoInfoCounts$Values;)[J
    .registers 10
    .param p0, "values"    # Le/e/a/VideoInfoCounts$Values;

    .line 8
    const-string v0, "likeCount"

    const-string v1, "mylistCount"

    const-string v2, "viewCount"

    const-string v3, "commentCount"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    .line 9
    .local v0, "keys":[Ljava/lang/String;
    array-length v1, v0

    new-array v1, v1, [J

    .line 10
    .local v1, "result":[J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_10
    array-length v3, v0

    if-ge v2, v3, :cond_39

    .line 11
    const-wide/16 v3, -0x1

    aput-wide v3, v1, v2

    .line 13
    :try_start_17
    aget-object v3, v0, v2

    invoke-interface {p0, v3}, Le/e/a/VideoInfoCounts$Values;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 14
    .local v3, "value":Ljava/lang/String;
    if-eqz v3, :cond_35

    .line 15
    const-string v4, ","

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 16
    .local v4, "parsed":J
    const-wide/16 v6, 0x0

    cmp-long v8, v4, v6

    if-ltz v8, :cond_35

    aput-wide v4, v1, v2
    :try_end_33
    .catch Ljava/lang/NumberFormatException; {:try_start_17 .. :try_end_33} :catch_34

    goto :goto_35

    .line 18
    .end local v3    # "value":Ljava/lang/String;
    .end local v4    # "parsed":J
    :catch_34
    move-exception v3

    :cond_35
    :goto_35
    nop

    .line 10
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 20
    .end local v2    # "i":I
    :cond_39
    return-object v1
.end method
