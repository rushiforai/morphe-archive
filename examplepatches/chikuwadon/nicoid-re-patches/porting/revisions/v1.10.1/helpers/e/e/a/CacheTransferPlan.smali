.class final Le/e/a/CacheTransferPlan;
.super Ljava/lang/Object;
.source "CacheTransferPlan.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CacheTransferPlan$Fetch;
    }
.end annotation


# static fields
.field private static final RANGE:Ljava/util/regex/Pattern;

.field private static final URI:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 10
    const-string v0, "URI=\"([^\"]+)\""

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/CacheTransferPlan;->URI:Ljava/util/regex/Pattern;

    .line 11
    const-string v0, "BYTERANGE=\"([0-9]+)(?:@([0-9]+))?\""

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/CacheTransferPlan;->RANGE:Ljava/util/regex/Pattern;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static bytes(Ljava/net/URL;Le/e/a/CacheTransferPlan$Fetch;)J
    .registers 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 18
    move-object/from16 v0, p1

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    const/4 v3, 0x0

    move-object/from16 v4, p0

    invoke-static {v4, v0, v1, v2, v3}, Le/e/a/CacheTransferPlan;->walk(Ljava/net/URL;Le/e/a/CacheTransferPlan$Fetch;Ljava/util/Map;Ljava/util/Set;I)V

    .line 19
    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v2

    invoke-interface {v0, v2}, Le/e/a/CacheTransferPlan$Fetch;->assets(I)V

    .line 20
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 21
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_2b
    :goto_2b
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/4 v7, 0x2

    const-string v8, "\\|"

    const-wide/16 v9, 0x0

    if-nez v6, :cond_ab

    .line 23
    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v4

    const/16 v5, 0x8

    const-wide/16 v11, -0x1

    if-le v4, v5, :cond_41

    return-wide v11

    .line 24
    :cond_41
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move-wide v4, v9

    :goto_4a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_56

    .line 29
    cmp-long v0, v4, v9

    if-lez v0, :cond_55

    move-wide v11, v4

    :cond_55
    return-wide v11

    .line 24
    :cond_56
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 25
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Long;

    invoke-virtual {v13}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    .line 26
    cmp-long v15, v13, v9

    if-gtz v15, :cond_92

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6, v8, v7}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v6

    aget-object v6, v6, v3

    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Long;

    if-nez v13, :cond_8e

    new-instance v13, Ljava/net/URL;

    invoke-direct {v13, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v13}, Le/e/a/CacheTransferPlan$Fetch;->length(Ljava/net/URL;)J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-interface {v2, v6, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8e
    invoke-virtual {v13}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    .line 27
    :cond_92
    cmp-long v6, v13, v9

    if-gtz v6, :cond_97

    return-wide v11

    :cond_97
    const-wide v15, 0x7fffffffffffffffL

    sub-long/2addr v15, v4

    cmp-long v6, v13, v15

    if-gtz v6, :cond_a3

    add-long/2addr v4, v13

    goto :goto_4a

    :cond_a3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Transfer size overflow"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 21
    :cond_ab
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Long;

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    cmp-long v13, v11, v9

    if-gtz v13, :cond_2b

    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6, v8, v7}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v6

    aget-object v6, v6, v3

    invoke-interface {v4, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2b
.end method

.method private static parseRange(Ljava/lang/String;J)[J
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 32
    :try_start_0
    const-string v0, "@"

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    const/4 v1, 0x2

    if-gt v0, v1, :cond_3d

    const/4 v0, 0x0

    aget-object v2, p0, v0

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    array-length v4, p0

    const/4 v5, 0x1

    if-ne v4, v1, :cond_1c

    aget-object p0, p0, v5

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p1

    :cond_1c
    const-wide/16 v6, 0x0

    cmp-long p0, v2, v6

    if-lez p0, :cond_37

    cmp-long p0, p1, v6

    if-ltz p0, :cond_37

    const-wide v6, 0x7fffffffffffffffL

    sub-long/2addr v6, v2

    cmp-long p0, p1, v6

    if-gtz p0, :cond_37

    new-array p0, v1, [J

    aput-wide v2, p0, v0

    aput-wide p1, p0, v5

    return-object p0

    :cond_37
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0}, Ljava/lang/NumberFormatException;-><init>()V

    :goto_3c
    throw p0

    :cond_3d
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0}, Ljava/lang/NumberFormatException;-><init>()V
    :try_end_42
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_42} :catch_43

    goto :goto_3c

    .line 33
    :catch_43
    move-exception p0

    new-instance p1, Ljava/io/IOException;

    const-string p2, "Invalid byte range"

    invoke-direct {p1, p2, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method private static walk(Ljava/net/URL;Le/e/a/CacheTransferPlan$Fetch;Ljava/util/Map;Ljava/util/Set;I)V
    .registers 30
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            "Le/e/a/CacheTransferPlan$Fetch;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 36
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move/from16 v4, p4

    const/4 v5, 0x4

    if-gt v4, v5, :cond_21f

    invoke-virtual/range {p0 .. p0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_19

    goto/16 :goto_21f

    .line 37
    :cond_19
    invoke-interface {v1, v0}, Le/e/a/CacheTransferPlan$Fetch;->text(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "#EXTM3U"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_217

    .line 38
    nop

    .line 39
    const-string v6, "\\r?\\n"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    array-length v6, v5

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const-wide/16 v16, 0x0

    :goto_35
    if-lt v11, v6, :cond_38

    .line 61
    return-void

    .line 39
    :cond_38
    aget-object v18, v5, v11

    .line 40
    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    const-string v7, "#EXT-X-STREAM-INF"

    invoke-virtual {v10, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_55

    move-object v8, v3

    move-object/from16 v21, v5

    move/from16 v22, v6

    move/from16 v23, v11

    move/from16 v24, v14

    const-wide/16 v3, 0x0

    const/4 v12, 0x1

    const/4 v14, 0x0

    goto/16 :goto_20a

    .line 41
    :cond_55
    const-string v7, "#EXT-X-BYTERANGE:"

    invoke-virtual {v10, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_71

    const/16 v7, 0x11

    invoke-virtual {v10, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    move-object v8, v3

    move-object/from16 v21, v5

    move/from16 v22, v6

    move/from16 v23, v11

    move/from16 v24, v14

    const-wide/16 v3, 0x0

    const/4 v14, 0x0

    goto/16 :goto_20a

    .line 42
    :cond_71
    const-string v7, "#"

    invoke-virtual {v10, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    const-wide/16 v19, -0x1

    const-string v8, ".m3u8"

    move-object/from16 v21, v5

    const-string v5, "@"

    move/from16 v22, v6

    const-string v6, "|"

    if-eqz v7, :cond_157

    .line 43
    sget-object v7, Le/e/a/CacheTransferPlan;->URI:Ljava/util/regex/Pattern;

    invoke-virtual {v7, v10}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->find()Z

    move-result v23

    if-nez v23, :cond_99

    move/from16 v23, v11

    move/from16 v24, v14

    const-wide/16 v3, 0x0

    goto/16 :goto_163

    .line 44
    :cond_99
    move/from16 v23, v11

    new-instance v11, Ljava/net/URL;

    move/from16 v24, v14

    const/4 v14, 0x1

    invoke-virtual {v7, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v11, v0, v7}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_ba

    add-int/lit8 v5, v4, 0x1

    invoke-static {v11, v1, v2, v3, v5}, Le/e/a/CacheTransferPlan;->walk(Ljava/net/URL;Le/e/a/CacheTransferPlan$Fetch;Ljava/util/Map;Ljava/util/Set;I)V

    const-wide/16 v3, 0x0

    goto/16 :goto_163

    .line 45
    :cond_ba
    sget-object v7, Le/e/a/CacheTransferPlan;->RANGE:Ljava/util/regex/Pattern;

    invoke-virtual {v7, v10}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    .line 47
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_12e

    new-instance v8, Ljava/lang/StringBuilder;

    const/4 v10, 0x1

    invoke-virtual {v7, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v10, 0x2

    invoke-virtual {v7, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    if-nez v14, :cond_de

    const-string v7, ""

    goto :goto_ef

    :cond_de
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    :goto_ef
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-wide/16 v3, 0x0

    invoke-static {v7, v3, v4}, Le/e/a/CacheTransferPlan;->parseRange(Ljava/lang/String;J)[J

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v8, 0x0

    aget-wide v10, v7, v8

    invoke-virtual {v6, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x1

    aget-wide v10, v7, v6

    invoke-virtual {v5, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aget-wide v6, v7, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_163

    .line 48
    :cond_12e
    const-wide/16 v3, 0x0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "#EXT-X-KEY:"

    invoke-virtual {v10, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_14f

    const-wide/16 v19, 0x10

    :cond_14f
    invoke-static/range {v19 .. v20}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_163

    .line 50
    :cond_157
    move/from16 v23, v11

    move/from16 v24, v14

    const-wide/16 v3, 0x0

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_168

    .line 39
    :goto_163
    move-object/from16 v8, p3

    const/4 v14, 0x0

    goto/16 :goto_20a

    .line 51
    :cond_168
    new-instance v7, Ljava/net/URL;

    invoke-direct {v7, v0, v10}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 52
    if-nez v12, :cond_1f5

    invoke-virtual {v7}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_17f

    move-wide/from16 v10, v16

    const/4 v6, 0x1

    const/4 v14, 0x0

    goto/16 :goto_1f9

    .line 55
    :cond_17f
    invoke-virtual {v7}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v7

    .line 56
    if-nez v13, :cond_1a0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static/range {v19 .. v20}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v14, 0x0

    const/4 v15, 0x0

    goto :goto_1f0

    .line 57
    :cond_1a0
    invoke-virtual {v13, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1b7

    if-eqz v15, :cond_1af

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1af

    goto :goto_1b7

    :cond_1af
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Missing implicit range offset"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1b7
    :goto_1b7
    move-wide/from16 v10, v16

    invoke-static {v13, v10, v11}, Le/e/a/CacheTransferPlan;->parseRange(Ljava/lang/String;J)[J

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v14, 0x0

    aget-wide v9, v8, v14

    invoke-virtual {v6, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x1

    aget-wide v9, v8, v6

    invoke-virtual {v5, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aget-wide v9, v8, v14

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-interface {v2, v5, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    aget-wide v9, v8, v6

    aget-wide v16, v8, v14

    add-long v16, v9, v16

    const/4 v15, 0x1

    .line 58
    :goto_1f0
    move-object/from16 v8, p3

    move-object v9, v7

    const/4 v13, 0x0

    goto :goto_20a

    .line 52
    :cond_1f5
    move-wide/from16 v10, v16

    const/4 v6, 0x1

    const/4 v14, 0x0

    .line 53
    :goto_1f9
    if-nez v24, :cond_205

    add-int/lit8 v5, p4, 0x1

    move-object/from16 v8, p3

    invoke-static {v7, v1, v2, v8, v5}, Le/e/a/CacheTransferPlan;->walk(Ljava/net/URL;Le/e/a/CacheTransferPlan$Fetch;Ljava/util/Map;Ljava/util/Set;I)V

    const/16 v24, 0x1

    goto :goto_207

    :cond_205
    move-object/from16 v8, p3

    .line 54
    :goto_207
    move-wide/from16 v16, v10

    const/4 v12, 0x0

    .line 39
    :goto_20a
    add-int/lit8 v11, v23, 0x1

    move/from16 v4, p4

    move-object v3, v8

    move-object/from16 v5, v21

    move/from16 v6, v22

    move/from16 v14, v24

    goto/16 :goto_35

    .line 37
    :cond_217
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid playlist"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 36
    :cond_21f
    :goto_21f
    return-void
.end method
