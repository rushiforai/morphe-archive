.class final Lapp/yydarlinker/deepseekcaptions/CaptionDocument;
.super Ljava/lang/Object;
.source "CaptionDocument.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;,
        Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;
    }
.end annotation


# direct methods
.method static bridge synthetic -$$Nest$smrequireSameSize(Ljava/util/List;Ljava/util/List;)V
    .registers 2

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->requireSameSize(Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static varargs firstTime(Lorg/w3c/dom/Element;Z[Ljava/lang/String;)J
    .registers 9

    .line 285
    array-length v0, p2

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v0, :cond_25

    aget-object v2, p2, v1

    .line 286
    invoke-interface {p0, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_22

    .line 287
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_17

    goto :goto_22

    .line 288
    :cond_17
    invoke-static {v2, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->parseTime(Ljava/lang/String;Z)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-ltz v4, :cond_22

    return-wide v2

    :cond_22
    :goto_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_25
    const-wide/16 p0, -0x1

    return-wide p0
.end method

.method private static looksLikeSrt(Ljava/lang/String;)Z
    .registers 2

    .line 325
    const-string v0, "(?s)^\\d+\\s*\\R\\d{1,2}:\\d{2}:\\d{2}[,.]\\d{3}\\s+-->.*"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static normalizeCueText(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 329
    const-string v0, ""

    if-nez p0, :cond_5

    return-object v0

    :cond_5
    const/16 v1, 0xa0

    const/16 v2, 0x20

    .line 330
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    const-string v1, "\r"

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static normalizeEnds(Ljava/util/List;)Ljava/util/List;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;",
            ">;)",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;",
            ">;"
        }
    .end annotation

    .line 266
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0

    .line 267
    :cond_9
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    .line 268
    :goto_13
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_59

    .line 269
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;

    .line 270
    iget-wide v3, v2, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->endMs:J

    add-int/lit8 v1, v1, 0x1

    .line 271
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    if-ge v1, v5, :cond_40

    .line 272
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;

    iget-wide v5, v5, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->startMs:J

    .line 275
    iget-wide v7, v2, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->startMs:J

    cmp-long v7, v3, v7

    if-gtz v7, :cond_38

    move-wide v3, v5

    :cond_38
    const-wide/16 v7, 0xfa0

    add-long/2addr v5, v7

    cmp-long v7, v3, v5

    if-lez v7, :cond_40

    move-wide v3, v5

    .line 278
    :cond_40
    iget-wide v5, v2, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->startMs:J

    cmp-long v5, v3, v5

    if-gtz v5, :cond_4b

    iget-wide v3, v2, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->startMs:J

    const-wide/16 v5, 0x7d0

    add-long/2addr v3, v5

    :cond_4b
    move-wide v8, v3

    .line 279
    new-instance v5, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;

    iget-wide v6, v2, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->startMs:J

    iget-object v10, v2, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->text:Ljava/lang/String;

    invoke-direct/range {v5 .. v10}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;-><init>(JJLjava/lang/String;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_13

    .line 281
    :cond_59
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static parse([BLjava/lang/String;)Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-eqz p0, :cond_77

    .line 50
    array-length v0, p0

    if-eqz v0, :cond_77

    .line 51
    new-instance v0, Ljava/lang/String;

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p0, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 52
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 54
    const-string v2, "{"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_25

    const-string v2, "\"events\""

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_25

    .line 55
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->parseJson3(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;

    move-result-object p0

    return-object p0

    .line 57
    :cond_25
    const-string v2, "<?xml"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_72

    const-string v2, "<transcript"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_72

    const-string v2, "<timedtext"

    .line 58
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3e

    goto :goto_72

    .line 61
    :cond_3e
    const-string p0, "WEBVTT"

    invoke-virtual {v1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_4d

    const-string p0, "text/vtt; charset=utf-8"

    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->parseBlockFormat(Ljava/lang/String;Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;

    move-result-object p0

    return-object p0

    .line 62
    :cond_4d
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->looksLikeSrt(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_5a

    .line 63
    const-string p0, "application/x-subrip; charset=utf-8"

    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->parseBlockFormat(Ljava/lang/String;Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;

    move-result-object p0

    return-object p0

    .line 66
    :cond_5a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\u6682\u4e0d\u652f\u6301\u6b64\u5b57\u5e55\u683c\u5f0f: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->safeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 59
    :cond_72
    :goto_72
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->parseXml([B)Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;

    move-result-object p0

    return-object p0

    .line 50
    :cond_77
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u5b57\u5e55\u4e3a\u7a7a"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static parseBlockFormat(Ljava/lang/String;Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;
    .registers 22

    move-object/from16 v0, p0

    .line 201
    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    const-string v3, "\n"

    if-eqz v2, :cond_e

    move-object v10, v1

    goto :goto_f

    :cond_e
    move-object v10, v3

    .line 202
    :goto_f
    new-instance v9, Ljava/util/ArrayList;

    const-string v1, "\\r?\\n\\r?\\n"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v9, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 203
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 204
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 205
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    move v4, v1

    .line 207
    :goto_30
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v6

    if-ge v4, v6, :cond_bc

    .line 208
    invoke-interface {v9, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const-string v7, "\\r?\\n"

    invoke-virtual {v6, v7, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v6

    move v7, v1

    .line 210
    :goto_43
    array-length v11, v6

    if-ge v7, v11, :cond_54

    .line 211
    aget-object v11, v6, v7

    const-string v12, " --> "

    invoke-virtual {v11, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_51

    goto :goto_55

    :cond_51
    add-int/lit8 v7, v7, 0x1

    goto :goto_43

    :cond_54
    move v7, v2

    :goto_55
    if-ltz v7, :cond_b8

    add-int/lit8 v11, v7, 0x1

    .line 216
    array-length v12, v6

    if-lt v11, v12, :cond_5d

    goto :goto_b8

    .line 218
    :cond_5d
    aget-object v7, v6, v7

    const-string v12, "\\s+-->\\s+"

    const/4 v13, 0x2

    invoke-virtual {v7, v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v7

    .line 219
    array-length v12, v7

    if-eq v12, v13, :cond_6a

    goto :goto_b8

    .line 220
    :cond_6a
    aget-object v12, v7, v1

    invoke-static {v12, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->parseTime(Ljava/lang/String;Z)J

    move-result-wide v15

    const/4 v12, 0x1

    .line 221
    aget-object v7, v7, v12

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    const-string v12, "\\s+"

    invoke-virtual {v7, v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v7

    aget-object v7, v7, v1

    .line 222
    invoke-static {v7, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->parseTime(Ljava/lang/String;Z)J

    move-result-wide v17

    const-wide/16 v12, 0x0

    cmp-long v7, v15, v12

    if-ltz v7, :cond_b8

    cmp-long v7, v17, v15

    if-gtz v7, :cond_8e

    goto :goto_b8

    .line 225
    :cond_8e
    array-length v7, v6

    .line 227
    invoke-static {v6, v11, v7}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/CharSequence;

    .line 225
    invoke-static {v3, v6}, Lapp/yydarlinker/deepseekcaptions/RebuildClock$$ExternalSyntheticBackport0;->m(Ljava/lang/CharSequence;[Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->normalizeCueText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 229
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_a4

    goto :goto_b8

    .line 230
    :cond_a4
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 231
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 232
    new-instance v14, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;

    move-object/from16 v19, v6

    invoke-direct/range {v14 .. v19}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;-><init>(JJLjava/lang/String;)V

    invoke-interface {v0, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_b8
    :goto_b8
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_30

    .line 234
    :cond_bc
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->normalizeEnds(Ljava/util/List;)Ljava/util/List;

    move-result-object v6

    .line 236
    new-instance v4, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;

    move-object/from16 v7, p1

    invoke-direct/range {v4 .. v10}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$3;-><init>(Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    return-object v4
.end method

.method private static parseJson3(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;
    .registers 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 70
    new-instance v0, Lorg/json/JSONObject;

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 71
    const-string v1, "events"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_c0

    .line 74
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 75
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 76
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const/4 v6, 0x0

    .line 77
    :goto_1f
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v6, v7, :cond_b6

    .line 78
    invoke-virtual {v1, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    if-nez v7, :cond_2d

    goto/16 :goto_ae

    .line 80
    :cond_2d
    const-string v8, "segs"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    if-eqz v8, :cond_ae

    .line 81
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-nez v9, :cond_3d

    goto/16 :goto_ae

    .line 83
    :cond_3d
    const-string v9, "tStartMs"

    const-wide/16 v10, -0x1

    invoke-virtual {v7, v9, v10, v11}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v13

    const-wide/16 v15, 0x0

    cmp-long v9, v13, v15

    if-gez v9, :cond_4c

    goto :goto_ae

    .line 85
    :cond_4c
    const-string v9, "dDurationMs"

    invoke-virtual {v7, v9, v10, v11}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v9

    .line 87
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v12, 0x0

    .line 88
    :goto_58
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v12, v5, :cond_7f

    .line 89
    invoke-virtual {v8, v12}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    if-eqz v5, :cond_74

    move-wide/from16 v17, v15

    .line 90
    const-string v15, "utf8"

    move-object/from16 v19, v1

    const-string v1, ""

    invoke-virtual {v5, v15, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_78

    :cond_74
    move-object/from16 v19, v1

    move-wide/from16 v17, v15

    :goto_78
    add-int/lit8 v12, v12, 0x1

    move-wide/from16 v15, v17

    move-object/from16 v1, v19

    goto :goto_58

    :cond_7f
    move-object/from16 v19, v1

    move-wide/from16 v17, v15

    .line 92
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->normalizeCueText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 93
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_92

    goto :goto_b0

    .line 95
    :cond_92
    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    new-instance v12, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;

    cmp-long v5, v9, v17

    if-lez v5, :cond_a0

    add-long/2addr v9, v13

    goto :goto_a4

    :cond_a0
    const-wide/16 v7, 0x7d0

    add-long v9, v13, v7

    :goto_a4
    move-object/from16 v17, v1

    move-wide v15, v9

    invoke-direct/range {v12 .. v17}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;-><init>(JJLjava/lang/String;)V

    invoke-interface {v4, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b0

    :cond_ae
    :goto_ae
    move-object/from16 v19, v1

    :goto_b0
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v1, v19

    goto/16 :goto_1f

    .line 99
    :cond_b6
    invoke-static {v4}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->normalizeEnds(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 101
    new-instance v4, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$1;

    invoke-direct {v4, v3, v1, v2, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$1;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Lorg/json/JSONObject;)V

    return-object v4

    .line 72
    :cond_c0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "JSON3 \u7f3a\u5c11 events"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static parseTime(Ljava/lang/String;Z)J
    .registers 13

    .line 295
    const-string v0, ":"

    const-wide/16 v1, -0x1

    if-nez p0, :cond_7

    return-wide v1

    .line 296
    :cond_7
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const/16 v3, 0x2c

    const/16 v4, 0x2e

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    .line 297
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_20

    return-wide v1

    .line 299
    :cond_20
    :try_start_20
    const-string v3, "ms"

    invoke-virtual {p0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_3c

    .line 300
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit8 p1, p1, -0x2

    invoke-virtual {p0, v4, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Math;->round(D)J

    move-result-wide p0

    return-wide p0

    .line 302
    :cond_3c
    const-string v3, "s"

    invoke-virtual {p0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    const-wide v5, 0x408f400000000000L    # 1000.0

    if-eqz v3, :cond_5d

    .line 303
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {p0, v4, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p0

    mul-double/2addr p0, v5

    invoke-static {p0, p1}, Ljava/lang/Math;->round(D)J

    move-result-wide p0

    return-wide p0

    .line 305
    :cond_5d
    const-string v3, "m"

    invoke-virtual {p0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7e

    .line 306
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {p0, v4, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p0

    const-wide v3, 0x40ed4c0000000000L    # 60000.0

    mul-double/2addr p0, v3

    invoke-static {p0, p1}, Ljava/lang/Math;->round(D)J

    move-result-wide p0

    return-wide p0

    .line 308
    :cond_7e
    const-string v3, "h"

    invoke-virtual {p0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_9f

    .line 309
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {p0, v4, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p0

    const-wide v3, 0x414b774000000000L    # 3600000.0

    mul-double/2addr p0, v3

    invoke-static {p0, p1}, Ljava/lang/Math;->round(D)J

    move-result-wide p0

    return-wide p0

    .line 311
    :cond_9f
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_c1

    .line 312
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 314
    array-length p1, p0

    const-wide/16 v7, 0x0

    :goto_ac
    if-ge v4, p1, :cond_bb

    aget-object v0, p0, v4

    const-wide/high16 v9, 0x404e000000000000L    # 60.0

    mul-double/2addr v7, v9

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v9

    add-double/2addr v7, v9

    add-int/lit8 v4, v4, 0x1

    goto :goto_ac

    :cond_bb
    mul-double/2addr v7, v5

    .line 315
    invoke-static {v7, v8}, Ljava/lang/Math;->round(D)J

    move-result-wide p0

    return-wide p0

    .line 317
    :cond_c1
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    if-eqz p1, :cond_c9

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    :cond_c9
    mul-double/2addr v3, v5

    .line 318
    invoke-static {v3, v4}, Ljava/lang/Math;->round(D)J

    move-result-wide p0
    :try_end_ce
    .catchall {:try_start_20 .. :try_end_ce} :catchall_cf

    return-wide p0

    :catchall_cf
    return-wide v1
.end method

.method private static parseXml([B)Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;
    .registers 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 128
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v0

    const/4 v1, 0x0

    .line 129
    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setNamespaceAware(Z)V

    const/4 v2, 0x1

    .line 130
    :try_start_9
    const-string v3, "http://apache.org/xml/features/disallow-doctype-decl"

    invoke-virtual {v0, v3, v2}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V
    :try_end_e
    .catchall {:try_start_9 .. :try_end_e} :catchall_e

    .line 132
    :catchall_e
    :try_start_e
    const-string v3, "http://xml.org/sax/features/external-general-entities"

    invoke-virtual {v0, v3, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V
    :try_end_13
    .catchall {:try_start_e .. :try_end_13} :catchall_13

    .line 134
    :catchall_13
    :try_start_13
    const-string v3, "http://xml.org/sax/features/external-parameter-entities"

    invoke-virtual {v0, v3, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V
    :try_end_18
    .catchall {:try_start_13 .. :try_end_18} :catchall_18

    .line 137
    :catchall_18
    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    new-instance v3, Ljava/io/ByteArrayInputStream;

    move-object/from16 v4, p0

    invoke-direct {v3, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v0, v3}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 138
    const-string v3, "text"

    invoke-interface {v0, v3}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 139
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-nez v4, :cond_35

    move v4, v2

    goto :goto_36

    :cond_35
    move v4, v1

    :goto_36
    if-eqz v4, :cond_3e

    .line 140
    const-string v3, "p"

    invoke-interface {v0, v3}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 142
    :cond_3e
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 143
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 144
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    move v8, v1

    .line 145
    :goto_4e
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v9

    if-ge v8, v9, :cond_f6

    .line 146
    invoke-interface {v3, v8}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v9

    .line 147
    instance-of v10, v9, Lorg/w3c/dom/Element;

    if-nez v10, :cond_61

    :goto_5c
    move/from16 v17, v2

    move v2, v1

    goto/16 :goto_ef

    .line 148
    :cond_61
    invoke-interface {v9}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->normalizeCueText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 149
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_70

    goto :goto_5c

    .line 151
    :cond_70
    move-object v11, v9

    check-cast v11, Lorg/w3c/dom/Element;

    .line 154
    const-string v14, "end"

    const-string v15, "d"

    const-string v12, "dur"

    const-string v13, "t"

    const-string v1, "begin"

    const-string v2, "start"

    const-wide/16 v18, 0x0

    if-eqz v4, :cond_ae

    .line 155
    filled-new-array {v13, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v11, v2, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->firstTime(Lorg/w3c/dom/Element;Z[Ljava/lang/String;)J

    move-result-wide v20

    .line 156
    filled-new-array {v15, v12}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v11, v2, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->firstTime(Lorg/w3c/dom/Element;Z[Ljava/lang/String;)J

    move-result-wide v12

    .line 157
    filled-new-array {v14}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v11, v2, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->firstTime(Lorg/w3c/dom/Element;Z[Ljava/lang/String;)J

    move-result-wide v14

    cmp-long v1, v14, v18

    if-ltz v1, :cond_a1

    goto :goto_aa

    :cond_a1
    cmp-long v1, v12, v18

    if-lez v1, :cond_a6

    goto :goto_a8

    :cond_a6
    const-wide/16 v12, 0x7d0

    :goto_a8
    add-long v14, v20, v12

    :goto_aa
    move/from16 v17, v2

    const/4 v2, 0x0

    goto :goto_d8

    :cond_ae
    const/16 v17, 0x1

    .line 162
    filled-new-array {v2, v1, v13}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v11, v2, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->firstTime(Lorg/w3c/dom/Element;Z[Ljava/lang/String;)J

    move-result-wide v20

    .line 163
    filled-new-array {v12, v15}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v11, v2, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->firstTime(Lorg/w3c/dom/Element;Z[Ljava/lang/String;)J

    move-result-wide v12

    .line 164
    filled-new-array {v14}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v11, v2, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->firstTime(Lorg/w3c/dom/Element;Z[Ljava/lang/String;)J

    move-result-wide v14

    cmp-long v1, v14, v18

    if-ltz v1, :cond_ce

    goto :goto_d8

    :cond_ce
    cmp-long v1, v12, v18

    if-lez v1, :cond_d3

    goto :goto_d5

    :cond_d3
    const-wide/16 v12, 0x7d0

    :goto_d5
    add-long v12, v20, v12

    move-wide v14, v12

    :goto_d8
    move-wide/from16 v12, v20

    cmp-long v1, v12, v18

    if-gez v1, :cond_df

    goto :goto_ef

    .line 171
    :cond_df
    invoke-interface {v5, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 172
    invoke-interface {v6, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    new-instance v11, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;

    move-object/from16 v16, v10

    invoke-direct/range {v11 .. v16}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;-><init>(JJLjava/lang/String;)V

    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_ef
    add-int/lit8 v8, v8, 0x1

    move v1, v2

    move/from16 v2, v17

    goto/16 :goto_4e

    .line 175
    :cond_f6
    invoke-static {v7}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument;->normalizeEnds(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 177
    new-instance v2, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$2;

    invoke-direct {v2, v6, v1, v5, v0}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$2;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Lorg/w3c/dom/Document;)V

    return-object v2
.end method

.method private static requireSameSize(Ljava/util/List;Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 334
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-ne p0, p1, :cond_b

    return-void

    .line 335
    :cond_b
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u7ffb\u8bd1\u6761\u6570\u4e0e\u539f\u5b57\u5e55\u4e0d\u4e00\u81f4"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static safeType(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    if-eqz p0, :cond_a

    .line 340
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_a

    :cond_9
    return-object p0

    :cond_a
    :goto_a
    const-string p0, "unknown"

    return-object p0
.end method
