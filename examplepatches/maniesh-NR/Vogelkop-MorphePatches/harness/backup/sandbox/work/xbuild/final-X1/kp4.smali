.class public final Lkp4;
.super Lz4o;
.source "SourceFile"


# instance fields
.field public final synthetic r:B

.field public final synthetic s:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lkp4;->r:B

    iput-object p2, p0, Lkp4;->s:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final Y(Ljava/lang/String;Z)V
    .registers 3

    iget-byte p1, p0, Lkp4;->r:B

    const/4 p2, 0x0

    iget-object p0, p0, Lkp4;->s:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_26

    check-cast p0, Loam;

    invoke-virtual {p0, p2}, Loam;->q(Ljava/lang/String;)V

    return-void

    :pswitch_e
    check-cast p0, Lqu8;

    iget-object p1, p0, Lqu8;->d:Lt7j;

    check-cast p1, Lru8;

    iget-object p1, p1, Lru8;->j:Lta7;

    invoke-virtual {p1}, Lta7;->p()Lpu8;

    move-result-object p1

    invoke-virtual {p0, p1}, Lqu8;->d(Lpu8;)V

    return-void

    :pswitch_1e
    check-cast p0, Llp4;

    const/4 p1, 0x0

    invoke-interface {p0, p2, p1}, Llp4;->d(Ljava/util/ArrayList;Z)V

    return-void

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_1e
        :pswitch_e
    .end packed-switch
.end method

