.class public final Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000.\n\u0000\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u001a\u000c\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0000\u001a\u000c\u0010\u0003\u001a\u00020\u0004*\u00020\u0005H\u0000\u001a\u000c\u0010\u0006\u001a\u00020\u0002*\u00020\u0007H\u0000\u001a\u000c\u0010\u0008\u001a\u00020\u0002*\u00020\u0007H\u0000\u001a\u000c\u0010\t\u001a\u00020\u0002*\u00020\nH\u0000\u001a\u000c\u0010\u000b\u001a\u00020\n*\u00020\nH\u0000\u001a\u000c\u0010\u000c\u001a\u00020\n*\u00020\nH\u0000\u001a\u000c\u0010\r\u001a\u00020\n*\u00020\nH\u0000\u001a\u000c\u0010\u000e\u001a\u00020\n*\u00020\nH\u0000\u001a\u000c\u0010\u000f\u001a\u00020\n*\u00020\nH\u0000\u001a\u0014\u0010\u0010\u001a\u00020\u0002*\u00020\u00072\u0006\u0010\u0011\u001a\u00020\u0012H\u0000\u001a\u001e\u0010\u0013\u001a\u00020\u0004*\u00020\u00012\u0006\u0010\u0014\u001a\u00020\u00012\u0008\u0008\u0002\u0010\u0015\u001a\u00020\u0004H\u0002\u00a8\u0006\u0016"
    }
    d2 = {
        "commonToString",
        "",
        "Lnicoid/network238/okhttp3/CacheControl;",
        "commonClampToInt",
        "",
        "",
        "commonForceNetwork",
        "Lnicoid/network238/okhttp3/CacheControl$Companion;",
        "commonForceCache",
        "commonBuild",
        "Lnicoid/network238/okhttp3/CacheControl$Builder;",
        "commonNoCache",
        "commonNoStore",
        "commonOnlyIfCached",
        "commonNoTransform",
        "commonImmutable",
        "commonParse",
        "headers",
        "Lnicoid/network238/okhttp3/Headers;",
        "indexOfElement",
        "characters",
        "startIndex",
        "okhttp"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final commonBuild(Lnicoid/network238/okhttp3/CacheControl$Builder;)Lnicoid/network238/okhttp3/CacheControl;
    .registers 15

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 69
    new-instance v0, Lnicoid/network238/okhttp3/CacheControl;

    .line 70
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl$Builder;->getNoCache$okhttp()Z

    move-result v1

    .line 71
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl$Builder;->getNoStore$okhttp()Z

    move-result v2

    .line 72
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl$Builder;->getMaxAgeSeconds$okhttp()I

    move-result v3

    .line 77
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl$Builder;->getMaxStaleSeconds$okhttp()I

    move-result v8

    .line 78
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl$Builder;->getMinFreshSeconds$okhttp()I

    move-result v9

    .line 79
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl$Builder;->getOnlyIfCached$okhttp()Z

    move-result v10

    .line 80
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl$Builder;->getNoTransform$okhttp()Z

    move-result v11

    .line 81
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl$Builder;->getImmutable$okhttp()Z

    move-result v12

    .line 69
    const/4 v4, -0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v0 .. v13}, Lnicoid/network238/okhttp3/CacheControl;-><init>(ZZIIZZZIIZZZLjava/lang/String;)V

    return-object v0
.end method

.method public static final commonClampToInt(J)I
    .registers 4

    const-wide/32 v0, 0x7fffffff

    cmp-long v0, p0, v0

    if-lez v0, :cond_0

    const p0, 0x7fffffff

    return p0

    :cond_0
    long-to-int p0, p0

    return p0
.end method

.method public static final commonForceCache(Lnicoid/network238/okhttp3/CacheControl$Companion;)Lnicoid/network238/okhttp3/CacheControl;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    new-instance p0, Lnicoid/network238/okhttp3/CacheControl$Builder;

    invoke-direct {p0}, Lnicoid/network238/okhttp3/CacheControl$Builder;-><init>()V

    .line 64
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl$Builder;->onlyIfCached()Lnicoid/network238/okhttp3/CacheControl$Builder;

    move-result-object p0

    .line 65
    sget-object v0, Lnicoid/network238/kotlin/time/Duration;->Companion:Lnicoid/network238/kotlin/time/Duration$Companion;

    sget-object v0, Lnicoid/network238/kotlin/time/DurationUnit;->SECONDS:Lnicoid/network238/kotlin/time/DurationUnit;

    const v1, 0x7fffffff

    invoke-static {v1, v0}, Lnicoid/network238/kotlin/time/DurationKt;->toDuration(ILnicoid/network238/kotlin/time/DurationUnit;)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okhttp3/CacheControl$Builder;->maxStale-LRDsOJo(J)Lnicoid/network238/okhttp3/CacheControl$Builder;

    move-result-object p0

    .line 66
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl$Builder;->build()Lnicoid/network238/okhttp3/CacheControl;

    move-result-object p0

    return-object p0
