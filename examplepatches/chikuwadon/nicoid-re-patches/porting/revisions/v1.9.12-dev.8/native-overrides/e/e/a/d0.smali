.class public Le/e/a/d0;
.super Ljava/lang/Thread;
.source ""


# instance fields
.field public A:Ljava/lang/String;

.field public B:Ljava/lang/String;

.field public C:Ljava/lang/String;

.field public D:Ljava/lang/String;

.field public E:Ljava/lang/String;

.field public F:Ljava/lang/String;

.field public G:Ljava/lang/String;

.field public H:Ljava/lang/Boolean;

.field public I:Lorg/apache/http/client/CookieStore;

.field public J:Ljava/lang/String;

.field public K:Landroid/content/Context;

.field public L:[Ljava/lang/String;

.field public M:Landroid/content/SharedPreferences;

.field public N:J

.field public O:Z

.field public P:Z

.field public Q:Ljava/lang/String;

.field public R:Z

.field public S:Z

.field public T:Ljava/lang/String;

.field public U:Ljava/lang/String;

.field public V:Ljava/lang/String;

.field public a:Z

.field public b:Le/e/a/v;

.field public c:Le/e/a/g0;

.field public d:Ljava/lang/String;

.field public e:I

.field public f:I

.field public g:I

.field public i:Ljava/lang/String;

.field public j:Landroid/os/Handler;

.field public k:Le/e/a/l3/j;

.field public l:Landroid/os/Bundle;

.field public m:Landroid/os/Bundle;

.field public modernCommentsRequested:Z

.field public modernFallbackTried:Z

.field public modernWatch:Lorg/json/JSONObject;

.field public n:Ljava/lang/Boolean;

.field public o:Z

.field public p:Ljava/lang/Boolean;

.field public q:Ljava/lang/Boolean;

.field public r:Ljava/lang/Boolean;

.field public s:Z

.field public t:Z

.field public u:Z

.field public w:Z

.field public x:Z

.field public y:Z

.field public z:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-boolean v0, p0, Le/e/a/d0;->a:Z

    iput v0, p0, Le/e/a/d0;->e:I

    iput v0, p0, Le/e/a/d0;->f:I

    iput v0, p0, Le/e/a/d0;->g:I

    const-string v2, ""

    iput-object v2, p0, Le/e/a/d0;->i:Ljava/lang/String;

    new-instance v3, Landroid/os/Handler;

    invoke-direct {v3}, Landroid/os/Handler;-><init>()V

    iput-object v3, p0, Le/e/a/d0;->j:Landroid/os/Handler;

    const/4 v3, 0x0

    iput-object v3, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iput-boolean v0, p0, Le/e/a/d0;->o:Z

    iput-object v1, p0, Le/e/a/d0;->q:Ljava/lang/Boolean;

    iput-object v1, p0, Le/e/a/d0;->r:Ljava/lang/Boolean;

    iput-boolean v0, p0, Le/e/a/d0;->s:Z

    iput-boolean v0, p0, Le/e/a/d0;->t:Z

    const/4 v3, 0x1

    iput-boolean v3, p0, Le/e/a/d0;->u:Z

    iput-boolean v0, p0, Le/e/a/d0;->w:Z

    iput-boolean v0, p0, Le/e/a/d0;->x:Z

    iput-boolean v0, p0, Le/e/a/d0;->y:Z

    iput-object v1, p0, Le/e/a/d0;->z:Ljava/lang/Boolean;

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    aput-object v2, v1, v0

    aput-object v2, v1, v3

    const/4 v4, 0x2

    aput-object v2, v1, v4

    const/4 v5, 0x3

    aput-object v2, v1, v5

    const/4 v5, 0x4

    aput-object v2, v1, v5

    iput-object v1, p0, Le/e/a/d0;->L:[Ljava/lang/String;

    const-wide/16 v6, 0x0

    iput-wide v6, p0, Le/e/a/d0;->N:J

    iput-boolean v0, p0, Le/e/a/d0;->O:Z

    iput-boolean v0, p0, Le/e/a/d0;->P:Z

    const-string v1, "0-1:100"

    iput-object v1, p0, Le/e/a/d0;->Q:Ljava/lang/String;

    iput-boolean v3, p0, Le/e/a/d0;->R:Z

    iput-boolean v0, p0, Le/e/a/d0;->S:Z

    iput-object v2, p0, Le/e/a/d0;->T:Ljava/lang/String;

    iput-object p1, p0, Le/e/a/d0;->K:Landroid/content/Context;

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Le/e/a/d0;->M:Landroid/content/SharedPreferences;

    iget-object v1, p0, Le/e/a/d0;->M:Landroid/content/SharedPreferences;

    const-string v2, "share_ng_level"

    const-string v6, "-4800"

    invoke-interface {v1, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Le/e/a/d0;->f:I

    iget-object v1, p0, Le/e/a/d0;->M:Landroid/content/SharedPreferences;

    const-string v2, "quality_mode"

    const-string v6, "0"

    invoke-interface {v1, v2, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Le/e/a/d0;->e:I

    iget-object v1, p0, Le/e/a/d0;->M:Landroid/content/SharedPreferences;

    const-string v2, "mobile_low_quality_legacy_unused"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_99

    invoke-static {p1}, Le/e/a/v0;->g(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_99

    iput v5, p0, Le/e/a/d0;->e:I

    :cond_99
    iget v1, p0, Le/e/a/d0;->e:I

    invoke-static {p1, v1}, Le/e/a/FeedbackFixes;->mobileQuality(Landroid/content/Context;I)I

    move-result v1

    iput v1, p0, Le/e/a/d0;->e:I

    iget-object v1, p0, Le/e/a/d0;->M:Landroid/content/SharedPreferences;

    const-string v2, "comment_cast_min"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Le/e/a/d0;->u:Z

    const v0, 0x7f0f0161

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static/range {p1 .. p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Le/e/a/d0;->M:Landroid/content/SharedPreferences;

    const-string v1, "player_lang"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "-1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_cb

    goto :goto_cc

    :cond_cb
    move-object p1, v0

    :goto_cc
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Le/e/a/d0;->g:I

    iget p1, p0, Le/e/a/d0;->g:I

    if-eqz p1, :cond_e1

    if-eq p1, v3, :cond_de

    if-eq p1, v4, :cond_db

    goto :goto_e5

    :cond_db
    const-string p1, "zh-tw"

    goto :goto_e3

    :cond_de
    const-string p1, "en-us"

    goto :goto_e3

    :cond_e1
    const-string p1, "ja-jp"

    :goto_e3
    iput-object p1, p0, Le/e/a/d0;->i:Ljava/lang/String;

    :goto_e5
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/String;)Landroid/os/Bundle;
    .registers 23

    move-object/from16 v1, p0

    const-string v0, "smileInfo"

    const-string v2, "ranking"

    const-string v3, "video"

    const-string v4, "playlist"

    const-string v5, "owner"

    const-string v6, "genre"

    const-string v7, "tag"

    const-string v8, "comment"

    new-instance v9, Landroid/os/Bundle;

    invoke-direct {v9}, Landroid/os/Bundle;-><init>()V

    :try_start_17
    new-instance v10, Lorg/json/JSONObject;

    move-object/from16 v11, p1

    invoke-direct {v10, v11}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v10, v9}, Le/e/a/VideoInfoUi;->captureStatistics(Lorg/json/JSONObject;Landroid/os/Bundle;)V

    invoke-virtual {v10, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_32

    invoke-virtual {v10, v5}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_32

    invoke-virtual {v10, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    goto :goto_33

    :cond_32
    const/4 v5, 0x0

    :goto_33
    invoke-virtual {v10, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_44

    invoke-virtual {v10, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_44

    invoke-virtual {v10, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    goto :goto_45

    :cond_44
    const/4 v4, 0x0

    :goto_45
    invoke-virtual {v10, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_56

    invoke-virtual {v10, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_56

    invoke-virtual {v10, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    goto :goto_57

    :cond_56
    const/4 v3, 0x0

    :goto_57
    invoke-virtual {v10, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_68

    invoke-virtual {v10, v8}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_68

    invoke-virtual {v10, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    goto :goto_69

    :cond_68
    const/4 v11, 0x0

    :goto_69
    invoke-virtual {v10, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_7a

    invoke-virtual {v10, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_7a

    invoke-virtual {v10, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    goto :goto_7b

    :cond_7a
    const/4 v2, 0x0

    :goto_7b
    invoke-virtual {v10, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_92

    invoke-virtual {v10, v7}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_92

    invoke-virtual {v10, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "items"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v13

    goto :goto_93

    :cond_92
    const/4 v13, 0x0

    :goto_93
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_a4

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_a4

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_a5

    :cond_a4
    const/4 v0, 0x0

    :goto_a5
    const-string v14, "channel"

    invoke-virtual {v10, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_bc

    const-string v14, "channel"

    invoke-virtual {v10, v14}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_bc

    const-string v14, "channel"

    invoke-virtual {v10, v14}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v14

    goto :goto_bd

    :cond_bc
    const/4 v14, 0x0

    :goto_bd
    const-string v15, "media"

    invoke-virtual {v10, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_d4

    const-string v15, "media"

    invoke-virtual {v10, v15}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_d4

    const-string v15, "media"

    invoke-virtual {v10, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    goto :goto_d5

    :cond_d4
    const/4 v15, 0x0

    :goto_d5
    const-string v12, "viewer"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_ec

    const-string v12, "viewer"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_ec

    const-string v12, "viewer"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    goto :goto_ed

    :cond_ec
    const/4 v12, 0x0

    :goto_ed
    if-eqz v4, :cond_11b

    invoke-virtual {v4}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v10

    :goto_f3
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_11b

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 p1, v10

    move-object/from16 v10, v16

    check-cast v10, Ljava/lang/String;

    move-object/from16 v16, v12

    const-string v12, "recipe"

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_116

    const-string v12, "recipe"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v12, v10}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_116
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_116} :catch_4e2

    :cond_116
    move-object/from16 v10, p1

    move-object/from16 v12, v16

    goto :goto_f3

    :cond_11b
    move-object/from16 v16, v12

    const-string v4, "id"

    const-string v10, ""

    if-eqz v5, :cond_185

    :try_start_123
    invoke-virtual {v5}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v12

    :goto_127
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_185

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 p1, v12

    move-object/from16 v12, v17

    check-cast v12, Ljava/lang/String;

    move-object/from16 v17, v15

    const-string v15, "nickname"

    invoke-virtual {v12, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_14d

    const-string v15, "nickname"

    move-object/from16 v18, v7

    invoke-virtual {v5, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v9, v15, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_14f

    :cond_14d
    move-object/from16 v18, v7

    :goto_14f
    const-string v7, "iconUrl"

    invoke-virtual {v12, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_160

    const-string v7, "icon_url"

    invoke-virtual {v5, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v9, v7, v15}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_160
    invoke-virtual {v12, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_17e

    const-string v7, "videoUserId"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v12}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v7, v12}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_17e
    .catch Ljava/lang/Exception; {:try_start_123 .. :try_end_17e} :catch_4e2

    :cond_17e
    move-object/from16 v12, p1

    move-object/from16 v15, v17

    move-object/from16 v7, v18

    goto :goto_127

    :cond_185
    move-object/from16 v18, v7

    move-object/from16 v17, v15

    const-string v5, "thumbnail"

    const-string v7, "url"

    if-eqz v14, :cond_1f6

    :try_start_18f
    invoke-virtual {v14}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v12

    :goto_193
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_1f6

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    move-object/from16 p1, v12

    const-string v12, "name"

    invoke-virtual {v15, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1b5

    const-string v12, "nickname"

    move-object/from16 v19, v13

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v12, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1b7

    :cond_1b5
    move-object/from16 v19, v13

    :goto_1b7
    invoke-virtual {v15, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1da

    const-string v12, "channelVideoURL"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v20, v6

    const-string v6, "http://ch.nicovideo.jp/"

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v9, v12, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1dc

    :cond_1da
    move-object/from16 v20, v6

    :goto_1dc
    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1ef

    const-string v6, "icon_url"

    invoke-virtual {v14, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    invoke-virtual {v12, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v6, v12}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1ef
    move-object/from16 v12, p1

    move-object/from16 v13, v19

    move-object/from16 v6, v20

    goto :goto_193

    :cond_1f6
    move-object/from16 v20, v6

    move-object/from16 v19, v13

    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v6

    :goto_1fe
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_336

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v12, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_219

    const-string v13, "v"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v13, v14}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_219
    const-string v13, "description"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_22a

    const-string v13, "description"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v13, v14}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_22a
    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_257

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "middleUrl"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_250

    const-string v14, "middleUrl"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_250

    const-string v14, "thumbImage"

    const-string v15, "middleUrl"

    invoke-virtual {v13, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    :goto_24c
    invoke-virtual {v9, v14, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_257

    :cond_250
    const-string v14, "thumbImage"

    invoke-virtual {v13, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    goto :goto_24c

    :cond_257
    :goto_257
    invoke-virtual {v12, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_266

    const-string v13, "videoId"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v13, v14}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_266
    const-string v13, "title"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_277

    const-string v13, "videoTitle"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v13, v14}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_277
    const-string v13, "registeredAt"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_288

    const-string v13, "first_retrieve"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v13, v14}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_288
    const-string v13, "duration"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2a8

    const-string v13, "length"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v13, v14}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2a8
    const-string v13, "count"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_31f

    const-string v13, "count"

    invoke-virtual {v3, v13}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "viewCount"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 p1, v5

    const-string v5, "view"

    invoke-virtual {v13, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9, v14, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "mylistCount"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "mylist"

    invoke-virtual {v13, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v5, v14}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "commentCount"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v5, v14}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "likeCount"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "like"

    invoke-virtual {v13, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v13

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v5, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_321

    :cond_31f
    move-object/from16 p1, v5

    :goto_321
    const-string v5, "movieType"

    invoke-virtual {v12, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_332

    const-string v5, "movie_type"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v5, v12}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_332
    move-object/from16 v5, p1

    goto/16 :goto_1fe

    :cond_336
    if-eqz v0, :cond_372

    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    :cond_33c
    :goto_33c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_372

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_33c

    const-string v6, "flvUrl"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v9, v6, v8}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "HTML5 flvUrl:"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Le/e/a/d0;->G:Ljava/lang/String;

    goto :goto_33c

    :cond_372
    const/4 v0, 0x0

    if-eqz v11, :cond_3f9

    const-string v3, "threads"

    invoke-virtual {v11, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    const/4 v5, 0x0

    :goto_37c
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_3f9

    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/json/JSONObject;

    invoke-virtual {v6}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v8

    const/4 v12, 0x0

    :cond_38d
    :goto_38d
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_3f6

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    const-string v14, "isDefaultPostTarget"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3be

    const-string v14, "isDefaultPostTarget"

    invoke-virtual {v6, v14, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v14

    if-eqz v14, :cond_3be

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    iput-object v14, v1, Le/e/a/d0;->A:Ljava/lang/String;

    :cond_3be
    invoke-virtual {v13, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3c8

    invoke-virtual {v6, v13}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12

    :cond_3c8
    const-string v14, "label"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_38d

    const-string v14, "label"

    invoke-virtual {v6, v14}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_38d

    invoke-virtual {v6, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v14, "extra-community"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_38d

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    iput-object v13, v1, Le/e/a/d0;->B:Ljava/lang/String;

    goto :goto_38d

    :cond_3f6
    add-int/lit8 v5, v5, 0x1

    goto :goto_37c

    :cond_3f9
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "extraCommunityThreadid:"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v1, Le/e/a/d0;->B:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    if-eqz v2, :cond_442

    move-object/from16 v3, v20

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_442

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_442

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v5, "genreName"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9, v5, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "highestRank"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "rank"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_442
    const/4 v2, 0x1

    if-eqz v19, :cond_488

    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    :goto_44a
    invoke-virtual/range {v19 .. v19}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v0, v5, :cond_47f

    move-object/from16 v12, v19

    invoke-virtual {v12, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/json/JSONObject;

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    const-string v8, "isNicodicArticleExists"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_46a

    const-string v8, "dic"

    invoke-virtual {v6, v8, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    :cond_46a
    const-string v8, "name"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v8, v18

    invoke-virtual {v6, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v3, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v0, v0, 0x1

    move-object/from16 v18, v8

    move-object/from16 v19, v12

    goto :goto_44a

    :cond_47f
    const-string v0, "tagList"

    invoke-virtual {v3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9, v0, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_488
    if-eqz v17, :cond_48c

    iput-boolean v2, v1, Le/e/a/d0;->w:Z

    :cond_48c
    iget-boolean v0, v1, Le/e/a/d0;->w:Z

    if-eqz v0, :cond_4e6

    const-string v0, "delivery"

    move-object/from16 v15, v17

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4e6

    const-string v0, "delivery"

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4e6

    const-string v0, "delivery"

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v1, v0, v9}, Le/e/a/d0;->a(Lorg/json/JSONObject;Landroid/os/Bundle;)V

    move-object/from16 v12, v16

    invoke-virtual {v12, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4b9

    invoke-virtual {v12, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Le/e/a/d0;->C:Ljava/lang/String;

    :cond_4b9
    const-string v0, "isPremium"

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4cd

    const-string v0, "isPremium"

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, v1, Le/e/a/d0;->H:Ljava/lang/Boolean;

    :cond_4cd
    const-string v0, "server"

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "/api/"

    const-string v3, "/api.json/"

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Le/e/a/d0;->E:Ljava/lang/String;
    :try_end_4e1
    .catch Ljava/lang/Exception; {:try_start_18f .. :try_end_4e1} :catch_4e2

    goto :goto_4e6

    :catch_4e2
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_4e6
    :goto_4e6
    return-object v9
.end method

.method public final b(Landroid/os/Bundle;Ljava/lang/String;)V
    .registers 13

    const-string v0, "cookie"

    const-string v1, "sessionRequest"

    const-string v2, "UTF-8"

    const-string v3, "sessionURL"

    const-string v4, "/nicoid/nicoid_cache/"

    iget-object v5, p0, Le/e/a/d0;->K:Landroid/content/Context;

    invoke-static {v5}, Le/e/a/o;->a(Landroid/content/Context;)V

    const/4 v5, 0x0

    :try_start_10
    new-instance v6, Le/e/a/CacheFile;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Le/e/a/d0;->K:Landroid/content/Context;

    invoke-static {v8}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ".json"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_45

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_49

    :cond_45
    iget-boolean v7, p0, Le/e/a/d0;->O:Z

    if-eqz v7, :cond_9d

    :cond_49
    iget-boolean v7, p0, Le/e/a/d0;->O:Z

    if-nez v7, :cond_5b

    iget-object v7, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v8, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v9, 0x7f0f0059

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    :cond_5b
    invoke-virtual {p1}, Landroid/os/Bundle;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Bundle;

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6a

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_6a
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_73

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_73
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7c

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_7c
    new-instance v0, Le/e/a/CacheOutputStream;

    invoke-direct {v0, v6, v5}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;Z)V

    new-instance v1, Ljava/io/OutputStreamWriter;

    invoke-direct {v1, v0, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    new-instance v0, Ljava/io/BufferedWriter;

    invoke-direct {v0, v1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    invoke-static {p1}, Le/e/a/v0;->a(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/BufferedWriter;->flush()V

    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V
    :try_end_98
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_98} :catch_99

    goto :goto_9d

    :catch_99
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_9d
    :goto_9d
    :try_start_9d
    new-instance p1, Le/e/a/CacheFile;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Le/e/a/d0;->K:Landroid/content/Context;

    invoke-static {v1}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".xml"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_d2

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_d6

    :cond_d2
    iget-boolean v0, p0, Le/e/a/d0;->O:Z

    if-eqz v0, :cond_f3

    :cond_d6
    new-instance v0, Le/e/a/CacheOutputStream;

    invoke-direct {v0, p1, v5}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;Z)V

    new-instance p1, Ljava/io/OutputStreamWriter;

    invoke-direct {p1, v0, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    new-instance v0, Ljava/io/BufferedWriter;

    invoke-direct {v0, p1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v0, p2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/BufferedWriter;->flush()V

    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V
    :try_end_ee
    .catch Ljava/lang/Exception; {:try_start_9d .. :try_end_ee} :catch_ef

    goto :goto_f3

    :catch_ef
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_f3
    :goto_f3
    return-void
.end method

.method public final d()V
    .registers 8

    invoke-static {p0}, Le/e/a/CachedPlayback;->offline(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const-string v0, "UTF-8"

    const-string v1, "/nicoid/nicoid_cache/"

    iget-object v2, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f006d

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    :try_start_19
    new-instance v2, Le/e/a/CacheFile;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Le/e/a/d0;->K:Landroid/content/Context;

    invoke-static {v4}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ".json"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_a8

    iget-object v3, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v4, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v5, 0x7f0f0073

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    new-instance v4, Le/e/a/CacheInputStream;

    invoke-direct {v4, v2}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V

    new-instance v2, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-direct {v5, v4, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v2, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    :goto_73
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_7d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_73

    :cond_7d
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    :goto_8a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9e

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8a

    :cond_9e
    iget-object v2, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Landroid/os/Bundle;)V
    :try_end_a3
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_a3} :catch_a4

    goto :goto_a8

    :catch_a4
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    :cond_a8
    :goto_a8
    :try_start_a8
    new-instance v2, Le/e/a/CacheFile;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Le/e/a/d0;->K:Landroid/content/Context;

    invoke-static {v4}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".xml"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_117

    iget-object v1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f0072

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    new-instance v1, Le/e/a/CacheInputStream;

    invoke-direct {v1, v2}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V

    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v1, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    :goto_fd
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_107

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_fd

    :cond_107
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Le/e/a/d0;->b:Le/e/a/v;

    iput-object v0, v1, Le/e/a/v;->d:Ljava/lang/String;

    invoke-virtual {p0, v0}, Le/e/a/d0;->a(Ljava/lang/String;)V
    :try_end_112
    .catch Ljava/lang/Exception; {:try_start_a8 .. :try_end_112} :catch_113

    goto :goto_117

    :catch_113
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_117
    :goto_117
    iget-object v0, p0, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    const-string v1, ""

    invoke-virtual {p0, v1, v0}, Le/e/a/d0;->a(Ljava/lang/String;Lorg/apache/http/client/CookieStore;)V

    invoke-static {p0}, Le/e/a/ModernComments;->load(Le/e/a/d0;)V

    return-void
.end method

.method public final f(Ljava/lang/String;)Landroid/os/Bundle;
    .registers 12

    invoke-static/range {p0 .. p1}, Le/e/a/ModernPlayback;->info(Le/e/a/d0;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_7

    return-object v0

    :cond_7
    const-string v0, "nickname"

    iget-object v1, p0, Le/e/a/d0;->l:Landroid/os/Bundle;

    if-eqz v1, :cond_4c

    const-string p1, "isNewsaba"

    invoke-virtual {v1, p1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    if-eqz v0, :cond_3b

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_3b

    iget-object v0, p0, Le/e/a/d0;->l:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Le/e/a/d0;->w:Z

    iget-object p1, p0, Le/e/a/d0;->l:Landroid/os/Bundle;

    const-string v0, "sessionURL"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Le/e/a/d0;->U:Ljava/lang/String;

    iget-object p1, p0, Le/e/a/d0;->l:Landroid/os/Bundle;

    const-string v0, "sessionRequest"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Le/e/a/d0;->V:Ljava/lang/String;

    :cond_3b
    iget-object p1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v0, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v1, 0x7f0f006c

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object p1, p0, Le/e/a/d0;->l:Landroid/os/Bundle;

    return-object p1

    :cond_4c
    const/4 v1, 0x0

    :try_start_4d
    iget-object v2, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f0065

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v3, Lorg/apache/http/client/methods/HttpGet;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "https://www.nicovideo.jp/watch/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "?watch_harmful=2"

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Le/e/a/d0;->e:I
    :try_end_76
    .catch Ljava/lang/Exception; {:try_start_4d .. :try_end_76} :catch_27a

    const/4 v5, 0x3

    const-string v6, ""

    if-eq p1, v5, :cond_83

    :try_start_7b
    iget p1, p0, Le/e/a/d0;->e:I

    const/4 v5, 0x4

    if-ne p1, v5, :cond_81

    goto :goto_83

    :cond_81
    move-object p1, v6

    goto :goto_85

    :cond_83
    :goto_83
    const-string p1, "&eco=1"

    :goto_85
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v3, p1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    new-instance p1, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {p1}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    const-string v4, "http.cookie-store"

    iget-object v5, p0, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-interface {p1, v4, v5}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "Accept-Language"

    iget-object v5, p0, Le/e/a/d0;->i:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v3, p1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object p1

    new-instance v3, Ljava/lang/String;

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-direct {v3, v4, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Le/e/a/d0;->N:J

    const-string v4, "<h1>\u30d7\u30ed\u30d5\u30a3\u30fc\u30eb\u60c5\u5831\u306e\u5165\u529b</h1>"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-ltz v4, :cond_d9

    iget-object p1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    const-string v0, "\u300c\u30d7\u30ed\u30d5\u30a3\u30fc\u30eb\u767b\u9332\u300d\u3092\u5b8c\u4e86\u3055\u305b\u3066\u304f\u3060\u3055\u3044"

    invoke-interface {p1, v0}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object p1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    const-string v0, "\u30d6\u30e9\u30a6\u30b6\u304b\u3089\u30cb\u30b3\u30cb\u30b3\u52d5\u753b\u306b\u30a2\u30af\u30bb\u30b9\u3057"

    invoke-interface {p1, v0}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object p1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    const-string v0, "\u30a2\u30ab\u30a6\u30f3\u30c8\u60c5\u5831\u304c\u672a\u5165\u529b\u306e\u305f\u3081\u52d5\u753b\u3092\u518d\u751f\u3067\u304d\u307e\u305b\u3093"

    invoke-interface {p1, v0}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    return-object v1

    :cond_d9
    iget-object v4, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v5, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v7, 0x7f0f0064

    invoke-virtual {v5, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    const-string v4, "\"js-initial-watch-data\" data-api-data=\"([^\"]+?)\" data-environment=\""

    const/16 v5, 0x20

    invoke-static {v4, v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    move-object v7, v1

    :goto_f4
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    const/4 v9, 0x1

    if-eqz v8, :cond_104

    invoke-virtual {v4, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_f4

    :cond_104
    const/4 v4, 0x0

    if-nez v7, :cond_122

    iput-boolean v4, p0, Le/e/a/d0;->R:Z

    const-string v8, "id=\"watchAPIDataContainer\"[^>]+?>([^<]+?)</div>"

    invoke-static {v8, v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    :goto_113
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_122

    invoke-virtual {v5, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_113

    :cond_122
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "database : HTML5"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v8, p0, Le/e/a/d0;->R:Z

    if-eqz v8, :cond_133

    const-string v8, "\u3060\u3088"

    goto :goto_135

    :cond_133
    const-string v8, "\u3058\u3083\u306a\u3044\u3088"

    :goto_135
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    if-eqz v7, :cond_14d

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "database : "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :cond_14d
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v5
    :try_end_15a
    .catch Ljava/lang/Exception; {:try_start_7b .. :try_end_15a} :catch_27a

    const-string v8, "nicovideo_version"

    if-nez v7, :cond_1ca

    const/16 v7, 0xc8

    if-ne v5, v7, :cond_16b

    :try_start_162
    invoke-virtual {p0, v3}, Le/e/a/d0;->c(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {p1, v8, v9}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto/16 :goto_1db

    :cond_16b
    iget-object v0, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v2, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v3, 0x7f0f0068

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    const/16 v0, 0x1f7

    if-ne v5, v0, :cond_18c

    iget-object p1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v0, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v2, 0x7f0f006b

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_188
    invoke-interface {p1, v0}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    goto :goto_1b9

    :cond_18c
    const/16 v0, 0x194

    if-ne v5, v0, :cond_19c

    iget-object p1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v0, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v2, 0x7f0f006a

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_188

    :cond_19c
    const/16 v0, 0x193

    if-ne v5, v0, :cond_1ac

    iget-object p1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v0, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v2, 0x7f0f0069

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_188

    :cond_1ac
    iget-object v0, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    :goto_1b9
    iget-object p1, p0, Le/e/a/d0;->q:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1c9

    iget-object p1, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    invoke-interface {p1, v4}, Le/e/a/l3/j;->a(Z)V

    invoke-virtual {p0}, Le/e/a/d0;->d()V

    :cond_1c9
    return-object v1

    :cond_1ca
    iget-boolean p1, p0, Le/e/a/d0;->R:Z

    if-eqz p1, :cond_1d6

    invoke-virtual {p0, v7}, Le/e/a/d0;->b(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    :goto_1d2
    invoke-virtual {p1, v8, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_1db

    :cond_1d6
    invoke-virtual {p0, v7}, Le/e/a/d0;->e(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    goto :goto_1d2

    :goto_1db
    const-string v3, "description"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1e4

    goto :goto_1ed

    :cond_1e4
    iget-object v3, p0, Le/e/a/d0;->K:Landroid/content/Context;

    const v5, 0x7f0f0066

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    :goto_1ed
    const-string v5, "Anicoid"

    invoke-static {v5, v3}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "<span id=\"deleted_message_default\">(.+?)</span>"

    const-string v7, "<font color=\'#ff0000\'>$1</font>"

    invoke-virtual {v3, v5, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "href=\"(h?ttps?://)([^\"]+)\""

    const-string v7, "motoweblink\"$2\""

    invoke-virtual {v3, v5, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, ">(h?ttps?://)([^<]+)</a>"

    const-string v7, "nakaweblink>$2</a>"

    invoke-virtual {v3, v5, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "(h?ttps?)(://[-_.!~*\\\'()a-zA-Z0-9;\\/?:\\@&=+\\$,%#]+)"

    const-string v7, "<a href=\'http$2\'>http$2</a>"

    invoke-virtual {v3, v5, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "motoweblink\"([^\"]+)\""

    const-string v7, "href=\'http://$1\'"

    invoke-virtual {v3, v5, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "nakaweblink>([^<]+)</a>"

    const-string v7, ">http://$1</a>"

    invoke-virtual {v3, v5, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v8, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v9, :cond_240

    const-string v4, "(http://com.nicovideo.jp/community/|)co([0-9]+)"

    const-string v5, "<a href=\'http://com.nicovideo.jp/community/co$2\'>$1co$2</a>"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "(http://www.nicovideo.jp/|)(mylist|user|watch)/([0-9/]+)"

    const-string v5, "<a href=\'http://www.nicovideo.jp/$2/$3\'>$1$2/$3</a>"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "(http://www.nicovideo.jp/watch/|)(sm|so|nm|ss)([0-9]+)"

    const-string v5, "<a href=\'http://www.nicovideo.jp/watch/$2$3\'>$1$2$3</a>"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_240
    const-string v4, "\""

    const-string v5, "\'"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "description_original"

    invoke-virtual {p1, v4, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "cookie"

    iget-object v4, p0, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-static {v4}, Le/e/a/v0;->a(Lorg/apache/http/client/CookieStore;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_264

    const-string v3, "name"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_264
    if-eqz v3, :cond_26f

    const-string v4, "\\s\u3055\u3093"

    invoke-virtual {v3, v4, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v0, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_26f
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    invoke-virtual {p0, p1}, Le/e/a/d0;->a(Landroid/os/Bundle;)V
    :try_end_279
    .catch Ljava/lang/Exception; {:try_start_162 .. :try_end_279} :catch_27a

    return-object p1

    :catch_27a
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-object v1
.end method

.method public final g(Ljava/lang/String;)Ljava/lang/String;
    .registers 18

    invoke-static/range {p0 .. p1}, Le/e/a/ModernPlayback;->stream(Le/e/a/d0;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_7

    return-object v0

    :cond_7
    invoke-static/range {p0 .. p0}, Le/e/a/GuestWatch;->hasFailure(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    const/4 v0, 0x0

    return-object v0

    :cond_f
    move-object/from16 v1, p0

    const-string v2, "flvUrl"

    iget-boolean v3, v1, Le/e/a/d0;->a:Z

    const/4 v4, 0x0

    if-eqz v3, :cond_19

    return-object v4

    :cond_19
    iget-object v3, v1, Le/e/a/d0;->n:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_26

    invoke-virtual/range {p0 .. p1}, Le/e/a/d0;->f(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v3

    goto :goto_2a

    :cond_26
    invoke-virtual/range {p0 .. p1}, Le/e/a/d0;->h(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v3

    :goto_2a
    if-nez v3, :cond_2d

    return-object v4

    :cond_2d
    iput-object v3, v1, Le/e/a/d0;->m:Landroid/os/Bundle;

    iget-object v5, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    invoke-interface {v5, v3}, Le/e/a/l3/j;->a(Landroid/os/Bundle;)V

    const-string v5, "v"

    invoke-virtual {v3, v5}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_48

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "v"

    invoke-virtual {v3, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_4f

    :cond_48
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v6, p1

    :goto_4f
    const-string v7, "?watch_harmful=2"

    invoke-static {v5, v6, v7}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iget-boolean v6, v1, Le/e/a/d0;->a:Z

    if-eqz v6, :cond_5a

    return-object v4

    :cond_5a
    :try_start_5a
    new-instance v4, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v4}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v6, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v6}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    const-string v7, "http.cookie-store"

    iget-object v8, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-interface {v6, v7, v8}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v4}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v7

    const-string v8, "http.useragent"

    const-string v9, "Windows"

    invoke-interface {v7, v8, v9}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    const-string v7, "length"

    invoke-virtual {v3, v7}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    const/4 v8, 0x1

    if-eqz v7, :cond_125

    const-string v7, "length"

    invoke-virtual {v3, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    const/16 v9, 0x64

    div-int/lit8 v10, v7, 0x3c

    const/16 v11, 0x3c

    rem-int/2addr v7, v11

    add-int/2addr v10, v8

    const/16 v12, 0x32

    if-le v7, v12, :cond_97

    add-int/lit8 v10, v10, 0x1

    :cond_97
    const/16 v7, 0xb

    const/4 v12, 0x6

    if-le v10, v8, :cond_a1

    if-ge v10, v12, :cond_a1

    const/16 v9, 0xfa

    goto :goto_ac

    :cond_a1
    if-lt v10, v12, :cond_a8

    if-ge v10, v7, :cond_a8

    const/16 v9, 0x1f4

    goto :goto_ac

    :cond_a8
    if-lt v10, v7, :cond_ac

    const/16 v9, 0x3e8

    :cond_ac
    :goto_ac
    const/16 v13, 0x1e

    if-le v10, v13, :cond_b5

    if-gt v10, v11, :cond_b5

    const/16 v14, 0x32

    goto :goto_c7

    :cond_b5
    if-le v10, v11, :cond_be

    const/16 v14, 0x5a

    if-gt v10, v14, :cond_be

    const/16 v14, 0x1e

    goto :goto_c7

    :cond_be
    const/16 v14, 0x5a

    if-le v10, v14, :cond_c5

    const/16 v14, 0xa

    goto :goto_c7

    :cond_c5
    const/16 v14, 0x64

    :goto_c7
    iget-boolean v15, v1, Le/e/a/d0;->t:Z

    if-eqz v15, :cond_f7

    iget-boolean v15, v1, Le/e/a/d0;->u:Z

    if-eqz v15, :cond_f7

    if-le v10, v8, :cond_d6

    if-ge v10, v12, :cond_d6

    const/16 v9, 0xfa

    goto :goto_e1

    :cond_d6
    if-lt v10, v12, :cond_dd

    if-ge v10, v7, :cond_dd

    const/16 v9, 0x1f4

    goto :goto_e1

    :cond_dd
    if-lt v10, v7, :cond_e1

    const/16 v9, 0x15e

    :cond_e1
    :goto_e1
    const/4 v7, 0x5

    if-le v10, v7, :cond_eb

    const/16 v7, 0x14

    if-gt v10, v7, :cond_eb

    const/16 v13, 0x32

    goto :goto_f8

    :cond_eb
    const/16 v7, 0x14

    if-le v10, v7, :cond_f2

    if-gt v10, v13, :cond_f2

    goto :goto_f8

    :cond_f2
    if-le v10, v11, :cond_f7

    const/16 v13, 0xa

    goto :goto_f8

    :cond_f7
    move v13, v14

    :goto_f8
    iget-object v7, v1, Le/e/a/d0;->M:Landroid/content/SharedPreferences;

    invoke-static {v7, v13}, Le/e/a/Followup173;->legacyPerMinute(Landroid/content/SharedPreferences;I)I

    move-result v13

    invoke-static {v7, v9}, Le/e/a/Followup173;->legacyTotal(Landroid/content/SharedPreferences;I)I

    move-result v9

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "0-"

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ":"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, ","

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v1, Le/e/a/d0;->Q:Ljava/lang/String;

    :cond_125
    iget v7, v1, Le/e/a/d0;->e:I

    iget v9, v1, Le/e/a/d0;->e:I

    const/4 v10, 0x4

    const/4 v11, 0x3

    if-ne v9, v10, :cond_12e

    const/4 v7, 0x3

    :cond_12e
    iget v9, v1, Le/e/a/d0;->e:I

    const/4 v10, 0x5

    if-ne v9, v10, :cond_134

    const/4 v7, 0x0

    :cond_134
    invoke-virtual {v3, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_157

    const-string v9, "movie_type"

    invoke-virtual {v3, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_157

    const-string v9, "movie_type"

    invoke-virtual {v3, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "fl"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_157

    invoke-virtual {v3, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-nez v9, :cond_157

    const/4 v7, 0x3

    :cond_157
    const-string v9, "videoId"

    invoke-virtual {v3, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_181

    const-string v9, "videoId"

    invoke-virtual {v3, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "so"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_181

    iput-boolean v8, v1, Le/e/a/d0;->P:Z

    iget-object v9, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v10, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v12, 0x7f0f0071

    invoke-virtual {v10, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-static/range {v10 .. v10}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    :cond_181
    iget-object v9, v1, Le/e/a/d0;->n:Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    if-nez v9, :cond_193

    if-ne v7, v11, :cond_18d

    const/4 v7, -0x2

    goto :goto_18e

    :cond_18d
    const/4 v7, -0x1

    :goto_18e
    iget-boolean v9, v1, Le/e/a/d0;->w:Z

    if-eqz v9, :cond_193

    const/4 v7, -0x3

    :cond_193
    iget-boolean v9, v1, Le/e/a/d0;->a:Z

    if-eqz v9, :cond_199

    const/4 v2, 0x0

    return-object v2

    :cond_199
    if-eqz v7, :cond_1a0

    if-ne v7, v11, :cond_19e

    goto :goto_1a0

    :cond_19e
    const/4 v9, 0x0

    goto :goto_1a6

    :cond_1a0
    :goto_1a0
    const-string v9, "content_uri"

    invoke-virtual {v3, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9
    :try_end_1a6
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_1a6} :catch_77d

    :goto_1a6
    :try_start_1a6
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "isHTTPSupport"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v11, v1, Le/e/a/d0;->o:Z

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    iget-boolean v10, v1, Le/e/a/d0;->o:Z
    :try_end_1ba
    .catch Ljava/lang/Exception; {:try_start_1a6 .. :try_end_1ba} :catch_634

    const-string v11, "Anicoid"

    const-string v12, "UTF-8"

    if-nez v10, :cond_638

    :try_start_1c0
    const/16 v13, 0x20

    iget-boolean v8, v1, Le/e/a/d0;->a:Z

    if-eqz v8, :cond_1c8

    const/4 v2, 0x0

    return-object v2

    :cond_1c8
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "\u30c7\u30d0\u30c3\u30b0 mode: "

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1d8
    .catch Ljava/lang/Exception; {:try_start_1c0 .. :try_end_1d8} :catch_634

    const-string v8, "&eco=1"

    const-string v10, ""

    if-eqz v7, :cond_1e6

    const/4 v13, 0x3

    if-ne v7, v13, :cond_1e2

    goto :goto_1e6

    :cond_1e2
    move-object/from16 p1, v8

    goto/16 :goto_30f

    :cond_1e6
    :goto_1e6
    :try_start_1e6
    new-instance v13, Lorg/apache/http/client/methods/HttpGet;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "http://flapi.nicovideo.jp/api/getflv/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v15, 0x3

    if-ne v7, v15, :cond_1fa

    move-object v15, v8

    goto :goto_1fb

    :cond_1fa
    move-object v15, v10

    :goto_1fb
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v13, v6}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "HTML5 MODE"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v15, " http://flapi.nicovideo.jp/api/getflv/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v15, 0x3

    if-ne v7, v15, :cond_223

    move-object v15, v8

    goto :goto_224

    :cond_223
    move-object v15, v10

    :goto_224
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const-string v14, "([^=]+)=([^&]*)\\&"

    const/16 v15, 0x20

    invoke-static {v14, v15}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 p1, v8

    new-instance v8, Ljava/lang/String;

    invoke-interface {v13}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v13

    invoke-static {v13}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v13

    invoke-direct {v8, v13, v12}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "&"

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget-boolean v13, v1, Le/e/a/d0;->R:Z

    if-nez v13, :cond_278

    const-string v13, "flvInfo"

    invoke-virtual {v3, v13}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_278

    const-string v8, "flvInfo"

    invoke-virtual {v3, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "isHTML5Player\u3058\u3083\u306a\u304f\u3066 data: "

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :cond_278
    invoke-virtual {v14, v8}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    :cond_27c
    :goto_27c
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->find()Z

    move-result v13

    if-eqz v13, :cond_304

    const/4 v13, 0x1

    invoke-virtual {v8, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    const-string v14, "error"

    invoke-virtual {v13, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_291

    goto/16 :goto_304

    :cond_291
    const-string v14, "thread_id"

    invoke-virtual {v13, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_2a0

    const/4 v14, 0x2

    invoke-virtual {v8, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v1, Le/e/a/d0;->A:Ljava/lang/String;

    :cond_2a0
    const-string v14, "ms"

    invoke-virtual {v13, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_2b3

    const/4 v14, 0x2

    invoke-virtual {v8, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v1, Le/e/a/d0;->E:Ljava/lang/String;

    :cond_2b3
    const-string v14, "url"

    invoke-virtual {v13, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_2c1

    const/4 v14, 0x2

    invoke-virtual {v8, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    goto :goto_2c2

    :cond_2c1
    const/4 v14, 0x2

    :goto_2c2
    const-string v15, "fmst"

    invoke-virtual {v13, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_2cd

    invoke-virtual {v8, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    :cond_2cd
    iget-object v14, v1, Le/e/a/d0;->C:Ljava/lang/String;

    if-nez v14, :cond_2e0

    const-string v14, "user_id"

    invoke-virtual {v13, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_2e0

    const/4 v14, 0x2

    invoke-virtual {v8, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v1, Le/e/a/d0;->C:Ljava/lang/String;

    :cond_2e0
    iget-object v14, v1, Le/e/a/d0;->H:Ljava/lang/Boolean;

    if-nez v14, :cond_27c

    const-string v14, "is_premium"

    invoke-virtual {v13, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_27c

    const/4 v13, 0x2

    invoke-virtual {v8, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    const-string v14, "1"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2fb

    const/4 v13, 0x1

    goto :goto_2fc

    :cond_2fb
    const/4 v13, 0x0

    :goto_2fc
    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v13

    iput-object v13, v1, Le/e/a/d0;->H:Ljava/lang/Boolean;

    goto/16 :goto_27c

    :cond_304
    :goto_304
    iget-boolean v8, v1, Le/e/a/d0;->w:Z

    if-eqz v8, :cond_30f

    const-string v8, "content_uri"

    invoke-virtual {v3, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move-object v9, v8

    :cond_30f
    :goto_30f
    iget-boolean v8, v1, Le/e/a/d0;->w:Z

    if-nez v8, :cond_31e

    invoke-virtual {v3, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_31e

    invoke-virtual {v3, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object v9, v2

    :cond_31e
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "flvurl\uff01"

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v11, v2}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v9, :cond_536

    invoke-static {}, Le/e/a/v0;->f()I

    move-result v2

    const/16 v8, 0x18

    if-gt v2, v8, :cond_536

    iget-boolean v2, v1, Le/e/a/d0;->w:Z

    if-nez v2, :cond_536

    const-string v2, "https"

    invoke-virtual {v9, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2
    :try_end_346
    .catch Ljava/lang/Exception; {:try_start_1e6 .. :try_end_346} :catch_634

    if-eqz v2, :cond_536

    :try_start_348
    invoke-static {v9}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {}, Ljavax/net/ssl/SSLSocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v8

    check-cast v8, Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    const/16 v13, 0x1bb

    invoke-virtual {v8, v2, v13}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v2

    check-cast v2, Ljavax/net/ssl/SSLSocket;

    invoke-virtual {v2}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_365
    .catch Ljava/lang/Exception; {:try_start_348 .. :try_end_365} :catch_366

    goto :goto_373

    :catch_366
    move-exception v0

    move-object v2, v0

    :try_start_368
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v2, 0x1

    iput-boolean v2, v1, Le/e/a/d0;->y:Z

    const-string v2, "isSSLHandShakeERROR\uff01"

    invoke-static {v11, v2}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_373
    iget-boolean v2, v1, Le/e/a/d0;->y:Z

    if-eqz v2, :cond_536

    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "http://sp.nicovideo.jp/watch/"

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v2, v8}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v2, v6}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    new-instance v8, Ljava/lang/String;

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v2

    invoke-direct {v8, v2}, Ljava/lang/String;-><init>([B)V

    const-string v2, "id=\"jsDataContainer\" data-context=\"([^\"]+)\""

    const/16 v13, 0x20

    invoke-static {v2, v13}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    const/4 v8, 0x0

    :goto_3ab
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v13

    if-eqz v13, :cond_3bb

    const/4 v8, 0x1

    invoke-virtual {v2, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8
    :try_end_3ba
    .catch Ljava/lang/Exception; {:try_start_368 .. :try_end_3ba} :catch_634

    goto :goto_3ab

    :cond_3bb
    :try_start_3bb
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v8, "watch_api_url"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_3c6
    .catch Ljava/lang/Exception; {:try_start_3bb .. :try_end_3c6} :catch_3c7

    goto :goto_3cd

    :catch_3c7
    move-exception v0

    move-object v2, v0

    :try_start_3c9
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v2, 0x0

    :goto_3cd
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "SSLERROR SP LOAD "

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance v8, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v8, v2}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    iget-object v2, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4, v8, v6}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v8

    new-instance v13, Ljava/lang/String;

    invoke-interface {v8}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v8

    invoke-static {v8}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v8

    invoke-direct {v13, v8, v12}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v13, "watchAuthKey"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v13, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_424

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f0068

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    const/4 v2, 0x0

    return-object v2

    :cond_424
    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "http://ext.nicovideo.jp/api/getthumbinfo/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v2, v13}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v2, v6}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    new-instance v13, Ljava/lang/String;

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v2

    invoke-direct {v13, v2, v12}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-string v2, "<([a-zA-Z_]+?)(\\s[^>]+|)>([^<]+?)</[a-zA-Z_]+?>\n"

    const/16 v14, 0x20

    invoke-static {v2, v14}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    const/4 v13, 0x0

    :cond_458
    :goto_458
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v14

    if-eqz v14, :cond_47a

    const/4 v14, 0x1

    invoke-virtual {v2, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    const-string v15, "movie_type"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_458

    const/4 v14, 0x3

    invoke-virtual {v2, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    const-string v15, "flv"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_458

    const/4 v13, 0x1

    goto :goto_458

    :cond_47a
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "isFLV:"

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const/4 v2, 0x3

    if-ne v7, v2, :cond_48e

    const/4 v13, 0x1

    :cond_48e
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "isFLV:http://flapi.nicovideo.jp/api/getflv/"

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, "&watch_auth_key="

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v13, :cond_4a8

    move-object/from16 v14, p1

    goto :goto_4a9

    :cond_4a8
    move-object v14, v10

    :goto_4a9
    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "http://flapi.nicovideo.jp/api/getflv/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, "&watch_auth_key="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v13, :cond_4cb

    move-object/from16 v8, p1

    goto :goto_4cc

    :cond_4cb
    move-object v8, v10

    :goto_4cc
    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v2, v8}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v2, v6}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    const-string v8, "([^=]+)=([^&]*)\\&"

    const/16 v13, 0x20

    invoke-static {v8, v13}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v8

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v14, Ljava/lang/String;

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v2

    invoke-direct {v14, v2, v12}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "&"

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "isFLV:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :cond_514
    :goto_514
    invoke-virtual {v8}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_536

    const/4 v2, 0x1

    invoke-virtual {v8, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    const-string v13, "error"

    invoke-virtual {v2, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_528

    goto :goto_536

    :cond_528
    const-string v13, "url"

    invoke-virtual {v2, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_514

    const/4 v2, 0x2

    invoke-virtual {v8, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    goto :goto_514

    :cond_536
    :goto_536
    const/4 v2, -0x1

    if-eq v7, v2, :cond_53c

    const/4 v2, -0x2

    if-ne v7, v2, :cond_638

    :cond_53c
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "http://ext.nicovideo.jp/thumb_watch/"

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "&k="

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "thumbPlayKey"

    invoke-virtual {v3, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v8, -0x2

    if-ne v7, v8, :cond_55d

    move-object/from16 v8, p1

    goto :goto_55e

    :cond_55d
    move-object v8, v10

    :goto_55e
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v11, v2}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "http://ext.nicovideo.jp/thumb_watch/"

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "&k="

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "thumbPlayKey"

    invoke-virtual {v3, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v5, -0x2

    if-ne v7, v5, :cond_58a

    move-object/from16 v10, p1

    :cond_58a
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v2, v6}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    const-string v5, "([^=]+)=([^&]*)\\&"

    const/16 v6, 0x20

    invoke-static {v5, v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v8, Ljava/lang/String;

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v2

    invoke-direct {v8, v2, v12}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "&"

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "http://ext.nicovideo.jp/thumb_watch/ / "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v11, v2}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5d6
    :goto_5d6
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_638

    const/4 v2, 0x1

    invoke-virtual {v5, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    const-string v6, "error"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5fe

    const/4 v2, 0x2

    invoke-virtual {v5, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    const-string v5, "invalid_play_key"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_638

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    const-string v5, "OperaMax\u7b49\u4f7f\u7528\u3057\u3066\u3044\u308b\u5834\u5408\u306f\u7121\u52b9\u306b\u3059\u308b\u3053\u3068\u3067\u8aad\u307f\u8fbc\u307f\u53ef\u80fd\u3067\u3059"

    invoke-interface {v2, v5}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    goto :goto_638

    :cond_5fe
    iget-object v6, v1, Le/e/a/d0;->A:Ljava/lang/String;

    if-nez v6, :cond_611

    const-string v6, "thread_id"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_611

    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Le/e/a/d0;->A:Ljava/lang/String;

    :cond_611
    iget-object v6, v1, Le/e/a/d0;->E:Ljava/lang/String;

    if-nez v6, :cond_624

    const-string v6, "ms"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_624

    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v1, Le/e/a/d0;->E:Ljava/lang/String;

    :cond_624
    if-nez v9, :cond_5d6

    const-string v6, "url"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5d6

    const/4 v2, 0x2

    invoke-virtual {v5, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    goto :goto_5d6

    :catch_634
    move-exception v0

    move-object v2, v0

    goto/16 :goto_780

    :cond_638
    :goto_638
    const/4 v2, -0x3

    if-ne v7, v2, :cond_642

    const-string v2, "content_uri"

    invoke-virtual {v3, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object v9, v2

    :cond_642
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "userid "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Le/e/a/d0;->C:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " / "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Le/e/a/d0;->E:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " mode:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v11, v2}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, v1, Le/e/a/d0;->E:Ljava/lang/String;

    if-eqz v2, :cond_67b

    if-nez v9, :cond_697

    :cond_67b
    iget-boolean v2, v1, Le/e/a/d0;->w:Z

    if-eqz v2, :cond_731

    iget-boolean v2, v1, Le/e/a/d0;->S:Z

    if-nez v2, :cond_731

    iget-object v2, v1, Le/e/a/d0;->q:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_731

    iget-object v2, v1, Le/e/a/d0;->E:Ljava/lang/String;

    if-nez v2, :cond_693

    const-string v2, "http://"

    iput-object v2, v1, Le/e/a/d0;->E:Ljava/lang/String;

    :cond_693
    if-nez v9, :cond_697

    const-string v9, "http://"

    :cond_697
    iget-object v2, v1, Le/e/a/d0;->E:Ljava/lang/String;

    invoke-static {v2, v12}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Le/e/a/d0;->E:Ljava/lang/String;

    invoke-static {v9, v12}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v2, "http"

    invoke-virtual {v9, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_709

    const-string v2, "rtmp"

    invoke-virtual {v9, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6cf

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v5, 0x7f0f0079

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object v2, v1, Le/e/a/d0;->q:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_6cf

    const/4 v2, 0x0

    return-object v2

    :cond_6cf
    iget-object v2, v1, Le/e/a/d0;->q:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_6e9

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v5, 0x7f0f0070

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    :cond_6e9
    iget-boolean v2, v1, Le/e/a/d0;->P:Z

    if-eqz v2, :cond_6ff

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v5, 0x7f0f0074

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    :cond_6ff
    iget-object v2, v1, Le/e/a/d0;->q:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_709

    const/4 v2, 0x0

    return-object v2

    :cond_709
    iget-boolean v2, v1, Le/e/a/d0;->x:Z

    if-eqz v2, :cond_729

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v5, 0x7f0f0070

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object v2, v1, Le/e/a/d0;->q:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_729

    const/4 v2, 0x0

    return-object v2

    :cond_729
    invoke-interface {v4}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto :goto_795

    :cond_731
    iget-boolean v2, v1, Le/e/a/d0;->P:Z

    if-eqz v2, :cond_757

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f0070

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f0074

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_778

    :cond_757
    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f0068

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f0075

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {v3 .. v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_778
    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V
    :try_end_77b
    .catch Ljava/lang/Exception; {:try_start_3c9 .. :try_end_77b} :catch_634

    const/4 v2, 0x0

    return-object v2

    :catch_77d
    move-exception v0

    move-object v2, v0

    const/4 v9, 0x0

    :goto_780
    iget-object v3, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v4, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v5, 0x7f0f0067

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static/range {v4 .. v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    :goto_795
    iget-boolean v2, v1, Le/e/a/d0;->a:Z

    if-eqz v2, :cond_79b

    const/4 v2, 0x0

    return-object v2

    :cond_79b
    return-object v9
.end method

.method public final h(Ljava/lang/String;)Landroid/os/Bundle;
    .registers 27

    invoke-static/range {p0 .. p1}, Le/e/a/ModernPlayback;->info(Le/e/a/d0;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_7

    return-object v0

    :cond_7
    move-object/from16 v1, p0

    const-string v2, "session"

    const-string v3, "meta"

    const-string v4, "videoId"

    const-string v5, "content_uri"

    const-string v6, "data"

    const-string v7, "videoWatchId"

    const-string v8, "nicoid"

    const-string v9, "UTF-8"

    iget-object v10, v1, Le/e/a/d0;->l:Landroid/os/Bundle;

    if-eqz v10, :cond_2e

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f006c

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object v2, v1, Le/e/a/d0;->l:Landroid/os/Bundle;

    return-object v2

    :cond_2e
    :try_start_2e
    iget-object v11, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v12, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v13, 0x7f0f0065

    invoke-virtual {v12, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    const-string v11, "0"

    iput-object v11, v1, Le/e/a/d0;->C:Ljava/lang/String;

    const/4 v11, 0x0

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v12

    iput-object v12, v1, Le/e/a/d0;->H:Ljava/lang/Boolean;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "http://embed.nicovideo.jp/watch/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v13, p1

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1, v12}, Le/e/a/d0;->d(Ljava/lang/String;)Lorg/apache/http/HttpResponse;

    move-result-object v12

    new-instance v13, Ljava/lang/String;

    invoke-interface {v12}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v12

    invoke-static {v12}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v12

    invoke-direct {v13, v12, v9}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-string v12, "id=\"ext-player\" data-props=\"([^\"]+?)\""

    const/16 v14, 0x20

    invoke-static {v12, v14}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v12

    invoke-virtual {v12, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v12

    const/4 v13, 0x0

    :goto_78
    invoke-virtual {v12}, Ljava/util/regex/Matcher;->find()Z

    move-result v14

    const/4 v15, 0x1

    if-eqz v14, :cond_88

    invoke-virtual {v12, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    goto :goto_78

    :cond_88
    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_7e9

    invoke-virtual {v12, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "database : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v10}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "http://embed.nicovideo.jp/play/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "?forceSmile=1"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Le/e/a/d0;->d(Ljava/lang/String;)Lorg/apache/http/HttpResponse;

    move-result-object v10

    new-instance v11, Ljava/lang/String;

    invoke-interface {v10}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v10

    invoke-static {v10}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v10

    invoke-direct {v11, v10, v9}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10, v11}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "loaddata : "

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v10}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v10, Landroid/os/Bundle;

    invoke-direct {v10}, Landroid/os/Bundle;-><init>()V

    const-string v11, "description"

    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_14b

    const-string v11, "description"

    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "href=\"(h?ttps?://)([^\"]+)\""

    const-string v15, "motoweblink\"$2\""

    invoke-virtual {v11, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, ">(h?ttps?://)([^<]+)</a>"

    const-string v15, "nakaweblink>$2</a>"

    invoke-virtual {v11, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "(h?ttps?)(://[-_.!~*\\\'()a-zA-Z0-9;\\/?:\\@&=+\\$,%#]+)"

    const-string v15, "<a href=\'http$2\'>http$2</a>"

    invoke-virtual {v11, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "motoweblink\"([^\"]+)\""

    const-string v15, "href=\'http://$1\'"

    invoke-virtual {v11, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "nakaweblink>([^<]+)</a>"

    const-string v15, ">http://$1</a>"

    invoke-virtual {v11, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "(https?://com.nicovideo.jp/community/|)co([0-9]+)"

    const-string v15, "<a href=\'http://com.nicovideo.jp/community/co$2\'>$1co$2</a>"

    invoke-virtual {v11, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "(https?://www.nicovideo.jp/|)(mylist|user|watch)/([0-9/]+)"

    const-string v15, "<a href=\'http://www.nicovideo.jp/$2/$3\'>$1$2/$3</a>"

    invoke-virtual {v11, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "(https?://www.nicovideo.jp/watch/|)(sm|so|nm|ss)([0-9]+)"

    const-string v15, "<a href=\'http://www.nicovideo.jp/watch/$2$3\'>$1$2$3</a>"

    invoke-virtual {v11, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "\""

    const-string v15, "\'"

    invoke-virtual {v11, v13, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v13, "description_original"

    invoke-virtual {v10, v13, v11}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_14b
    const-string v11, "actionTrackId"

    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11
    :try_end_151
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_151} :catch_816

    const-string v13, ""

    if-eqz v11, :cond_15c

    :try_start_155
    const-string v11, "actionTrackId"

    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    goto :goto_15d

    :cond_15c
    move-object v11, v13

    :goto_15d
    const-string v15, "thumbnailUrl"

    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_173

    const-string v15, "thumbImage"

    move-object/from16 v16, v5

    const-string v5, "thumbnailUrl"

    invoke-virtual {v12, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10, v15, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_175

    :cond_173
    move-object/from16 v16, v5

    :goto_175
    const-string v5, "title"

    invoke-virtual {v12, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_188

    const-string v5, "videoTitle"

    const-string v15, "title"

    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v10, v5, v15}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_188
    invoke-virtual {v12, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_195

    invoke-virtual {v12, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_195
    const-string v4, "viewCounter"

    invoke-virtual {v12, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1b7

    const-string v4, "viewCount"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "viewCounter"

    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1b7
    const-string v4, "mylistCounter"

    invoke-virtual {v12, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1d9

    const-string v4, "mylistCount"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "mylistCounter"

    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v10, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1d9
    const-string v4, "commentCount"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "thread"

    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    move-object/from16 v17, v2

    const-string v2, "commentCounter"

    invoke-virtual {v15, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10, v4, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "lengthInSeconds"

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_21d

    const-string v2, "length"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "lengthInSeconds"

    invoke-virtual {v12, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v10, v2, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_21d
    invoke-virtual {v12, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_22c

    const-string v2, "v"

    invoke-virtual {v12, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v10, v2, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_22c
    const-string v2, "tags"

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    new-instance v4, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v4}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v5, Lorg/apache/http/client/methods/HttpGet;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "http://ext.nicovideo.jp/api/getthumbinfo/"

    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    new-instance v7, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v7}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    const-string v15, "http.cookie-store"

    move-object/from16 v18, v6

    iget-object v6, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-interface {v7, v15, v6}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v4, v5, v7}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    new-instance v5, Ljava/lang/String;

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v4

    invoke-direct {v5, v4, v9}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-string v4, "\n"

    invoke-virtual {v5, v4, v13}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "<([a-zA-Z_]+?)(\\s[^>]+|)>([^<]+?)</[a-zA-Z_]+?>\n"

    const/16 v6, 0x20

    invoke-static {v5, v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    :goto_282
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    const/4 v6, 0x2

    const/4 v7, 0x3

    if-eqz v5, :cond_35a

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v4, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, ".*category.*"

    invoke-virtual {v5, v6}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2a4

    const-string v5, "category"

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2a4
    const-string v5, "tag"

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2c0

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    const-string v6, "tag"

    move-object/from16 v19, v13

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v5, v6, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v2, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_2c2

    :cond_2c0
    move-object/from16 v19, v13

    :goto_2c2
    const-string v5, "first_retrieve"

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2d3

    const-string v5, "first_retrieve"

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2d3
    const-string v5, "user_nickname"

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2e4

    const-string v5, "nickname"

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2e4
    const-string v5, "user_icon_url"

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2f5

    const-string v5, "icon_url"

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2f5
    const-string v5, "user_id"

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_306

    const-string v5, "videoUserId"

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_306
    const-string v5, "ch_name"

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_317

    const-string v5, "nickname"

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_317
    const-string v5, "ch_icon_url"

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_328

    const-string v5, "icon_url"

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_328
    const-string v5, "user_id"

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_339

    const-string v5, "videoUserId"

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_339
    const-string v5, "getthumbinfo"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v13, " : "

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v13, v19

    goto/16 :goto_282

    :cond_35a
    move-object/from16 v19, v13

    const-string v4, "tagList"

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10, v4, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1

    iput-boolean v2, v1, Le/e/a/d0;->w:Z

    iget-boolean v2, v1, Le/e/a/d0;->w:Z

    if-eqz v2, :cond_7d3

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "https://www.nicovideo.jp/api/watch/v3_guest/"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v4, "frontendId"

    invoke-virtual {v12, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3a0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "?_frontendId="

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "frontendId"

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :goto_39b
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_3ae

    :cond_3a0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "?_frontendId=70"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_39b

    :goto_3ae
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "&_frontendVersion=0&actionTrackId="

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "&skips=harmful"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "guestWatchURL : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v8, v4}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Le/e/a/d0;->d(Ljava/lang/String;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    new-instance v4, Ljava/lang/String;

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v2

    invoke-direct {v4, v2, v9}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "guestWatch : "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v8, v2}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_427

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "status"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_427

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "status"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    const/16 v4, 0xc8

    if-ne v3, v4, :cond_427

    const/4 v3, 0x1

    goto :goto_428

    :cond_427
    const/4 v3, 0x0

    :goto_428
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getWatchSuccess : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v8, v4}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v3, :cond_7d3

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    move-object/from16 v5, v18

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "media"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "delivery"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "movie"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    move-object/from16 v12, v17

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    const-string v13, "urls"

    invoke-virtual {v11, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_486

    const-string v13, "urls"

    invoke-virtual {v11, v13}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v13

    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-lez v14, :cond_486

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    const-string v14, "url"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    goto :goto_487

    :cond_486
    const/4 v13, 0x0

    :goto_487
    const-string v14, "playerId"

    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_4a4

    new-instance v14, Lorg/json/JSONObject;

    invoke-direct {v14}, Lorg/json/JSONObject;-><init>()V

    const-string v15, "player_id"

    const-string v7, "playerId"

    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v14, v15, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v7, "client_info"

    invoke-virtual {v4, v7, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_4a4
    const-string v7, "serviceUserId"

    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4e4

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const-string v14, "auth_type"

    const-string v15, "authTypes"

    invoke-virtual {v11, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    const-string v6, "http"

    invoke-virtual {v15, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v7, v14, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v6, "content_key_timeout"

    const-string v14, "contentKeyTimeout"

    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14

    invoke-virtual {v7, v6, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v6, "service_id"

    const-string v14, "nicovideo"

    invoke-virtual {v7, v6, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v6, "service_user_id"

    const-string v14, "serviceUserId"

    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v7, v6, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v6, "content_auth"

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_4e4
    const-string v6, "content_id"

    const-string v7, "contentId"

    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v6, "videos"

    invoke-virtual {v11, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_58a

    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    new-instance v14, Lorg/json/JSONObject;

    invoke-direct {v14}, Lorg/json/JSONObject;-><init>()V

    new-instance v15, Lorg/json/JSONObject;

    invoke-direct {v15}, Lorg/json/JSONObject;-><init>()V

    move-object/from16 v20, v2

    const-string v2, "videos"

    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    move-object/from16 v21, v10

    iget v10, v1, Le/e/a/d0;->e:I
    :try_end_517
    .catch Ljava/lang/Exception; {:try_start_155 .. :try_end_517} :catch_816

    move-object/from16 v22, v5

    const/4 v5, 0x5

    move-object/from16 v23, v9

    const-string v9, "video_src_ids"

    if-ne v10, v5, :cond_53e

    :try_start_520
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v10

    move-object/from16 v24, v13

    const/4 v13, 0x2

    if-le v10, v13, :cond_53a

    const/4 v10, 0x1

    invoke-virtual {v2, v10}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :goto_536
    invoke-virtual {v14, v9, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_563

    :cond_53a
    invoke-virtual {v14, v9, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_563

    :cond_53e
    move-object/from16 v24, v13

    iget v5, v1, Le/e/a/d0;->e:I

    const/4 v10, 0x4

    if-eq v5, v10, :cond_54a

    iget v5, v1, Le/e/a/d0;->e:I

    const/4 v10, 0x3

    if-ne v5, v10, :cond_53a

    :cond_54a
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v10

    const/4 v13, 0x1

    if-le v10, v13, :cond_53a

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v10

    sub-int/2addr v10, v13

    invoke-virtual {v2, v10}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_536

    :goto_563
    const-string v2, "audio_src_ids"

    const-string v5, "audios"

    invoke-virtual {v11, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {v14, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "src_id_to_mux"

    invoke-virtual {v15, v2, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v7, v15}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "content_src_ids"

    invoke-virtual {v2, v5, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v6, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string v2, "content_src_id_sets"

    invoke-virtual {v4, v2, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_594

    :cond_58a
    move-object/from16 v20, v2

    move-object/from16 v22, v5

    move-object/from16 v23, v9

    move-object/from16 v21, v10

    move-object/from16 v24, v13

    :goto_594
    const-string v2, "content_type"

    const-string v5, "movie"

    invoke-virtual {v4, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-object/from16 v2, v16

    move-object/from16 v5, v19

    invoke-virtual {v4, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v6, "heartbeatLifetime"

    invoke-virtual {v11, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5c9

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const-string v9, "lifetime"

    const-string v10, "heartbeatLifetime"

    invoke-virtual {v11, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v9, "heartbeat"

    invoke-virtual {v6, v9, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v7, "keep_method"

    invoke-virtual {v4, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_5c9
    const-string v6, "priority"

    invoke-virtual {v11, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5dc

    const-string v6, "priority"

    const-string v7, "priority"

    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v9

    invoke-virtual {v4, v6, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    :cond_5dc
    const-string v6, "protocols"

    invoke-virtual {v11, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_61d

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    const-string v7, "name"

    const-string v9, "http"

    invoke-virtual {v6, v7, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    const-string v14, "http_output_download_parameters"

    invoke-virtual {v10, v14, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v13, "parameters"

    invoke-virtual {v9, v13, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v10, "http_parameters"

    invoke-virtual {v7, v10, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v9, "parameters"

    invoke-virtual {v6, v9, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v7, "protocol"

    invoke-virtual {v4, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_61d
    const-string v6, "recipeId"

    invoke-virtual {v11, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_630

    const-string v6, "recipe_id"

    const-string v7, "recipeId"

    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_630
    const-string v6, "signature"

    invoke-virtual {v11, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_662

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const-string v9, "signature"

    const-string v10, "signature"

    invoke-virtual {v11, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v9, "token"

    const-string v10, "token"

    invoke-virtual {v11, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v9, "session_operation_auth_by_signature"

    invoke-virtual {v6, v9, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v7, "session_operation_auth"

    invoke-virtual {v4, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_662
    const-string v6, "timing_constraint"

    const-string v7, "unlimited"

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v3, v12, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Le/e/a/d0;->V:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sessionRequestJSON : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v1, Le/e/a/d0;->V:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v8, v3}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v3}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v4, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v4}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    const-string v6, "http.cookie-store"

    iget-object v7, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-interface {v4, v6, v7}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v6, Lorg/apache/http/client/methods/HttpPost;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v13, v24

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "?_format=json"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "firstSessionURL : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "?_format=json"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_6c6
    .catch Ljava/lang/Exception; {:try_start_520 .. :try_end_6c6} :catch_816

    :try_start_6c6
    new-instance v7, Lorg/apache/http/entity/StringEntity;

    iget-object v8, v1, Le/e/a/d0;->V:Ljava/lang/String;

    move-object/from16 v9, v23

    invoke-direct {v7, v8, v9}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    invoke-virtual {v3, v6, v4}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/StatusLine;->getStatusCode()I

    new-instance v6, Ljava/lang/String;

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v4

    invoke-direct {v6, v4, v9}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_6ea
    .catch Ljava/lang/Exception; {:try_start_6c6 .. :try_end_6ea} :catch_6fe

    :try_start_6ea
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sessionresdata : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_6fa
    .catch Ljava/lang/Exception; {:try_start_6ea .. :try_end_6fa} :catch_6fb

    goto :goto_704

    :catch_6fb
    move-exception v0

    move-object v4, v0

    goto :goto_701

    :catch_6fe
    move-exception v0

    move-object v4, v0

    move-object v6, v5

    :goto_701
    :try_start_701
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    :goto_704
    invoke-virtual {v3}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    move-object/from16 v4, v22

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v5, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "id"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "?_format=json&_method=PUT"

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Le/e/a/d0;->U:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Le/e/a/d0;->V:Ljava/lang/String;

    const-string v3, "sessionURL"

    iget-object v5, v1, Le/e/a/d0;->U:Ljava/lang/String;

    move-object/from16 v7, v21

    invoke-virtual {v7, v3, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "sessionRequest"

    iget-object v5, v1, Le/e/a/d0;->V:Ljava/lang/String;

    invoke-virtual {v7, v3, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "isNewsaba"

    iget-boolean v5, v1, Le/e/a/d0;->w:Z

    invoke-virtual {v7, v3, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sessionURL : "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v1, Le/e/a/d0;->U:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {v7, v2, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "content_uri : "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {v7, v2, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v2, v20

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "comment"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "server"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "threads"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    const-string v4, "url"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "/api/"

    const-string v5, "/api.json/"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Le/e/a/d0;->E:Ljava/lang/String;

    const/4 v3, 0x0

    :goto_7b1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_7d4

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "isDefaultPostTarget"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_7d0

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "id"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Le/e/a/d0;->A:Ljava/lang/String;

    :cond_7d0
    add-int/lit8 v3, v3, 0x1

    goto :goto_7b1

    :cond_7d3
    move-object v7, v10

    :cond_7d4
    const-string v2, "nicovideo_version"

    const/4 v3, 0x2

    invoke-virtual {v7, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "cookie"

    iget-object v3, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-static {v3}, Le/e/a/v0;->a(Lorg/apache/http/client/CookieStore;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v7}, Le/e/a/d0;->a(Landroid/os/Bundle;)V

    return-object v7

    :cond_7e9
    iget-object v2, v1, Le/e/a/d0;->q:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_7fc

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Z)V

    invoke-virtual/range {p0 .. p0}, Le/e/a/d0;->d()V

    :goto_7fa
    const/4 v2, 0x0

    goto :goto_815

    :cond_7fc
    const-string v2, "message"

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_810

    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    const-string v3, "message"

    invoke-virtual {v12, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_80c
    invoke-interface {v2, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    goto :goto_7fa

    :cond_810
    iget-object v2, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    const-string v3, "\u3053\u306e\u52d5\u753b\u306f\u518d\u751f\u3067\u304d\u307e\u305b\u3093"
    :try_end_814
    .catch Ljava/lang/Exception; {:try_start_701 .. :try_end_814} :catch_816

    goto :goto_80c

    :goto_815
    return-object v2

    :catch_816
    move-exception v0

    move-object v2, v0

    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v2, 0x0

    return-object v2
.end method

.method public run()V
    .registers 19

    move-object/from16 v1, p0

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, v1, Le/e/a/d0;->z:Ljava/lang/Boolean;

    iget-object v0, v1, Le/e/a/d0;->p:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_17d

    .line 1
    iget-object v0, v1, Le/e/a/d0;->n:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_56

    iget-object v0, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    if-nez v0, :cond_34

    iget-object v0, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f005a

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object v0, v1, Le/e/a/d0;->K:Landroid/content/Context;

    invoke-static {v0}, Le/e/a/v0;->h(Landroid/content/Context;)Lorg/apache/http/client/CookieStore;

    move-result-object v0

    iput-object v0, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    :cond_34
    iget-object v0, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    if-nez v0, :cond_5d

    iget-object v0, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f006e

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object v0, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v3, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v4, 0x7f0f005b

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    goto/16 :goto_180

    :cond_56
    new-instance v0, Lorg/apache/http/impl/client/BasicCookieStore;

    invoke-direct {v0}, Lorg/apache/http/impl/client/BasicCookieStore;-><init>()V

    iput-object v0, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    :cond_5d
    const-string v0, "Anicoid"

    const-string v3, "\u901a\u308a\u307e\u3059 "

    invoke-static {v0, v3}, Lcom/sauzask/nicoid/NicoidLogger;->a(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, v1, Le/e/a/d0;->t:Z

    const-string v3, ""

    if-eqz v0, :cond_7a

    iget-object v0, v1, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v1, v0}, Le/e/a/d0;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Le/e/a/d0;->a()V

    if-eqz v3, :cond_170

    iget-boolean v0, v1, Le/e/a/d0;->a:Z

    if-nez v0, :cond_170

    goto :goto_88

    :cond_7a
    iget-boolean v0, v1, Le/e/a/d0;->s:Z

    if-eqz v0, :cond_8f

    iget-object v0, v1, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v1, v0}, Le/e/a/d0;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-boolean v0, v1, Le/e/a/d0;->a:Z

    if-nez v0, :cond_170

    :goto_88
    iget-object v0, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-virtual {v1, v3, v0}, Le/e/a/d0;->a(Ljava/lang/String;Lorg/apache/http/client/CookieStore;)V

    goto/16 :goto_170

    :cond_8f
    iget-object v0, v1, Le/e/a/d0;->r:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_120

    iget-object v0, v1, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v1, v0}, Le/e/a/d0;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_111

    iget-boolean v0, v1, Le/e/a/d0;->a:Z

    if-nez v0, :cond_111

    iget-object v3, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v0, v1, Le/e/a/d0;->L:[Ljava/lang/String;

    aget-object v5, v0, v2

    const/4 v4, 0x2

    aget-object v6, v0, v4

    iget-object v7, v1, Le/e/a/d0;->m:Landroid/os/Bundle;

    const/4 v4, 0x0

    .line 2
    :try_start_af
    iget-object v0, v1, Le/e/a/d0;->modernWatch:Lorg/json/JSONObject;

    if-eqz v0, :cond_b8

    invoke-static {v1}, Le/e/a/ModernComments;->load(Le/e/a/d0;)V

    move-object v8, v4

    goto :goto_106

    :cond_b8
    iget-object v0, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v8, 0x7f0f005f

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    iget-object v0, v1, Le/e/a/d0;->E:Ljava/lang/String;

    if-eqz v0, :cond_e4

    iget-object v0, v1, Le/e/a/d0;->E:Ljava/lang/String;

    iget-object v8, v1, Le/e/a/d0;->A:Ljava/lang/String;

    iget-boolean v9, v1, Le/e/a/d0;->P:Z

    iget-object v11, v1, Le/e/a/d0;->Q:Ljava/lang/String;

    invoke-virtual {v1, v0, v8, v9, v11}, Le/e/a/d0;->a(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_e2

    iget-object v0, v1, Le/e/a/d0;->E:Ljava/lang/String;

    iget-object v8, v1, Le/e/a/d0;->A:Ljava/lang/String;

    iget-boolean v9, v1, Le/e/a/d0;->P:Z

    iget-object v11, v1, Le/e/a/d0;->Q:Ljava/lang/String;

    invoke-virtual {v1, v0, v8, v9, v11}, Le/e/a/d0;->a(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_e2
    move-object v8, v0

    goto :goto_106

    :cond_e4
    iget-object v0, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v8, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v9, 0x7f0f0061

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v0, v8}, Le/e/a/l3/j;->a(Ljava/lang/String;)V
    :try_end_f2
    .catch Ljava/lang/Exception; {:try_start_af .. :try_end_f2} :catch_f3

    goto :goto_105

    :catch_f3
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    iget-object v0, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v8, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v9, 0x7f0f0060

    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v0, v8}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    :goto_105
    move-object v8, v4

    .line 3
    :goto_106
    iget-object v0, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-static {v0}, Le/e/a/v0;->a(Lorg/apache/http/client/CookieStore;)Ljava/lang/String;

    move-result-object v9

    move-object v4, v10

    invoke-interface/range {v3 .. v9}, Le/e/a/l3/j;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_11e

    :cond_111
    iget-object v11, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    invoke-interface/range {v11 .. v17}, Le/e/a/l3/j;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)V

    :goto_11e
    move-object v3, v10

    goto :goto_170

    :cond_120
    iget-object v0, v1, Le/e/a/d0;->b:Le/e/a/v;

    if-eqz v0, :cond_14f

    iget-object v0, v1, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v1, v0}, Le/e/a/d0;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_170

    iget-boolean v0, v1, Le/e/a/d0;->a:Z

    if-nez v0, :cond_170

    iget-object v0, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-virtual {v1, v3, v0}, Le/e/a/d0;->a(Ljava/lang/String;Lorg/apache/http/client/CookieStore;)V

    iget-object v0, v1, Le/e/a/d0;->b:Le/e/a/v;

    invoke-virtual {v0}, Le/e/a/v;->c()Z

    move-result v0

    if-nez v0, :cond_140

    invoke-virtual/range {p0 .. p0}, Le/e/a/d0;->a()V

    :cond_140
    iget-object v0, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    iget-object v4, v1, Le/e/a/d0;->K:Landroid/content/Context;

    const v5, 0x7f0f007a

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Le/e/a/l3/j;->a(Ljava/lang/String;)V

    goto :goto_170

    :cond_14f
    iget-object v0, v1, Le/e/a/d0;->n:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_15e

    iget-object v0, v1, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v1, v0}, Le/e/a/d0;->f(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    goto :goto_164

    :cond_15e
    iget-object v0, v1, Le/e/a/d0;->d:Ljava/lang/String;

    invoke-virtual {v1, v0}, Le/e/a/d0;->h(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    :goto_164
    iget-object v4, v1, Le/e/a/d0;->I:Lorg/apache/http/client/CookieStore;

    invoke-virtual {v1, v3, v4}, Le/e/a/d0;->a(Ljava/lang/String;Lorg/apache/http/client/CookieStore;)V

    if-eqz v0, :cond_170

    iget-object v4, v1, Le/e/a/d0;->k:Le/e/a/l3/j;

    invoke-interface {v4, v0}, Le/e/a/l3/j;->a(Landroid/os/Bundle;)V

    :cond_170
    :goto_170
    if-nez v3, :cond_180

    iget-object v0, v1, Le/e/a/d0;->j:Landroid/os/Handler;

    new-instance v3, Le/e/a/c0;

    invoke-direct {v3, v1}, Le/e/a/c0;-><init>(Le/e/a/d0;)V

    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_180

    .line 4
    :cond_17d
    invoke-virtual/range {p0 .. p0}, Le/e/a/d0;->d()V

    :cond_180
    :goto_180
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, v1, Le/e/a/d0;->z:Ljava/lang/Boolean;

    return-void
.end method

.method public synchronized start()V
    .locals 1
    invoke-static {p0}, Le/e/a/PopupReturn244;->retainedLoader(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :normal_start_247
    return-void
    :normal_start_247
    invoke-super {p0}, Ljava/lang/Thread;->start()V
    return-void
.end method
