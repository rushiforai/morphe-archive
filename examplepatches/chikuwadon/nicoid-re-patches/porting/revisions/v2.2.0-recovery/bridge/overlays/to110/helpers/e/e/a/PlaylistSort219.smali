.class public final Le/e/a/PlaylistSort219;
.super Ljava/lang/Object;
.source "PlaylistSort219.java"


# static fields
.field private static final DURATION:Ljava/util/regex/Pattern;

.field private static final LABELS:[[Ljava/lang/String;

.field private static final LOCAL:[I

.field private static final RAW:[Ljava/lang/String;

.field private static final STATS:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 17

    .line 12
    const/16 v0, 0xf

    new-array v1, v0, [I

    fill-array-data v1, :array_0

    sput-object v1, Le/e/a/PlaylistSort219;->LOCAL:[I

    .line 13
    const-string v1, "rawres"

    const-string v2, "rawmylis"

    const-string v3, "rawplay"

    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    sput-object v1, Le/e/a/PlaylistSort219;->RAW:[Ljava/lang/String;

    .line 14
    const-string v1, "(?<![0-9])[0-9]+(?:[,\uff0c\\u00a0\\u202f][0-9]{3})*"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    sput-object v1, Le/e/a/PlaylistSort219;->STATS:Ljava/util/regex/Pattern;

    .line 16
    const-string v1, "^(?:(\\d+):)?(\\d+):(\\d{2})$"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    sput-object v1, Le/e/a/PlaylistSort219;->DURATION:Ljava/util/regex/Pattern;

    .line 17
    const-string v1, "Newest upload first"

    const-string v2, "\u6295\u7a3f\u65e5\u671f\u7531\u65b0\u5230\u820a"

    const-string v3, "\u6295\u7a3f\u65e5\u304c\u65b0\u3057\u3044\u9806"

    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "Oldest upload first"

    const-string v3, "\u6295\u7a3f\u65e5\u671f\u7531\u820a\u5230\u65b0"

    const-string v4, "\u6295\u7a3f\u65e5\u304c\u53e4\u3044\u9806"

    filled-new-array {v4, v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "Most recently added"

    const-string v4, "\u52a0\u5165\u65e5\u671f\u7531\u65b0\u5230\u820a"

    const-string/jumbo v5, "\u767b\u9332\u65e5\u304c\u65b0\u3057\u3044\u9806"

    filled-new-array {v5, v3, v4}, [Ljava/lang/String;

    move-result-object v3

    const-string v4, "Earliest added"

    const-string v5, "\u52a0\u5165\u65e5\u671f\u7531\u820a\u5230\u65b0"

    const-string/jumbo v6, "\u767b\u9332\u65e5\u304c\u53e4\u3044\u9806"

    filled-new-array {v6, v4, v5}, [Ljava/lang/String;

    move-result-object v4

    const-string v5, "Title ascending"

    const-string/jumbo v6, "\u6a19\u984c\u5347\u51aa"

    const-string v7, "\u30bf\u30a4\u30c8\u30eb\u6607\u9806"

    filled-new-array {v7, v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "Title descending"

    const-string/jumbo v7, "\u6a19\u984c\u964d\u51aa"

    const-string v8, "\u30bf\u30a4\u30c8\u30eb\u964d\u9806"

    filled-new-array {v8, v6, v7}, [Ljava/lang/String;

    move-result-object v6

    const-string v7, "Most views"

    const-string/jumbo v8, "\u89c0\u770b\u6b21\u6578\u6700\u591a"

    const-string v9, "\u518d\u751f\u6570\u304c\u591a\u3044\u9806"

    filled-new-array {v9, v7, v8}, [Ljava/lang/String;

    move-result-object v7

    const-string v8, "Fewest views"

    const-string/jumbo v9, "\u89c0\u770b\u6b21\u6578\u6700\u5c11"

    const-string v10, "\u518d\u751f\u6570\u304c\u5c11\u306a\u3044\u9806"

    filled-new-array {v10, v8, v9}, [Ljava/lang/String;

    move-result-object v8

    const-string v9, "Most comments"

    const-string/jumbo v10, "\u7559\u8a00\u6578\u6700\u591a"

    const-string v11, "\u30b3\u30e1\u30f3\u30c8\u6570\u304c\u591a\u3044\u9806"

    filled-new-array {v11, v9, v10}, [Ljava/lang/String;

    move-result-object v9

    const-string v10, "Fewest comments"

    const-string/jumbo v11, "\u7559\u8a00\u6578\u6700\u5c11"

    const-string v12, "\u30b3\u30e1\u30f3\u30c8\u6570\u304c\u5c11\u306a\u3044\u9806"

    filled-new-array {v12, v10, v11}, [Ljava/lang/String;

    move-result-object v10

    const-string v11, "Most mylists"

    const-string/jumbo v12, "\u6536\u85cf\u6578\u6700\u591a"

    const-string v13, "\u30de\u30a4\u30ea\u30b9\u30c8\u6570\u304c\u591a\u3044\u9806"

    filled-new-array {v13, v11, v12}, [Ljava/lang/String;

    move-result-object v11

    const-string v12, "Fewest mylists"

    const-string/jumbo v13, "\u6536\u85cf\u6578\u6700\u5c11"

    const-string v14, "\u30de\u30a4\u30ea\u30b9\u30c8\u6570\u304c\u5c11\u306a\u3044\u9806"

    filled-new-array {v14, v12, v13}, [Ljava/lang/String;

    move-result-object v12

    const-string v13, "Longest first"

    const-string/jumbo v14, "\u64ad\u653e\u6642\u9593\u7531\u9577\u5230\u77ed"

    const-string v15, "\u518d\u751f\u6642\u9593\u304c\u9577\u3044\u9806"

    filled-new-array {v15, v13, v14}, [Ljava/lang/String;

    move-result-object v13

    const-string v14, "Shortest first"

    const-string/jumbo v15, "\u64ad\u653e\u6642\u9593\u7531\u77ed\u5230\u9577"

    const-string v0, "\u518d\u751f\u6642\u9593\u304c\u77ed\u3044\u9806"

    filled-new-array {v0, v14, v15}, [Ljava/lang/String;

    move-result-object v0

    const-string v14, "Custom order"

    const-string/jumbo v15, "\u81ea\u8a02\u9806\u5e8f"

    move-object/from16 v16, v0

    const-string v0, "\u30ab\u30b9\u30bf\u30e0\u9806"

    filled-new-array {v0, v14, v15}, [Ljava/lang/String;

    move-result-object v0

    const/16 v14, 0xf

    new-array v14, v14, [[Ljava/lang/String;

    const/4 v15, 0x0

    aput-object v1, v14, v15

    const/4 v1, 0x1

    aput-object v2, v14, v1

    const/4 v1, 0x2

    aput-object v3, v14, v1

    const/4 v1, 0x3

    aput-object v4, v14, v1

    const/4 v1, 0x4

    aput-object v5, v14, v1

    const/4 v1, 0x5

    aput-object v6, v14, v1

    const/4 v1, 0x6

    aput-object v7, v14, v1

    const/4 v1, 0x7

    aput-object v8, v14, v1

    const/16 v1, 0x8

    aput-object v9, v14, v1

    const/16 v1, 0x9

    aput-object v10, v14, v1

    const/16 v1, 0xa

    aput-object v11, v14, v1

    const/16 v1, 0xb

    aput-object v12, v14, v1

    const/16 v1, 0xc

    aput-object v13, v14, v1

    const/16 v1, 0xd

    aput-object v16, v14, v1

    const/16 v1, 0xe

    aput-object v0, v14, v1

    sput-object v14, Le/e/a/PlaylistSort219;->LABELS:[[Ljava/lang/String;

    return-void

    nop

    :array_0
    .array-data 4
        0x4
        0x5
        0x0
        0x1
        0x2
        0x6
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
        0xd
        0xe
        0x3
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static compare(JJZ)I
    .registers 9

    .line 102
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-ltz v2, :cond_2

    cmp-long v3, p2, v0

    if-gez v3, :cond_0

    goto :goto_1

    .line 103
    :cond_0
    if-eqz p4, :cond_1

    invoke-static {p0, p1, p2, p3}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    goto :goto_0

    :cond_1
    invoke-static {p2, p3, p0, p1}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    :goto_0
    return p0

    .line 102
    :cond_2
    :goto_1
    const/4 p0, 0x1

    const/4 p1, 0x0

    if-gez v2, :cond_3

    move p4, p0

    goto :goto_2

    :cond_3
    move p4, p1

    :goto_2
    cmp-long p2, p2, v0

    if-gez p2, :cond_4

    goto :goto_3

    :cond_4
    move p0, p1

    :goto_3
    invoke-static {p4, p0}, Ljava/lang/Boolean;->compare(ZZ)I

    move-result p0

    return p0
.end method

.method private static duration(Ljava/lang/String;)J
    .registers 11

    .line 133
    sget-object v0, Le/e/a/PlaylistSort219;->DURATION:Ljava/util/regex/Pattern;

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 134
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p0}, Le/e/a/PlaylistSort219;->number(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0

    .line 135
    :cond_0
    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    const-wide/16 v2, 0x0

    if-nez v1, :cond_1

    move-wide v4, v2

    goto :goto_0

    :cond_1
    invoke-virtual {v0, p0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PlaylistSort219;->number(Ljava/lang/String;)J

    move-result-wide v4

    .line 136
    :goto_0
    const/4 p0, 0x2

    invoke-virtual {v0, p0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PlaylistSort219;->number(Ljava/lang/String;)J

    move-result-wide v6

    .line 137
    const/4 p0, 0x3

    invoke-virtual {v0, p0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PlaylistSort219;->number(Ljava/lang/String;)J

    move-result-wide v0

    .line 138
    cmp-long p0, v4, v2

    if-ltz p0, :cond_3

    const-wide/32 v8, 0xf4240

    cmp-long p0, v4, v8

    if-gtz p0, :cond_3

    cmp-long p0, v6, v2

    if-ltz p0, :cond_3

    cmp-long p0, v6, v8

    if-gtz p0, :cond_3

    const-wide/16 v2, 0x3c

    cmp-long p0, v0, v2

    if-ltz p0, :cond_2

    goto :goto_1

    .line 139
    :cond_2
    const-wide/16 v8, 0xe10

    mul-long/2addr v4, v8

    mul-long/2addr v6, v2

    add-long/2addr v4, v6

    add-long/2addr v4, v0

    return-wide v4

    .line 138
    :cond_3
    :goto_1
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public static labels(Landroid/content/Context;)[Ljava/lang/String;
    .registers 9

    .line 38
    sget-object v0, Le/e/a/PlaylistSort219;->LABELS:[[Ljava/lang/String;

    array-length v0, v0

    new-array v1, v0, [Ljava/lang/String;

    .line 39
    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_0

    .line 40
    sget-object v4, Le/e/a/PlaylistSort219;->LABELS:[[Ljava/lang/String;

    aget-object v4, v4, v3

    .line 41
    aget-object v5, v4, v2

    const/4 v6, 0x1

    aget-object v6, v4, v6

    const/4 v7, 0x2

    aget-object v4, v4, v7

    invoke-static {p0, v5, v6, v4}, Le/e/a/LocalPlaylists;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v3

    .line 39
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 43
    :cond_0
    return-object v1
.end method

.method static synthetic lambda$sortLocal$0(ILorg/json/JSONObject;Lorg/json/JSONObject;)I
    .registers 4

    .line 74
    nop

    .line 75
    const-string v0, "title"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result p1

    .line 74
    invoke-static {p1}, Ljava/lang/Integer;->signum(I)I

    move-result p1

    mul-int/2addr p0, p1

    return p0
.end method

.method static synthetic lambda$sortLocal$1(Ljava/util/IdentityHashMap;ZLorg/json/JSONObject;Lorg/json/JSONObject;)I
    .registers 6

    .line 81
    invoke-virtual {p0, p2}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, p3}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p2

    invoke-static {v0, v1, p2, p3, p1}, Le/e/a/PlaylistSort219;->compare(JJZ)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$sortPosted$2(Ljava/util/IdentityHashMap;ZLjava/lang/Object;Ljava/lang/Object;)I
    .registers 6

    .line 91
    invoke-virtual {p0, p2}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, p3}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p2

    invoke-static {v0, v1, p2, p3, p1}, Le/e/a/PlaylistSort219;->compare(JJZ)I

    move-result p0

    return p0
.end method

.method public static localId(I)I
    .registers 2

    .line 53
    if-ltz p0, :cond_0

    sget-object v0, Le/e/a/PlaylistSort219;->LOCAL:[I

    array-length v0, v0

    if-ge p0, v0, :cond_0

    sget-object v0, Le/e/a/PlaylistSort219;->LOCAL:[I

    aget p0, v0, p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static localNumber(Lorg/json/JSONObject;I)J
    .registers 9

    .line 107
    const-wide/16 v0, -0x1

    const/4 v2, 0x2

    if-ge p1, v2, :cond_0

    const-string p1, "date"

    invoke-virtual {p0, p1, v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide p0

    return-wide p0

    .line 108
    :cond_0
    const/4 v3, 0x6

    const-string v4, "videoinfo"

    const-wide/16 v5, 0x0

    if-ge p1, v3, :cond_2

    .line 109
    const-string p1, "postedAt"

    invoke-virtual {p0, p1, v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 110
    cmp-long p1, v0, v5

    if-lez p1, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PlaylistSort219;->postedInInfo(Ljava/lang/String;)J

    move-result-wide v0

    :goto_0
    return-wide v0

    .line 112
    :cond_2
    const/16 v3, 0xd

    if-lt p1, v3, :cond_3

    const-string p1, "length"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PlaylistSort219;->duration(Ljava/lang/String;)J

    move-result-wide p0

    return-wide p0

    .line 113
    :cond_3
    add-int/lit8 p1, p1, -0x7

    div-int/2addr p1, v2

    invoke-static {v2, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 114
    sget-object v2, Le/e/a/PlaylistSort219;->RAW:[Ljava/lang/String;

    aget-object v2, v2, p1

    invoke-virtual {p0, v2, v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 115
    cmp-long v5, v2, v5

    if-ltz v5, :cond_4

    return-wide v2

    .line 116
    :cond_4
    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 117
    const/16 v2, 0xa

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 118
    sget-object v3, Le/e/a/PlaylistSort219;->STATS:Ljava/util/regex/Pattern;

    const/4 v4, 0x0

    if-gez v2, :cond_5

    goto :goto_1

    :cond_5
    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :goto_1
    invoke-virtual {v3, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 119
    nop

    :goto_2
    if-gt v4, p1, :cond_7

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-nez v2, :cond_6

    return-wide v0

    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 120
    :cond_7
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PlaylistSort219;->number(Ljava/lang/String;)J

    move-result-wide p0

    return-wide p0
.end method

.method public static localPosition(I)I
    .registers 3

    .line 57
    const/4 v0, 0x0

    :goto_0
    sget-object v1, Le/e/a/PlaylistSort219;->LOCAL:[I

    array-length v1, v1

    if-ge v0, v1, :cond_1

    sget-object v1, Le/e/a/PlaylistSort219;->LOCAL:[I

    aget v1, v1, v0

    if-ne v1, p0, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 58
    :cond_1
    const/4 p0, 0x2

    return p0
.end method

.method private static number(Ljava/lang/String;)J
    .registers 3

    .line 144
    const-string v0, ""

    :try_start_0
    const-string v1, ","

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string/jumbo v1, "\uff0c"

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "\u00a0"

    .line 145
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "\u202f"

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 144
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    .line 146
    :catch_0
    move-exception p0

    .line 147
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method private static postedInInfo(Ljava/lang/String;)J
    .registers 7

    .line 124
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 125
    const-wide/16 v2, -0x1

    if-gez v1, :cond_0

    return-wide v2

    .line 126
    :cond_0
    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 127
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 128
    if-gez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :goto_0
    invoke-static {p0}, Le/e/a/VideoRows191;->millis(Ljava/lang/String;)J

    move-result-wide v0

    .line 129
    const-wide/16 v4, 0x0

    cmp-long p0, v0, v4

    if-lez p0, :cond_2

    move-wide v2, v0

    :cond_2
    return-wide v2
.end method

.method public static remoteId(I)I
    .registers 2

    .line 62
    const/4 v0, 0x2

    if-ge p0, v0, :cond_0

    add-int/lit8 p0, p0, 0xc

    goto :goto_0

    :cond_0
    sub-int/2addr p0, v0

    :goto_0
    return p0
.end method

.method public static remoteLabels(Landroid/widget/ArrayAdapter;Landroid/content/Context;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/ArrayAdapter<",
            "Ljava/lang/CharSequence;",
            ">;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .line 47
    invoke-static {p1}, Le/e/a/PlaylistSort219;->labels(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object p1

    .line 48
    invoke-virtual {p0}, Landroid/widget/ArrayAdapter;->clear()V

    .line 49
    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0xe

    if-ge v0, v1, :cond_0

    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 50
    :cond_0
    return-void
.end method

.method public static remotePosition(I)I
    .registers 3

    .line 66
    const/4 v0, 0x2

    if-ltz p0, :cond_2

    const/16 v1, 0xd

    if-le p0, v1, :cond_0

    goto :goto_1

    .line 67
    :cond_0
    const/16 v1, 0xc

    if-lt p0, v1, :cond_1

    sub-int/2addr p0, v1

    goto :goto_0

    :cond_1
    add-int/2addr p0, v0

    :goto_0
    return p0

    .line 66
    :cond_2
    :goto_1
    return v0
.end method

.method public static saveCounts(Lorg/json/JSONObject;Ljava/lang/Object;)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 95
    sget-object v0, Le/e/a/PlaylistSort219;->RAW:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 96
    invoke-static {p1, v3}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Le/e/a/PlaylistSort219;->number(Ljava/lang/String;)J

    move-result-wide v4

    .line 97
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-ltz v6, :cond_0

    invoke-virtual {p0, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 95
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 99
    :cond_1
    return-void
.end method

.method public static sortLocal(Ljava/util/List;I)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;I)V"
        }
    .end annotation

    .line 71
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_7

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    goto :goto_4

    .line 72
    :cond_0
    const/4 v0, 0x1

    if-eq p1, v1, :cond_5

    const/4 v2, 0x6

    if-ne p1, v2, :cond_1

    goto :goto_2

    .line 78
    :cond_1
    new-instance v1, Ljava/util/IdentityHashMap;

    invoke-direct {v1}, Ljava/util/IdentityHashMap;-><init>()V

    .line 79
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    invoke-static {v3, p1}, Le/e/a/PlaylistSort219;->localNumber(Lorg/json/JSONObject;I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 80
    :cond_2
    if-eq p1, v0, :cond_4

    const/4 v2, 0x5

    if-eq p1, v2, :cond_4

    const/16 v2, 0x8

    if-lt p1, v2, :cond_3

    and-int/2addr p1, v0

    if-nez p1, :cond_3

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    .line 81
    :cond_4
    :goto_1
    new-instance p1, Le/e/a/PlaylistSort219$$ExternalSyntheticLambda2;

    invoke-direct {p1, v1, v0}, Le/e/a/PlaylistSort219$$ExternalSyntheticLambda2;-><init>(Ljava/util/IdentityHashMap;Z)V

    invoke-interface {p0, p1}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    .line 82
    return-void

    .line 73
    :cond_5
    :goto_2
    if-ne p1, v1, :cond_6

    goto :goto_3

    :cond_6
    const/4 v0, -0x1

    .line 74
    :goto_3
    new-instance p1, Le/e/a/PlaylistSort219$$ExternalSyntheticLambda1;

    invoke-direct {p1, v0}, Le/e/a/PlaylistSort219$$ExternalSyntheticLambda1;-><init>(I)V

    invoke-interface {p0, p1}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    .line 76
    return-void

    .line 71
    :cond_7
    :goto_4
    return-void
.end method

.method public static sortPosted(Ljava/util/List;Z)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;Z)V"
        }
    .end annotation

    .line 85
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    return-void

    .line 86
    :cond_0
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    .line 87
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 88
    const/4 v3, 0x0

    invoke-static {v2, v3}, Le/e/a/VideoRows191;->posted(Ljava/lang/Object;Z)J

    move-result-wide v3

    .line 89
    const-wide/16 v5, 0x0

    cmp-long v5, v3, v5

    if-lez v5, :cond_1

    goto :goto_1

    :cond_1
    const-string v3, "videoinfo"

    invoke-static {v2, v3}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Le/e/a/PlaylistSort219;->postedInInfo(Ljava/lang/String;)J

    move-result-wide v3

    :goto_1
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    goto :goto_0

    .line 91
    :cond_2
    new-instance v1, Le/e/a/PlaylistSort219$$ExternalSyntheticLambda0;

    invoke-direct {v1, v0, p1}, Le/e/a/PlaylistSort219$$ExternalSyntheticLambda0;-><init>(Ljava/util/IdentityHashMap;Z)V

    invoke-interface {p0, v1}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    .line 92
    return-void
.end method
