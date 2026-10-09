.class final Le/e/a/FollowFeedData;
.super Ljava/lang/Object;
.source "FollowFeedData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/FollowFeedData$Actor;,
        Le/e/a/FollowFeedData$Item;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static actors(Lorg/json/JSONObject;)Ljava/util/ArrayList;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/ArrayList<",
            "Le/e/a/FollowFeedData$Actor;",
            ">;"
        }
    .end annotation

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "actors"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    if-nez p0, :cond_e

    return-object v0

    .line 53
    :cond_e
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 54
    const/4 v2, 0x0

    :goto_14
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt v2, v3, :cond_1b

    .line 58
    return-object v0

    .line 55
    :cond_1b
    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    if-nez v3, :cond_22

    goto :goto_3c

    .line 56
    :cond_22
    new-instance v4, Le/e/a/FollowFeedData$Actor;

    invoke-direct {v4, v3}, Le/e/a/FollowFeedData$Actor;-><init>(Lorg/json/JSONObject;)V

    iget-object v3, v4, Le/e/a/FollowFeedData$Actor;->id:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3c

    invoke-virtual {v4}, Le/e/a/FollowFeedData$Actor;->key()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3c

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    :cond_3c
    :goto_3c
    add-int/lit8 v2, v2, 0x1

    goto :goto_14
.end method

.method static bucket(JJ)I
    .registers 9

    .line 71
    const-wide/16 v0, 0x0

    const/4 v2, 0x5

    cmp-long v3, p0, v0

    if-gtz v3, :cond_8

    return v2

    .line 72
    :cond_8
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 73
    const/16 p2, 0xb

    const/4 p3, 0x0

    invoke-virtual {v0, p2, p3}, Ljava/util/Calendar;->set(II)V

    const/16 p2, 0xc

    invoke-virtual {v0, p2, p3}, Ljava/util/Calendar;->set(II)V

    const/16 p2, 0xd

    invoke-virtual {v0, p2, p3}, Ljava/util/Calendar;->set(II)V

    const/16 p2, 0xe

    invoke-virtual {v0, p2, p3}, Ljava/util/Calendar;->set(II)V

    .line 74
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v3

    cmp-long p2, p0, v3

    if-ltz p2, :cond_2d

    return p3

    .line 75
    :cond_2d
    const/4 p2, -0x1

    invoke-virtual {v0, v2, p2}, Ljava/util/Calendar;->add(II)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p2

    cmp-long v1, p0, p2

    if-ltz v1, :cond_3b

    const/4 p0, 0x1

    return p0

    .line 76
    :cond_3b
    const/4 p2, -0x6

    invoke-virtual {v0, v2, p2}, Ljava/util/Calendar;->add(II)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p2

    cmp-long v1, p0, p2

    if-ltz v1, :cond_49

    const/4 p0, 0x2

    return p0

    .line 77
    :cond_49
    const/16 p2, -0x18

    invoke-virtual {v0, v2, p2}, Ljava/util/Calendar;->add(II)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p2

    cmp-long v0, p0, p2

    if-ltz v0, :cond_58

    const/4 p0, 0x3

    goto :goto_59

    :cond_58
    const/4 p0, 0x4

    :goto_59
    return p0
.end method

.method static date(Le/e/a/FollowFeedData$Item;)Ljava/lang/String;
    .registers 6

    .line 79
    iget-wide v0, p0, Le/e/a/FollowFeedData$Item;->time:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_b

    iget-object p0, p0, Le/e/a/FollowFeedData$Item;->date:Ljava/lang/String;

    goto :goto_1f

    :cond_b
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy/M/d"

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v1, Ljava/util/Date;

    iget-wide v2, p0, Le/e/a/FollowFeedData$Item;->time:J

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    :goto_1f
    return-object p0
.end method

.method static duration(I)Ljava/lang/String;
    .registers 8

    .line 81
    const/16 v0, 0xe10

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-lt p0, v0, :cond_2d

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    div-int/lit16 v4, p0, 0xe10

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    div-int/lit8 v5, p0, 0x3c

    rem-int/lit8 v5, v5, 0x3c

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    rem-int/lit8 p0, p0, 0x3c

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v4, v6, v2

    aput-object v5, v6, v1

    aput-object p0, v6, v3

    const-string p0, "%d:%02d:%02d"

    invoke-static {v0, p0, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_47

    :cond_2d
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    div-int/lit8 v4, p0, 0x3c

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    rem-int/lit8 p0, p0, 0x3c

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v4, v3, v2

    aput-object p0, v3, v1

    const-string p0, "%d:%02d"

    invoke-static {v0, p0, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    :goto_47
    return-object p0
.end method

.method static parse(Lorg/json/JSONObject;)Ljava/util/ArrayList;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/ArrayList<",
            "Le/e/a/FollowFeedData$Item;",
            ">;"
        }
    .end annotation

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "activities"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    if-nez p0, :cond_e

    return-object v0

    .line 41
    :cond_e
    const/4 v1, 0x0

    :goto_f
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v1, v2, :cond_16

    .line 49
    return-object v0

    .line 42
    :cond_16
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    if-nez v2, :cond_1d

    goto :goto_62

    .line 43
    :cond_1d
    const-string v3, "content"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    if-nez v3, :cond_26

    goto :goto_62

    .line 44
    :cond_26
    const-string v4, "type"

    invoke-static {v3, v4}, Le/e/a/FollowFeedData;->string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    .line 45
    const-string v5, "video"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4b

    const-string v5, "short"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4b

    const-string v5, "shortvideo"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4b

    goto :goto_62

    .line 46
    :cond_4b
    const-string v4, "id"

    invoke-static {v3, v4}, Le/e/a/FollowFeedData;->string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "(?:sm|nm|so|ss)?[0-9]+"

    invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5a

    goto :goto_62

    .line 47
    :cond_5a
    new-instance v4, Le/e/a/FollowFeedData$Item;

    invoke-direct {v4, v2, v3}, Le/e/a/FollowFeedData$Item;-><init>(Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    :goto_62
    add-int/lit8 v1, v1, 0x1

    goto :goto_f
.end method

.method static string(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 37
    const-string v0, ""

    if-eqz p0, :cond_f

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_b

    goto :goto_f

    :cond_b
    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_f
    :goto_f
    return-object v0
.end method

.method static timestamp(Ljava/lang/String;)J
    .registers 9

    .line 61
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_9

    return-wide v1

    .line 62
    :cond_9
    const-string v0, "Z$"

    const-string v3, "+0000"

    invoke-virtual {p0, v0, v3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "([+-]\\d\\d):(\\d\\d)$"

    const-string v3, "$1$2"

    invoke-virtual {p0, v0, v3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 63
    const-string v0, "yyyy-MM-dd\'T\'HH:mm:ss.SSSZ"

    const-string v3, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    filled-new-array {v0, v3}, [Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_23
    const/4 v5, 0x2

    if-lt v4, v5, :cond_27

    .line 67
    return-wide v1

    .line 63
    :cond_27
    aget-object v5, v0, v4

    .line 64
    :try_start_29
    new-instance v6, Ljava/text/SimpleDateFormat;

    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-direct {v6, v5, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    invoke-virtual {v6, v3}, Ljava/text/SimpleDateFormat;->setLenient(Z)V

    .line 65
    invoke-virtual {v6, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v0
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_3b} :catch_3c

    return-wide v0

    .line 66
    :catch_3c
    move-exception v5

    .line 63
    add-int/lit8 v4, v4, 0x1

    goto :goto_23
.end method
