.class public final Le/e/a/PageRules;
.super Ljava/lang/Object;
.source "PageRules.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static more(Lorg/json/JSONObject;III)Z
    .registers 10

    .line 6
    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    .line 7
    :cond_4
    const-string v1, "hasNext"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_11

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result p0

    return p0

    .line 8
    :cond_11
    const-string v1, "total"

    const-wide/16 v2, -0x1

    invoke-virtual {p0, v1, v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v1

    const-string v3, "totalCount"

    invoke-virtual {p0, v3, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v1

    .line 9
    const-wide/16 v3, 0x0

    const/4 p0, 0x1

    cmp-long v5, v1, v3

    if-ltz v5, :cond_30

    int-to-long p1, p2

    int-to-long v3, p3

    mul-long p1, p1, v3

    cmp-long p3, p1, v1

    if-gez p3, :cond_2f

    return p0

    :cond_2f
    return v0

    .line 10
    :cond_30
    if-ne p1, p3, :cond_33

    return p0

    :cond_33
    return v0
.end method
