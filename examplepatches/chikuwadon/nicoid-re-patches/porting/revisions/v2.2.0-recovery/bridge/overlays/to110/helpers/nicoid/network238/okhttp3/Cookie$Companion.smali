.class public final Lnicoid/network238/okhttp3/Cookie$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/Cookie;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0018\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\rH\u0002J\u0018\u0010\u000f\u001a\u00020\u000b2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\rH\u0002J\u001a\u0010\u0013\u001a\u0004\u0018\u00010\u00142\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0015\u001a\u00020\rH\u0007J\'\u0010\u0013\u001a\u0004\u0018\u00010\u00142\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0015\u001a\u00020\rH\u0000\u00a2\u0006\u0002\u0008\u0018J \u0010\u0019\u001a\u00020\u00172\u0006\u0010\u001a\u001a\u00020\r2\u0006\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001cH\u0002J(\u0010\u001e\u001a\u00020\u001c2\u0006\u0010\u001f\u001a\u00020\r2\u0006\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001c2\u0006\u0010 \u001a\u00020\u000bH\u0002J\u0010\u0010!\u001a\u00020\u00172\u0006\u0010\u001a\u001a\u00020\rH\u0002J\u0010\u0010\"\u001a\u00020\r2\u0006\u0010\u001a\u001a\u00020\rH\u0002J\u001e\u0010#\u001a\u0008\u0012\u0004\u0012\u00020\u00140$2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010%\u001a\u00020&H\u0007R\u0016\u0010\u0004\u001a\n \u0006*\u0004\u0018\u00010\u00050\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u0007\u001a\n \u0006*\u0004\u0018\u00010\u00050\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u0008\u001a\n \u0006*\u0004\u0018\u00010\u00050\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\t\u001a\n \u0006*\u0004\u0018\u00010\u00050\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\'"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Cookie$Companion;",
        "",
        "<init>",
        "()V",
        "YEAR_PATTERN",
        "Ljava/util/regex/Pattern;",
        "nicoid.network238.kotlin.jvm.PlatformType",
        "MONTH_PATTERN",
        "DAY_OF_MONTH_PATTERN",
        "TIME_PATTERN",
        "domainMatch",
        "",
        "urlHost",
        "",
        "domain",
        "pathMatch",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "path",
        "parse",
        "Lnicoid/network238/okhttp3/Cookie;",
        "setCookie",
        "currentTimeMillis",
        "",
        "parse$okhttp",
        "parseExpires",
        "s",
        "pos",
        "",
        "limit",
        "dateCharacterOffset",
        "input",
        "invert",
        "parseMaxAge",
        "parseDomain",
        "parseAll",
        "",
        "headers",
        "Lnicoid/network238/okhttp3/Headers;",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 401
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/Cookie$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$domainMatch(Lnicoid/network238/okhttp3/Cookie$Companion;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3

    .line 401
    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/Cookie$Companion;->domainMatch(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static final synthetic access$pathMatch(Lnicoid/network238/okhttp3/Cookie$Companion;Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;)Z
    .registers 3

    .line 401
    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/Cookie$Companion;->pathMatch(Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private final dateCharacterOffset(Ljava/lang/String;IIZ)I
    .registers 9

    :goto_0
    if-ge p2, p3, :cond_6

    .line 674
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x20

    const/4 v2, 0x1

    if-ge v0, v1, :cond_0

    const/16 v1, 0x9

    if-ne v0, v1, :cond_4

    :cond_0
    const/16 v1, 0x7f

    if-ge v0, v1, :cond_4

    const/16 v1, 0x30

    const/16 v3, 0x3a

    if-gt v1, v0, :cond_1

    if-lt v0, v3, :cond_4

    :cond_1
    const/16 v1, 0x61

    if-gt v1, v0, :cond_2

    const/16 v1, 0x7b

    if-lt v0, v1, :cond_4

    :cond_2
    const/16 v1, 0x41

    if-gt v1, v0, :cond_3

    const/16 v1, 0x5b

    if-lt v0, v1, :cond_4

    :cond_3
    if-eq v0, v3, :cond_4

    const/4 v0, 0x0

    goto :goto_1

    :cond_4
    move v0, v2

    :goto_1
    xor-int/2addr v2, p4

    if-ne v0, v2, :cond_5

    return p2

    :cond_5
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_6
    return p3
.end method

.method private final domainMatch(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 7

    .line 413
    invoke-static {p1, p2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 417
    const/4 v0, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-static {p1, p2, v0, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 418
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    sub-int/2addr v2, p2

    sub-int/2addr v2, v1

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result p2

    const/16 v2, 0x2e

    if-ne p2, v2, :cond_1

    .line 419
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->canParseAsIpAddress(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    :cond_0
    return v1

    :cond_1
    return v0
.end method

.method private final parseDomain(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 712
    const/4 v0, 0x2

    const/4 v1, 0x0

    const-string v2, "."

    const/4 v3, 0x0

    invoke-static {p1, v2, v3, v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 713
    invoke-static {p1, v2}, Lnicoid/network238/kotlin/text/StringsKt;->removePrefix(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->toCanonicalHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    return-object p1

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1

    .line 712
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Failed requirement."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final parseExpires(Ljava/lang/String;II)J
    .registers 26

    .line 599
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    const/4 v3, 0x0

    move/from16 v4, p2

    invoke-direct {v0, v1, v4, v2, v3}, Lnicoid/network238/okhttp3/Cookie$Companion;->dateCharacterOffset(Ljava/lang/String;IIZ)I

    move-result v4

    .line 607
    # getter for: Lnicoid/network238/okhttp3/Cookie;->TIME_PATTERN:Ljava/util/regex/Pattern;
    invoke-static {}, Lnicoid/network238/okhttp3/Cookie;->access$getTIME_PATTERN$cp()Ljava/util/regex/Pattern;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    const/4 v6, -0x1

    move v7, v6

    move v8, v7

    move v9, v8

    move v10, v9

    move v11, v10

    move v12, v11

    :goto_0
    const/4 v13, 0x2

    const/4 v14, 0x1

    if-ge v4, v2, :cond_4

    add-int/lit8 v15, v4, 0x1

    .line 610
    invoke-direct {v0, v1, v15, v2, v14}, Lnicoid/network238/okhttp3/Cookie$Companion;->dateCharacterOffset(Ljava/lang/String;IIZ)I

    move-result v15

    .line 611
    invoke-virtual {v5, v4, v15}, Ljava/util/regex/Matcher;->region(II)Ljava/util/regex/Matcher;

    if-ne v8, v6, :cond_0

    .line 614
    # getter for: Lnicoid/network238/okhttp3/Cookie;->TIME_PATTERN:Ljava/util/regex/Pattern;
    invoke-static {}, Lnicoid/network238/okhttp3/Cookie;->access$getTIME_PATTERN$cp()Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/util/regex/Matcher;->usePattern(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 615
    invoke-virtual {v5, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 616
    invoke-virtual {v5, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    .line 617
    const/4 v4, 0x3

    invoke-virtual {v5, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    goto/16 :goto_1

    :cond_0
    if-ne v9, v6, :cond_1

    .line 620
    # getter for: Lnicoid/network238/okhttp3/Cookie;->DAY_OF_MONTH_PATTERN:Ljava/util/regex/Pattern;
    invoke-static {}, Lnicoid/network238/okhttp3/Cookie;->access$getDAY_OF_MONTH_PATTERN$cp()Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/util/regex/Matcher;->usePattern(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 621
    invoke-virtual {v5, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    goto :goto_1

    :cond_1
    if-ne v10, v6, :cond_2

    .line 624
    # getter for: Lnicoid/network238/okhttp3/Cookie;->MONTH_PATTERN:Ljava/util/regex/Pattern;
    invoke-static {}, Lnicoid/network238/okhttp3/Cookie;->access$getMONTH_PATTERN$cp()Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/util/regex/Matcher;->usePattern(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 625
    invoke-virtual {v5, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v4, v10}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 626
    # getter for: Lnicoid/network238/okhttp3/Cookie;->MONTH_PATTERN:Ljava/util/regex/Pattern;
    invoke-static {}, Lnicoid/network238/okhttp3/Cookie;->access$getMONTH_PATTERN$cp()Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Pattern;->pattern()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v20, 0x6

    const/16 v21, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    invoke-static/range {v16 .. v21}, Lnicoid/network238/kotlin/text/StringsKt;->indexOf$default(Ljava/lang/CharSequence;Ljava/lang/String;IZILjava/lang/Object;)I

    move-result v4

    div-int/lit8 v10, v4, 0x4

    goto :goto_1

    :cond_2
    if-ne v7, v6, :cond_3

    .line 629
    # getter for: Lnicoid/network238/okhttp3/Cookie;->YEAR_PATTERN:Ljava/util/regex/Pattern;
    invoke-static {}, Lnicoid/network238/okhttp3/Cookie;->access$getYEAR_PATTERN$cp()Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/util/regex/Matcher;->usePattern(Ljava/util/regex/Pattern;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 630
    invoke-virtual {v5, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    :cond_3
    :goto_1
    add-int/lit8 v15, v15, 0x1

    .line 634
    invoke-direct {v0, v1, v15, v2, v3}, Lnicoid/network238/okhttp3/Cookie$Companion;->dateCharacterOffset(Ljava/lang/String;IIZ)I

    move-result v4

    goto/16 :goto_0

    :cond_4
    const/16 v1, 0x46

    if-gt v1, v7, :cond_5

    const/16 v2, 0x64

    if-ge v7, v2, :cond_5

    add-int/lit16 v7, v7, 0x76c

    :cond_5
    if-ltz v7, :cond_6

    if-ge v7, v1, :cond_6

    add-int/lit16 v7, v7, 0x7d0

    :cond_6
    const/16 v1, 0x641

    const-string v2, "Failed requirement."

    if-lt v7, v1, :cond_c

    if-eq v10, v6, :cond_b

    if-gt v14, v9, :cond_a

    const/16 v1, 0x20

    if-ge v9, v1, :cond_a

    if-ltz v8, :cond_9

    const/16 v1, 0x18

    if-ge v8, v1, :cond_9

    if-ltz v11, :cond_8

    const/16 v1, 0x3c

    if-ge v11, v1, :cond_8

    if-ltz v12, :cond_7

    if-ge v12, v1, :cond_7

    .line 650
    new-instance v1, Ljava/util/GregorianCalendar;

    sget-object v2, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->UTC:Ljava/util/TimeZone;

    invoke-direct {v1, v2}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    .line 651
    invoke-virtual {v1, v3}, Ljava/util/Calendar;->setLenient(Z)V

    .line 652
    invoke-virtual {v1, v14, v7}, Ljava/util/Calendar;->set(II)V

    sub-int/2addr v10, v14

    .line 653
    invoke-virtual {v1, v13, v10}, Ljava/util/Calendar;->set(II)V

    .line 654
    const/4 v2, 0x5

    invoke-virtual {v1, v2, v9}, Ljava/util/Calendar;->set(II)V

    .line 655
    const/16 v2, 0xb

    invoke-virtual {v1, v2, v8}, Ljava/util/Calendar;->set(II)V

    .line 656
    const/16 v2, 0xc

    invoke-virtual {v1, v2, v11}, Ljava/util/Calendar;->set(II)V

    .line 657
    const/16 v2, 0xd

    invoke-virtual {v1, v2, v12}, Ljava/util/Calendar;->set(II)V

    .line 658
    const/16 v2, 0xe

    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->set(II)V

    .line 659
    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    return-wide v1

    .line 648
    :cond_7
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 647
    :cond_8
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 646
    :cond_9
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 645
    :cond_a
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 644
    :cond_b
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 643
    :cond_c
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private final parseMaxAge(Ljava/lang/String;)J
    .registers 8

    .line 696
    const-wide/high16 v0, -0x8000000000000000L

    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    const-wide/16 v4, 0x0

    cmp-long p1, v2, v4

    if-gtz p1, :cond_0

    return-wide v0

    :cond_0
    return-wide v2

    :catch_0
    move-exception v2

    .line 700
    new-instance v3, Lnicoid/network238/kotlin/text/Regex;

    const-string v4, "-?\\d+"

    invoke-direct {v3, v4}, Lnicoid/network238/kotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Lnicoid/network238/kotlin/text/Regex;->matches(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 701
    const/4 v2, 0x2

    const/4 v3, 0x0

    const-string v4, "-"

    const/4 v5, 0x0

    invoke-static {p1, v4, v5, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    const-wide v0, 0x7fffffffffffffffL

    :cond_1
    return-wide v0

    .line 703
    :cond_2
    throw v2
.end method

.method private final pathMatch(Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;)Z
    .registers 7

    .line 426
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object p1

    .line 428
    invoke-static {p1, p2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 432
    const/4 v0, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-static {p1, p2, v0, v1, v2}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 433
    const-string v3, "/"

    invoke-static {p2, v3, v0, v1, v2}, Lnicoid/network238/kotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 434
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result p1

    const/16 p2, 0x2f

    if-ne p1, p2, :cond_2

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1

    :cond_2
    return v0
.end method


# virtual methods
.method public final parse(Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;)Lnicoid/network238/okhttp3/Cookie;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 448
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1, p1, p2}, Lnicoid/network238/okhttp3/Cookie$Companion;->parse$okhttp(JLnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;)Lnicoid/network238/okhttp3/Cookie;

    move-result-object p1

    return-object p1
.end method

.method public final parse$okhttp(JLnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;)Lnicoid/network238/okhttp3/Cookie;
    .registers 38

    move-object/from16 v1, p0

    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual/range {p4 .. p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 455
    const/16 v3, 0x3b

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x6

    const/4 v7, 0x0

    move-object/from16 v2, p4

    invoke-static/range {v2 .. v7}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->delimiterOffset$default(Ljava/lang/String;CIIILjava/lang/Object;)I

    move-result v5

    .line 457
    const/16 v3, 0x3d

    const/4 v6, 0x2

    invoke-static/range {v2 .. v7}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->delimiterOffset$default(Ljava/lang/String;CIIILjava/lang/Object;)I

    move-result v0

    const/4 v3, 0x0

    if-eq v0, v5, :cond_10

    .line 460
    const/4 v4, 0x0

    const/4 v6, 0x1

    invoke-static {v2, v4, v0, v6, v3}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->trimSubstring$default(Ljava/lang/String;IIILjava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 461
    invoke-interface {v8}, Ljava/lang/CharSequence;->length()I

    move-result v7

    if-eqz v7, :cond_0

    invoke-static {v8}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->indexOfControlOrNonAscii(Ljava/lang/String;)I

    move-result v7

    const/4 v9, -0x1

    if-eq v7, v9, :cond_1

    :cond_0
    goto/16 :goto_7

    :cond_1
    add-int/2addr v0, v6

    .line 463
    invoke-static {v2, v0, v5}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->trimSubstring(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v7

    .line 464
    invoke-static {v7}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->indexOfControlOrNonAscii(Ljava/lang/String;)I

    move-result v0

    if-ne v0, v9, :cond_10

    add-int/2addr v5, v6

    .line 477
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    move-object v10, v3

    move-object v11, v10

    move-object/from16 v20, v11

    move/from16 v19, v4

    move/from16 v23, v19

    move/from16 v24, v23

    move/from16 v18, v6

    const-wide/16 v14, -0x1

    const-wide/16 v16, -0x1

    const-wide v21, 0xe677d21fdbffL

    :goto_0
    if-ge v5, v9, :cond_a

    .line 479
    const/16 v0, 0x3b

    const-wide v25, 0xe677d21fdbffL

    invoke-static {v2, v0, v5, v9}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;CII)I

    move-result v12

    .line 481
    const/16 v0, 0x3d

    invoke-static {v2, v0, v5, v12}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;CII)I

    move-result v0

    .line 482
    invoke-static {v2, v5, v0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->trimSubstring(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v5

    if-ge v0, v12, :cond_2

    add-int/lit8 v0, v0, 0x1

    .line 485
    invoke-static {v2, v0, v12}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->trimSubstring(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 487
    :cond_2
    const-string v0, ""

    .line 491
    :goto_1
    const-string v13, "expires"

    invoke-static {v5, v13, v6}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 493
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-direct {v1, v0, v4, v5}, Lnicoid/network238/okhttp3/Cookie$Companion;->parseExpires(Ljava/lang/String;II)J

    move-result-wide v21
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_2

    .line 500
    :cond_3
    const-string v13, "max-age"

    invoke-static {v5, v13, v6}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 502
    :try_start_1
    invoke-direct {v1, v0}, Lnicoid/network238/okhttp3/Cookie$Companion;->parseMaxAge(Ljava/lang/String;)J

    move-result-wide v14
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    :goto_2
    move/from16 v19, v6

    goto :goto_3

    :catch_0
    move-exception v0

    goto :goto_3

    .line 509
    :cond_4
    const-string v13, "domain"

    invoke-static {v5, v13, v6}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 511
    :try_start_2
    invoke-direct {v1, v0}, Lnicoid/network238/okhttp3/Cookie$Companion;->parseDomain(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_1

    move/from16 v18, v4

    goto :goto_3

    :catch_1
    move-exception v0

    goto :goto_3

    .line 518
    :cond_5
    const-string v13, "path"

    invoke-static {v5, v13, v6}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v13

    if-eqz v13, :cond_6

    move-object v11, v0

    goto :goto_3

    .line 522
    :cond_6
    const-string v13, "secure"

    invoke-static {v5, v13, v6}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v13

    if-eqz v13, :cond_7

    move/from16 v23, v6

    goto :goto_3

    .line 526
    :cond_7
    const-string v13, "httponly"

    invoke-static {v5, v13, v6}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v13

    if-eqz v13, :cond_8

    move/from16 v24, v6

    goto :goto_3

    .line 530
    :cond_8
    const-string v13, "samesite"

    invoke-static {v5, v13, v6}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_9

    move-object/from16 v20, v0

    :cond_9
    :goto_3
    add-int/lit8 v5, v12, 0x1

    goto/16 :goto_0

    :cond_a
    const-wide v25, 0xe677d21fdbffL

    const-wide/high16 v5, -0x8000000000000000L

    cmp-long v0, v14, v5

    if-nez v0, :cond_b

    move-wide v12, v5

    goto :goto_5

    :cond_b
    cmp-long v0, v14, v16

    if-eqz v0, :cond_e

    const-wide v5, 0x20c49ba5e353f7L

    cmp-long v0, v14, v5

    if-gtz v0, :cond_c

    const-wide/16 v5, 0x3e8

    mul-long/2addr v14, v5

    goto :goto_4

    :cond_c
    const-wide v14, 0x7fffffffffffffffL

    :goto_4
    add-long v14, p1, v14

    cmp-long v0, v14, p1

    if-ltz v0, :cond_d

    cmp-long v0, v14, v25

    if-gtz v0, :cond_d

    move-wide v12, v14

    goto :goto_5

    :cond_d
    move-wide/from16 v12, v25

    goto :goto_5

    :cond_e
    move-wide/from16 v12, v21

    .line 556
    :goto_5
    invoke-virtual/range {p3 .. p3}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    if-nez v10, :cond_f

    move-object v10, v0

    goto :goto_6

    .line 559
    :cond_f
    invoke-direct {v1, v0, v10}, Lnicoid/network238/okhttp3/Cookie$Companion;->domainMatch(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 564
    :goto_6
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v0, v2, :cond_11

    .line 565
    sget-object v0, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->Companion:Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase$Companion;->get()Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;

    move-result-object v0

    invoke-virtual {v0, v10}, Lnicoid/network238/okhttp3/internal/publicsuffix/PublicSuffixDatabase;->getEffectiveTldPlusOne(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_11

    :cond_10
    :goto_7
    return-object v3

    :cond_11
    const-string v0, "/"

    if-eqz v11, :cond_12

    .line 572
    const/4 v2, 0x2

    invoke-static {v11, v0, v4, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_14

    .line 573
    :cond_12
    invoke-virtual/range {p3 .. p3}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v25

    .line 574
    const/16 v26, 0x2f

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x6

    const/16 v30, 0x0

    invoke-static/range {v25 .. v30}, Lnicoid/network238/kotlin/text/StringsKt;->lastIndexOf$default(Ljava/lang/CharSequence;CIZILjava/lang/Object;)I

    move-result v2

    move-object/from16 v3, v25

    if-eqz v2, :cond_13

    .line 575
    invoke-virtual {v3, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    goto :goto_8

    :cond_13
    move-object v11, v0

    .line 578
    :cond_14
    :goto_8
    move-object v9, v7

    new-instance v7, Lnicoid/network238/okhttp3/Cookie;

    move/from16 v16, v19

    const/16 v19, 0x0

    move/from16 v17, v18

    move-object/from16 v18, v20

    move/from16 v14, v23

    move/from16 v15, v24

    move-wide/from16 v31, v12

    move-object v12, v10

    move-object v13, v11

    move-wide/from16 v10, v31

    invoke-direct/range {v7 .. v19}, Lnicoid/network238/okhttp3/Cookie;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;ZZZZLjava/lang/String;Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v7
.end method

.method public final parseAll(Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)Ljava/util/List;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/HttpUrl;",
            "Lnicoid/network238/okhttp3/Headers;",
            ")",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Cookie;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 722
    const-string v0, "Set-Cookie"

    invoke-virtual {p2, v0}, Lnicoid/network238/okhttp3/Headers;->values(Ljava/lang/String;)Ljava/util/List;

    move-result-object p2

    .line 725
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v3, v1

    :goto_0
    if-ge v2, v0, :cond_2

    .line 726
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p0, p1, v4}, Lnicoid/network238/okhttp3/Cookie$Companion;->parse(Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;)Lnicoid/network238/okhttp3/Cookie;

    move-result-object v4

    if-eqz v4, :cond_1

    if-nez v3, :cond_0

    .line 727
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 728
    :cond_0
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    if-eqz v3, :cond_3

    .line 736
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_1

    :cond_3
    nop

    :goto_1
    if-nez v1, :cond_4

    .line 731
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1

    :cond_4
    return-object v1
.end method