.end method

.method public static final commonForceNetwork(Lnicoid/network238/okhttp3/CacheControl$Companion;)Lnicoid/network238/okhttp3/CacheControl;
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    new-instance p0, Lnicoid/network238/okhttp3/CacheControl$Builder;

    invoke-direct {p0}, Lnicoid/network238/okhttp3/CacheControl$Builder;-><init>()V

    .line 58
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl$Builder;->noCache()Lnicoid/network238/okhttp3/CacheControl$Builder;

    move-result-object p0

    .line 59
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl$Builder;->build()Lnicoid/network238/okhttp3/CacheControl;

    move-result-object p0

    return-object p0
.end method

.method public static final commonImmutable(Lnicoid/network238/okhttp3/CacheControl$Builder;)Lnicoid/network238/okhttp3/CacheControl$Builder;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 107
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/CacheControl$Builder;->setImmutable$okhttp(Z)V

    return-object p0
.end method

.method public static final commonNoCache(Lnicoid/network238/okhttp3/CacheControl$Builder;)Lnicoid/network238/okhttp3/CacheControl$Builder;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 87
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/CacheControl$Builder;->setNoCache$okhttp(Z)V

    return-object p0
.end method

.method public static final commonNoStore(Lnicoid/network238/okhttp3/CacheControl$Builder;)Lnicoid/network238/okhttp3/CacheControl$Builder;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 92
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/CacheControl$Builder;->setNoStore$okhttp(Z)V

    return-object p0
.end method

.method public static final commonNoTransform(Lnicoid/network238/okhttp3/CacheControl$Builder;)Lnicoid/network238/okhttp3/CacheControl$Builder;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 102
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/CacheControl$Builder;->setNoTransform$okhttp(Z)V

    return-object p0
.end method

.method public static final commonOnlyIfCached(Lnicoid/network238/okhttp3/CacheControl$Builder;)Lnicoid/network238/okhttp3/CacheControl$Builder;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 97
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/CacheControl$Builder;->setOnlyIfCached$okhttp(Z)V

    return-object p0
.end method