.method public final c0(Lpzh;Lorb;)V
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    iget-byte v3, v0, Lkp4;->r:B

    const/4 v4, 0x0

    const/4 v5, 0x1

    iget-object v0, v0, Lkp4;->s:Ljava/lang/Object;

    packed-switch v3, :pswitch_data_144

    const-string v1, "device_id"

    invoke-virtual {v2, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_21

    check-cast v0, Loam;

    invoke-virtual {v0, v1}, Loam;->q(Ljava/lang/String;)V

    goto :goto_26

    :cond_21
    const-string v0, "device id can\'t be empty"

    invoke-static {v0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    :goto_26
    return-void

    :pswitch_27
    check-cast v0, Lqu8;

    const-string v1, "enable_video_theater"

    const-string v3, "enable_native_push"

    const-string v6, "enable_local_push"

    const-string v7, "percent_threshold"

    const-string v8, "duration_threshold"

    :try_start_33
    const-string v9, "related_articles"

    invoke-virtual {v2, v9}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v9

    iget-object v9, v9, Lorb;->a:Lorg/json/JSONObject;

    const/4 v10, -0x1

    invoke-virtual {v9, v8, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v11

    invoke-virtual {v9, v7, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v9

    const-string v12, "feedback_reason_v2"

    invoke-virtual {v2, v12}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object v12

    if-eqz v12, :cond_51

    invoke-static {v12}, Lo0g;->L(Lorb;)Landroid/util/Pair;

    move-result-object v12

    goto :goto_52

    :cond_51
    move-object v12, v4

    :goto_52
    invoke-virtual {v2, v6}, Lorb;->f(Ljava/lang/String;)Z

    move-result v18

    invoke-virtual {v2, v3}, Lorb;->f(Ljava/lang/String;)Z

    move-result v19

    invoke-virtual {v2, v1}, Lorb;->f(Ljava/lang/String;)Z

    move-result v20

    const-string v13, "enable_clip"

    iget-object v2, v2, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2, v13, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    new-instance v13, Lpu8;

    if-ne v11, v10, :cond_6b

    move-object v14, v4

    goto :goto_70

    :cond_6b
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object v14, v2

    :goto_70
    if-ne v9, v10, :cond_74

    move-object v15, v4

    goto :goto_79

    :cond_74
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object v15, v2

    :goto_79
    if-eqz v12, :cond_82

    iget-object v2, v12, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/util/Map;

    move-object/from16 v16, v2

    goto :goto_84

    :cond_82
    move-object/from16 v16, v4

    :goto_84
    if-eqz v12, :cond_8d

    iget-object v2, v12, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/util/Map;

    move-object/from16 v17, v2

    goto :goto_8f

    :cond_8d
    move-object/from16 v17, v4

    :goto_8f
    invoke-direct/range {v13 .. v20}, Lpu8;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/Map;Ljava/util/Map;ZZZ)V
    :try_end_92
    .catch Lorg/json/JSONException; {:try_start_33 .. :try_end_92} :catch_93

    move-object v4, v13

    :catch_93
    iget-object v2, v0, Lqu8;->d:Lt7j;

    check-cast v2, Lru8;

    if-eqz v4, :cond_f2

    iget-object v2, v2, Lru8;->j:Lta7;

    invoke-virtual {v2}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v9

    invoke-interface {v9}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    iget-object v10, v4, Lpu8;->a:Ljava/lang/Integer;

    if-eqz v10, :cond_ae

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-interface {v9, v8, v10}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    :cond_ae
    iget-object v8, v4, Lpu8;->b:Ljava/lang/Integer;

    if-eqz v8, :cond_b9

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-interface {v9, v7, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    :cond_b9
    iget-object v2, v2, Lta7;->e:Ljava/lang/Object;

    check-cast v2, Ls6h;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v7, v4, Lpu8;->c:Ljava/util/Map;

    iget-object v8, v4, Lpu8;->d:Ljava/util/Map;

    new-instance v10, Lux8;

    invoke-direct {v10, v7, v8}, Lux8;-><init>(Ljava/util/Map;Ljava/util/Map;)V

    iget-object v7, v2, Ls6h;->a:Ljava/lang/Object;

    check-cast v7, Li32;

    new-instance v8, Lcn7;

    const/16 v11, 0x15

    invoke-direct {v8, v2, v10, v11}, Lcn7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v7, v8}, Lldk;->f(Ljava/lang/Runnable;)V

    iget-boolean v2, v4, Lpu8;->e:Z

    invoke-interface {v9, v6, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    iget-boolean v2, v4, Lpu8;->f:Z

    invoke-interface {v9, v3, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    iget-boolean v2, v4, Lpu8;->g:Z

    invoke-interface {v9, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v0, v0, Lqu8;->b:Lisd;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v4, v5}, Lisd;->E(Ljava/lang/Object;Z)V

    goto :goto_fb

    :cond_f2
    iget-object v1, v2, Lru8;->j:Lta7;

    invoke-virtual {v1}, Lta7;->p()Lpu8;

    move-result-object v1

    invoke-virtual {v0, v1}, Lqu8;->d(Lpu8;)V

    :goto_fb
    return-void

    :pswitch_fc
    iget-object v3, v1, Lpzh;->j:Lpzh;

    const/4 v6, 0x0

    if-eqz v3, :cond_105

    iget-object v1, v1, Lpzh;->i:Lpzh;

    if-eqz v1, :cond_106

    :cond_105
    move v5, v6

    :cond_106
    check-cast v0, Llp4;

    :try_start_108
    const-string v1, "version"

    invoke-virtual {v2, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    const-string v1, "categories"

    invoke-virtual {v2, v1}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v1

    invoke-static {v1}, Lnp4;->d(Lvpb;)Lnp4;

    move-result-object v1

    iget-object v1, v1, Lnp4;->a:Ljava/util/ArrayList;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    :goto_122
    if-ge v6, v3, :cond_13b

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Lpp4;

    new-instance v8, Lyqe;

    iget-object v9, v7, Lpp4;->a:Ljava/lang/String;

    iget-object v10, v7, Lpp4;->b:Ljava/lang/String;

    iget-boolean v7, v7, Lpp4;->c:Z

    invoke-direct {v8, v9, v10, v7}, Lyqe;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_122

    :cond_13b
    invoke-interface {v0, v2, v5}, Llp4;->d(Ljava/util/ArrayList;Z)V
    :try_end_13e
    .catch Lorg/json/JSONException; {:try_start_108 .. :try_end_13e} :catch_13f

    goto :goto_142

    :catch_13f
    invoke-interface {v0, v4, v5}, Llp4;->d(Ljava/util/ArrayList;Z)V

    :goto_142
    return-void

    nop

    :pswitch_data_144
    .packed-switch 0x0
        :pswitch_fc
        :pswitch_27
    .end packed-switch
.end method
