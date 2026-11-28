.class public final Le/e/a/CacheRowInfo;
.super Ljava/lang/Object;
.source "CacheRowInfo.java"


# instance fields
.field public final counts:Ljava/lang/String;

.field public final owner:Ljava/lang/String;

.field public final posted:Ljava/lang/String;

.field public final statistics:[J

.field public final transfer:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[J)V
    .registers 6

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CacheRowInfo;->counts:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/CacheRowInfo;->owner:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/CacheRowInfo;->posted:Ljava/lang/String;

    iput-object p4, p0, Le/e/a/CacheRowInfo;->transfer:Ljava/lang/String;

    iput-object p5, p0, Le/e/a/CacheRowInfo;->statistics:[J

    return-void
.end method

.method public static from(Lorg/json/JSONObject;JZ)Le/e/a/CacheRowInfo;
    .registers 16

    .line 9
    new-instance v0, Le/e/a/CacheRowInfo$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Le/e/a/CacheRowInfo$$ExternalSyntheticLambda0;-><init>(Lorg/json/JSONObject;)V

    invoke-static {v0}, Le/e/a/VideoInfoCounts;->read(Le/e/a/VideoInfoCounts$Values;)[J

    move-result-object v6

    const-string v0, "\u3044\u3044\u306d"

    const-string v1, "\u30de\u30a4\u30ea\u30b9\u30c8"

    const-string v2, "\u518d\u751f\u6570"

    const-string v3, "\u30b3\u30e1\u30f3\u30c8"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    const/4 v2, 0x0

    move-object v3, v1

    const/4 v4, 0x0

    :goto_0
    const/4 v5, 0x4

    if-lt v4, v5, :cond_5

    .line 10
    const-string v0, "userNickname"

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "uploaderName"

    invoke-virtual {p0, v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "ownerName"

    invoke-virtual {p0, v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 11
    const-string v4, "details_owner"

    const-string v7, "details_channel"

    const-string v8, "owner"

    const-string v9, "channel"

    filled-new-array {v8, v9, v4, v7}, [Ljava/lang/String;

    move-result-object v7

    const/4 v4, 0x0

    :goto_1
    if-lt v4, v5, :cond_0

    :goto_2
    goto :goto_3

    :cond_0
    aget-object v8, v7, v4

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_2

    goto :goto_2

    .line 12
    :goto_3
    const-string v4, "first_retrieve"

    invoke-virtual {p0, v4, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "postedAt"

    invoke-virtual {p0, v4, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string/jumbo v1, "\u6295\u7a3f"

    invoke-static {p0, v1}, Le/e/a/VideoRows191;->date(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 13
    new-instance p0, Le/e/a/CacheRowInfo;

    new-instance v1, Ljava/lang/StringBuilder;

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    long-to-float p1, p1

    const/high16 p2, 0x49800000    # 1048576.0f

    div-float/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    aput-object p1, p2, v2

    const-string p1, "%.1f MB"

    invoke-static {v5, p1, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p3, :cond_1

    const-string p1, " (100%)"

    goto :goto_4

    :cond_1
    const-string p1, " \u00b7 \u672a\u5b8c\u4e86"

    :goto_4
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object v1, p0

    move-object v2, v3

    move-object v3, v0

    invoke-direct/range {v1 .. v6}, Le/e/a/CacheRowInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[J)V

    return-object p0

    .line 11
    :cond_2
    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    if-nez v9, :cond_3

    :try_start_0
    new-instance v10, Lorg/json/JSONObject;

    const-string v11, "{}"

    invoke-virtual {p0, v8, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v10, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v9, v10

    goto :goto_5

    :catch_0
    move-exception v8

    :cond_3
    :goto_5
    if-eqz v9, :cond_4

    const-string v0, "name"

    invoke-virtual {v9, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v8, "nickname"

    invoke-virtual {v9, v8, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 9
    :cond_5
    aget-wide v7, v6, v4

    const-wide/16 v9, 0x0

    cmp-long v5, v7, v9

    if-ltz v5, :cond_7

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_6

    move-object v3, v1

    goto :goto_6

    :cond_6
    const-string v3, " "

    :goto_6
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v5, v0, v4

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ":"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-wide v7, v6, v4

    invoke-virtual {v3, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0
.end method

.method static synthetic lambda$0(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    invoke-static {p0, p1}, Le/e/a/HistoryVideoCounts;->cacheCount(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