.method public static final commonParse(Lnicoid/network238/okhttp3/CacheControl$Companion;Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/CacheControl;
    .registers 31

    move-object/from16 v0, p1

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 127
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v1

    const/4 v4, 0x1

    move v7, v4

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, -0x1

    const/4 v12, -0x1

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, -0x1

    const/16 v17, -0x1

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    :goto_0
    if-ge v6, v1, :cond_13

    .line 128
    invoke-virtual {v0, v6}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v2

    .line 129
    invoke-virtual {v0, v6}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v5

    .line 132
    const-string v3, "Cache-Control"

    invoke-static {v2, v3, v4}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    if-nez v8, :cond_1

    move-object v8, v5

    goto :goto_1

    .line 141
    :cond_0
    const-string v3, "Pragma"

    invoke-static {v2, v3, v4}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_12

    :cond_1
    const/4 v7, 0x0

    :goto_1
    const/4 v2, 0x0

    .line 152
    :goto_2
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_11

    .line 154
    const-string v3, "=,;"

    invoke-static {v5, v3, v2}, Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;->indexOfElement(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    .line 155
    invoke-virtual {v5, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lnicoid/network238/kotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 158
    move/from16 v27, v4

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v4

    if-eq v3, v4, :cond_4

    invoke-virtual {v5, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v0, 0x2c

    if-eq v4, v0, :cond_4

    invoke-virtual {v5, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v4, 0x3b

    if-ne v0, v4, :cond_2

    move-object v4, v5

    goto :goto_3

    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 163
    invoke-static {v5, v3}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->indexOfNonWhitespace(Ljava/lang/String;I)I

    move-result v0

    .line 165
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_3

    invoke-virtual {v5, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x22

    if-ne v3, v4, :cond_3

    add-int/lit8 v23, v0, 0x1

    .line 169
    const/16 v22, 0x22

    const/16 v24, 0x0

    const/16 v25, 0x4

    const/16 v26, 0x0

    move-object/from16 v21, v5

    invoke-static/range {v21 .. v26}, Lnicoid/network238/kotlin/text/StringsKt;->indexOf$default(Ljava/lang/CharSequence;CIZILjava/lang/Object;)I

    move-result v0

    .line 170
    move-object/from16 v4, v21

    move/from16 v3, v23

    invoke-virtual {v4, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v0, v0, 0x1

    move-object/from16 v28, v3

    move v3, v0

    move-object/from16 v0, v28

    goto :goto_4

    .line 165
    :cond_3
    move-object v4, v5

    .line 175
    const-string v3, ",;"

    invoke-static {v4, v3, v0}, Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;->indexOfElement(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    .line 176
    invoke-virtual {v4, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/kotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    .line 158
    :cond_4
    move-object v4, v5

    .line 176
    :goto_3
    add-int/lit8 v3, v3, 0x1

    const/4 v0, 0x0

    .line 181
    :goto_4
    const-string v5, "no-cache"

    move/from16 v21, v1

    move/from16 v1, v27

    invoke-static {v5, v2, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_5

    move-object/from16 v0, p1

    move v9, v1

    move v2, v3

    move-object v5, v4

    move v4, v9

    move/from16 v1, v21

    goto/16 :goto_2

    .line 185
    :cond_5
    const-string v5, "no-store"

    invoke-static {v5, v2, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_6

    move-object/from16 v0, p1

    move v10, v1

    move v2, v3

    move-object v5, v4

    move v4, v10

    move/from16 v1, v21

    goto/16 :goto_2

    .line 189
    :cond_6
    const-string v5, "max-age"

    invoke-static {v5, v2, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 190
    const/4 v5, -0x1

    invoke-static {v0, v5}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->toNonNegativeInt(Ljava/lang/String;I)I

    move-result v11

    move-object/from16 v0, p1

    move v2, v3

    move-object v5, v4

    move v4, v1

    move/from16 v1, v21

    goto/16 :goto_2

    .line 193
    :cond_7
    const/4 v5, -0x1

    const-string v5, "s-maxage"

    invoke-static {v5, v2, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 194
    const/4 v5, -0x1

    invoke-static {v0, v5}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->toNonNegativeInt(Ljava/lang/String;I)I

    move-result v12

    move-object/from16 v0, p1

    move v2, v3

    move-object v5, v4

    move v4, v1

    move/from16 v1, v21

    goto/16 :goto_2

    .line 197
    :cond_8
    const-string v5, "private"

    invoke-static {v5, v2, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_9

    move-object/from16 v0, p1

    move v13, v1

    move v2, v3

    move-object v5, v4

    move v4, v13

    move/from16 v1, v21

    goto/16 :goto_2

    .line 201
    :cond_9
    const-string v5, "public"

    invoke-static {v5, v2, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_a

    move-object/from16 v0, p1

    move v14, v1

    move v2, v3

    move-object v5, v4

    move v4, v14

    move/from16 v1, v21

    goto/16 :goto_2

    .line 205
    :cond_a
    const-string v5, "must-revalidate"

    invoke-static {v5, v2, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_b

    move-object/from16 v0, p1

    move v15, v1

    move v2, v3

    move-object v5, v4

    move v4, v15

    move/from16 v1, v21

    goto/16 :goto_2

    .line 209
    :cond_b
    const-string v5, "max-stale"

    invoke-static {v5, v2, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 210
    const v2, 0x7fffffff

    invoke-static {v0, v2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->toNonNegativeInt(Ljava/lang/String;I)I

    move-result v16

    move-object/from16 v0, p1

    move v2, v3

    move-object v5, v4

    move v4, v1

    move/from16 v1, v21

    goto/16 :goto_2

    .line 213
    :cond_c
    const-string v5, "min-fresh"

    invoke-static {v5, v2, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_d

    .line 214
    const/4 v5, -0x1

    invoke-static {v0, v5}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->toNonNegativeInt(Ljava/lang/String;I)I

    move-result v17

    move-object/from16 v0, p1

    move v2, v3

    move-object v5, v4

    move v4, v1

    move/from16 v1, v21

    goto/16 :goto_2

    .line 217
    :cond_d
    const/4 v5, -0x1

    const-string v0, "only-if-cached"

    invoke-static {v0, v2, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_e

    move-object/from16 v0, p1

    move/from16 v18, v1

    move v2, v3

    move-object v5, v4

    move/from16 v4, v18

    move/from16 v1, v21

    goto/16 :goto_2

    .line 221
    :cond_e
    const-string v0, "no-transform"

    invoke-static {v0, v2, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_f

    move-object/from16 v0, p1

    move/from16 v19, v1

    move v2, v3

    move-object v5, v4

    move/from16 v4, v19

    move/from16 v1, v21

    goto/16 :goto_2

    .line 225
    :cond_f
    const-string v0, "immutable"

    invoke-static {v0, v2, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_10

    move-object/from16 v0, p1

    move/from16 v20, v1

    move v2, v3

    move-object v5, v4

    move/from16 v4, v20

    goto :goto_5

    :cond_10
    move-object/from16 v0, p1

    move v2, v3

    move-object v5, v4

    move v4, v1

    :goto_5
    move/from16 v1, v21

    goto/16 :goto_2

    .line 152
    :cond_11
    move/from16 v21, v1

    move v1, v4

    const/4 v5, -0x1

    goto :goto_6

    .line 141
    :cond_12
    move/from16 v21, v1

    move v1, v4

    const/4 v5, -0x1

    .line 225
    :goto_6
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, p1

    move v4, v1

    move/from16 v1, v21

    goto/16 :goto_0

    :cond_13
    if-nez v7, :cond_14

    const/16 v21, 0x0

    goto :goto_7

    :cond_14
    move-object/from16 v21, v8

    .line 236
    :goto_7
    new-instance v8, Lnicoid/network238/okhttp3/CacheControl;

    invoke-direct/range {v8 .. v21}, Lnicoid/network238/okhttp3/CacheControl;-><init>(ZZIIZZZIIZZZLjava/lang/String;)V

    return-object v8
.end method

.method public static final commonToString(Lnicoid/network238/okhttp3/CacheControl;)Ljava/lang/String;
    .registers 6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl;->getHeaderValue$okhttp()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_d

    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl;->noCache()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "no-cache, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl;->noStore()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "no-store, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl;->maxAgeSeconds()I

    move-result v1

    const-string v2, ", "

    const/4 v3, -0x1

    if-eq v1, v3, :cond_2

    const-string v1, "max-age="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl;->maxAgeSeconds()I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    :cond_2
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl;->sMaxAgeSeconds()I

    move-result v1

    if-eq v1, v3, :cond_3

    const-string v1, "s-maxage="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl;->sMaxAgeSeconds()I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    :cond_3
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl;->isPrivate()Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v1, "private, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    :cond_4
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl;->isPublic()Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v1, "public, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    :cond_5
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl;->mustRevalidate()Z

    move-result v1

    if-eqz v1, :cond_6

    const-string v1, "must-revalidate, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    :cond_6
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl;->maxStaleSeconds()I

    move-result v1

    if-eq v1, v3, :cond_7

    const-string v1, "max-stale="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl;->maxStaleSeconds()I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    :cond_7
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl;->minFreshSeconds()I

    move-result v1

    if-eq v1, v3, :cond_8

    const-string v1, "min-fresh="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl;->minFreshSeconds()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    :cond_8
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl;->onlyIfCached()Z

    move-result v1

    if-eqz v1, :cond_9

    const-string v1, "only-if-cached, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    :cond_9
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl;->noTransform()Z

    move-result v1

    if-eqz v1, :cond_a

    const-string v1, "no-transform, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    :cond_a
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/CacheControl;->immutable()Z

    move-result v1

    if-eqz v1, :cond_b

    const-string v1, "immutable, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    :cond_b
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-nez v1, :cond_c

    const-string p0, ""

    return-object p0

    .line 42
    :cond_c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/CacheControl;->setHeaderValue$okhttp(Ljava/lang/String;)V

    :cond_d
    return-object v0
.end method

.method private static final indexOfElement(Ljava/lang/String;Ljava/lang/String;I)I
    .registers 8

    .line 261
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    :goto_0
    if-ge p2, v0, :cond_1

    .line 262
    invoke-virtual {p0, p2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {p1, v1, v4, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;CZILjava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return p2

    :cond_0
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 266
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    return p0
.end method

.method static synthetic indexOfElement$default(Ljava/lang/String;Ljava/lang/String;IILjava/lang/Object;)I
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 257
    :cond_0
    invoke-static {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;->indexOfElement(Ljava/lang/String;Ljava/lang/String;I)I

    move-result p0

    return p0
.end method
