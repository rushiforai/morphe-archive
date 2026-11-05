.class public final Le/e/a/Mp4Playlist115;
.super Ljava/lang/Object;
.source "Mp4Playlist115.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/Mp4Playlist115$Fetch;,
        Le/e/a/Mp4Playlist115$Plan;,
        Le/e/a/Mp4Playlist115$Segment;
    }
.end annotation


# static fields
.field static final ATTR:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    const-string v0, "([A-Z0-9-]+)=(?:\"([^\"]*)\"|([^,]*))"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/Mp4Playlist115;->ATTR:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static attrs(Ljava/lang/String;)Ljava/util/Map;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 6
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sget-object v1, Le/e/a/Mp4Playlist115;->ATTR:Ljava/util/regex/Pattern;

    const/16 v2, 0x3a

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v3, 0x1

    add-int/2addr v2, v3

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    :goto_17
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-nez v1, :cond_1e

    return-object v0

    :cond_1e
    invoke-virtual {p0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2a

    goto :goto_2b

    :cond_2a
    const/4 v2, 0x3

    :goto_2b
    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_17
.end method

.method static filename(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 34
    if-nez p0, :cond_4

    const-string p0, ""

    :cond_4
    const-string v0, "[\\p{Cntrl}\\\\/:*?\"<>|]"

    const-string v1, "_"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_17

    move-object p0, p1

    :cond_17
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x64

    if-le v0, v1, :cond_24

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_24
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, " ["

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "].mp4"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static iv(Ljava/lang/String;J)[B
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 19
    const/16 v0, 0x10

    new-array v1, v0, [B

    if-nez p0, :cond_15

    const/16 p0, 0xf

    :goto_8
    const/16 v0, 0x8

    if-ge p0, v0, :cond_d

    return-object v1

    :cond_d
    long-to-int v2, p1

    int-to-byte v2, v2

    aput-byte v2, v1, p0

    ushr-long/2addr p1, v0

    add-int/lit8 p0, p0, -0x1

    goto :goto_8

    :cond_15
    const-string p1, "^0[xX]"

    const-string p2, ""

    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "[0-9a-fA-F]{1,32}"

    invoke-virtual {p0, p1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_61

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    rem-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_3c

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "0"

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_3c
    const/4 p1, 0x0

    :goto_3d
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    div-int/lit8 p2, p2, 0x2

    if-lt p1, p2, :cond_46

    return-object v1

    :cond_46
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    div-int/lit8 p2, p2, 0x2

    rsub-int/lit8 p2, p2, 0x10

    add-int/2addr p2, p1

    mul-int/lit8 v2, p1, 0x2

    add-int/lit8 v3, v2, 0x2

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v2

    int-to-byte v2, v2

    aput-byte v2, v1, p2

    add-int/lit8 p1, p1, 0x1

    goto :goto_3d

    :cond_61
    new-instance p0, Ljava/io/IOException;

    const-string p1, "HLS\u306eIV\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static load(Ljava/net/URL;Le/e/a/Mp4Playlist115$Fetch;)Ljava/util/List;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            "Le/e/a/Mp4Playlist115$Fetch;",
            ")",
            "Ljava/util/List<",
            "Le/e/a/Mp4Playlist115$Plan;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 12
    invoke-interface {p1, p0}, Le/e/a/Mp4Playlist115$Fetch;->text(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, "#EXTM3U"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e1

    .line 13
    const-string v1, "\\r?\\n"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 14
    const/4 v2, 0x0

    move v3, v2

    :goto_18
    array-length v4, v1

    const-string v5, "AUDIO"

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-lt v3, v4, :cond_22

    move-object v3, v6

    move-object v4, v3

    goto :goto_63

    :cond_22
    aget-object v4, v1, v3

    const-string v8, "#EXT-X-STREAM-INF:"

    invoke-virtual {v4, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_dd

    aget-object v4, v1, v3

    invoke-static {v4}, Le/e/a/Mp4Playlist115;->attrs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    add-int/2addr v3, v7

    :goto_39
    array-length v8, v1

    if-ge v3, v8, :cond_4c

    aget-object v8, v1, v3

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_49

    goto :goto_4c

    :cond_49
    add-int/lit8 v3, v3, 0x1

    goto :goto_39

    :cond_4c
    :goto_4c
    array-length v8, v1

    if-ge v3, v8, :cond_d5

    aget-object v8, v1, v3

    const-string v9, "#"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_d5

    aget-object v3, v1, v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Le/e/a/Mp4Playlist115;->resolve(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v3

    .line 15
    :goto_63
    if-nez v3, :cond_72

    new-array p1, v7, [Le/e/a/Mp4Playlist115$Plan;

    invoke-static {p0, v0}, Le/e/a/Mp4Playlist115;->parse(Ljava/net/URL;Ljava/lang/String;)Le/e/a/Mp4Playlist115$Plan;

    move-result-object p0

    aput-object p0, p1, v2

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 16
    :cond_72
    array-length v0, v1

    :goto_73
    if-lt v2, v0, :cond_76

    goto :goto_ae

    :cond_76
    aget-object v7, v1, v2

    const-string v8, "#EXT-X-MEDIA:"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_d2

    invoke-static {v7}, Le/e/a/Mp4Playlist115;->attrs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v7

    const-string v8, "TYPE"

    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d2

    const-string v8, "GROUP-ID"

    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v4, v8}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d2

    const-string v8, "URI"

    invoke-interface {v7, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_d2

    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p0, v0}, Le/e/a/Mp4Playlist115;->resolve(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v6

    .line 17
    :goto_ae
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1, v3}, Le/e/a/Mp4Playlist115$Fetch;->text(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Le/e/a/Mp4Playlist115;->parse(Ljava/net/URL;Ljava/lang/String;)Le/e/a/Mp4Playlist115$Plan;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    if-eqz v6, :cond_d1

    invoke-virtual {v6, v3}, Ljava/net/URL;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d1

    invoke-interface {p1, v6}, Le/e/a/Mp4Playlist115$Fetch;->text(Ljava/net/URL;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v6, p1}, Le/e/a/Mp4Playlist115;->parse(Ljava/net/URL;Ljava/lang/String;)Le/e/a/Mp4Playlist115$Plan;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_d1
    return-object p0

    .line 16
    :cond_d2
    add-int/lit8 v2, v2, 0x1

    goto :goto_73

    .line 14
    :cond_d5
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u6620\u50cf\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_dd
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_18

    .line 12
    :cond_e1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "HLS\u60c5\u5831\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static parse(Ljava/net/URL;Ljava/lang/String;)Le/e/a/Mp4Playlist115$Plan;
    .registers 25
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 21
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "BYTERANGE"

    const-string v3, "KEYFORMAT"

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const-string v5, "#EXTM3U"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_270

    const-string v4, "#EXT-X-ENDLIST"

    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_270

    .line 22
    new-instance v4, Le/e/a/Mp4Playlist115$Plan;

    invoke-direct {v4}, Le/e/a/Mp4Playlist115$Plan;-><init>()V

    .line 23
    const-string v5, "\\r?\\n"

    invoke-virtual {v1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v5, v1

    const-wide/16 v7, 0x0

    move-wide v13, v7

    move-wide/from16 v16, v13

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v15, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    :goto_36
    if-lt v10, v5, :cond_97

    .line 31
    iget-object v0, v4, Le/e/a/Mp4Playlist115$Plan;->segments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_8f

    iget-object v0, v4, Le/e/a/Mp4Playlist115$Plan;->segments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const v1, 0x30d40

    if-gt v0, v1, :cond_87

    iget-object v0, v4, Le/e/a/Mp4Playlist115$Plan;->segments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move-wide v1, v7

    const/4 v6, 0x1

    :goto_53
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_61

    if-eqz v6, :cond_5c

    goto :goto_5e

    :cond_5c
    const-wide/16 v1, -0x1

    :goto_5e
    iput-wide v1, v4, Le/e/a/Mp4Playlist115$Plan;->bytes:J

    return-object v4

    :cond_61
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/Mp4Playlist115$Segment;

    iget-wide v9, v3, Le/e/a/Mp4Playlist115$Segment;->length:J

    cmp-long v5, v9, v7

    if-gez v5, :cond_6f

    const/4 v6, 0x0

    goto :goto_53

    :cond_6f
    const-wide v9, 0x7fffffffffffffffL

    sub-long/2addr v9, v1

    iget-wide v11, v3, Le/e/a/Mp4Playlist115$Segment;->length:J

    cmp-long v5, v9, v11

    if-ltz v5, :cond_7f

    iget-wide v9, v3, Le/e/a/Mp4Playlist115$Segment;->length:J

    add-long/2addr v1, v9

    goto :goto_53

    :cond_7f
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u5bb9\u91cf\u304c\u5927\u304d\u3059\u304e\u307e\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_87
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u52d5\u753b\u304c\u9577\u3059\u304e\u307e\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_8f
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u52d5\u753b\u30c7\u30fc\u30bf\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 23
    :cond_97
    aget-object v21, v1, v10

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 24
    :try_start_9d
    const-string v7, "#EXT-X-MEDIA-SEQUENCE:"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_c7

    const/16 v7, 0x16

    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v13

    const-wide/16 v6, 0x0

    cmp-long v8, v13, v6

    if-ltz v8, :cond_c1

    move-object/from16 v22, v1

    move-object/from16 v20, v2

    move-wide/from16 v0, v16

    move-object/from16 v2, v19

    const-wide/16 v16, 0x0

    goto/16 :goto_24f

    :cond_c1
    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0}, Ljava/lang/NumberFormatException;-><init>()V

    throw v0

    .line 25
    :cond_c7
    const-string v7, "#EXT-X-DISCONTINUITY"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_25f

    const-string v7, "#EXT-X-GAP"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_25f

    .line 26
    const-string v7, "#EXT-X-KEY:"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7
    :try_end_dd
    .catch Ljava/lang/NumberFormatException; {:try_start_9d .. :try_end_dd} :catch_267

    const-string v8, "URI"

    if-eqz v7, :cond_141

    :try_start_e1
    invoke-static {v6}, Le/e/a/Mp4Playlist115;->attrs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v6

    const-string v7, "METHOD"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    const-string v11, "NONE"

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_103

    move-object/from16 v22, v1

    move-object/from16 v20, v2

    move-wide/from16 v0, v16

    move-object/from16 v2, v19

    const/4 v11, 0x0

    const/4 v12, 0x0

    :goto_ff
    const-wide/16 v16, 0x0

    goto/16 :goto_24f

    :cond_103
    const-string v11, "AES-128"

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_139

    invoke-interface {v6, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_11d

    const-string v7, "identity"

    invoke-interface {v6, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_139

    :cond_11d
    invoke-interface {v6, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-static {v0, v7}, Le/e/a/Mp4Playlist115;->resolve(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v11

    const-string v7, "IV"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object v12, v6

    check-cast v12, Ljava/lang/String;

    move-object/from16 v22, v1

    move-object/from16 v20, v2

    move-wide/from16 v0, v16

    move-object/from16 v2, v19

    goto :goto_ff

    :cond_139
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u3053\u306e\u6697\u53f7\u5316\u5f62\u5f0f\u306b\u306f\u5bfe\u5fdc\u3057\u3066\u3044\u307e\u305b\u3093"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 27
    :cond_141
    const-string v7, "#EXT-X-MAP:"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1d3

    invoke-static {v6}, Le/e/a/Mp4Playlist115;->attrs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-interface {v6, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/String;

    move-object/from16 v22, v1

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v7, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "|"

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz v15, :cond_183

    invoke-virtual {v15, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_17b

    goto :goto_183

    :cond_17b
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u9014\u4e2d\u3067\u5f62\u5f0f\u304c\u5909\u308f\u308b\u914d\u4fe1\u306b\u306f\u5bfe\u5fdc\u3057\u3066\u3044\u307e\u305b\u3093"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_182
    throw v0

    :cond_183
    :goto_183
    if-nez v15, :cond_1c4

    new-instance v7, Le/e/a/Mp4Playlist115$Segment;

    invoke-direct {v7}, Le/e/a/Mp4Playlist115$Segment;-><init>()V

    invoke-interface {v6, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v0, v8}, Le/e/a/Mp4Playlist115;->resolve(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v8

    iput-object v8, v7, Le/e/a/Mp4Playlist115$Segment;->url:Ljava/net/URL;

    const/4 v8, 0x1

    iput-boolean v8, v7, Le/e/a/Mp4Playlist115$Segment;->init:Z

    iput-object v11, v7, Le/e/a/Mp4Playlist115$Segment;->key:Ljava/net/URL;

    if-eqz v11, :cond_1a8

    if-eqz v12, :cond_1a0

    goto :goto_1a8

    :cond_1a0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u521d\u671f\u5316\u30c7\u30fc\u30bf\u306eIV\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_182

    :cond_1a8
    :goto_1a8
    invoke-static {v12, v13, v14}, Le/e/a/Mp4Playlist115;->iv(Ljava/lang/String;J)[B

    move-result-object v8

    iput-object v8, v7, Le/e/a/Mp4Playlist115$Segment;->iv:[B

    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    move-object/from16 v21, v1

    move-object/from16 v20, v2

    const-wide/16 v1, 0x0

    const/4 v8, 0x0

    invoke-static {v7, v6, v1, v2, v8}, Le/e/a/Mp4Playlist115;->range(Le/e/a/Mp4Playlist115$Segment;Ljava/lang/String;JZ)V

    iget-object v1, v4, Le/e/a/Mp4Playlist115$Plan;->segments:Ljava/util/List;

    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1c9

    :cond_1c4
    move-object/from16 v21, v1

    move-object/from16 v20, v2

    const/4 v8, 0x0

    :goto_1c9
    move-wide/from16 v0, v16

    move-object/from16 v2, v19

    move-object/from16 v15, v21

    const-wide/16 v16, 0x0

    goto/16 :goto_24f

    .line 28
    :cond_1d3
    move-object/from16 v22, v1

    move-object/from16 v20, v2

    const/4 v1, 0x0

    const/4 v8, 0x1

    const-string v2, "#EXT-X-BYTERANGE:"

    invoke-virtual {v6, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1ee

    const/16 v2, 0x11

    invoke-virtual {v6, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    move-wide/from16 v0, v16

    move-object/from16 v2, v19

    const-wide/16 v16, 0x0

    goto :goto_24f

    .line 29
    :cond_1ee
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_249

    const-string v2, "#"

    invoke-virtual {v6, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_249

    new-instance v2, Le/e/a/Mp4Playlist115$Segment;

    invoke-direct {v2}, Le/e/a/Mp4Playlist115$Segment;-><init>()V

    invoke-static {v0, v6}, Le/e/a/Mp4Playlist115;->resolve(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v6

    iput-object v6, v2, Le/e/a/Mp4Playlist115$Segment;->url:Ljava/net/URL;

    iput-object v11, v2, Le/e/a/Mp4Playlist115$Segment;->key:Ljava/net/URL;

    invoke-static {v12, v13, v14}, Le/e/a/Mp4Playlist115;->iv(Ljava/lang/String;J)[B

    move-result-object v6

    iput-object v6, v2, Le/e/a/Mp4Playlist115$Segment;->iv:[B

    const-wide/16 v6, 0x1

    add-long/2addr v6, v13

    iput-wide v13, v2, Le/e/a/Mp4Playlist115$Segment;->sequence:J

    if-eqz v18, :cond_222

    iget-object v13, v2, Le/e/a/Mp4Playlist115$Segment;->url:Ljava/net/URL;

    move-object/from16 v14, v19

    invoke-virtual {v13, v14}, Ljava/net/URL;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_222

    move v13, v8

    goto :goto_223

    :cond_222
    move v13, v1

    :goto_223
    move-wide/from16 v0, v16

    invoke-static {v2, v9, v0, v1, v13}, Le/e/a/Mp4Playlist115;->range(Le/e/a/Mp4Playlist115$Segment;Ljava/lang/String;JZ)V

    iget-object v0, v4, Le/e/a/Mp4Playlist115$Plan;->segments:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-wide v0, v2, Le/e/a/Mp4Playlist115$Segment;->offset:J

    iget-wide v13, v2, Le/e/a/Mp4Playlist115$Segment;->length:J

    const-wide/16 v16, 0x0

    cmp-long v13, v13, v16

    if-lez v13, :cond_23a

    iget-wide v13, v2, Le/e/a/Mp4Playlist115$Segment;->length:J

    goto :goto_23c

    :cond_23a
    move-wide/from16 v13, v16

    :goto_23c
    add-long/2addr v0, v13

    iget-object v2, v2, Le/e/a/Mp4Playlist115$Segment;->url:Ljava/net/URL;

    if-eqz v9, :cond_244

    move/from16 v18, v8

    goto :goto_246

    :cond_244
    const/16 v18, 0x0

    .line 30
    :goto_246
    move-wide v13, v6

    const/4 v9, 0x0

    goto :goto_24f

    .line 29
    :cond_249
    move-wide/from16 v0, v16

    move-object/from16 v2, v19

    const-wide/16 v16, 0x0

    .line 23
    :goto_24f
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v19, v2

    move-wide/from16 v7, v16

    move-object/from16 v2, v20

    move-wide/from16 v16, v0

    move-object/from16 v1, v22

    move-object/from16 v0, p0

    goto/16 :goto_36

    .line 25
    :cond_25f
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u4e0d\u9023\u7d9a\u306a\u914d\u4fe1\u306fMP4\u3078\u4fdd\u5b58\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_267
    .catch Ljava/lang/NumberFormatException; {:try_start_e1 .. :try_end_267} :catch_267

    .line 30
    :catch_267
    move-exception v0

    new-instance v1, Ljava/io/IOException;

    const-string v2, "HLS\u306e\u6570\u5024\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 21
    :cond_270
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u5b8c\u7d50\u3057\u3066\u3044\u306a\u3044\u914d\u4fe1\u306b\u306f\u5bfe\u5fdc\u3057\u3066\u3044\u307e\u305b\u3093"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static range(Le/e/a/Mp4Playlist115$Segment;Ljava/lang/String;JZ)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 33
    if-nez p1, :cond_3

    return-void

    :cond_3
    :try_start_3
    const-string v0, "@"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p1

    array-length v0, p1

    const/4 v1, 0x2

    if-gt v0, v1, :cond_4b

    array-length v0, p1

    const/4 v2, 0x1

    if-ne v0, v2, :cond_14

    if-eqz p4, :cond_4b

    :cond_14
    const/4 p4, 0x0

    aget-object p4, p1, p4

    invoke-static {p4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    iput-wide v3, p0, Le/e/a/Mp4Playlist115$Segment;->length:J

    array-length p4, p1

    if-ne p4, v1, :cond_26

    aget-object p1, p1, v2

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p2

    :cond_26
    iput-wide p2, p0, Le/e/a/Mp4Playlist115$Segment;->offset:J

    iget-wide p1, p0, Le/e/a/Mp4Playlist115$Segment;->length:J

    const-wide/16 p3, 0x0

    cmp-long p1, p1, p3

    if-lez p1, :cond_45

    iget-wide p1, p0, Le/e/a/Mp4Playlist115$Segment;->offset:J

    cmp-long p1, p1, p3

    if-ltz p1, :cond_45

    iget-wide p1, p0, Le/e/a/Mp4Playlist115$Segment;->offset:J

    iget-wide p3, p0, Le/e/a/Mp4Playlist115$Segment;->length:J

    const-wide v0, 0x7fffffffffffffffL

    sub-long/2addr v0, p3

    cmp-long p0, p1, v0

    if-gtz p0, :cond_45

    return-void

    :cond_45
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0}, Ljava/lang/NumberFormatException;-><init>()V

    :goto_4a
    throw p0

    :cond_4b
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0}, Ljava/lang/NumberFormatException;-><init>()V
    :try_end_50
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_50} :catch_51

    goto :goto_4a

    :catch_51
    move-exception p0

    new-instance p1, Ljava/io/IOException;

    const-string p2, "HLS\u306e\u7bc4\u56f2\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {p1, p2, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method static resolve(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 7
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0, p1}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    const-string p0, "https"

    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_27

    invoke-virtual {v0}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_27

    invoke-virtual {v0}, Ljava/net/URL;->getPort()I

    move-result p0

    const/4 p1, -0x1

    if-eq p0, p1, :cond_26

    invoke-virtual {v0}, Ljava/net/URL;->getPort()I

    move-result p0

    const/16 p1, 0x1bb

    if-ne p0, p1, :cond_27

    :cond_26
    return-object v0

    :cond_27
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u5b89\u5168\u306a\u914d\u4fe1URL\u3067\u306f\u3042\u308a\u307e\u305b\u3093"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
