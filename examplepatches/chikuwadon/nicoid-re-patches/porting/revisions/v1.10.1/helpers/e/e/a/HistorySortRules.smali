.class final Le/e/a/HistorySortRules;
.super Ljava/lang/Object;
.source "HistorySortRules.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static compare(JJIIZ)I
    .registers 11

    .line 5
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-lez v2, :cond_14

    cmp-long v3, p2, v0

    if-gtz v3, :cond_b

    goto :goto_14

    :cond_b
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    if-eqz p6, :cond_12

    goto :goto_13

    :cond_12
    neg-int p0, p0

    :goto_13
    return p0

    :cond_14
    :goto_14
    if-lez v2, :cond_18

    const/4 p0, -0x1

    return p0

    :cond_18
    cmp-long p0, p2, v0

    if-lez p0, :cond_1e

    const/4 p0, 0x1

    return p0

    :cond_1e
    invoke-static {p4, p5}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    return p0
.end method

.method static watched(Ljava/lang/String;)J
    .registers 9

    .line 4
    const-wide/16 v0, 0x0

    if-nez p0, :cond_5

    return-wide v0

    :cond_5
    const-string v2, "<[^>]+>"

    const-string v3, ""

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string v6, "yyyy/MM/dd HH:mm"

    const-string v7, "yyyy-MM-dd\'T\'HH:mm:ssXXX"

    const-string v2, "yyyy\u5e74MM\u6708dd\u65e5 HH\u6642mm\u5206"

    const-string v3, "yyyy-MM-dd HH:mm:ss"

    const-string v4, "yyyy-MM-dd HH:mm"

    const-string v5, "yyyy/MM/dd HH:mm:ss"

    filled-new-array/range {v2 .. v7}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_23
    const/4 v5, 0x6

    if-lt v4, v5, :cond_27

    return-wide v0

    :cond_27
    aget-object v5, v2, v4

    :try_start_29
    new-instance v6, Ljava/text/SimpleDateFormat;

    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-direct {v6, v5, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    invoke-virtual {v6, v3}, Ljava/text/SimpleDateFormat;->setLenient(Z)V

    const-string v5, "Asia/Tokyo"

    invoke-static {v5}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    invoke-virtual {v6, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v5

    if-eqz v5, :cond_48

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v0
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_46} :catch_47

    return-wide v0

    :catch_47
    move-exception v5

    :cond_48
    add-int/lit8 v4, v4, 0x1

    goto :goto_23
.end method
