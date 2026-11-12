.class public abstract Lpoo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/EnumMap;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lw06;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    sput-object v0, Lpoo;->a:Ljava/util/EnumMap;

    return-void
.end method

.method public static a(Ljava/lang/String;Lpqo;)Luuj;
    .registers 26

    move-object/from16 v7, p1

    iget-object v9, v7, Lpqo;->d:Ldro;

    :try_start_4
    new-instance v0, Lorg/json/JSONObject;

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "sessionId"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    const-string v1, "statusCode"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v11

    const-string v1, "message"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    const-string v1, "expireTimestamp"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v3

    const-string v1, "fetchConfig"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const/4 v12, 0x0

    if-eqz v1, :cond_7e

    const-string v2, "reqNum"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v14

    const-string v2, "minAdNumInCache"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v15

    const-string v2, "videoAutoPlayFlag"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v16

    const-string v2, "te"

    invoke-virtual {v1, v2, v12}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v18

    const-string v2, "d"

    const/16 v5, 0x14

    invoke-virtual {v1, v2, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v19

    const-string v2, "td"

    const/16 v5, 0x1f4

    invoke-virtual {v1, v2, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v20

    const-string v2, "tb"

    invoke-virtual {v1, v2, v12}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v21

    const-string v2, "acceptsClickOnEntireAd"

    invoke-virtual {v1, v2, v12}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    const-string v5, "updatedAdServerUrl"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v17, Lfio;

    iget-byte v5, v7, Lpqo;->e:B

    iget-boolean v6, v7, Lpqo;->f:Z

    move/from16 v22, v5

    move/from16 v23, v6

    invoke-direct/range {v17 .. v23}, Lfio;-><init>(IIIIIZ)V

    move-object/from16 v5, v17

    new-instance v13, Lbio;

    move-object/from16 v17, v1

    move/from16 v18, v2

    invoke-direct/range {v13 .. v18}, Lbio;-><init>(IIILjava/lang/String;Z)V

    move-object v8, v5

    goto :goto_80

    :cond_7e
    const/4 v8, 0x0

    const/4 v13, 0x0

    :goto_80
    const-string v1, "ads"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v14

    if-eqz v14, :cond_11a

    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lez v0, :cond_11a

    new-instance v15, Ljava/util/ArrayList;

    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v0

    invoke-direct {v15, v0}, Ljava/util/ArrayList;-><init>(I)V

    move v0, v12

    :goto_98
    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_117

    invoke-virtual {v14, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "creativeType"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lw06;->values()[Lw06;

    move-result-object v5

    array-length v6, v5
    :try_end_ad
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_ad} :catch_12c

    move v10, v12

    const/16 v16, 0x0

    :goto_b0
    if-ge v10, v6, :cond_c3

    :try_start_b2
    aget-object v12, v5, v10

    move/from16 v17, v0

    iget-object v0, v12, Lw06;->a:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c7

    add-int/lit8 v10, v10, 0x1

    move/from16 v0, v17

    goto :goto_b0

    :cond_c3
    move/from16 v17, v0

    sget-object v12, Lw06;->v:Lw06;

    :cond_c7
    iget-object v0, v9, Ldro;->a:Ljava/util/EnumSet;

    invoke-interface {v0, v12}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_111

    const-string v0, "endTime"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v5

    const-string v0, "adParts"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    if-eqz v0, :cond_10a

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-lez v1, :cond_10a

    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    :goto_ed
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v1, v10, :cond_103

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    invoke-static {v10, v9}, Lpoo;->b(Lorg/json/JSONObject;Ldro;)Llho;

    move-result-object v10

    if-eqz v10, :cond_100

    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_100
    add-int/lit8 v1, v1, 0x1

    goto :goto_ed

    :cond_103
    new-instance v0, Lvho;

    move-object v1, v12

    invoke-direct/range {v0 .. v8}, Lvho;-><init>(Lw06;Ljava/util/List;JJLpqo;Lfio;)V

    goto :goto_10c

    :cond_10a
    move-object/from16 v0, v16

    :goto_10c
    if-eqz v0, :cond_111

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_111
    add-int/lit8 v0, v17, 0x1

    move-object/from16 v7, p1

    const/4 v12, 0x0

    goto :goto_98

    :cond_117
    const/16 v16, 0x0

    goto :goto_11e

    :cond_11a
    const/16 v16, 0x0

    move-object/from16 v15, v16

    :goto_11e
    new-instance v0, Luuj;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput v11, v0, Luuj;->a:I

    iput-object v15, v0, Luuj;->b:Ljava/lang/Object;

    iput-object v13, v0, Luuj;->c:Ljava/lang/Object;
    :try_end_129
    .catch Lorg/json/JSONException; {:try_start_b2 .. :try_end_129} :catch_12a

    return-object v0

    :catch_12a
    move-exception v0

    goto :goto_12f

    :catch_12c
    move-exception v0

    const/16 v16, 0x0

    :goto_12f
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    return-object v16
.end method

.method public static b(Lorg/json/JSONObject;Ldro;)Llho;
    .registers 28

    move-object/from16 v0, p0

    const-string v1, "creative"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "type"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lw06;->values()[Lw06;

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    move v6, v5

    :goto_15
    if-ge v6, v4, :cond_24

    aget-object v7, v3, v6

    iget-object v8, v7, Lw06;->a:Ljava/lang/String;

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_26

    add-int/lit8 v6, v6, 0x1

    goto :goto_15

    :cond_24
    sget-object v7, Lw06;->v:Lw06;

    :cond_26
    sget-object v2, Lpoo;->a:Ljava/util/EnumMap;

    invoke-virtual {v2, v7}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lwmo;

    const/4 v4, 0x3

    if-eqz v3, :cond_38

    :goto_31
    invoke-virtual {v3, v1}, Lwmo;->a(Lorg/json/JSONObject;)Lxho;

    move-result-object v1

    move-object v9, v1

    goto/16 :goto_ac

    :cond_38
    sget-object v8, Limo;->a:[I

    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_254

    goto :goto_a5

    :pswitch_44
    new-instance v3, Lwmo;

    const/4 v8, 0x7

    invoke-direct {v3, v7, v8}, Lwmo;-><init>(Lw06;B)V

    goto :goto_a5

    :pswitch_4b
    new-instance v3, Lwmo;

    const/16 v8, 0xa

    invoke-direct {v3, v7, v8}, Lwmo;-><init>(Lw06;B)V

    goto :goto_a5

    :pswitch_53
    new-instance v3, Lwmo;

    sget-object v8, Lw06;->j:Lw06;

    const/4 v9, 0x5

    invoke-direct {v3, v8, v9}, Lwmo;-><init>(Lw06;B)V

    goto :goto_a5

    :pswitch_5c
    new-instance v3, Lwmo;

    sget-object v8, Lw06;->i:Lw06;

    const/4 v9, 0x4

    invoke-direct {v3, v8, v9}, Lwmo;-><init>(Lw06;B)V

    goto :goto_a5

    :pswitch_65
    new-instance v3, Lwmo;

    sget-object v8, Lw06;->q:Lw06;

    const/16 v9, 0x9

    invoke-direct {v3, v8, v9}, Lwmo;-><init>(Lw06;B)V

    goto :goto_a5

    :pswitch_6f
    new-instance v3, Lwmo;

    const/16 v8, 0x8

    invoke-direct {v3, v7, v8}, Lwmo;-><init>(Lw06;B)V

    goto :goto_a5

    :pswitch_77
    new-instance v3, Lwmo;

    sget-object v8, Lw06;->k:Lw06;

    const/4 v9, 0x6

    invoke-direct {v3, v8, v9}, Lwmo;-><init>(Lw06;B)V

    goto :goto_a5

    :pswitch_80
    new-instance v3, Lwmo;

    sget-object v8, Lw06;->f:Lw06;

    const/4 v9, 0x2

    invoke-direct {v3, v8, v9}, Lwmo;-><init>(Lw06;B)V

    goto :goto_a5

    :pswitch_89
    new-instance v3, Lwmo;

    const/4 v8, 0x1

    invoke-direct {v3, v7, v8}, Lwmo;-><init>(Lw06;B)V

    goto :goto_a5

    :pswitch_90
    new-instance v3, Lwmo;

    sget-object v8, Lw06;->u:Lw06;

    const/16 v9, 0xb

    invoke-direct {v3, v8, v9}, Lwmo;-><init>(Lw06;B)V

    goto :goto_a5

    :pswitch_9a
    new-instance v3, Lwmo;

    invoke-direct {v3, v7, v4}, Lwmo;-><init>(Lw06;B)V

    goto :goto_a5

    :pswitch_a0
    new-instance v3, Lwmo;

    invoke-direct {v3, v7, v5}, Lwmo;-><init>(Lw06;B)V

    :goto_a5
    if-eqz v3, :cond_ab

    invoke-virtual {v2, v7, v3}, Ljava/util/EnumMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_31

    :cond_ab
    const/4 v9, 0x0

    :goto_ac
    if-nez v9, :cond_b2

    const/16 v21, 0x0

    goto/16 :goto_20c

    :cond_b2
    const-string v1, "clickUrl"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v1, "deepLink"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v1, "clickType"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v4}, Lvep;->B(I)[I

    move-result-object v2

    array-length v3, v2

    move v4, v5

    :goto_ca
    if-ge v4, v3, :cond_d9

    aget v8, v2, v4

    invoke-static {v8}, Lz1m;->b(I)B

    move-result v12

    if-ne v12, v1, :cond_d6

    :goto_d4
    move v13, v8

    goto :goto_dc

    :cond_d6
    add-int/lit8 v4, v4, 0x1

    goto :goto_ca

    :cond_d9
    sget v8, Lz1m;->a:I

    goto :goto_d4

    :goto_dc
    const-string v1, "pkgName"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v1, "adChoiceUrl"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    const-string v1, "erid"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    const-string v1, "eridUrl"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    const-string v1, "ecpm"

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v18

    const-string v1, "adTrackers"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_1fa

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lez v2, :cond_1fa

    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    move v3, v5

    :goto_114
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_1f6

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v8, "offset"

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v12, "eventType"

    invoke-virtual {v4, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const/16 v20, 0x1a

    const/16 v21, 0x0

    invoke-static/range {v20 .. v20}, Lvep;->B(I)[I

    move-result-object v6

    array-length v5, v6

    move-object/from16 v22, v1

    const/4 v1, 0x0

    :goto_136
    if-ge v1, v5, :cond_1b8

    aget v23, v6, v1

    packed-switch v23, :pswitch_data_280

    throw v21

    :pswitch_13e
    const-string v24, "ILLEGAL"

    :goto_140
    move/from16 v25, v1

    move-object/from16 v1, v24

    goto/16 :goto_191

    :pswitch_146
    const-string v24, "AD_CHOICE"

    goto :goto_140

    :pswitch_149
    const-string v24, "VIDEO_EXIT_FULLSCREEN"

    goto :goto_140

    :pswitch_14c
    const-string v24, "VIDEO_FULLSCREEN"

    goto :goto_140

    :pswitch_14f
    const-string v24, "VIDEO_RESUME"

    goto :goto_140

    :pswitch_152
    const-string v24, "VIDEO_PAUSE"

    goto :goto_140

    :pswitch_155
    const-string v24, "VIDEO_STOP"

    goto :goto_140

    :pswitch_158
    const-string v24, "VIDEO_SKIP"

    goto :goto_140

    :pswitch_15b
    const-string v24, "VIDEO_UNMUTE"

    goto :goto_140

    :pswitch_15e
    const-string v24, "VIDEO_MUTE"

    goto :goto_140

    :pswitch_161
    const-string v24, "VIDEO_ERROR"

    goto :goto_140

    :pswitch_164
    const-string v24, "VIDEO_PROGRESS_97_PERCENT"

    goto :goto_140

    :pswitch_167
    const-string v24, "VIDEO_PROGRESS_15S"

    goto :goto_140

    :pswitch_16a
    const-string v24, "VIDEO_PROGRESS_2S"

    goto :goto_140

    :pswitch_16d
    const-string v24, "VIDEO_COMPLETE"

    goto :goto_140

    :pswitch_170
    const-string v24, "VIDEO_THIRDQUARTILE"

    goto :goto_140

    :pswitch_173
    const-string v24, "VIDEO_MIDPOINT"

    goto :goto_140

    :pswitch_176
    const-string v24, "VIDEO_FIRSTQUARTILE"

    goto :goto_140

    :pswitch_179
    const-string v24, "VIDEO_START"

    goto :goto_140

    :pswitch_17c
    const-string v24, "VIDEO_LOAD"

    goto :goto_140

    :pswitch_17f
    const-string v24, "MISSING"

    goto :goto_140

    :pswitch_182
    const-string v24, "DISCARD"

    goto :goto_140

    :pswitch_185
    const-string v24, "CLICK"

    goto :goto_140

    :pswitch_188
    const-string v24, "IMPRESSION_FAIL"

    goto :goto_140

    :pswitch_18b
    const-string v24, "VIEWABLE_IMPRESSION"

    goto :goto_140

    :pswitch_18e
    const-string v24, "IMPRESSION"

    goto :goto_140

    :goto_191
    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1b5

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1b2

    packed-switch v23, :pswitch_data_2b8

    throw v21

    :pswitch_1a1
    const-string v1, "97%"

    goto :goto_1ac

    :pswitch_1a4
    const-string v1, "15s"

    goto :goto_1ac

    :pswitch_1a7
    const-string v1, "2s"

    goto :goto_1ac

    :pswitch_1aa
    move-object/from16 v1, v21

    :goto_1ac
    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1b5

    :cond_1b2
    add-int/lit8 v1, v25, 0x1

    goto :goto_136

    :cond_1b5
    move/from16 v1, v23

    goto :goto_1ba

    :cond_1b8
    move/from16 v1, v20

    :goto_1ba
    const-string v5, "urls"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    if-eqz v4, :cond_1e2

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-lez v5, :cond_1e2

    new-instance v5, Ljava/util/ArrayList;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v6, 0x0

    :goto_1d2
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v6, v8, :cond_1e4

    invoke-virtual {v4, v6}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_1d2

    :cond_1e2
    move-object/from16 v5, v21

    :cond_1e4
    new-instance v4, Lpho;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput v1, v4, Lpho;->a:I

    iput-object v5, v4, Lpho;->b:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v1, v22

    goto/16 :goto_114

    :cond_1f6
    const/16 v21, 0x0

    move-object v12, v2

    goto :goto_1fe

    :cond_1fa
    const/16 v21, 0x0

    move-object/from16 v12, v21

    :goto_1fe
    invoke-virtual {v7}, Lw06;->g()Z

    move-result v1

    if-nez v1, :cond_20d

    if-eqz v12, :cond_20c

    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_20d

    :cond_20c
    :goto_20c
    return-object v21

    :cond_20d
    const-string v1, "omidParams"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_24a

    :try_start_215
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "VENDOR_KEY"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "VERIFICATION_PARAMETERS"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "VERIFICATION_URL"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_24a

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_24a

    if-eqz v0, :cond_24a

    new-instance v3, Loam;

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v4, v1, v2, v0}, Loam;-><init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_243
    .catch Lorg/json/JSONException; {:try_start_215 .. :try_end_243} :catch_246

    move-object/from16 v20, v3

    goto :goto_24c

    :catch_246
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    :cond_24a
    move-object/from16 v20, v21

    :goto_24c
    new-instance v8, Llho;

    move-object/from16 v21, p1

    invoke-direct/range {v8 .. v21}, Llho;-><init>(Lxho;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;DLoam;Ldro;)V

    return-object v8

    :pswitch_data_254
    .packed-switch 0x1
        :pswitch_a0
        :pswitch_a0
        :pswitch_a0
        :pswitch_9a
        :pswitch_90
        :pswitch_89
        :pswitch_89
        :pswitch_80
        :pswitch_77
        :pswitch_6f
        :pswitch_6f
        :pswitch_65
        :pswitch_5c
        :pswitch_53
        :pswitch_4b
        :pswitch_4b
        :pswitch_4b
        :pswitch_44
        :pswitch_44
        :pswitch_44
    .end packed-switch

    :pswitch_data_280
    .packed-switch 0x1
        :pswitch_18e
        :pswitch_18b
        :pswitch_188
        :pswitch_185
        :pswitch_182
        :pswitch_17f
        :pswitch_17c
        :pswitch_179
        :pswitch_176
        :pswitch_173
        :pswitch_170
        :pswitch_16d
        :pswitch_16a
        :pswitch_167
        :pswitch_164
        :pswitch_161
        :pswitch_15e
        :pswitch_15b
        :pswitch_158
        :pswitch_155
        :pswitch_152
        :pswitch_14f
        :pswitch_14c
        :pswitch_149
        :pswitch_146
        :pswitch_13e
    .end packed-switch

    :pswitch_data_2b8
    .packed-switch 0x1
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1a7
        :pswitch_1a4
        :pswitch_1a1
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
        :pswitch_1aa
    .end packed-switch
.end method

.method public static c(Ljava/util/List;)Lorg/json/JSONArray;
    .registers 6

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_9
    :goto_9
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_46

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ly5p;

    iget-object v2, v1, Ly5p;->b:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_9

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    iget-object v3, v1, Ly5p;->b:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_28
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_38

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_28

    :cond_38
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    iget-object v1, v1, Ly5p;->a:Ljava/lang/String;

    invoke-virtual {v3, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_9

    :cond_46
    return-object v0
.end method

.method public static d(Lorg/json/JSONArray;)Ljava/util/ArrayList;
    .registers 4

    if-eqz p0, :cond_23

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lez v0, :cond_23

    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    :goto_12
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_22

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    :cond_22
    return-object v0

    :cond_23
    const/4 p0, 0x0

    return-object p0
.end method
