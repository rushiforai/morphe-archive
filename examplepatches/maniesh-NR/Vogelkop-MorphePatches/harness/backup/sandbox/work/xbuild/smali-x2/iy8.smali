.class public final Liy8;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Laip;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Liy8;->a:B

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p1, p0, Liy8;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Liy8;->a:B

    iput-object p1, p0, Liy8;->b:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method public static a(Lorb;Lk5o;)V
    .registers 9

    const-string v0, "articles"

    invoke-virtual {p0, v0}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object p0

    iget-object v0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    :cond_c
    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_42

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v2

    const-string v3, "type"

    invoke-virtual {v2, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "request_id"

    invoke-virtual {v2, v4}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v4, p1, Lk5o;->b:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashMap;

    invoke-virtual {v4, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    new-instance v5, Lh92;

    const/4 v6, 0x0

    invoke-direct {v5, v3, v2, v6}, Lh92;-><init>(Ljava/lang/String;Ljava/lang/String;Lqre;)V

    iget-object v2, v5, Lh92;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-virtual {v4, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_c

    :cond_42
    return-void
.end method

.method public static b(Lvpb;Ljec;)V
    .registers 29

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v1, Ljec;->a:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    iget-object v3, v0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    add-int/2addr v4, v2

    iget-object v2, v1, Ljec;->a:Ljava/util/ArrayList;

    iget v5, v1, Ljec;->b:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->ensureCapacity(I)V

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_1e
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v4, v6, :cond_295

    invoke-virtual {v0, v4}, Lvpb;->c(I)Lorb;

    move-result-object v6

    const-string v7, "event_type"

    invoke-virtual {v6, v7}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->hashCode()I

    move-result v8

    const-string v9, "publisher_unfollow"

    const-string v10, "ui_impression"

    const-string v11, "dislike"

    const-string v12, "publisher_click"

    const-string v13, "load_more"

    const-string v14, "refresh"

    const-string v15, "publisher_follow"

    const-string v2, "share"

    const-string v0, "pause"

    move-object/from16 v16, v3

    const-string v3, "click"

    const/16 v17, 0x5

    move/from16 v18, v4

    const-string v4, "drag"

    const/16 v19, 0x4

    move/from16 v20, v8

    const-string v8, "not_interested"

    const/16 v21, 0x3

    const-string v1, "ui_click"

    const/16 v22, 0x2

    move/from16 v23, v5

    const-string v5, "report"

    move-object/from16 v24, v6

    const-string v6, "full_screen"

    const/16 v25, -0x1

    move-object/from16 v26, v6

    sparse-switch v20, :sswitch_data_296

    goto/16 :goto_156

    :sswitch_6b
    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_156

    const/16 v7, 0x16

    goto/16 :goto_15a

    :sswitch_75
    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_156

    const/16 v7, 0x15

    goto/16 :goto_15a

    :sswitch_7f
    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_156

    const/16 v7, 0x14

    goto/16 :goto_15a

    :sswitch_89
    invoke-virtual {v7, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_156

    const/16 v7, 0x13

    goto/16 :goto_15a

    :sswitch_93
    invoke-virtual {v7, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_156

    const/16 v7, 0x12

    goto/16 :goto_15a

    :sswitch_9d
    const-string v6, "app_stay"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_156

    const/16 v7, 0x11

    goto/16 :goto_15a

    :sswitch_a9
    invoke-virtual {v7, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_156

    const/16 v7, 0x10

    goto/16 :goto_15a

    :sswitch_b3
    invoke-virtual {v7, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_156

    const/16 v7, 0xf

    goto/16 :goto_15a

    :sswitch_bd
    const-string v6, "publisher_impression"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_156

    const/16 v7, 0xe

    goto/16 :goto_15a

    :sswitch_c9
    const-string v6, "post_action"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_156

    const/16 v7, 0xd

    goto/16 :goto_15a

    :sswitch_d5
    const-string v6, "impression"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_156

    const/16 v7, 0xc

    goto/16 :goto_15a

    :sswitch_e1
    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_156

    const/16 v7, 0xb

    goto/16 :goto_15a

    :sswitch_eb
    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_156

    const/16 v7, 0xa

    goto/16 :goto_15a

    :sswitch_f5
    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_156

    const/16 v7, 0x9

    goto/16 :goto_15a

    :sswitch_ff
    const-string v6, "stay"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_156

    const/16 v7, 0x8

    goto :goto_15a

    :sswitch_10a
    const-string v6, "play"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_156

    const/4 v7, 0x7

    goto :goto_15a

    :sswitch_114
    const-string v6, "like"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_156

    const/4 v7, 0x6

    goto :goto_15a

    :sswitch_11e
    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_156

    move/from16 v7, v17

    goto :goto_15a

    :sswitch_127
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_156

    move/from16 v7, v19

    goto :goto_15a

    :sswitch_130
    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_156

    move/from16 v7, v21

    goto :goto_15a

    :sswitch_139
    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_156

    move/from16 v7, v22

    goto :goto_15a

    :sswitch_142
    move-object/from16 v6, v26

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    move-object/from16 v26, v6

    if-eqz v7, :cond_156

    const/4 v7, 0x1

    goto :goto_15a

    :sswitch_14e
    const-string v6, "podcast_stay"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_159

    :cond_156
    :goto_156
    move/from16 v7, v25

    goto :goto_15a

    :cond_159
    const/4 v7, 0x0

    :goto_15a
    const/4 v6, 0x0

    packed-switch v7, :pswitch_data_2f4

    goto/16 :goto_27e

    :pswitch_160
    new-instance v6, Lly8;

    move-object/from16 v7, v24

    invoke-direct {v6, v7, v9}, Lmy8;-><init>(Lorb;Ljava/lang/String;)V

    goto/16 :goto_27e

    :pswitch_169
    move-object/from16 v7, v24

    new-instance v6, Lsy8;

    const/4 v0, 0x1

    invoke-direct {v6, v10, v7, v0}, Loy8;-><init>(Ljava/lang/String;Lorb;B)V

    goto/16 :goto_27e

    :pswitch_173
    move-object/from16 v7, v24

    new-instance v6, Lby8;

    invoke-direct {v6, v7, v11}, Lzx8;-><init>(Lorb;Ljava/lang/String;)V

    goto/16 :goto_27e

    :pswitch_17c
    move-object/from16 v7, v24

    new-instance v6, Lly8;

    invoke-direct {v6, v7, v12}, Lmy8;-><init>(Lorb;Ljava/lang/String;)V

    goto/16 :goto_27e

    :pswitch_185
    move-object/from16 v7, v24

    new-instance v6, Lhy8;

    const/4 v9, 0x0

    invoke-direct {v6, v13, v7, v9}, Loy8;-><init>(Ljava/lang/String;Lorb;B)V

    goto/16 :goto_27e

    :pswitch_18f
    move-object/from16 v7, v24

    new-instance v6, Lyx8;

    invoke-direct {v6, v7}, Lyx8;-><init>(Lorb;)V

    goto/16 :goto_27e

    :pswitch_198
    move-object/from16 v7, v24

    const/4 v9, 0x0

    new-instance v6, Lhy8;

    invoke-direct {v6, v14, v7, v9}, Loy8;-><init>(Ljava/lang/String;Lorb;B)V

    goto/16 :goto_27e

    :pswitch_1a2
    move-object/from16 v7, v24

    new-instance v6, Lly8;

    invoke-direct {v6, v7, v15}, Lmy8;-><init>(Lorb;Ljava/lang/String;)V

    goto/16 :goto_27e

    :pswitch_1ab
    move-object/from16 v7, v24

    new-instance v6, Lny8;

    invoke-direct {v6, v7}, Lny8;-><init>(Lorb;)V

    goto/16 :goto_27e

    :pswitch_1b4
    move-object/from16 v7, v24

    const/4 v9, 0x0

    const-string v0, "action"

    invoke-virtual {v7, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_326

    goto :goto_202

    :sswitch_1c5
    const-string v1, "audio_play"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_207

    goto :goto_202

    :sswitch_1ce
    const-string v1, "audio_next"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_202

    move/from16 v17, v19

    goto :goto_207

    :sswitch_1d9
    const-string v1, "audio_previous"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_202

    move/from16 v17, v21

    goto :goto_207

    :sswitch_1e4
    const-string v1, "audio_speed"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_202

    move/from16 v17, v22

    goto :goto_207

    :sswitch_1ef
    const-string v1, "audio_pause"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_202

    const/16 v17, 0x1

    goto :goto_207

    :sswitch_1fa
    const-string v1, "audio_close"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_205

    :cond_202
    :goto_202
    move/from16 v17, v25

    goto :goto_207

    :cond_205
    move/from16 v17, v9

    :cond_207
    :goto_207
    packed-switch v17, :pswitch_data_340

    goto/16 :goto_27e

    :pswitch_20c
    new-instance v6, Lay8;

    invoke-direct {v6, v7, v0}, Lay8;-><init>(Lorb;Ljava/lang/String;)V

    goto/16 :goto_27e

    :pswitch_213
    move-object/from16 v7, v24

    new-instance v6, Ley8;

    invoke-direct {v6, v7}, Ley8;-><init>(Lorb;)V

    goto/16 :goto_27e

    :pswitch_21c
    move-object/from16 v7, v24

    new-instance v6, Lby8;

    invoke-direct {v6, v7, v2}, Lzx8;-><init>(Lorb;Ljava/lang/String;)V

    goto :goto_27e

    :pswitch_224
    move-object/from16 v7, v24

    new-instance v6, Lcy8;

    invoke-direct {v6, v7, v0}, Lty8;-><init>(Lorb;Ljava/lang/String;)V

    goto :goto_27e

    :pswitch_22c
    move-object/from16 v7, v24

    new-instance v6, Lby8;

    invoke-direct {v6, v7, v3}, Lzx8;-><init>(Lorb;Ljava/lang/String;)V

    goto :goto_27e

    :pswitch_234
    move-object/from16 v7, v24

    new-instance v6, Lry8;

    invoke-direct {v6, v7}, Lry8;-><init>(Lorb;)V

    goto :goto_27e

    :pswitch_23c
    move-object/from16 v7, v24

    new-instance v6, Ljy8;

    invoke-direct {v6, v7}, Ljy8;-><init>(Lorb;)V

    goto :goto_27e

    :pswitch_244
    move-object/from16 v7, v24

    new-instance v6, Lgy8;

    invoke-direct {v6, v7}, Lgy8;-><init>(Lorb;)V

    goto :goto_27e

    :pswitch_24c
    move-object/from16 v7, v24

    new-instance v6, Lcy8;

    invoke-direct {v6, v7, v4}, Lty8;-><init>(Lorb;Ljava/lang/String;)V

    goto :goto_27e

    :pswitch_254
    move-object/from16 v7, v24

    new-instance v6, Lfy8;

    invoke-direct {v6, v7, v8}, Lfy8;-><init>(Lorb;Ljava/lang/String;)V

    goto :goto_27e

    :pswitch_25c
    move-object/from16 v7, v24

    new-instance v6, Lsy8;

    const/4 v0, 0x1

    invoke-direct {v6, v1, v7, v0}, Loy8;-><init>(Ljava/lang/String;Lorb;B)V

    goto :goto_27e

    :pswitch_265
    move-object/from16 v7, v24

    new-instance v6, Lfy8;

    invoke-direct {v6, v7, v5}, Lfy8;-><init>(Lorb;Ljava/lang/String;)V

    goto :goto_27e

    :pswitch_26d
    move-object/from16 v7, v24

    new-instance v6, Lcy8;

    move-object/from16 v0, v26

    invoke-direct {v6, v7, v0}, Lty8;-><init>(Lorb;Ljava/lang/String;)V

    goto :goto_27e

    :pswitch_277
    move-object/from16 v7, v24

    new-instance v6, Lky8;

    invoke-direct {v6, v7}, Lky8;-><init>(Lorb;)V

    :goto_27e
    if-eqz v6, :cond_28a

    add-int/lit8 v5, v23, 0x1

    move-object/from16 v1, p1

    move/from16 v2, v23

    invoke-virtual {v1, v2, v6}, Ljec;->add(ILjava/lang/Object;)V

    goto :goto_28d

    :cond_28a
    move/from16 v2, v23

    move v5, v2

    :goto_28d
    add-int/lit8 v4, v18, 0x1

    move-object/from16 v0, p0

    move-object/from16 v3, v16

    goto/16 :goto_1e

    :cond_295
    return-void

    :sswitch_data_296
    .sparse-switch
        -0x64d5814c -> :sswitch_14e
        -0x3c1c93e4 -> :sswitch_142
        -0x37b3aacc -> :sswitch_139
        -0x2be607e3 -> :sswitch_130
        -0x29d3b5cb -> :sswitch_127
        0x2f2d34 -> :sswitch_11e
        0x32af97 -> :sswitch_114
        0x348b34 -> :sswitch_10a
        0x360659 -> :sswitch_ff
        0x5a5c588 -> :sswitch_f5
        0x65825f6 -> :sswitch_eb
        0x6854fdf -> :sswitch_e1
        0x7309209 -> :sswitch_d5
        0x94beeb5 -> :sswitch_c9
        0x1089702c -> :sswitch_bd
        0x36c8a354 -> :sswitch_b3
        0x40b292db -> :sswitch_a9
        0x459b71b7 -> :sswitch_9d
        0x52d04f0e -> :sswitch_93
        0x542d5d85 -> :sswitch_89
        0x63a33d25 -> :sswitch_7f
        0x71cdb494 -> :sswitch_75
        0x7e643e6d -> :sswitch_6b
    .end sparse-switch

    :pswitch_data_2f4
    .packed-switch 0x0
        :pswitch_277
        :pswitch_26d
        :pswitch_265
        :pswitch_25c
        :pswitch_254
        :pswitch_24c
        :pswitch_244
        :pswitch_23c
        :pswitch_234
        :pswitch_22c
        :pswitch_224
        :pswitch_21c
        :pswitch_213
        :pswitch_1b4
        :pswitch_1ab
        :pswitch_1a2
        :pswitch_198
        :pswitch_18f
        :pswitch_185
        :pswitch_17c
        :pswitch_173
        :pswitch_169
        :pswitch_160
    .end packed-switch

    :sswitch_data_326
    .sparse-switch
        0x2de5244f -> :sswitch_1fa
        0x2e976c4d -> :sswitch_1ef
        0x2ec8469e -> :sswitch_1e4
        0x4f6e4140 -> :sswitch_1d9
        0x5c569dbc -> :sswitch_1ce
        0x5c579dfd -> :sswitch_1c5
    .end sparse-switch

    :pswitch_data_340
    .packed-switch 0x0
        :pswitch_20c
        :pswitch_20c
        :pswitch_20c
        :pswitch_20c
        :pswitch_20c
        :pswitch_20c
    .end packed-switch
.end method

.method public static c(Lvpb;Ljava/util/Set;)V
    .registers 4

    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_13

    invoke-virtual {p0, v0}, Lvpb;->d(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_13
    return-void
.end method


# virtual methods
.method public final doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Liy8;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object p0, p0, Liy8;->b:Ljava/lang/Object;

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_196

    check-cast p1, [Ljava/lang/Void;

    check-cast p0, Laip;

    iget-object p1, p0, Laip;->c:Lwhp;

    iget-object v0, p1, Lwhp;->b:Ljava/lang/String;

    sget-object v4, Lgxo;->c:Lgxo;

    :try_start_14
    iget v4, p1, Lwhp;->c:I

    iget v5, p1, Lwhp;->d:I

    invoke-static {v0}, Landroid/webkit/URLUtil;->isHttpUrl(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_60

    invoke-static {v0}, Landroid/webkit/URLUtil;->isHttpsUrl(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_60

    invoke-static {v0}, Landroid/webkit/URLUtil;->isContentUrl(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_30

    invoke-static {v0}, Landroid/webkit/URLUtil;->isFileUrl(Ljava/lang/String;)Z

    move-result v1
    :try_end_2e
    .catch Ljava/lang/OutOfMemoryError; {:try_start_14 .. :try_end_2e} :catch_114

    if-eqz v1, :cond_101

    :cond_30
    :try_start_30
    iget-object v1, p0, Laip;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v2, "r"

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v0
    :try_end_40
    .catch Ljava/io/FileNotFoundException; {:try_start_30 .. :try_end_40} :catch_5a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_30 .. :try_end_40} :catch_5a
    .catchall {:try_start_30 .. :try_end_40} :catchall_54

    if-nez v0, :cond_47

    :try_start_42
    invoke-static {v0}, Lr9h;->l(Ljava/io/Closeable;)V
    :try_end_45
    .catch Ljava/lang/OutOfMemoryError; {:try_start_42 .. :try_end_45} :catch_114

    goto/16 :goto_11c

    :cond_47
    :try_start_47
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-static {v1, v4, v5}, Lnro;->b(Ljava/io/FileDescriptor;II)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Laip;->d:Landroid/graphics/Bitmap;
    :try_end_51
    .catch Ljava/io/FileNotFoundException; {:try_start_47 .. :try_end_51} :catch_5b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_47 .. :try_end_51} :catch_5b
    .catchall {:try_start_47 .. :try_end_51} :catchall_52

    goto :goto_5b

    :catchall_52
    move-exception p1

    goto :goto_56

    :catchall_54
    move-exception p1

    move-object v0, v3

    :goto_56
    :try_start_56
    invoke-static {v0}, Lr9h;->l(Ljava/io/Closeable;)V

    throw p1

    :catch_5a
    move-object v0, v3

    :catch_5b
    :goto_5b
    invoke-static {v0}, Lr9h;->l(Ljava/io/Closeable;)V

    goto/16 :goto_101

    :cond_60
    iget-object v6, p0, Laip;->j:[B
    :try_end_62
    .catch Ljava/lang/OutOfMemoryError; {:try_start_56 .. :try_end_62} :catch_114

    if-eqz v6, :cond_e4

    :try_start_64
    invoke-virtual {p0, v0}, Laip;->b(Ljava/lang/String;)V

    iget-object v6, p0, Laip;->j:[B

    invoke-static {v6}, Laip;->d([B)Z

    move-result v7

    if-nez v7, :cond_ac

    invoke-static {v6}, Laip;->f([B)Z

    move-result v6

    if-nez v6, :cond_ac

    iget-object v0, p0, Laip;->j:[B

    sget-object v6, Lnro;->c:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->tryLock()Z

    move-result v7
    :try_end_7d
    .catchall {:try_start_64 .. :try_end_7d} :catchall_e0

    if-eqz v7, :cond_a0

    :try_start_7f
    sget-object v7, Lnro;->b:Landroid/graphics/BitmapFactory$Options;

    sget-object v8, Lnro;->a:[B

    iput-object v8, v7, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B

    iput-boolean v2, v7, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iput v1, v7, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    sget-object v1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    if-nez v1, :cond_90

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    goto :goto_91

    :cond_90
    move-object v1, v3

    :goto_91
    iput-object v1, v7, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v4, v5, v7}, Lnro;->d([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_97
    .catchall {:try_start_7f .. :try_end_97} :catchall_9b

    :try_start_97
    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_a9

    :catchall_9b
    move-exception p1

    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw p1

    :cond_a0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    invoke-static {v0, v4, v5, v1}, Lnro;->d([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    :goto_a9
    iput-object v0, p0, Laip;->d:Landroid/graphics/Bitmap;

    goto :goto_da

    :cond_ac
    sget-object v1, Lfip;->a:Ljava/util/HashMap;

    iget-object v1, p1, Lwhp;->e:Lvhp;

    invoke-static {v1}, Lfip;->c(Lvhp;)Lz9p;

    move-result-object v1
    :try_end_b4
    .catchall {:try_start_97 .. :try_end_b4} :catchall_e0

    if-eqz v1, :cond_cb

    :try_start_b6
    const-string v2, "MD5"

    invoke-static {v0, v2}, Ldyg;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_c6

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    :cond_c6
    invoke-virtual {v1, v2}, Lz9p;->p(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0
    :try_end_ca
    .catch Ljava/io/IOException; {:try_start_b6 .. :try_end_ca} :catch_cb
    .catchall {:try_start_b6 .. :try_end_ca} :catchall_e0

    goto :goto_cc

    :catch_cb
    :cond_cb
    move-object v0, v3

    :goto_cc
    if-eqz v0, :cond_d7

    :try_start_ce
    invoke-static {v0}, Landroid/graphics/ImageDecoder;->createSource(Ljava/io/File;)Landroid/graphics/ImageDecoder$Source;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/ImageDecoder;->decodeDrawable(Landroid/graphics/ImageDecoder$Source;)Landroid/graphics/drawable/Drawable;

    move-result-object v0
    :try_end_d6
    .catch Ljava/io/IOException; {:try_start_ce .. :try_end_d6} :catch_d7
    .catchall {:try_start_ce .. :try_end_d6} :catchall_e0

    goto :goto_d8

    :catch_d7
    :cond_d7
    move-object v0, v3

    :goto_d8
    :try_start_d8
    iput-object v0, p0, Laip;->k:Landroid/graphics/drawable/Drawable;

    :goto_da
    iget-object v0, p0, Laip;->j:[B

    array-length v0, v0
    :try_end_dd
    .catchall {:try_start_d8 .. :try_end_dd} :catchall_e0

    :try_start_dd
    iput-object v3, p0, Laip;->j:[B

    goto :goto_101

    :catchall_e0
    move-exception p1

    iput-object v3, p0, Laip;->j:[B

    throw p1

    :cond_e4
    invoke-virtual {p0, v4, v5, v0}, Laip;->a(IILjava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Landroid/graphics/Bitmap;

    if-eqz v1, :cond_f2

    move-object v1, v0

    check-cast v1, Landroid/graphics/Bitmap;

    iput-object v1, p0, Laip;->d:Landroid/graphics/Bitmap;

    goto :goto_fb

    :cond_f2
    instance-of v1, v0, Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_fb

    move-object v1, v0

    check-cast v1, Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Laip;->k:Landroid/graphics/drawable/Drawable;

    :cond_fb
    :goto_fb
    if-nez v0, :cond_101

    iget v0, p0, Laip;->e:I

    if-nez v0, :cond_11c

    :cond_101
    :goto_101
    iget-object v0, p0, Laip;->d:Landroid/graphics/Bitmap;

    if-nez v0, :cond_10e

    iget-object v0, p0, Laip;->k:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_10e

    const/16 p1, 0x9

    iput p1, p0, Laip;->e:I

    goto :goto_11c

    :cond_10e
    sget-object v0, Llep;->a:Lz4k;

    invoke-virtual {v0, p1}, Lz4k;->c(Lwhp;)Lxhp;
    :try_end_113
    .catch Ljava/lang/OutOfMemoryError; {:try_start_dd .. :try_end_113} :catch_114

    goto :goto_11c

    :catch_114
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    const/16 p1, 0x8

    iput p1, p0, Laip;->e:I

    :cond_11c
    :goto_11c
    return-object v3

    :pswitch_11d
    check-cast p1, [Landroid/graphics/Bitmap;

    aget-object p0, p1, v2

    :goto_121
    new-instance p1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->WEBP:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {p0, v0, v2, p1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "data:image/webp;base64,"

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    const/4 v3, 0x2

    invoke-static {p1, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v3, 0x800

    if-gt v0, v3, :cond_153

    return-object p1

    :cond_153
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    int-to-float p1, p1

    const v0, 0x3f5db3d7

    mul-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v0

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-static {p0, p1, v0, v1}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_121

    :pswitch_16f
    check-cast p1, [Ljava/lang/Void;

    new-instance p1, Ljava/io/File;

    check-cast p0, Luy8;

    iget-object p0, p0, Luy8;->J:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string v0, "newsfeedback"

    invoke-direct {p1, p0, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_180
    invoke-static {p1}, Ls29;->h(Ljava/io/File;)[B

    move-result-object p0

    new-instance p1, Ljava/lang/String;

    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    new-instance p0, Lorb;

    invoke-direct {p0, p1}, Lorb;-><init>(Ljava/lang/String;)V
    :try_end_194
    .catch Ljava/io/FileNotFoundException; {:try_start_180 .. :try_end_194} :catch_195
    .catch Ljava/io/IOException; {:try_start_180 .. :try_end_194} :catch_195
    .catch Lorg/json/JSONException; {:try_start_180 .. :try_end_194} :catch_195

    move-object v3, p0

    :catch_195
    return-object v3

    :pswitch_data_196
    .packed-switch 0x0
        :pswitch_16f
        :pswitch_11d
    .end packed-switch
.end method

.method public final onCancelled(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Liy8;->a:B

    packed-switch v0, :pswitch_data_14

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onCancelled(Ljava/lang/Object;)V

    return-void

    :pswitch_9
    check-cast p1, Ljava/lang/Void;

    iget-object p0, p0, Liy8;->b:Ljava/lang/Object;

    check-cast p0, Laip;

    invoke-virtual {p0}, Laip;->g()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x2
        :pswitch_9
    .end packed-switch
.end method

.method public final onPostExecute(Ljava/lang/Object;)V
    .registers 9

    iget-byte v0, p0, Liy8;->a:B

    iget-object p0, p0, Liy8;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_10c

    check-cast p1, Ljava/lang/Void;

    check-cast p0, Laip;

    invoke-virtual {p0}, Laip;->g()V

    return-void

    :pswitch_f
    check-cast p1, Landroid/net/Uri;

    check-cast p0, Lcom/opera/api/Callback;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_17
    check-cast p1, Lorb;

    check-cast p0, Luy8;

    const/4 v0, 0x1

    if-eqz p1, :cond_e2

    :try_start_1e
    const-string v1, "version"

    iget-object v2, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    if-lt v1, v0, :cond_54

    const-string v2, "events"

    invoke-virtual {p1, v2}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v2

    iget-object v3, p0, Luy8;->d:Ljec;

    invoke-static {v2, v3}, Liy8;->b(Lvpb;Ljec;)V

    const-string v2, "report_click"

    invoke-virtual {p1, v2}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v2

    iget-object v3, p0, Luy8;->q:Ljava/util/Set;

    invoke-static {v2, v3}, Liy8;->c(Lvpb;Ljava/util/Set;)V

    const-string v2, "report_imp"

    invoke-virtual {p1, v2}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v2

    iget-object v3, p0, Luy8;->x:Ljava/util/Set;

    invoke-static {v2, v3}, Liy8;->c(Lvpb;Ljava/util/Set;)V

    const-string v2, "ack_imp"

    invoke-virtual {p1, v2}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v2

    iget-object v3, p0, Luy8;->y:Ljava/util/Set;

    invoke-static {v2, v3}, Liy8;->c(Lvpb;Ljava/util/Set;)V

    :cond_54
    const/4 v2, 0x2

    if-lt v1, v2, :cond_6d

    const-string v2, "report_stay"

    invoke-virtual {p1, v2}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v2

    iget-object v3, p0, Luy8;->s:Ljava/util/Set;

    invoke-static {v2, v3}, Liy8;->c(Lvpb;Ljava/util/Set;)V

    const-string v2, "report_share"

    invoke-virtual {p1, v2}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v2

    iget-object v3, p0, Luy8;->r:Ljava/util/Set;

    invoke-static {v2, v3}, Liy8;->c(Lvpb;Ljava/util/Set;)V

    :cond_6d
    const/4 v2, 0x3

    if-lt v1, v2, :cond_7b

    const-string v2, "video_events"

    invoke-virtual {p1, v2}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v2

    iget-object v3, p0, Luy8;->e:Ljec;

    invoke-static {v2, v3}, Liy8;->b(Lvpb;Ljec;)V

    :cond_7b
    const/4 v2, 0x4

    if-lt v1, v2, :cond_ad

    iget-object v2, p0, Luy8;->m:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_ad

    const-string v2, "experiments"

    invoke-virtual {p1, v2}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v2

    iget-object v3, v2, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    :goto_97
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_ab

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v2, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_97

    :cond_ab
    iput-object v4, p0, Luy8;->m:Ljava/util/Map;

    :cond_ad
    const/4 v2, 0x5

    if-lt v1, v2, :cond_c6

    const-string v2, "report_dislike"

    invoke-virtual {p1, v2}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v2

    iget-object v3, p0, Luy8;->z:Ljava/util/Set;

    invoke-static {v2, v3}, Liy8;->c(Lvpb;Ljava/util/Set;)V

    const-string v2, "report_feedback"

    invoke-virtual {p1, v2}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v2

    iget-object v3, p0, Luy8;->A:Ljava/util/Set;

    invoke-static {v2, v3}, Liy8;->c(Lvpb;Ljava/util/Set;)V

    :cond_c6
    const/4 v2, 0x6

    if-lt v1, v2, :cond_d4

    const-string v2, "request_data"

    invoke-virtual {p1, v2}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v2

    iget-object v3, p0, Luy8;->H:Lk5o;

    invoke-static {v2, v3}, Liy8;->a(Lorb;Lk5o;)V

    :cond_d4
    const/4 v2, 0x7

    if-lt v1, v2, :cond_e2

    const-string v1, "clip_events"

    invoke-virtual {p1, v1}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object p1

    iget-object v1, p0, Luy8;->f:Ljec;

    invoke-static {p1, v1}, Liy8;->b(Lvpb;Ljec;)V
    :try_end_e2
    .catch Lorg/json/JSONException; {:try_start_1e .. :try_end_e2} :catch_e2

    :catch_e2
    :cond_e2
    iput-boolean v0, p0, Luy8;->j:Z

    iget-object p1, p0, Luy8;->c:Ljava/util/HashSet;

    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_ea
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_fe

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lxqe;

    invoke-virtual {v1}, Lxqe;->a()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p0, v1}, Luy8;->b(Ljava/util/List;)V

    goto :goto_ea

    :cond_fe
    invoke-virtual {p1}, Ljava/util/HashSet;->clear()V

    iget-object p1, p0, Luy8;->a:Lqtm;

    if-eqz p1, :cond_10b

    iget-object p0, p0, Luy8;->o:Lqy8;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lqy8;->c(Z)V

    :cond_10b
    return-void

    :pswitch_data_10c
    .packed-switch 0x0
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method

.method public final onPreExecute()V
    .registers 2

    iget-byte v0, p0, Liy8;->a:B

    packed-switch v0, :pswitch_data_e

    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    return-void

    :pswitch_9
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    return-void

    nop

    :pswitch_data_e
    .packed-switch 0x2
        :pswitch_9
    .end packed-switch
.end method
