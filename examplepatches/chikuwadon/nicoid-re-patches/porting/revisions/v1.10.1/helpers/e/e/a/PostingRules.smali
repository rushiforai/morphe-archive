.class final Le/e/a/PostingRules;
.super Ljava/lang/Object;
.source "PostingRules.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static thread(Lorg/json/JSONObject;Lorg/json/JSONArray;)Lorg/json/JSONObject;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 15
    const-string v0, "threads"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 16
    const/4 v0, 0x0

    if-eqz p0, :cond_2c

    const/4 v1, 0x0

    :goto_a
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v1, v2, :cond_11

    goto :goto_2c

    :cond_11
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_29

    const-string v3, "isDefaultPostTarget"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_29

    const-string v3, "isActive"

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_29

    return-object v2

    :cond_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 17
    :cond_2c
    :goto_2c
    nop

    :goto_2d
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p0

    if-ge v0, p0, :cond_49

    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "fork"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "main"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_46

    return-object p0

    :cond_46
    add-int/lit8 v0, v0, 0x1

    goto :goto_2d

    .line 18
    :cond_49
    new-instance p0, Lorg/json/JSONException;

    const-string p1, "No posting thread"

    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static valid(Ljava/lang/String;)Z
    .registers 2

    .line 22
    if-eqz p0, :cond_c

    const-string v0, "(?:sm|nm|so|ss)[0-9]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method static videoId(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 8
    if-eqz p0, :cond_b

    const-string v0, "(?:sm|nm|so|ss)?[0-9]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    return-object p0

    .line 9
    :cond_b
    if-eqz p1, :cond_16

    const-string p0, "(?:sm|nm|so|ss)[0-9]+"

    invoke-virtual {p1, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_16

    return-object p1

    .line 10
    :cond_16
    invoke-static {p2}, Le/e/a/PostingRules;->valid(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1d

    return-object p2

    .line 11
    :cond_1d
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Missing canonical watch ID"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
