.class final Lapp/yydarlinker/deepseekcaptions/WordTimingReference;
.super Ljava/lang/Object;
.source "WordTimingReference.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static find(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 5
    const-string v0, ""

    invoke-static {p0, p1, v0}, Lapp/yydarlinker/deepseekcaptions/WordTimingReference;->findAll(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_d

    return-object v0

    :cond_d
    const/4 p1, 0x0

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method static findAll(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    move v3, v2

    .line 10
    :cond_c
    :goto_c
    const-string v4, "ytInitialPlayerResponse"

    invoke-virtual {p0, v4, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    if-ltz v3, :cond_10a

    add-int/lit8 v3, v3, 0x17

    const/16 v4, 0x3d

    invoke-virtual {p0, v4, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    if-gez v3, :cond_20

    goto/16 :goto_10a

    :cond_20
    :goto_20
    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_33

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v4

    if-eqz v4, :cond_33

    goto :goto_20

    .line 11
    :cond_33
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_c

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x7b

    if-eq v4, v5, :cond_42

    goto :goto_c

    :cond_42
    move v6, v2

    move v7, v6

    move v8, v7

    move v4, v3

    .line 13
    :goto_46
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v4, v9, :cond_7a

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x22

    const/4 v11, 0x1

    if-eqz v6, :cond_63

    if-eqz v7, :cond_59

    move v7, v2

    goto :goto_77

    :cond_59
    const/16 v12, 0x5c

    if-ne v9, v12, :cond_5f

    move v7, v11

    goto :goto_77

    :cond_5f
    if-ne v9, v10, :cond_77

    move v6, v2

    goto :goto_77

    :cond_63
    if-ne v9, v10, :cond_67

    move v6, v11

    goto :goto_77

    :cond_67
    if-ne v9, v5, :cond_6c

    add-int/lit8 v8, v8, 0x1

    goto :goto_77

    :cond_6c
    const/16 v10, 0x7d

    if-ne v9, v10, :cond_77

    add-int/lit8 v8, v8, -0x1

    if-nez v8, :cond_77

    add-int/lit8 v4, v4, 0x1

    goto :goto_7b

    :cond_77
    :goto_77
    add-int/lit8 v4, v4, 0x1

    goto :goto_46

    :cond_7a
    const/4 v4, -0x1

    :goto_7b
    if-gez v4, :cond_7e

    goto :goto_c

    .line 15
    :cond_7e
    new-instance v5, Lorg/json/JSONObject;

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v3, "videoDetails"

    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_107

    const-string v6, "videoId"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9d

    goto/16 :goto_107

    .line 16
    :cond_9d
    const-string v3, "captions"

    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    if-nez v3, :cond_a6

    goto :goto_107

    :cond_a6
    const-string v5, "playerCaptionsTracklistRenderer"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    if-nez v3, :cond_af

    goto :goto_107

    :cond_af
    const-string v5, "captionTracks"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    if-nez v3, :cond_b8

    goto :goto_107

    :cond_b8
    move v5, v2

    .line 17
    :goto_b9
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_107

    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    if-eqz v6, :cond_104

    const-string v7, "kind"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "asr"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_d4

    goto :goto_104

    :cond_d4
    const-string v7, "baseUrl"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, p1}, Lapp/yydarlinker/deepseekcaptions/WordTimingReference;->safe(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_104

    .line 18
    const-string v8, "languageCode"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {p2, v6}, Lapp/yydarlinker/deepseekcaptions/WordTimingReference;->sameLanguage(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_ee

    move-object v6, v0

    goto :goto_ef

    :cond_ee
    move-object v6, v1

    .line 19
    :goto_ef
    invoke-static {v7}, Lapp/yydarlinker/deepseekcaptions/SourceFormatPolicy;->json3(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_104

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v8

    const/16 v9, 0x10

    if-ge v8, v9, :cond_104

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_104
    :goto_104
    add-int/lit8 v5, v5, 0x1

    goto :goto_b9

    :cond_107
    :goto_107
    move v3, v4

    goto/16 :goto_c

    .line 21
    :cond_10a
    :goto_10a
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_10e
    :goto_10e
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_124

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_10e

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10e

    :cond_124
    return-object v0
.end method

.method static safe(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 13

    .line 24
    const-string v0, "UTF-8"

    const/4 v1, 0x0

    if-eqz p1, :cond_ac

    :try_start_5
    const-string v2, "[A-Za-z0-9_-]{11}"

    invoke-virtual {p1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_f

    goto/16 :goto_ac

    .line 25
    :cond_f
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 26
    const-string v3, "https"

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_ac

    invoke-virtual {p0}, Ljava/net/URI;->getUserInfo()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_ac

    invoke-virtual {p0}, Ljava/net/URI;->getPort()I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_38

    invoke-virtual {p0}, Ljava/net/URI;->getPort()I

    move-result v3

    const/16 v4, 0x1bb

    if-ne v3, v4, :cond_ac

    :cond_38
    const-string v3, "www.youtube.com"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_48

    const-string v3, "youtube.com"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ac

    :cond_48
    const-string v2, "/api/timedtext"

    invoke-virtual {p0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ac

    invoke-virtual {p0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_5b

    goto :goto_ac

    .line 28
    :cond_5b
    invoke-virtual {p0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object p0

    const-string v2, "&"

    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v2, p0

    move v3, v1

    move v4, v3

    move v5, v4

    :goto_69
    const/4 v6, 0x1

    if-ge v3, v2, :cond_a7

    aget-object v7, p0, v3

    const-string v8, "="

    const/4 v9, 0x2

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v7

    aget-object v8, v7, v1

    invoke-static {v8, v0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    array-length v10, v7

    if-ne v10, v9, :cond_85

    aget-object v6, v7, v6

    invoke-static {v6, v0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_87

    :cond_85
    const-string v6, ""

    .line 29
    :goto_87
    const-string v7, "v"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_95

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    :cond_95
    const-string v7, "tlang"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a4

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6
    :try_end_a1
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_a1} :catch_ac

    if-nez v6, :cond_a4

    return v1

    :cond_a4
    add-int/lit8 v3, v3, 0x1

    goto :goto_69

    :cond_a7
    if-ne v4, v6, :cond_ac

    if-eqz v5, :cond_ac

    return v6

    :catch_ac
    :cond_ac
    :goto_ac
    return v1
.end method

.method static sameLanguage(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4

    const/4 v0, 0x0

    if-eqz p0, :cond_27

    if-eqz p1, :cond_27

    .line 6
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_27

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_27

    const-string v1, "-"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    aget-object p0, p0, v0

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    aget-object p1, p1, v0

    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_27

    const/4 p0, 0x1

    return p0

    :cond_27
    return v0
.end method

.method static sameWords(Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;)Z
    .registers 5

    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;->cues()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_12
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_28

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;

    iget-object v2, v2, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->text:Ljava/lang/String;

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_12

    :cond_28
    invoke-interface {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;->cues()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_30
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_46

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;

    iget-object p1, p1, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->text:Ljava/lang/String;

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_30

    :cond_46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    if-lez p0, :cond_5c

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5c

    const/4 p0, 0x1

    return p0

    :cond_5c
    const/4 p0, 0x0

    return p0
.end method
