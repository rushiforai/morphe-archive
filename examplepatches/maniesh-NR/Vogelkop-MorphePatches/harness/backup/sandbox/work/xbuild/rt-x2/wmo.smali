.class public final Lwmo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lw06;

.field public final synthetic b:B


# direct methods
.method public constructor <init>(Lw06;B)V
    .registers 3

    iput-byte p2, p0, Lwmo;->b:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwmo;->a:Lw06;

    return-void
.end method


# virtual methods
.method public final a(Lorg/json/JSONObject;)Lxho;
    .registers 32

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lwmo;->b:B

    const-string v3, "domain"

    const-string v4, "subType"

    const-string v5, ""

    const-string v6, "choices"

    const-string v7, "successText"

    const-string v9, "commitURL"

    const-string v10, "subDescription"

    const-string v14, "imageUrl"

    iget-object v15, v0, Lwmo;->a:Lw06;

    const/16 v16, 0x0

    const-string v13, "ctaButtonText"

    const/16 v17, 0x3

    const-string v8, "ctaButtonVisible"

    const-string v11, "iconUrl"

    const-string v12, "description"

    move/from16 v20, v2

    const-string v2, "title"

    packed-switch v20, :pswitch_data_4ea

    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    const-string v3, "videoUrl"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v28

    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    new-instance v21, Lxho;

    iget-object v0, v0, Lwmo;->a:Lw06;

    move-object/from16 v22, v0

    invoke-direct/range {v21 .. v29}, Lxho;-><init>(Lw06;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    return-object v21

    :pswitch_53
    iget-object v0, v0, Lwmo;->a:Lw06;

    sget-object v15, Lw06;->r:Lr06;

    if-ne v0, v15, :cond_64

    const-string v2, "vastTagUrl"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_5f
    move-object v2, v1

    move-object v1, v0

    move-object/from16 v0, v16

    goto :goto_a3

    :cond_64
    sget-object v3, Lw06;->s:Ls06;

    const-string v4, "vastXml"

    if-ne v0, v3, :cond_6f

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_5f

    :cond_6f
    sget-object v3, Lw06;->t:Lt06;

    if-ne v0, v3, :cond_9f

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object v4, v3

    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object v5, v4

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object v2, v5

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v6

    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    move-object v1, v0

    new-instance v0, Lxho;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v0 .. v11}, Lxho;-><init>(Lw06;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    move-object/from16 v2, v17

    goto :goto_a3

    :cond_9f
    move-object v1, v0

    move-object/from16 v0, v16

    move-object v2, v0

    :goto_a3
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_ac

    move-object/from16 v13, v16

    goto :goto_c1

    :cond_ac
    new-instance v13, Lxho;

    new-instance v3, Leyi;

    if-ne v1, v15, :cond_b4

    const/4 v11, 0x1

    goto :goto_b5

    :cond_b4
    const/4 v11, 0x0

    :goto_b5
    const/16 v4, 0x9

    invoke-direct {v3, v4, v2, v0, v11}, Leyi;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-direct {v13}, Ljava/lang/Object;-><init>()V

    iput-object v1, v13, Lxho;->a:Lw06;

    iput-object v3, v13, Lxho;->G:Leyi;

    :goto_c1
    return-object v13

    :pswitch_c2
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    invoke-static {v9}, Lpoo;->d(Lorg/json/JSONArray;)Ljava/util/ArrayList;

    move-result-object v9

    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v8

    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "questions"

    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_14b

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-lez v11, :cond_14b

    new-instance v13, Ljava/util/ArrayList;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v11

    invoke-direct {v13, v11}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v11, 0x0

    :goto_fa
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v11, v14, :cond_14d

    invoke-virtual {v1, v11}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v14

    move-object/from16 p0, v1

    invoke-virtual {v14, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move/from16 v16, v11

    invoke-static/range {v17 .. v17}, Lvep;->B(I)[I

    move-result-object v11

    move-object/from16 v20, v4

    array-length v4, v11

    move-object/from16 p1, v11

    const/4 v11, 0x0

    :goto_116
    if-ge v11, v4, :cond_12e

    aget v18, p1, v11

    move/from16 v21, v4

    invoke-static/range {v18 .. v18}, Lv0g;->d(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_129

    move/from16 v1, v18

    goto :goto_130

    :cond_129
    add-int/lit8 v11, v11, 0x1

    move/from16 v4, v21

    goto :goto_116

    :cond_12e
    move/from16 v1, v17

    :goto_130
    invoke-virtual {v14, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v14, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    invoke-static {v11}, Lpoo;->d(Lorg/json/JSONArray;)Ljava/util/ArrayList;

    move-result-object v11

    new-instance v14, Llgh;

    invoke-direct {v14, v1, v4, v11}, Llgh;-><init>(ILjava/lang/String;Ljava/util/List;)V

    invoke-virtual {v13, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v11, v16, 0x1

    move-object/from16 v1, p0

    move-object/from16 v4, v20

    goto :goto_fa

    :cond_14b
    move-object/from16 v13, v16

    :cond_14d
    new-instance v1, Lxho;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v15, v1, Lxho;->a:Lw06;

    iput-object v0, v1, Lxho;->b:Ljava/lang/String;

    iput-object v2, v1, Lxho;->d:Ljava/lang/String;

    iput-object v5, v1, Lxho;->e:Ljava/lang/String;

    iput-object v3, v1, Lxho;->n:Ljava/lang/String;

    iput-object v7, v1, Lxho;->r:Ljava/lang/String;

    iput-object v9, v1, Lxho;->p:Ljava/util/ArrayList;

    iput-boolean v8, v1, Lxho;->f:Z

    iput-object v10, v1, Lxho;->g:Ljava/lang/String;

    iput-object v13, v1, Lxho;->z:Ljava/util/ArrayList;

    return-object v1

    :pswitch_167
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-static {v5}, Lpoo;->d(Lorg/json/JSONArray;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    invoke-static {v6}, Lpoo;->d(Lorg/json/JSONArray;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v8

    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v9, Lxho;

    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    iput-object v15, v9, Lxho;->a:Lw06;

    iput-object v0, v9, Lxho;->b:Ljava/lang/String;

    iput-object v2, v9, Lxho;->d:Ljava/lang/String;

    iput-object v3, v9, Lxho;->e:Ljava/lang/String;

    iput-object v4, v9, Lxho;->n:Ljava/lang/String;

    iput-object v5, v9, Lxho;->o:Ljava/util/ArrayList;

    iput-object v6, v9, Lxho;->p:Ljava/util/ArrayList;

    iput-object v7, v9, Lxho;->r:Ljava/lang/String;

    iput-boolean v8, v9, Lxho;->f:Z

    iput-object v1, v9, Lxho;->g:Ljava/lang/String;

    return-object v9

    :pswitch_1ad
    const-string v0, "payload"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "adunitID"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    const-string v2, "placementID"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lxho;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v5, v2, Lxho;->d:Ljava/lang/String;

    iput-object v5, v2, Lxho;->e:Ljava/lang/String;

    iput-object v15, v2, Lxho;->a:Lw06;

    iput-object v0, v2, Lxho;->C:Ljava/lang/String;

    iput-object v1, v2, Lxho;->D:Ljava/lang/String;

    return-object v2

    :pswitch_1ce
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-static {v5}, Lpoo;->d(Lorg/json/JSONArray;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    invoke-static {v6}, Lpoo;->d(Lorg/json/JSONArray;)Ljava/util/ArrayList;

    move-result-object v6

    const-string v7, "selectTimes"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    if-eqz v7, :cond_218

    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v7}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v10

    :goto_1ff
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_21a

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    const/4 v12, 0x0

    invoke-virtual {v7, v11, v12}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v9, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1ff

    :cond_218
    move-object/from16 v9, v16

    :cond_21a
    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v7

    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v8, Lxho;

    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    iput-object v15, v8, Lxho;->a:Lw06;

    iput-object v0, v8, Lxho;->b:Ljava/lang/String;

    iput-object v2, v8, Lxho;->d:Ljava/lang/String;

    iput-object v3, v8, Lxho;->e:Ljava/lang/String;

    iput-object v4, v8, Lxho;->n:Ljava/lang/String;

    iput-object v5, v8, Lxho;->o:Ljava/util/ArrayList;

    iput-object v6, v8, Lxho;->p:Ljava/util/ArrayList;

    iput-object v9, v8, Lxho;->t:Ljava/util/HashMap;

    iput-boolean v7, v8, Lxho;->f:Z

    iput-object v1, v8, Lxho;->g:Ljava/lang/String;

    return-object v8

    :pswitch_23c
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "imageUrl1"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "imageUrl2"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "imageUrl3"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v8

    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v9, Lxho;

    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    iput-object v15, v9, Lxho;->a:Lw06;

    iput-object v0, v9, Lxho;->b:Ljava/lang/String;

    iput-object v4, v9, Lxho;->i:Ljava/lang/String;

    iput-object v5, v9, Lxho;->j:Ljava/lang/String;

    iput-object v6, v9, Lxho;->k:Ljava/lang/String;

    iput-object v2, v9, Lxho;->d:Ljava/lang/String;

    iput-object v7, v9, Lxho;->e:Ljava/lang/String;

    iput-object v3, v9, Lxho;->l:Ljava/lang/String;

    iput-boolean v8, v9, Lxho;->f:Z

    iput-object v1, v9, Lxho;->g:Ljava/lang/String;

    return-object v9

    :pswitch_280
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v23

    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    new-instance v16, Lxho;

    iget-object v0, v0, Lwmo;->a:Lw06;

    move-object/from16 v17, v0

    invoke-direct/range {v16 .. v24}, Lxho;-><init>(Lw06;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    return-object v16

    :pswitch_2a6
    const-string v0, "iconUrlLight"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "iconUrlDark"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "imageUrlLight"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "imageUrlDark"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "backgroundUrlLight"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "backgroundUrlDark"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v9, "titleColorLight"

    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "titleColorDark"

    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "descriptionColorLight"

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v14, "descriptionColorDark"

    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v8

    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    move-object/from16 p0, v13

    const-string v13, "ctaButtonTextColorLight"

    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v16, v13

    const-string v13, "ctaButtonTextColorDark"

    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v17, v13

    const-string v13, "ctaButtonBgColorLight"

    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v18, v13

    const-string v13, "ctaButtonBgColorDark"

    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v19, v13

    const-string v13, "expandable"

    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    new-instance v13, Lxho;

    invoke-direct {v13}, Ljava/lang/Object;-><init>()V

    iput-object v15, v13, Lxho;->a:Lw06;

    iput-object v0, v13, Lxho;->H:Ljava/lang/String;

    iput-object v3, v13, Lxho;->I:Ljava/lang/String;

    iput-object v4, v13, Lxho;->J:Ljava/lang/String;

    iput-object v5, v13, Lxho;->K:Ljava/lang/String;

    iput-object v6, v13, Lxho;->P:Ljava/lang/String;

    iput-object v7, v13, Lxho;->Q:Ljava/lang/String;

    iput-object v2, v13, Lxho;->d:Ljava/lang/String;

    iput-object v9, v13, Lxho;->L:Ljava/lang/String;

    iput-object v10, v13, Lxho;->M:Ljava/lang/String;

    iput-object v11, v13, Lxho;->e:Ljava/lang/String;

    iput-object v12, v13, Lxho;->N:Ljava/lang/String;

    iput-object v14, v13, Lxho;->O:Ljava/lang/String;

    iput-boolean v8, v13, Lxho;->f:Z

    move-object/from16 v0, p0

    iput-object v0, v13, Lxho;->g:Ljava/lang/String;

    move-object/from16 v0, v16

    iput-object v0, v13, Lxho;->R:Ljava/lang/String;

    move-object/from16 v0, v17

    iput-object v0, v13, Lxho;->S:Ljava/lang/String;

    move-object/from16 v0, v18

    iput-object v0, v13, Lxho;->T:Ljava/lang/String;

    move-object/from16 v0, v19

    iput-object v0, v13, Lxho;->U:Ljava/lang/String;

    iput-boolean v1, v13, Lxho;->V:Z

    return-object v13

    :pswitch_352
    move-object v0, v4

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v17 .. v17}, Lvep;->B(I)[I

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    :goto_35d
    if-ge v5, v4, :cond_388

    aget v6, v3, v5

    const/4 v8, 0x1

    if-eq v6, v8, :cond_376

    const/4 v13, 0x2

    if-eq v6, v13, :cond_371

    move/from16 v13, v17

    if-ne v6, v13, :cond_370

    const-string v17, "ILLEGAL"

    :goto_36d
    move-object/from16 v8, v17

    goto :goto_37b

    :cond_370
    throw v16

    :cond_371
    move/from16 v13, v17

    const-string v17, "DIALOG"

    goto :goto_36d

    :cond_376
    move/from16 v13, v17

    const-string v17, "FULLSCREEN"

    goto :goto_36d

    :goto_37b
    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_383

    move v8, v6

    goto :goto_38b

    :cond_383
    add-int/lit8 v5, v5, 0x1

    move/from16 v17, v13

    goto :goto_35d

    :cond_388
    move/from16 v13, v17

    move v8, v13

    :goto_38b
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "ctaButton1Text"

    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v10, "promoText1"

    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "promoText2"

    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "inputDescription"

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v13, "leadInfos"

    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v13

    if-eqz v13, :cond_426

    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-lez v14, :cond_426

    new-instance v14, Ljava/util/ArrayList;

    move-object/from16 p0, v12

    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v12

    invoke-direct {v14, v12}, Ljava/util/ArrayList;-><init>(I)V

    move-object/from16 v17, v11

    const/4 v12, 0x0

    :goto_3d3
    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v12, v11, :cond_422

    invoke-virtual {v13, v12}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    move/from16 v16, v12

    const-string v12, "leadType"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const/16 v18, 0xb

    move-object/from16 v20, v13

    invoke-static/range {v18 .. v18}, Lvep;->B(I)[I

    move-result-object v13

    move-object/from16 v21, v10

    array-length v10, v13

    move-object/from16 v22, v13

    const/4 v13, 0x0

    :goto_3f3
    if-ge v13, v10, :cond_40b

    aget v23, v22, v13

    move/from16 v24, v10

    invoke-static/range {v23 .. v23}, Lj7c;->i(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_406

    move/from16 v10, v23

    goto :goto_40d

    :cond_406
    add-int/lit8 v13, v13, 0x1

    move/from16 v10, v24

    goto :goto_3f3

    :cond_40b
    move/from16 v10, v18

    :goto_40d
    const-string v12, "hint"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Lk7c;

    invoke-direct {v12, v10, v11}, Lk7c;-><init>(ILjava/lang/String;)V

    invoke-virtual {v14, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v12, v16, 0x1

    move-object/from16 v13, v20

    move-object/from16 v10, v21

    goto :goto_3d3

    :cond_422
    move-object/from16 v21, v10

    move-object v13, v14

    goto :goto_42e

    :cond_426
    move-object/from16 v21, v10

    move-object/from16 v17, v11

    move-object/from16 p0, v12

    move-object/from16 v13, v16

    :goto_42e
    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    invoke-static {v9}, Lpoo;->d(Lorg/json/JSONArray;)Ljava/util/ArrayList;

    move-result-object v9

    const-string v10, "ctaButton2Visible"

    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v10

    const-string v11, "ctaButton2Text"

    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v7, Lxho;

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    iput-object v15, v7, Lxho;->a:Lw06;

    iput v8, v7, Lxho;->Z:I

    iput-object v0, v7, Lxho;->b:Ljava/lang/String;

    iput-object v2, v7, Lxho;->d:Ljava/lang/String;

    iput-object v3, v7, Lxho;->e:Ljava/lang/String;

    iput-object v4, v7, Lxho;->c:Ljava/lang/String;

    iput-object v5, v7, Lxho;->n:Ljava/lang/String;

    iput-object v6, v7, Lxho;->u:Ljava/lang/String;

    move-object/from16 v0, v21

    iput-object v0, v7, Lxho;->v:Ljava/lang/String;

    move-object/from16 v0, v17

    iput-object v0, v7, Lxho;->w:Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v0, v7, Lxho;->q:Ljava/lang/String;

    iput-object v13, v7, Lxho;->x:Ljava/util/ArrayList;

    iput-object v9, v7, Lxho;->p:Ljava/util/ArrayList;

    iput-boolean v10, v7, Lxho;->E:Z

    iput-object v11, v7, Lxho;->y:Ljava/lang/String;

    iput-object v1, v7, Lxho;->r:Ljava/lang/String;

    return-object v7

    :pswitch_472
    const-string v0, "htmlContent"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_492

    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lxho;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v5, v2, Lxho;->d:Ljava/lang/String;

    iput-object v5, v2, Lxho;->e:Ljava/lang/String;

    iput-object v15, v2, Lxho;->a:Lw06;

    iput-object v1, v2, Lxho;->c:Ljava/lang/String;

    iput-object v0, v2, Lxho;->h:Ljava/lang/String;

    goto :goto_4ae

    :cond_492
    new-instance v2, Lxho;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v5, v2, Lxho;->d:Ljava/lang/String;

    iput-object v5, v2, Lxho;->e:Ljava/lang/String;

    iput-object v15, v2, Lxho;->a:Lw06;

    sget-object v1, Lw06;->d:Ll06;

    if-eq v15, v1, :cond_4ac

    sget-object v1, Lw06;->e:Lm06;

    if-eq v15, v1, :cond_4ac

    sget-object v1, Lw06;->h:Lw06;

    if-ne v15, v1, :cond_4ae

    iput-object v0, v2, Lxho;->c:Ljava/lang/String;

    goto :goto_4ae

    :cond_4ac
    iput-object v0, v2, Lxho;->h:Ljava/lang/String;

    :cond_4ae
    :goto_4ae
    return-object v2

    :pswitch_4af
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v9

    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v3, "attributionText"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v3, "disclaimerText"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v3, "disclaimerPrivacy"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v3, "disclaimerPercent"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v14

    new-instance v3, Lxho;

    iget-object v4, v0, Lwmo;->a:Lw06;

    move-object v8, v2

    invoke-direct/range {v3 .. v14}, Lxho;-><init>(Lw06;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v3

    nop

    :pswitch_data_4ea
    .packed-switch 0x0
        :pswitch_4af
        :pswitch_472
        :pswitch_352
        :pswitch_2a6
        :pswitch_280
        :pswitch_23c
        :pswitch_1ce
        :pswitch_1ad
        :pswitch_167
        :pswitch_c2
        :pswitch_53
    .end packed-switch
.end method
