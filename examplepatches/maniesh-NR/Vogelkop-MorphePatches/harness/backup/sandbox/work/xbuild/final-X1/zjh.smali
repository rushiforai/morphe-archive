.class public final Lzjh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final A:Ljava/lang/String;

.field public final B:Ljava/lang/String;

.field public final C:Ljava/util/List;

.field public final D:Ljava/util/List;

.field public final E:Ljava/lang/String;

.field public final F:Lxlg;

.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:[Lzjh;

.field public final e:Ljava/lang/String;

.field public final f:Lesg;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public final j:Ljava/lang/String;

.field public final k:Lr05;

.field public final l:Ljava/lang/String;

.field public final m:Ljava/lang/String;

.field public final n:Ljava/lang/String;

.field public final o:[Ljava/lang/String;

.field public final p:J

.field public final q:Ljava/lang/String;

.field public final r:Ljava/lang/String;

.field public final s:Ljava/lang/String;

.field public final t:Ljava/lang/String;

.field public final u:[Lmw7;

.field public final v:Lh4n;

.field public final w:Lw9h;

.field public final x:Llog;

.field public final y:Ljb8;

.field public final z:Lnb8;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Lzjh;Ljava/lang/String;Lesg;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lr05;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Lmw7;Lh4n;Lw9h;Llog;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lxlg;Ljb8;Lnb8;)V
    .registers 34

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzjh;->a:Ljava/lang/String;

    iput-object p2, p0, Lzjh;->b:Ljava/lang/String;

    iput-object p3, p0, Lzjh;->c:Ljava/lang/String;

    iput-object p4, p0, Lzjh;->d:[Lzjh;

    iput-object p5, p0, Lzjh;->e:Ljava/lang/String;

    iput-object p6, p0, Lzjh;->f:Lesg;

    iput-object p7, p0, Lzjh;->g:Ljava/lang/String;

    iput-object p8, p0, Lzjh;->h:Ljava/lang/String;

    iput-object p9, p0, Lzjh;->i:Ljava/lang/String;

    iput-object p10, p0, Lzjh;->j:Ljava/lang/String;

    iput-object p11, p0, Lzjh;->k:Lr05;

    iput-object p12, p0, Lzjh;->m:Ljava/lang/String;

    iput-object p13, p0, Lzjh;->n:Ljava/lang/String;

    iput-object p14, p0, Lzjh;->o:[Ljava/lang/String;

    move-wide p1, p15

    iput-wide p1, p0, Lzjh;->p:J

    move-object/from16 p1, p17

    iput-object p1, p0, Lzjh;->q:Ljava/lang/String;

    move-object/from16 p1, p18

    iput-object p1, p0, Lzjh;->r:Ljava/lang/String;

    move-object/from16 p1, p19

    iput-object p1, p0, Lzjh;->s:Ljava/lang/String;

    move-object/from16 p1, p20

    iput-object p1, p0, Lzjh;->t:Ljava/lang/String;

    move-object/from16 p1, p21

    iput-object p1, p0, Lzjh;->u:[Lmw7;

    move-object/from16 p1, p22

    iput-object p1, p0, Lzjh;->v:Lh4n;

    move-object/from16 p1, p23

    iput-object p1, p0, Lzjh;->w:Lw9h;

    move-object/from16 p1, p24

    iput-object p1, p0, Lzjh;->x:Llog;

    move-object/from16 p1, p25

    iput-object p1, p0, Lzjh;->A:Ljava/lang/String;

    move-object/from16 p1, p26

    iput-object p1, p0, Lzjh;->B:Ljava/lang/String;

    move-object/from16 p1, p27

    iput-object p1, p0, Lzjh;->C:Ljava/util/List;

    move-object/from16 p1, p28

    iput-object p1, p0, Lzjh;->D:Ljava/util/List;

    move-object/from16 p1, p29

    iput-object p1, p0, Lzjh;->l:Ljava/lang/String;

    move-object/from16 p1, p30

    iput-object p1, p0, Lzjh;->E:Ljava/lang/String;

    move-object/from16 p1, p31

    iput-object p1, p0, Lzjh;->F:Lxlg;

    move-object/from16 p1, p32

    iput-object p1, p0, Lzjh;->y:Ljb8;

    move-object/from16 p1, p33

    iput-object p1, p0, Lzjh;->z:Lnb8;

    return-void
.end method

.method public static a(Lorb;Ljava/lang/String;)Lzjh;
    .registers 49

    move-object/from16 v0, p0

    const-string v1, ""

    const-string v2, "news_entry_id"

    invoke-virtual {v0, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v2, "more_id"

    invoke-static {v0, v2}, Lzjh;->c(Lorb;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "news_id"

    invoke-virtual {v0, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    iget-object v3, v0, Lorb;->a:Lorg/json/JSONObject;

    const-string v5, "articles"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_27

    invoke-static/range {p0 .. p1}, Lzjh;->b(Lorb;Ljava/lang/String;)[Lzjh;

    move-result-object v5

    move-object/from16 v19, v5

    goto :goto_29

    :cond_27
    const/16 v19, 0x0

    :goto_29
    const-string v5, "enable_more_button"

    invoke-virtual {v0, v5}, Lorb;->f(Ljava/lang/String;)Z

    const-string v5, "hot_topic_id"

    invoke-static {v0, v5}, Lzjh;->c(Lorb;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    const-string v5, "category_meta"

    const/4 v7, 0x0

    :try_start_37
    invoke-virtual {v0, v5}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v5

    if-eqz v5, :cond_6a

    const-string v8, "name"

    invoke-virtual {v5, v8, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_4a

    const/4 v8, 0x0

    :cond_4a
    const-string v9, "id"

    invoke-virtual {v5, v9, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_57

    const/4 v9, 0x0

    :cond_57
    const-string v10, "icon"

    invoke-virtual {v5, v10, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lesg;

    const/16 v10, 0x8

    invoke-direct {v5, v10, v8, v9, v7}, Lesg;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V
    :try_end_67
    .catch Lorg/json/JSONException; {:try_start_37 .. :try_end_67} :catch_6a

    move-object/from16 v21, v5

    goto :goto_6c

    :catch_6a
    :cond_6a
    const/16 v21, 0x0

    :goto_6c
    const-string v5, "category"

    invoke-static {v0, v5}, Lzjh;->c(Lorb;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    const-string v5, "open_type"

    invoke-static {v0, v5}, Lzjh;->c(Lorb;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    const-string v5, "original_url"

    invoke-static {v0, v5}, Lzjh;->c(Lorb;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    const-string v5, "recommend_name"

    invoke-static {v0, v5}, Lzjh;->c(Lorb;Ljava/lang/String;)Ljava/lang/String;

    const-string v5, "recommend_type"

    invoke-static {v0, v5}, Lzjh;->c(Lorb;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    const-string v5, "social_info"

    :try_start_8b
    invoke-virtual {v0, v5}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v5

    if-eqz v5, :cond_98

    invoke-static {v5}, Lr05;->u(Lorb;)Lr05;

    move-result-object v5
    :try_end_95
    .catch Lorg/json/JSONException; {:try_start_8b .. :try_end_95} :catch_98

    move-object/from16 v26, v5

    goto :goto_9a

    :catch_98
    :cond_98
    const/16 v26, 0x0

    :goto_9a
    const-string v5, "source"

    invoke-static {v0, v5}, Lzjh;->c(Lorb;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    const-string v5, "source_name"

    invoke-static {v0, v5}, Lzjh;->c(Lorb;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    const-string v5, "thumbnail"

    invoke-virtual {v0, v5}, Lorb;->h(Ljava/lang/String;)Lvpb;

    move-result-object v5

    if-nez v5, :cond_b0

    const/4 v5, 0x0

    goto :goto_de

    :cond_b0
    iget-object v8, v5, Lvpb;->a:Lorg/json/JSONArray;

    new-instance v9, Ljava/util/ArrayList;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v10

    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(I)V

    move v10, v7

    :goto_bc
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v10, v11, :cond_d2

    invoke-virtual {v5, v10}, Lvpb;->f(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_cf

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_cf
    add-int/lit8 v10, v10, 0x1

    goto :goto_bc

    :cond_d2
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/String;

    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    :goto_de
    const-string v8, "timestamp"

    invoke-virtual {v0, v8}, Lorb;->j(Ljava/lang/String;)J

    move-result-wide v28

    const-string v8, "title"

    invoke-static {v0, v8}, Lzjh;->c(Lorb;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    const-string v8, "type"

    invoke-virtual {v0, v8, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "infra_feedback"

    invoke-virtual {v0, v10, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    const-string v10, "top_image"

    invoke-static {v0, v10}, Lzjh;->c(Lorb;Ljava/lang/String;)Ljava/lang/String;

    const-string v10, "share_url"

    invoke-static {v0, v10}, Lzjh;->c(Lorb;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    const-string v10, "images"

    :try_start_103
    invoke-virtual {v0, v10}, Lorb;->h(Ljava/lang/String;)Lvpb;

    move-result-object v10

    if-eqz v10, :cond_12a

    iget-object v11, v10, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v11

    new-array v12, v11, [Lmw7;

    move v13, v7

    :goto_112
    if-ge v13, v11, :cond_125

    invoke-virtual {v10, v13}, Lvpb;->e(I)Lorb;

    move-result-object v14

    if-eqz v14, :cond_11f

    invoke-static {v14}, Lmw7;->a(Lorb;)Lmw7;

    move-result-object v14

    goto :goto_120

    :cond_11f
    const/4 v14, 0x0

    :goto_120
    aput-object v14, v12, v13
    :try_end_122
    .catch Lorg/json/JSONException; {:try_start_103 .. :try_end_122} :catch_12a

    add-int/lit8 v13, v13, 0x1

    goto :goto_112

    :cond_125
    move-object/from16 v33, v24

    move-object/from16 v24, v12

    goto :goto_12e

    :catch_12a
    :cond_12a
    move-object/from16 v33, v24

    const/16 v24, 0x0

    :goto_12e
    const-string v10, "video_info"

    invoke-virtual {v0, v10}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v10

    if-nez v10, :cond_139

    const/16 v34, 0x0

    goto :goto_16c

    :cond_139
    const-string v11, "view_count"

    invoke-virtual {v10, v11}, Lorb;->j(Ljava/lang/String;)J

    move-result-wide v35

    const-string v11, "upload_time"

    invoke-virtual {v10, v11}, Lorb;->j(Ljava/lang/String;)J

    move-result-wide v37

    const-string v11, "duration"

    invoke-virtual {v10, v11}, Lorb;->g(Ljava/lang/String;)I

    move-result v39

    const-string v11, "width"

    invoke-virtual {v10, v11}, Lorb;->g(Ljava/lang/String;)I

    move-result v40

    const-string v11, "height"

    invoke-virtual {v10, v11}, Lorb;->g(Ljava/lang/String;)I

    move-result v41

    const/16 v11, 0xff

    iget-object v12, v10, Lorb;->a:Lorg/json/JSONObject;

    const-string v13, "auto_play_flag"

    invoke-virtual {v12, v13, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v42

    const-string v11, "card_style"

    invoke-virtual {v10, v11}, Lorb;->g(Ljava/lang/String;)I

    move-result v43

    new-instance v34, Lh4n;

    invoke-direct/range {v34 .. v43}, Lh4n;-><init>(JJIIIII)V

    :goto_16c
    const-string v10, "publisher_info"

    :try_start_16e
    invoke-virtual {v0, v10}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v10

    if-eqz v10, :cond_17d

    invoke-static {v10}, Lw9h;->a(Lorb;)Lw9h;

    move-result-object v10
    :try_end_178
    .catch Lorg/json/JSONException; {:try_start_16e .. :try_end_178} :catch_17d

    move-object/from16 v35, v26

    move-object/from16 v26, v10

    goto :goto_181

    :catch_17d
    :cond_17d
    move-object/from16 v35, v26

    const/16 v26, 0x0

    :goto_181
    const-string v10, "logo"

    invoke-static {v0, v10}, Lzjh;->c(Lorb;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v36

    const-string v10, "bg_image"

    invoke-static {v0, v10}, Lzjh;->c(Lorb;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v37

    const-string v10, "feedback_reason_v2"

    invoke-virtual {v0, v10}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v10

    if-nez v10, :cond_197

    const/4 v10, 0x0

    goto :goto_19b

    :cond_197
    invoke-static {v10}, Lo0g;->O(Lorb;)Landroid/util/Pair;

    move-result-object v10

    :goto_19b
    const-string v11, "insta_obj"

    invoke-virtual {v0, v11}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v11

    if-eqz v11, :cond_1bc

    invoke-virtual {v11, v8, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v12, "clip"

    invoke-virtual {v8, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1bc

    :try_start_1af
    sget-object v8, Llog;->h:Lir5;

    invoke-virtual {v8, v11}, Lir5;->d(Lorb;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Llog;
    :try_end_1b7
    .catch Lorg/json/JSONException; {:try_start_1af .. :try_end_1b7} :catch_1bc

    move-object/from16 v38, v27

    move-object/from16 v27, v8

    goto :goto_1c0

    :catch_1bc
    :cond_1bc
    move-object/from16 v38, v27

    const/16 v27, 0x0

    :goto_1c0
    const-string v8, "banner"

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1d3

    :try_start_1c8
    invoke-static {v0}, Ljb8;->a(Lorb;)Ljb8;

    move-result-object v8
    :try_end_1cc
    .catch Lorg/json/JSONException; {:try_start_1c8 .. :try_end_1cc} :catch_1cd

    goto :goto_1ce

    :catch_1cd
    const/4 v8, 0x0

    :goto_1ce
    move-object/from16 v39, v35

    move-object/from16 v35, v8

    goto :goto_1d7

    :cond_1d3
    move-object/from16 v39, v35

    const/16 v35, 0x0

    :goto_1d7
    const-string v8, "carousel"

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1f4

    :try_start_1df
    invoke-static {v0}, Lnb8;->a(Lorb;)Lnb8;

    move-result-object v8
    :try_end_1e3
    .catch Lorg/json/JSONException; {:try_start_1df .. :try_end_1e3} :catch_1e4

    goto :goto_1e5

    :catch_1e4
    const/4 v8, 0x0

    :goto_1e5
    move-object/from16 v40, v19

    move-object/from16 v44, v36

    move-object/from16 v36, v8

    move-wide/from16 v45, v28

    move-object/from16 v29, v18

    move-wide/from16 v18, v45

    move-object/from16 v28, v44

    goto :goto_200

    :cond_1f4
    move-object/from16 v40, v19

    move-wide/from16 v44, v28

    move-object/from16 v29, v18

    move-wide/from16 v18, v44

    move-object/from16 v28, v36

    const/16 v36, 0x0

    :goto_200
    const-string v8, "artifact_id"

    invoke-static {v0, v8}, Lzjh;->c(Lorb;Ljava/lang/String;)Ljava/lang/String;

    const-string v8, "city_info"

    :try_start_207
    invoke-virtual {v0, v8}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v8

    if-eqz v8, :cond_21a

    const-string v11, "display_name"

    invoke-virtual {v8, v11}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8
    :try_end_213
    .catch Lorg/json/JSONException; {:try_start_207 .. :try_end_213} :catch_21a

    move-object/from16 v41, v23

    move-object/from16 v23, v32

    move-object/from16 v32, v8

    goto :goto_220

    :catch_21a
    :cond_21a
    move-object/from16 v41, v23

    move-object/from16 v23, v32

    const/16 v32, 0x0

    :goto_220
    const-string v8, "transcoded_url"

    invoke-static {v0, v8}, Lzjh;->c(Lorb;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v42

    if-eqz v30, :cond_2ab

    if-eqz v5, :cond_2ab

    array-length v8, v5

    if-lez v8, :cond_2ab

    sget-object v8, Lxlg;->Companion:Lwlg;

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    move-object v12, v8

    move-object v8, v15

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_23c
    const-string v12, "summary_voice"

    invoke-virtual {v0, v12}, Lorb;->h(Ljava/lang/String;)Lvpb;

    move-result-object v12

    if-eqz v12, :cond_249

    invoke-virtual {v12, v7}, Lvpb;->f(I)Ljava/lang/String;

    move-result-object v7

    goto :goto_24a

    :cond_249
    const/4 v7, 0x0

    :goto_24a
    if-eqz v7, :cond_2a8

    invoke-static {v7}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_2a8

    const-string v12, "summary_voice_duration"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v12

    const-string v3, "summary_voice_category_id"

    invoke-virtual {v0, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v14, "summary_voice_category_name"

    invoke-virtual {v0, v14}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v6, "summary_voice_title"

    invoke-virtual {v0, v6, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_272

    move-object/from16 v1, v30

    :cond_272
    const-string v6, "summary_voice_share_url"

    move-object/from16 v17, v1

    const/4 v1, 0x0

    invoke-virtual {v0, v6, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6
    :try_end_27b
    .catch Lorg/json/JSONException; {:try_start_23c .. :try_end_27b} :catch_2a8

    move-object/from16 v43, v2

    :try_start_27d
    const-string v2, "summary_voice_highlight_title"

    invoke-virtual {v0, v2, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    const-string v2, "summary_voice_theme"

    invoke-virtual {v0, v2, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v11}, Lwlg;->a(Ljava/util/List;)V
    :try_end_28c
    .catch Lorg/json/JSONException; {:try_start_27d .. :try_end_28c} :catch_2a5

    move-object v2, v9

    move-object v9, v3

    :try_start_28e
    new-instance v3, Lxlg;
    :try_end_290
    .catch Lorg/json/JSONException; {:try_start_28e .. :try_end_290} :catch_2a2

    move-object/from16 v1, v17

    move-object/from16 v17, v0

    move-object v0, v5

    move-object v5, v1

    move-object v1, v10

    move-object v10, v14

    move-object v14, v6

    move-object v6, v11

    move-wide v11, v12

    move-object/from16 v13, p1

    :try_start_29d
    invoke-direct/range {v3 .. v17}, Lxlg;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2a0
    .catch Lorg/json/JSONException; {:try_start_29d .. :try_end_2a0} :catch_2b1

    move-object v6, v3

    goto :goto_2b2

    :catch_2a2
    move-object v0, v5

    :goto_2a3
    move-object v1, v10

    goto :goto_2b1

    :catch_2a5
    :goto_2a5
    move-object v0, v5

    move-object v2, v9

    goto :goto_2a3

    :catch_2a8
    :cond_2a8
    move-object/from16 v43, v2

    goto :goto_2a5

    :cond_2ab
    move-object/from16 v43, v2

    move-object v0, v5

    move-object v2, v9

    move-object v1, v10

    move-object v8, v15

    :catch_2b1
    :goto_2b1
    const/4 v6, 0x0

    :goto_2b2
    new-instance v3, Lzjh;

    if-eqz v1, :cond_2ea

    iget-object v5, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v5, Ljava/util/List;

    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    move-object v15, v8

    move-object/from16 v8, v20

    move-object/from16 v10, v22

    move-object/from16 v20, v30

    move-object/from16 v22, v31

    move-object/from16 v31, v1

    move-object/from16 v30, v5

    move-object/from16 v17, v0

    move-object/from16 v9, v21

    move-object/from16 v13, v25

    move-object/from16 v12, v33

    move-object/from16 v25, v34

    move-object/from16 v16, v38

    move-object/from16 v14, v39

    move-object/from16 v7, v40

    move-object/from16 v11, v41

    move-object/from16 v33, v42

    move-object/from16 v21, v2

    move-object/from16 v34, v6

    move-object/from16 v5, v29

    move-object/from16 v29, v37

    :goto_2e7
    move-object/from16 v6, v43

    goto :goto_314

    :cond_2ea
    move-object v15, v8

    move-object/from16 v8, v20

    move-object/from16 v10, v22

    move-object/from16 v20, v30

    move-object/from16 v22, v31

    const/16 v30, 0x0

    const/16 v31, 0x0

    move-object/from16 v17, v0

    move-object/from16 v9, v21

    move-object/from16 v13, v25

    move-object/from16 v5, v29

    move-object/from16 v12, v33

    move-object/from16 v25, v34

    move-object/from16 v29, v37

    move-object/from16 v16, v38

    move-object/from16 v14, v39

    move-object/from16 v7, v40

    move-object/from16 v11, v41

    move-object/from16 v33, v42

    move-object/from16 v21, v2

    move-object/from16 v34, v6

    goto :goto_2e7

    :goto_314
    invoke-direct/range {v3 .. v36}, Lzjh;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Lzjh;Ljava/lang/String;Lesg;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lr05;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Lmw7;Lh4n;Lw9h;Llog;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lxlg;Ljb8;Lnb8;)V

    return-object v3
.end method

.method public static b(Lorb;Ljava/lang/String;)[Lzjh;
    .registers 6

    const-string v0, "articles"

    invoke-virtual {p0, v0}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object p0

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    :goto_12
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_28

    :try_start_18
    invoke-virtual {p0, v2}, Lvpb;->e(I)Lorb;

    move-result-object v3

    if-eqz v3, :cond_25

    invoke-static {v3, p1}, Lzjh;->a(Lorb;Ljava/lang/String;)Lzjh;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_25
    .catch Lorg/json/JSONException; {:try_start_18 .. :try_end_25} :catch_25

    :catch_25
    :cond_25
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    :cond_28
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    new-array p0, p0, [Lzjh;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lzjh;

    return-object p0
.end method

.method public static c(Lorb;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_d

    const/4 p0, 0x0

    :cond_d
    return-object p0
.end method
