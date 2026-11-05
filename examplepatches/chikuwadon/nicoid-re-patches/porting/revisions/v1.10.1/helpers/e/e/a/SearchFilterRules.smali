.class final Le/e/a/SearchFilterRules;
.super Ljava/lang/Object;
.source "SearchFilterRules.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/SearchFilterRules$Bounds;,
        Le/e/a/SearchFilterRules$Query;
    }
.end annotation


# static fields
.field private static final DATES:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/text/SimpleDateFormat;",
            ">;"
        }
    .end annotation
.end field

.field private static final FILTERS:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Le/e/a/SearchFilterRules$Bounds;",
            ">;"
        }
    .end annotation
.end field

.field static final LENGTH:[Ljava/lang/String;

.field static final LENGTH_ORDER:[I

.field static final PERIOD:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 12

    .line 4
    const/16 v0, 0x8

    new-array v1, v0, [I

    const/4 v2, 0x1

    const/4 v3, 0x3

    aput v3, v1, v2

    const/4 v4, 0x2

    const/4 v5, 0x4

    aput v5, v1, v4

    aput v2, v1, v3

    const/4 v3, 0x5

    aput v3, v1, v5

    const/4 v5, 0x6

    aput v5, v1, v3

    aput v4, v1, v5

    const/4 v3, 0x7

    aput v3, v1, v3

    sput-object v1, Le/e/a/SearchFilterRules;->LENGTH_ORDER:[I

    .line 5
    const-string v10, "3\u5e74\u4ee5\u5185"

    const-string v11, "5\u5e74\u4ee5\u5185"

    const-string v4, "\u6307\u5b9a\u306a\u3057"

    const-string v5, "24\u6642\u9593\u4ee5\u5185"

    const-string v6, "1\u9031\u9593\u4ee5\u5185"

    const-string v7, "1\u30f6\u6708\u4ee5\u5185"

    const-string v8, "\u534a\u5e74\u4ee5\u5185"

    const-string v9, "1\u5e74\u4ee5\u5185"

    filled-new-array/range {v4 .. v11}, [Ljava/lang/String;

    move-result-object v1

    sput-object v1, Le/e/a/SearchFilterRules;->PERIOD:[Ljava/lang/String;

    .line 6
    const-string v9, "20\u5206\u4ee5\u5185"

    const-string v10, "60\u5206\u4ee5\u4e0a"

    const-string v3, "\u6307\u5b9a\u306a\u3057"

    const-string v4, "5\u5206\u4ee5\u5185"

    const-string v5, "20\u5206\u4ee5\u4e0a"

    const-string v6, "1\u5206\u4ee5\u5185"

    const-string v7, "3\u5206\u4ee5\u5185"

    const-string v8, "10\u5206\u4ee5\u5185"

    filled-new-array/range {v3 .. v10}, [Ljava/lang/String;

    move-result-object v1

    sput-object v1, Le/e/a/SearchFilterRules;->LENGTH:[Ljava/lang/String;

    .line 12
    new-instance v1, Le/e/a/SearchFilterRules$1;

    const/high16 v3, 0x3f400000    # 0.75f

    invoke-direct {v1, v0, v3, v2}, Le/e/a/SearchFilterRules$1;-><init>(IFZ)V

    sput-object v1, Le/e/a/SearchFilterRules;->FILTERS:Ljava/util/LinkedHashMap;

    .line 13
    new-instance v0, Le/e/a/SearchFilterRules$2;

    invoke-direct {v0}, Le/e/a/SearchFilterRules$2;-><init>()V

    sput-object v0, Le/e/a/SearchFilterRules;->DATES:Ljava/lang/ThreadLocal;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Ljava/lang/String;)J
    .registers 3

    .line 14
    invoke-static {p0}, Le/e/a/SearchFilterRules;->date(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method static declared-synchronized bounds(Ljava/lang/String;)Le/e/a/SearchFilterRules$Bounds;
    .registers 5

    const-class v0, Le/e/a/SearchFilterRules;

    monitor-enter v0

    .line 22
    :try_start_3
    sget-object v1, Le/e/a/SearchFilterRules;->FILTERS:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/SearchFilterRules$Bounds;

    if-nez v1, :cond_21

    new-instance v1, Le/e/a/SearchFilterRules$Bounds;

    invoke-direct {v1, p0}, Le/e/a/SearchFilterRules$Bounds;-><init>(Ljava/lang/String;)V

    if-eqz p0, :cond_21

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x4000

    if-gt v2, v3, :cond_21

    sget-object v2, Le/e/a/SearchFilterRules;->FILTERS:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p0, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_21
    .catchall {:try_start_3 .. :try_end_21} :catchall_23

    :cond_21
    monitor-exit v0

    return-object v1

    .line 22
    :catchall_23
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static date(Ljava/lang/String;)J
    .registers 3

    .line 14
    new-instance v0, Ljava/text/ParsePosition;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/text/ParsePosition;-><init>(I)V

    sget-object v1, Le/e/a/SearchFilterRules;->DATES:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, p0, v0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v1

    if-eqz v1, :cond_23

    invoke-virtual {v0}, Ljava/text/ParsePosition;->getIndex()I

    move-result v0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    if-ne v0, p0, :cond_23

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    return-wide v0

    :cond_23
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid search date"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static encode(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 7
    :try_start_0
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_6} :catch_7

    return-object p0

    :catch_7
    move-exception p0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static matches(Lorg/json/JSONObject;Ljava/lang/String;)Z
    .registers 8

    .line 23
    invoke-static {p1}, Le/e/a/SearchFilterRules;->bounds(Ljava/lang/String;)Le/e/a/SearchFilterRules$Bounds;

    move-result-object p1

    iget-boolean v0, p1, Le/e/a/SearchFilterRules$Bounds;->valid:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_56

    if-nez p0, :cond_c

    goto :goto_56

    :cond_c
    const-string v0, "duration"

    const/4 v2, -0x1

    invoke-virtual {p0, v0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iget v2, p1, Le/e/a/SearchFilterRules$Bounds;->low:I

    if-ltz v2, :cond_1d

    if-ltz v0, :cond_27

    iget v2, p1, Le/e/a/SearchFilterRules$Bounds;->low:I

    if-lt v0, v2, :cond_27

    :cond_1d
    iget v2, p1, Le/e/a/SearchFilterRules$Bounds;->high:I

    if-ltz v2, :cond_28

    if-ltz v0, :cond_27

    iget v2, p1, Le/e/a/SearchFilterRules$Bounds;->high:I

    if-le v0, v2, :cond_28

    :cond_27
    return v1

    :cond_28
    iget-wide v2, p1, Le/e/a/SearchFilterRules$Bounds;->from:J

    const-wide/high16 v4, -0x8000000000000000L

    cmp-long v0, v2, v4

    if-nez v0, :cond_3b

    iget-wide v2, p1, Le/e/a/SearchFilterRules$Bounds;->to:J

    const-wide v4, 0x7fffffffffffffffL

    cmp-long v0, v2, v4

    if-eqz v0, :cond_52

    :cond_3b
    :try_start_3b
    const-string v0, "registeredAt"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/SearchFilterRules;->date(Ljava/lang/String;)J

    move-result-wide v2

    iget-wide v4, p1, Le/e/a/SearchFilterRules$Bounds;->from:J

    cmp-long p0, v2, v4

    if-ltz p0, :cond_54

    iget-wide p0, p1, Le/e/a/SearchFilterRules$Bounds;->to:J
    :try_end_4d
    .catch Ljava/lang/RuntimeException; {:try_start_3b .. :try_end_4d} :catch_55

    cmp-long v0, v2, p0

    if-lez v0, :cond_52

    goto :goto_54

    :cond_52
    const/4 p0, 0x1

    return p0

    :cond_54
    :goto_54
    return v1

    :catch_55
    move-exception p0

    :cond_56
    :goto_56
    return v1
.end method

.method static max(I)I
    .registers 2

    .line 11
    const/4 v0, 0x1

    if-ne p0, v0, :cond_6

    const/16 p0, 0x12c

    goto :goto_1f

    :cond_6
    const/4 v0, 0x3

    if-ne p0, v0, :cond_c

    const/16 p0, 0x3c

    goto :goto_1f

    :cond_c
    const/4 v0, 0x4

    if-ne p0, v0, :cond_12

    const/16 p0, 0xb4

    goto :goto_1f

    :cond_12
    const/4 v0, 0x5

    if-ne p0, v0, :cond_18

    const/16 p0, 0x258

    goto :goto_1f

    :cond_18
    const/4 v0, 0x6

    if-ne p0, v0, :cond_1e

    const/16 p0, 0x4b0

    goto :goto_1f

    :cond_1e
    const/4 p0, 0x0

    :goto_1f
    return p0
.end method

.method static min(I)I
    .registers 2

    .line 11
    const/4 v0, 0x2

    if-ne p0, v0, :cond_6

    const/16 p0, 0x4b0

    goto :goto_d

    :cond_6
    const/4 v0, 0x7

    if-ne p0, v0, :cond_c

    const/16 p0, 0xe10

    goto :goto_d

    :cond_c
    const/4 p0, 0x0

    :goto_d
    return p0
.end method

.method static since(IJ)Ljava/lang/String;
    .registers 5

    .line 10
    if-lez p0, :cond_53

    sget-object v0, Le/e/a/SearchFilterRules;->PERIOD:[Ljava/lang/String;

    array-length v0, v0

    if-lt p0, v0, :cond_8

    goto :goto_53

    :cond_8
    const-string v0, "Asia/Tokyo"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/4 p1, -0x1

    const/4 p2, 0x2

    const/4 v1, 0x1

    packed-switch p0, :pswitch_data_56

    goto :goto_3a

    :pswitch_1c
    const/4 p0, -0x5

    goto :goto_1f

    :pswitch_1e
    const/4 p0, -0x3

    :goto_1f
    invoke-virtual {v0, v1, p0}, Ljava/util/Calendar;->add(II)V

    goto :goto_3a

    :pswitch_23
    invoke-virtual {v0, v1, p1}, Ljava/util/Calendar;->add(II)V

    goto :goto_3a

    :pswitch_27
    const/4 p0, -0x6

    invoke-virtual {v0, p2, p0}, Ljava/util/Calendar;->add(II)V

    goto :goto_3a

    :pswitch_2c
    invoke-virtual {v0, p2, p1}, Ljava/util/Calendar;->add(II)V

    goto :goto_3a

    :pswitch_30
    const/4 p0, 0x6

    const/4 p1, -0x7

    goto :goto_37

    :pswitch_33
    const/16 p0, 0xb

    const/16 p1, -0x18

    :goto_37
    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->add(II)V

    :goto_3a
    new-instance p0, Ljava/text/SimpleDateFormat;

    const-string p1, "yyyy-MM-dd\'T\'HH:mm:ssXXX"

    sget-object p2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-direct {p0, p1, p2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_53
    :goto_53
    const/4 p0, 0x0

    return-object p0

    nop

    :pswitch_data_56
    .packed-switch 0x1
        :pswitch_33
        :pswitch_30
        :pswitch_2c
        :pswitch_27
        :pswitch_23
        :pswitch_1e
        :pswitch_1c
    .end packed-switch
.end method

.method public static url([ILjava/lang/String;)Ljava/lang/String;
    .registers 15

    .line 8
    const-string v11, "duration"

    const-string v12, "hotMylist"

    const-string v0, "lastCommentTime"

    const-string v1, "lastCommentTime"

    const-string v2, "viewCount"

    const-string v3, "viewCount"

    const-string v4, "commentCount"

    const-string v5, "commentCount"

    const-string v6, "mylistCount"

    const-string v7, "mylistCount"

    const-string v8, "registeredAt"

    const-string v9, "registeredAt"

    const-string v10, "duration"

    filled-new-array/range {v0 .. v12}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    aget v2, p0, v1

    const/16 v3, 0xc

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/4 v4, 0x0

    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "https://nvapi.nicovideo.jp/v1/search/video?"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget v4, p0, v4

    if-ne v4, v1, :cond_3a

    const-string v1, "tag="

    goto :goto_3c

    :cond_3a
    const-string v1, "keyword="

    :goto_3c
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Le/e/a/SearchFilterRules;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, "&sortKey="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    aget-object v0, v0, v2

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "&sortOrder="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const/4 v0, 0x2

    if-ne v2, v3, :cond_60

    const-string v1, "none"

    goto :goto_68

    :cond_60
    rem-int/2addr v2, v0

    if-nez v2, :cond_66

    const-string v1, "desc"

    goto :goto_68

    :cond_66
    const-string v1, "asc"

    :goto_68
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 9
    aget v0, p0, v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Le/e/a/SearchFilterRules;->since(IJ)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_85

    const-string v1, "&minRegisteredAt="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Le/e/a/SearchFilterRules;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_85
    const/4 v0, 0x3

    aget v1, p0, v0

    invoke-static {v1}, Le/e/a/SearchFilterRules;->min(I)I

    move-result v1

    aget p0, p0, v0

    invoke-static {p0}, Le/e/a/SearchFilterRules;->max(I)I

    move-result p0

    if-lez v1, :cond_9d

    const-string v0, "&minDuration="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_9d
    if-lez p0, :cond_a8

    const-string v0, "&maxDuration="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_a8
    const-string p0, "&sensitiveContents=mask"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
