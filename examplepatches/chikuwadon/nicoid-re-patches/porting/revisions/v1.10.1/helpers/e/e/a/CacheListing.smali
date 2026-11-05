.class public final Le/e/a/CacheListing;
.super Ljava/lang/Object;
.source "CacheListing.java"


# static fields
.field static final INFO:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Le/e/a/CacheRowInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/CacheListing;->INFO:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bind(Landroid/view/View;Ljava/lang/Object;)V
    .registers 7

    .line 6
    sget-object v0, Le/e/a/CacheListing;->INFO:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/CacheRowInfo;

    if-nez p1, :cond_b

    return-void

    :cond_b
    const v0, 0x7f08015e

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0801d3

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    instance-of v1, v0, Landroid/widget/TextView;

    if-eqz v1, :cond_24

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p1, Le/e/a/CacheRowInfo;->posted:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_24
    instance-of v0, p0, Landroid/widget/TextView;

    if-eqz v0, :cond_81

    check-cast p0, Landroid/widget/TextView;

    iget-object v0, p1, Le/e/a/CacheRowInfo;->counts:Ljava/lang/String;

    invoke-static {p0, v0}, Le/e/a/VideoCounts;->setText(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Landroid/widget/TextView;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p1, Le/e/a/CacheRowInfo;->owner:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    const-string v3, "\n"

    if-eqz v2, :cond_42

    const-string v2, ""

    goto :goto_51

    :cond_42
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p1, Le/e/a/CacheRowInfo;->owner:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_51
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object p1, p1, Le/e/a/CacheRowInfo;->transfer:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_81
    return-void
.end method

.method public static load(Ljava/util/ArrayList;Landroid/content/Context;)J
    .registers 30

    .line 10
    const-string v1, ""

    const-string v2, "postedAt"

    const-string v3, "length"

    const-string v4, "title"

    const-string v5, "first_retrieve"

    invoke-static/range {p1 .. p1}, Le/e/a/CacheFolders;->init(Landroid/content/Context;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static/range {p1 .. p1}, Le/e/a/CacheFolders;->root(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "/nicoid/nicoid_cache"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v0, Le/e/a/CacheFile;

    invoke-direct {v0, v6}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Le/e/a/CacheFile;->listFiles()[Ljava/io/File;

    move-result-object v0

    invoke-virtual/range {p0 .. p0}, Ljava/util/ArrayList;->clear()V

    const-wide/16 v7, 0x0

    if-nez v0, :cond_35

    return-wide v7

    :cond_35
    invoke-static {v6, v0}, Le/e/a/CacheComments;->clean(Ljava/lang/String;[Ljava/io/File;)V

    new-instance v0, Le/e/a/CacheFile;

    invoke-direct {v0, v6}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Le/e/a/CacheFile;->listFiles()[Ljava/io/File;

    move-result-object v9

    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    array-length v11, v9

    move-wide v14, v7

    const/4 v13, 0x0

    :goto_49
    const-string v7, "nicoid-cache"

    if-lt v13, v11, :cond_2c7

    .line 11
    array-length v8, v9

    const/4 v11, 0x0

    :goto_4f
    if-lt v11, v8, :cond_52

    .line 12
    return-wide v14

    .line 11
    :cond_52
    aget-object v0, v9, v11

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v13

    const-string v12, "(?:sm|so|nm|ss)[0-9]+\\.json"

    invoke-virtual {v13, v12}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_71

    move-object/from16 v20, v3

    move-object/from16 v22, v4

    move-object v4, v7

    move/from16 v16, v8

    move-object/from16 v23, v9

    move-wide/from16 v17, v14

    const/4 v7, 0x0

    move-object/from16 v8, p0

    move-object v3, v1

    goto/16 :goto_2b7

    :cond_71
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v12

    add-int/lit8 v12, v12, -0x5

    move/from16 v16, v8

    const/4 v8, 0x0

    invoke-virtual {v13, v8, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    :try_start_7e
    invoke-static {v0}, Le/e/a/CacheListing;->read(Ljava/io/File;)Lorg/json/JSONObject;

    move-result-object v8

    const-string v0, "e.e.a.x1"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_88
    .catch Ljava/lang/Exception; {:try_start_7e .. :try_end_88} :catch_2a1

    move-wide/from16 v17, v14

    const/4 v13, 0x0

    :try_start_8b
    new-array v14, v13, [Ljava/lang/Class;

    invoke-virtual {v0, v14}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    new-array v14, v13, [Ljava/lang/Object;

    invoke-virtual {v0, v14}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    const-string v0, "videourl"

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "https://www.nicovideo.jp/watch/"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v0, v14}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "videoid"

    invoke-static {v13, v0, v12}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "thumbnail"

    const-string v14, "thumbnailUrl"

    invoke-virtual {v8, v14, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v0, v14}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "videoTitle"

    invoke-virtual {v8, v4, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v8, v0, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v13, v4, v0}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "0"

    invoke-virtual {v8, v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14
    :try_end_ce
    .catch Ljava/lang/Exception; {:try_start_8b .. :try_end_ce} :catch_295

    const/16 v19, 0x1

    :try_start_d0
    invoke-static {v14}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v20

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v15, "%d:%02d"
    :try_end_d8
    .catch Ljava/lang/NumberFormatException; {:try_start_d0 .. :try_end_d8} :catch_105
    .catch Ljava/lang/Exception; {:try_start_d0 .. :try_end_d8} :catch_fc

    move-object/from16 v22, v4

    move-object/from16 v23, v14

    const/4 v4, 0x2

    :try_start_dd
    new-array v14, v4, [Ljava/lang/Object;

    const-wide/16 v24, 0x3c

    div-long v26, v20, v24

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const/16 v26, 0x0

    aput-object v4, v14, v26

    rem-long v20, v20, v24

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v14, v19

    invoke-static {v0, v15, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14
    :try_end_f7
    .catch Ljava/lang/NumberFormatException; {:try_start_dd .. :try_end_f7} :catch_fa
    .catch Ljava/lang/Exception; {:try_start_dd .. :try_end_f7} :catch_f8

    goto :goto_10c

    :catch_f8
    move-exception v0

    goto :goto_ff

    :catch_fa
    move-exception v0

    goto :goto_10a

    :catch_fc
    move-exception v0

    move-object/from16 v22, v4

    :goto_ff
    move-object/from16 v8, p0

    move-object/from16 v20, v3

    goto/16 :goto_29c

    :catch_105
    move-exception v0

    move-object/from16 v22, v4

    move-object/from16 v23, v14

    :goto_10a
    move-object/from16 v14, v23

    :goto_10c
    :try_start_10c
    invoke-static {v14}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-static {v13, v3, v0}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "viewCount"

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v14

    const-string v0, "commentCount"
    :try_end_11b
    .catch Ljava/lang/Exception; {:try_start_10c .. :try_end_11b} :catch_f8

    move-object/from16 v20, v3

    :try_start_11d
    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v3

    const-string v0, "mylistCount"
    :try_end_123
    .catch Ljava/lang/Exception; {:try_start_11d .. :try_end_123} :catch_28b

    move-object/from16 v21, v1

    :try_start_125
    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_129
    .catch Ljava/lang/Exception; {:try_start_125 .. :try_end_129} :catch_281

    move-object/from16 v23, v9

    :try_start_12b
    const-string v9, "rawplay"
    :try_end_12d
    .catch Ljava/lang/Exception; {:try_start_12b .. :try_end_12d} :catch_27b

    move-object/from16 v24, v7

    move-object/from16 v25, v8

    const-wide/32 v7, 0x7fffffff

    :try_start_134
    invoke-static {v7, v8, v14, v15}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v14

    long-to-int v15, v14

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-static {v13, v9, v14}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v9, "rawres"

    invoke-static {v7, v8, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v4, v3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v13, v9, v3}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v3, "rawmylis"

    invoke-static {v7, v8, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v1, v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v13, v3, v0}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v6, v12}, Le/e/a/CachedPlayback;->completedBytes(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v0

    invoke-interface {v10, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_171

    invoke-interface {v10, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    goto :goto_173

    :cond_171
    const-wide/16 v3, 0x0

    :goto_173
    const-wide/16 v7, 0x0

    invoke-static {v7, v8, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v14

    invoke-static {v3, v4, v14, v15}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    cmp-long v9, v0, v7

    if-lez v9, :cond_183

    const/4 v0, 0x0

    goto :goto_184

    :cond_183
    const/4 v0, -0x1

    :goto_184
    int-to-long v0, v0

    const-string v7, "cachesize"

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {v13, v7, v8}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v7, "cached"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {v13, v7, v8}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-wide/16 v7, 0x0

    cmp-long v9, v0, v7

    if-nez v9, :cond_19f

    const/4 v0, 0x1

    goto :goto_1a0

    :cond_19f
    const/4 v0, 0x0

    :goto_1a0
    move-object/from16 v1, v25

    invoke-static {v1, v3, v4, v0}, Le/e/a/CacheRowInfo;->from(Lorg/json/JSONObject;JZ)Le/e/a/CacheRowInfo;

    move-result-object v0

    sget-object v3, Le/e/a/CacheListing;->INFO:Ljava/util/Map;

    invoke-interface {v3, v13, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "videoinfo"

    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v9, v0, Le/e/a/CacheRowInfo;->counts:Ljava/lang/String;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v4, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, "<br>"

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v9, v0, Le/e/a/CacheRowInfo;->transfer:Ljava/lang/String;

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-static {v13, v3, v4}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1cf
    .catch Ljava/lang/Exception; {:try_start_134 .. :try_end_1cf} :catch_274

    move-object/from16 v3, v21

    :try_start_1d1
    invoke-virtual {v1, v5, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v9, "posttime"

    iget-object v0, v0, Le/e/a/CacheRowInfo;->posted:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-static {v13, v9, v0}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v13, v2, v4}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v9, 0x3

    new-array v14, v9, [Ljava/lang/String;

    const-string v0, "yyyy-MM-dd\'T\'HH:mm:ssXXX"

    const/4 v15, 0x0

    aput-object v0, v14, v15

    const-string v0, "yyyy/MM/dd HH:mm:ss"

    aput-object v0, v14, v19

    const-string v0, "yyyy-MM-dd HH:mm:ss"

    const/4 v15, 0x2

    aput-object v0, v14, v15

    const/4 v15, 0x0

    :goto_1f9
    if-lt v15, v9, :cond_1fc

    :goto_1fb
    goto :goto_219

    :cond_1fc
    aget-object v0, v14, v15
    :try_end_1fe
    .catch Ljava/lang/Exception; {:try_start_1d1 .. :try_end_1fe} :catch_26f

    :try_start_1fe
    new-instance v7, Ljava/text/SimpleDateFormat;

    sget-object v8, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-direct {v7, v0, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const-string v0, "Asia/Tokyo"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    invoke-virtual {v7, v4}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    if-eqz v0, :cond_264

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v7
    :try_end_218
    .catch Ljava/lang/Exception; {:try_start_1fe .. :try_end_218} :catch_268

    goto :goto_1fb

    :goto_219
    :try_start_219
    const-string v0, "rawpostedAt"

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v13, v0, v4}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v6, v12}, Le/e/a/CachedPlayback;->acquiredAt(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v7

    const-string v0, "rawcachedAt"

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v13, v0, v4}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "cachedAt"

    invoke-static {v7, v8}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-static {v13, v0, v4}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v1, v5, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-static {v13, v5, v0}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "isad"
    :try_end_245
    .catch Ljava/lang/Exception; {:try_start_219 .. :try_end_245} :catch_26f

    const/4 v7, 0x0

    :try_start_246
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v13, v0, v1}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "isselect"

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v13, v0, v1}, Le/e/a/CacheListing;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_256
    .catch Ljava/lang/Exception; {:try_start_246 .. :try_end_256} :catch_262

    move-object/from16 v8, p0

    :try_start_258
    invoke-virtual {v8, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_25b
    .catch Ljava/lang/Exception; {:try_start_258 .. :try_end_25b} :catch_25f

    move-object/from16 v4, v24

    goto/16 :goto_2b7

    :catch_25f
    move-exception v0

    goto/16 :goto_2b0

    :catch_262
    move-exception v0

    goto :goto_271

    :cond_264
    :goto_264
    const/4 v7, 0x0

    move-object/from16 v8, p0

    goto :goto_26a

    :catch_268
    move-exception v0

    goto :goto_264

    :goto_26a
    add-int/lit8 v15, v15, 0x1

    const-wide/16 v7, 0x0

    goto :goto_1f9

    :catch_26f
    move-exception v0

    const/4 v7, 0x0

    :goto_271
    move-object/from16 v8, p0

    goto :goto_2b0

    :catch_274
    move-exception v0

    const/4 v7, 0x0

    move-object/from16 v8, p0

    move-object/from16 v3, v21

    goto :goto_2b0

    :catch_27b
    move-exception v0

    move-object/from16 v8, p0

    move-object/from16 v24, v7

    goto :goto_288

    :catch_281
    move-exception v0

    move-object/from16 v8, p0

    move-object/from16 v24, v7

    move-object/from16 v23, v9

    :goto_288
    move-object/from16 v3, v21

    goto :goto_293

    :catch_28b
    move-exception v0

    move-object/from16 v8, p0

    move-object v3, v1

    move-object/from16 v24, v7

    move-object/from16 v23, v9

    :goto_293
    const/4 v7, 0x0

    goto :goto_2b0

    :catch_295
    move-exception v0

    move-object/from16 v8, p0

    move-object/from16 v20, v3

    move-object/from16 v22, v4

    :goto_29c
    move-object/from16 v24, v7

    move-object/from16 v23, v9

    goto :goto_2ae

    :catch_2a1
    move-exception v0

    move-object/from16 v8, p0

    move-object/from16 v20, v3

    move-object/from16 v22, v4

    move-object/from16 v24, v7

    move-object/from16 v23, v9

    move-wide/from16 v17, v14

    :goto_2ae
    const/4 v7, 0x0

    move-object v3, v1

    :goto_2b0
    const-string v1, "Unreadable metadata was retained"

    move-object/from16 v4, v24

    invoke-static {v4, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2b7
    add-int/lit8 v11, v11, 0x1

    move-object v1, v3

    move-object v7, v4

    move/from16 v8, v16

    move-wide/from16 v14, v17

    move-object/from16 v3, v20

    move-object/from16 v4, v22

    move-object/from16 v9, v23

    goto/16 :goto_4f

    .line 10
    :cond_2c7
    move-object/from16 v8, p0

    move-object/from16 v20, v3

    move-object/from16 v22, v4

    move-object v4, v7

    move-object/from16 v23, v9

    move-wide/from16 v17, v14

    const/4 v7, 0x0

    move-object v3, v1

    aget-object v0, v23, v13

    :try_start_2d6
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-nez v1, :cond_2df

    move-wide/from16 v14, v17

    goto :goto_317

    :cond_2df
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v14
    :try_end_2e3
    .catch Ljava/lang/RuntimeException; {:try_start_2d6 .. :try_end_2e3} :catch_30f

    add-long v16, v17, v14

    :try_start_2e5
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CacheFolders;->videoId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_308

    invoke-interface {v10, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_301

    invoke-interface {v10, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v18

    add-long v14, v18, v14

    :cond_301
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v10, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_308
    .catch Ljava/lang/RuntimeException; {:try_start_2e5 .. :try_end_308} :catch_30b

    :cond_308
    move-wide/from16 v14, v16

    goto :goto_317

    :catch_30b
    move-exception v0

    move-wide/from16 v14, v16

    goto :goto_312

    :catch_30f
    move-exception v0

    move-wide/from16 v14, v17

    :goto_312
    const-string v1, "Cannot inspect cache file"

    invoke-static {v4, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_317
    add-int/lit8 v13, v13, 0x1

    move-object v1, v3

    move-object/from16 v3, v20

    move-object/from16 v4, v22

    move-object/from16 v9, v23

    const-wide/16 v7, 0x0

    goto/16 :goto_49
.end method

.method static read(Ljava/io/File;)Lorg/json/JSONObject;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 8
    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Le/e/a/CacheInputStream;

    invoke-direct {v1, p0}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_51

    :try_start_6
    new-instance p0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_b
    .catchall {:try_start_6 .. :try_end_b} :catchall_43

    const/16 v2, 0x1000

    :try_start_d
    new-array v2, v2, [B

    :goto_f
    invoke-virtual {v1, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_28

    new-instance v2, Lorg/json/JSONObject;

    const-string v3, "UTF-8"

    invoke-virtual {p0, v3}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_21
    .catchall {:try_start_d .. :try_end_21} :catchall_3e

    :try_start_21
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_24
    .catchall {:try_start_21 .. :try_end_24} :catchall_43

    :try_start_24
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_27
    .catchall {:try_start_24 .. :try_end_27} :catchall_51

    return-object v2

    :cond_28
    :try_start_28
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v4

    add-int/2addr v4, v3

    const/high16 v5, 0x200000

    if-gt v4, v5, :cond_36

    const/4 v4, 0x0

    invoke-virtual {p0, v2, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_f

    :cond_36
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Metadata too large"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3e
    .catchall {:try_start_28 .. :try_end_3e} :catchall_3e

    :catchall_3e
    move-exception v0

    :try_start_3f
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->close()V

    throw v0
    :try_end_43
    .catchall {:try_start_3f .. :try_end_43} :catchall_43

    :catchall_43
    move-exception p0

    if-eqz v0, :cond_4c

    if-eq v0, p0, :cond_4d

    :try_start_48
    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_4d

    :cond_4c
    move-object v0, p0

    :cond_4d
    :goto_4d
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    throw v0
    :try_end_51
    .catchall {:try_start_48 .. :try_end_51} :catchall_51

    :catchall_51
    move-exception p0

    if-eqz v0, :cond_5a

    if-eq v0, p0, :cond_59

    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_59
    move-object p0, v0

    :cond_5a
    throw p0
.end method

.method static set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Ljava/lang/Object;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    const-string v3, "a"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v4

    aput-object p2, v1, v5

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
