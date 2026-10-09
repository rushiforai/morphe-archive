.class public final Le/e/a/VideoCountRules;
.super Ljava/lang/Object;
.source "VideoCountRules.java"


# static fields
.field private static final ITEM:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 10
    const-string v0, "(\u518d\u751f\u6570|\u518d\u751f|Views|\u89c0\u770b|\u30b3\u30e1\u30f3\u30c8|\u30b3\u30e1|Comments|\u7559\u8a00|\u3044\u3044\u306d|Likes|\u6309\u8b9a|\u30de\u30a4\u30ea\u30b9\u30c8|\u30de\u30a4\u30ea\u30b9|\u30de\u30a4|Mylists|My Lists|\u64ad\u653e\u6e05\u55ae)[:\uff1a]\\s*([0-9][0-9,]*)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/VideoCountRules;->ITEM:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static format(J)Ljava/lang/String;
    .registers 6
    .param p0, "value"    # J

    .line 37
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const-string v1, "%,d"

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/lang/CharSequence;)[J
    .registers 14
    .param p0, "text"    # Ljava/lang/CharSequence;

    .line 16
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    .line 17
    :cond_4
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 18
    .local v1, "source":Ljava/lang/String;
    sget-object v2, Le/e/a/VideoCountRules;->ITEM:Ljava/util/regex/Pattern;

    invoke-virtual {v2, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 19
    .local v2, "matcher":Ljava/util/regex/Matcher;
    const/4 v3, 0x4

    new-array v3, v3, [J

    .line 20
    .local v3, "counts":[J
    const-wide/16 v4, -0x1

    invoke-static {v3, v4, v5}, Ljava/util/Arrays;->fill([JJ)V

    .line 21
    const/4 v4, 0x0

    .line 22
    .local v4, "end":I
    :goto_17
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    const/4 v6, 0x3

    const/4 v7, 0x0

    const/4 v8, 0x1

    const-wide/16 v9, 0x0

    if-eqz v5, :cond_b8

    .line 23
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->start()I

    move-result v5

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Le/e/a/VideoCountRules;->separator(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_31

    return-object v0

    .line 24
    :cond_31
    invoke-virtual {v2, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    .line 25
    .local v5, "label":Ljava/lang/String;
    const-string v11, "\u518d\u751f\u6570"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    const/4 v12, 0x2

    if-nez v11, :cond_94

    const-string v11, "\u518d\u751f"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_94

    const-string v11, "Views"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_94

    const-string v11, "\u89c0\u770b"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_57

    goto :goto_94

    .line 26
    :cond_57
    const-string v7, "\u30b3\u30e1\u30f3\u30c8"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_92

    const-string v7, "\u30b3\u30e1"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_92

    const-string v7, "Comments"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_92

    const-string v7, "\u7559\u8a00"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_78

    goto :goto_92

    .line 27
    :cond_78
    const-string v7, "\u3044\u3044\u306d"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_90

    const-string v7, "Likes"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_90

    const-string v7, "\u6309\u8b9a"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_95

    :cond_90
    const/4 v6, 0x2

    goto :goto_95

    .line 26
    :cond_92
    :goto_92
    const/4 v6, 0x1

    goto :goto_95

    .line 25
    :cond_94
    :goto_94
    const/4 v6, 0x0

    .line 27
    :cond_95
    :goto_95
    nop

    .line 28
    .local v6, "index":I
    aget-wide v7, v3, v6

    cmp-long v11, v7, v9

    if-ltz v11, :cond_9d

    return-object v0

    .line 29
    :cond_9d
    :try_start_9d
    invoke-virtual {v2, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    const-string v8, ","

    const-string v9, ""

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v7

    aput-wide v7, v3, v6
    :try_end_af
    .catch Ljava/lang/NumberFormatException; {:try_start_9d .. :try_end_af} :catch_b6

    .line 30
    nop

    .line 31
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->end()I

    move-result v4

    .line 32
    .end local v5    # "label":Ljava/lang/String;
    .end local v6    # "index":I
    goto/16 :goto_17

    .line 30
    .restart local v5    # "label":Ljava/lang/String;
    .restart local v6    # "index":I
    :catch_b6
    move-exception v7

    .local v7, "invalid":Ljava/lang/NumberFormatException;
    return-object v0

    .line 33
    .end local v5    # "label":Ljava/lang/String;
    .end local v6    # "index":I
    .end local v7    # "invalid":Ljava/lang/NumberFormatException;
    :cond_b8
    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Le/e/a/VideoCountRules;->separator(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_d5

    aget-wide v11, v3, v7

    cmp-long v5, v11, v9

    if-ltz v5, :cond_d5

    aget-wide v7, v3, v8

    cmp-long v5, v7, v9

    if-ltz v5, :cond_d5

    aget-wide v5, v3, v6

    cmp-long v7, v5, v9

    if-ltz v7, :cond_d5

    move-object v0, v3

    :cond_d5
    return-object v0
.end method

.method private static separator(Ljava/lang/String;)Z
    .registers 2
    .param p0, "value"    # Ljava/lang/String;

    .line 36
    const-string v0, "[\\s|]*"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
