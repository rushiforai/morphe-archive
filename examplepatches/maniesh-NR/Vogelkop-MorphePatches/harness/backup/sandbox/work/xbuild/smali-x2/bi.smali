.class public final synthetic Lbi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lph;
.implements Lh93;
.implements Lvlf;
.implements Ln5o;
.implements Lcom/opera/android/suggestion/SuggestionListCallback;
.implements Lp9n;
.implements Lry;
.implements Lm9n;
.implements Lzph;
.implements Lmm9;
.implements Lkrn;
.implements Lbqb;
.implements Lcy1;
.implements Ly62;
.implements Lla2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lbi;->a:B

    iput-object p1, p0, Lbi;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final X(Landroid/os/Bundle;Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Lbi;->b:Ljava/lang/Object;

    check-cast p0, Ls02;

    const-string p2, "result_code"

    invoke-virtual {p1, p2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result p1

    const/4 p2, -0x1

    if-ne p1, p2, :cond_f

    const/4 p1, 0x1

    goto :goto_10

    :cond_f
    const/4 p1, 0x0

    :goto_10
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Ls02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;Ltn;)V
    .registers 21

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iget-object v1, v1, Lbi;->b:Ljava/lang/Object;

    check-cast v1, Lyx;

    iget-object v2, v1, Lyx;->c:Ljava/lang/Object;

    check-cast v2, Lami;

    iget-object v3, v1, Lyx;->d:Ljava/lang/Object;

    check-cast v3, Lxx;

    iget-object v4, v1, Lyx;->e:Ljava/lang/Object;

    check-cast v4, Lr9i;

    iget-wide v5, v1, Lyx;->b:J

    iget-object v1, v2, Lami;->f:Ljava/lang/Object;

    check-cast v1, Lb59;

    iget-object v7, v2, Lami;->e:Ljava/lang/Object;

    check-cast v7, Lvzk;

    if-nez v0, :cond_29

    iget-object v8, v2, Lami;->h:Ljava/lang/Object;

    check-cast v8, Lwjh;

    sget-object v9, Lie0;->d:Lie0;

    invoke-virtual {v8, v9}, Lwjh;->y(Lie0;)V

    :cond_29
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    const/4 v9, 0x0

    if-nez v8, :cond_3b

    iget-object v8, v3, Llyf;->a:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    move-object/from16 v11, p3

    invoke-static {v0, v8, v11, v9}, Lzo;->a(Ljava/lang/String;Ljava/lang/String;Lgm;Z)Lzo;

    move-result-object v8

    goto :goto_3c

    :cond_3b
    const/4 v8, 0x0

    :goto_3c
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_c5

    iget-object v11, v3, Llyf;->a:Ljava/lang/Object;

    check-cast v11, Ljava/lang/String;

    :try_start_46
    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v13, "ok"

    const-string v14, "ret"

    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    invoke-static {v14}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_c5

    const-string v13, "dat"

    invoke-virtual {v12, v13}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    const-string v13, "accessID"

    invoke-virtual {v12, v13}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    invoke-static {v13}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    if-eqz v13, :cond_bb

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    const-string v14, "discharge"

    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    if-nez v12, :cond_7d

    const/4 v14, 0x0

    goto :goto_82

    :cond_7d
    new-instance v14, Lorb;

    invoke-direct {v14, v12}, Lorb;-><init>(Lorg/json/JSONObject;)V

    :goto_82
    if-eqz v14, :cond_c5

    const-string v12, "id"

    invoke-virtual {v14, v12}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v15, "ic"

    invoke-virtual {v14, v15}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v14

    iget-object v15, v14, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v15}, Lorg/json/JSONArray;->length()I

    move-result v16

    if-eqz v16, :cond_c5

    new-instance v9, Ljava/util/ArrayList;

    invoke-virtual {v15}, Lorg/json/JSONArray;->length()I

    move-result v10

    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(I)V
    :try_end_a1
    .catch Lorg/json/JSONException; {:try_start_46 .. :try_end_a1} :catch_c5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_46 .. :try_end_a1} :catch_c5

    move-object/from16 p0, v1

    const/4 v10, 0x0

    :goto_a4
    :try_start_a4
    invoke-virtual {v15}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v10, v1, :cond_b4

    invoke-virtual {v14, v10}, Lvpb;->d(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v10, v10, 0x1

    goto :goto_a4

    :cond_b4
    new-instance v1, Lr9i;

    invoke-direct {v1, v11, v13, v12, v9}, Lr9i;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V

    move-object v10, v1

    goto :goto_c8

    :cond_bb
    move-object/from16 p0, v1

    new-instance v1, Lorg/json/JSONException;

    const-string v9, "accessID is null"

    invoke-direct {v1, v9}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_c5
    .catch Lorg/json/JSONException; {:try_start_a4 .. :try_end_c5} :catch_c7
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a4 .. :try_end_c5} :catch_c7

    :catch_c5
    :cond_c5
    move-object/from16 p0, v1

    :catch_c7
    const/4 v10, 0x0

    :goto_c8
    if-eqz v8, :cond_13f

    invoke-virtual/range {p0 .. p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v9, "ads_config_last_ip_address"

    iget-object v11, v8, Lzo;->d:Ljava/lang/String;

    invoke-interface {v1, v9, v11}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v1, v3, Llyf;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v9, v7, Lvzk;->a:Ljava/lang/Object;

    check-cast v9, Lcy;

    invoke-virtual {v9}, Lcy;->c()Lml;

    move-result-object v9

    iget-object v9, v9, Lml;->j:Ljava/util/HashSet;

    invoke-virtual {v9, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13f

    iget-object v1, v2, Lami;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    invoke-virtual {v1, v3, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v4, Lr9i;->c:Ljava/lang/Object;

    check-cast v1, Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {p0 .. p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/SharedPreferences;

    invoke-static {v3}, Lami;->g(Lxx;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v11, "_data"

    invoke-virtual {v9, v11}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v4, v11, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v4, "_url"

    invoke-virtual {v9, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "_timestamp"

    invoke-virtual {v9, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    invoke-interface {v0, v1, v11, v12}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "_request_time"

    invoke-virtual {v9, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_13f
    iget-object v0, v2, Lami;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_15f

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_14f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_15f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/api/Callback;

    invoke-interface {v1, v8}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_14f

    :cond_15f
    if-eqz v10, :cond_18b

    iget-object v0, v7, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Li5o;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v10, Lr9i;->e:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_18b

    new-instance v2, Lly;

    invoke-direct {v2, v0, v1, v10}, Lly;-><init>(Li5o;Ljava/util/List;Lr9i;)V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_17b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_18b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Li5o;->j(Ljava/lang/String;Lly;)V

    goto :goto_17b

    :cond_18b
    return-void
.end method

.method public final b(ILd2c;)I
    .registers 4

    iget-object p0, p0, Lbi;->b:Ljava/lang/Object;

    check-cast p0, Lrd3;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2}, Lrd3;->a(IILd2c;)I

    move-result p0

    return p0
.end method

.method public final c()V
    .registers 3

    iget-object p0, p0, Lbi;->b:Ljava/lang/Object;

    check-cast p0, Ls62;

    iget-object p0, p0, Ls62;->c:Lg7m;

    iget-object p0, p0, Lg7m;->d:Ljava/lang/Object;

    check-cast p0, Lji;

    invoke-virtual {p0}, Lji;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorm;

    const/4 v0, 0x0

    check-cast p0, Lx5f;

    const/16 v1, 0xc

    invoke-virtual {p0, v1, v0}, Lx5f;->R(ILjava/lang/String;)V

    return-void
.end method

.method public final d(Ljava/util/List;)V
    .registers 20

    move-object/from16 v0, p0

    iget-object v0, v0, Lbi;->b:Ljava/lang/Object;

    check-cast v0, Lkt;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v2, p1

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_13
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_69

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/opera/android/suggestion/Suggestion;

    iget v4, v3, Lcom/opera/android/suggestion/Suggestion;->a:I

    const/16 v5, 0x18

    const/16 v6, 0x17

    if-eq v4, v6, :cond_2d

    if-eq v4, v5, :cond_2d

    packed-switch v4, :pswitch_data_6e

    goto :goto_13

    :cond_2d
    :pswitch_2d
    invoke-static {v3}, Lybh;->g(Lcom/opera/android/suggestion/Suggestion;)I

    move-result v4

    iget-object v7, v3, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    new-instance v9, Lqxh;

    invoke-direct {v9, v7}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v3}, Lcom/opera/android/suggestion/Suggestion;->b()Ljava/lang/String;

    move-result-object v10

    iget v3, v3, Lcom/opera/android/suggestion/Suggestion;->a:I

    if-eq v3, v6, :cond_52

    if-eq v3, v5, :cond_4f

    packed-switch v3, :pswitch_data_7e

    sget-object v3, Lht;->i:Lht;

    :goto_47
    move-object v13, v3

    goto :goto_55

    :pswitch_49
    sget-object v3, Lht;->d:Lht;

    goto :goto_47

    :pswitch_4c
    sget-object v3, Lht;->a:Lht;

    goto :goto_47

    :cond_4f
    sget-object v3, Lht;->g:Lht;

    goto :goto_47

    :cond_52
    sget-object v3, Lht;->h:Lht;

    goto :goto_47

    :goto_55
    new-instance v8, Lst;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/16 v16, 0x0

    const/16 v17, 0x1e4

    const/4 v11, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-direct/range {v8 .. v17}, Lst;-><init>(Lpxh;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lht;Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_13

    :cond_69
    invoke-virtual {v0, v1}, Lkt;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_6e
    .packed-switch 0x2
        :pswitch_2d
        :pswitch_2d
        :pswitch_2d
        :pswitch_2d
        :pswitch_2d
        :pswitch_2d
    .end packed-switch

    :pswitch_data_7e
    .packed-switch 0x2
        :pswitch_4c
        :pswitch_4c
        :pswitch_49
        :pswitch_49
        :pswitch_49
        :pswitch_49
    .end packed-switch
.end method

.method public final e(II)V
    .registers 4

    iget-byte v0, p0, Lbi;->a:B

    iget-object p0, p0, Lbi;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_18

    check-cast p0, Lcom/opera/android/widget/AspectRatioImageView;

    sget v0, Lcom/opera/android/widget/AspectRatioImageView;->l:I

    invoke-virtual {p0, p1, p2}, Lcom/opera/android/widget/AspectRatioImageView;->f(II)V

    return-void

    :pswitch_f
    check-cast p0, Lcom/opera/android/widget/AspectRatioFrameLayout;

    sget v0, Lcom/opera/android/widget/AspectRatioFrameLayout;->d:I

    invoke-virtual {p0, p1, p2}, Lcom/opera/android/widget/AspectRatioFrameLayout;->d(II)V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x1c
        :pswitch_f
    .end packed-switch
.end method

.method public final f(Ltc2;)V
    .registers 2

    iget-object p0, p0, Lbi;->b:Ljava/lang/Object;

    check-cast p0, Lx22;

    iget-object p0, p0, Lx22;->n:Lr22;

    if-eqz p0, :cond_b

    invoke-virtual {p0, p1}, Lr22;->f(Ltc2;)V

    :cond_b
    return-void
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Lbi;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object p0, p0, Lbi;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_76

    check-cast p0, Ll92;

    check-cast p1, Landroid/graphics/Bitmap;

    sget v0, Ll92;->b:I

    new-instance v0, Lm92;

    invoke-direct {v0, p1, v2}, Lm92;-><init>(Landroid/graphics/Bitmap;I)V

    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object v1

    :sswitch_1b
    check-cast p0, Lit1;

    check-cast p1, Ljava/util/List;

    new-instance v5, Lqii;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2a
    :goto_2a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_57

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ShortcutInfo;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lit1;->a(Landroid/content/pm/ShortcutInfo;)Ljava/lang/String;

    move-result-object v2

    iget-object v0, p0, Lit1;->a:Landroid/content/Context;

    if-eqz v2, :cond_2a

    move-object v1, v0

    new-instance v0, Lghf;

    move-object v3, v1

    invoke-static {v3}, Lcqp;->f0(Landroid/content/Context;)Lpne;

    move-result-object v1

    const/high16 v4, 0x42200000    # 40.0f

    invoke-static {v3, v4}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v3

    iget-object v4, p0, Lit1;->b:Lumi;

    const-wide/16 v6, 0xbb8

    invoke-direct/range {v0 .. v7}, Lghf;-><init>(Lpne;Ljava/lang/String;ILumi;Lbnj;J)V

    goto :goto_2a

    :cond_57
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :sswitch_5a
    check-cast p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;

    check-cast p1, Landroid/graphics/Bitmap;

    iput-object p1, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->g:Landroid/graphics/Bitmap;

    iput-boolean v2, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->h:Z

    iget-object p1, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->o:Liv;

    if-eqz p1, :cond_6b

    invoke-virtual {p1}, Liv;->run()V

    iput-object v1, p0, Lcom/opera/android/webapps/AddToHomescreenDataFetcherNative;->o:Liv;

    :cond_6b
    return-object v1

    :sswitch_6c
    check-cast p0, Lkt;

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lkt;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :sswitch_data_76
    .sparse-switch
        0x7 -> :sswitch_6c
        0x9 -> :sswitch_5a
        0x12 -> :sswitch_1b
    .end sparse-switch
.end method

.method public final h(Landroid/view/View;)V
    .registers 6

    iget-object p0, p0, Lbi;->b:Ljava/lang/Object;

    check-cast p0, Lmx;

    check-cast p1, Landroid/widget/RelativeLayout;

    iget-object p0, p0, Lmx;->E:Landroid/widget/FrameLayout;

    check-cast p0, Lcom/google/android/libraries/ads/mobile/sdk/nativead/NativeAdView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3e

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v1, v1, Landroid/widget/ImageView;

    if-eqz v1, :cond_3e

    const/high16 v1, 0x40800000    # 4.0f

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->orientation:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_3b

    const/high16 v1, 0x40c00000    # 6.0f

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {v1, p0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    :cond_3b
    invoke-static {p1, v0, v1, v1, v0}, Lq9n;->D(Landroid/view/View;IIII)V

    :cond_3e
    return-void
.end method

.method public final i(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    iget-object p0, p0, Lbi;->b:Ljava/lang/Object;

    check-cast p0, Lpy;

    iget-object v0, p0, Lpy;->b:Landroid/net/Uri$Builder;

    invoke-virtual {v0, p1, p2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    iget-object p0, p0, Lpy;->c:Loy;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, -0x1

    sparse-switch v0, :sswitch_data_66

    goto :goto_4f

    :sswitch_14
    const-string v0, "country"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4f

    const/4 v1, 0x5

    goto :goto_4f

    :sswitch_1e
    const-string v0, "opid"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4f

    const/4 v1, 0x4

    goto :goto_4f

    :sswitch_28
    const-string v0, "gaid"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4f

    const/4 v1, 0x3

    goto :goto_4f

    :sswitch_32
    const-string v0, "pkgname"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4f

    const/4 v1, 0x2

    goto :goto_4f

    :sswitch_3c
    const-string v0, "ip_country"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4f

    const/4 v1, 0x1

    goto :goto_4f

    :sswitch_46
    const-string v0, "pkgver"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4f

    const/4 v1, 0x0

    :cond_4f
    :goto_4f
    packed-switch v1, :pswitch_data_80

    goto :goto_64

    :pswitch_53
    iput-object p2, p0, Loy;->d:Ljava/io/Serializable;

    goto :goto_64

    :pswitch_56
    iput-object p2, p0, Loy;->i:Ljava/lang/Object;

    goto :goto_64

    :pswitch_59
    iput-object p2, p0, Loy;->h:Ljava/lang/Object;

    goto :goto_64

    :pswitch_5c
    iput-object p2, p0, Loy;->g:Ljava/lang/Object;

    goto :goto_64

    :pswitch_5f
    iput-object p2, p0, Loy;->e:Ljava/lang/Object;

    goto :goto_64

    :pswitch_62
    iput-object p2, p0, Loy;->f:Ljava/lang/Object;

    :goto_64
    return-void

    nop

    :sswitch_data_66
    .sparse-switch
        -0x3acccda9 -> :sswitch_46
        -0x2a490b82 -> :sswitch_3c
        -0x1ed099a9 -> :sswitch_32
        0x304b75 -> :sswitch_28
        0x3426bc -> :sswitch_1e
        0x39175796 -> :sswitch_14
    .end sparse-switch

    :pswitch_data_80
    .packed-switch 0x0
        :pswitch_62
        :pswitch_5f
        :pswitch_5c
        :pswitch_59
        :pswitch_56
        :pswitch_53
    .end packed-switch
.end method

.method public final isEmpty()Z
    .registers 1

    iget-object p0, p0, Lbi;->b:Ljava/lang/Object;

    check-cast p0, Lqmj;

    invoke-virtual {p0}, Lqmj;->I()Z

    move-result p0

    return p0
.end method

.method public final j()V
    .registers 1

    iget-object p0, p0, Lbi;->b:Ljava/lang/Object;

    check-cast p0, Lzg;

    invoke-virtual {p0}, Lzg;->x()V

    return-void
.end method

.method public final k(Ljava/lang/Object;)V
    .registers 2

    iget-object p0, p0, Lbi;->b:Ljava/lang/Object;

    check-cast p0, Lafe;

    invoke-interface {p0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final l(Ljava/lang/String;)V
    .registers 4

    iget-object p0, p0, Lbi;->b:Ljava/lang/Object;

    check-cast p0, Landroid/widget/EditText;

    new-instance v0, Lkv;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lkv;-><init>(Landroid/widget/EditText;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    invoke-static {p1}, Lwqm;->C(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {p0, v1, p1}, Landroid/widget/EditText;->setSelection(II)V

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    return-void
.end method

.method public final n(Ltw7;)V
    .registers 4

    iget-byte v0, p0, Lbi;->a:B

    iget-object p0, p0, Lbi;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_6e

    :pswitch_7
    check-cast p0, Lq3;

    instance-of v0, p1, Lrw7;

    const/4 v1, 0x0

    if-eqz v0, :cond_15

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    goto :goto_2e

    :cond_15
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_44

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Lt32;

    if-eqz p1, :cond_40

    instance-of v0, p1, Ls32;

    if-eqz v0, :cond_2a

    check-cast p1, Ls32;

    iget-boolean v1, p1, Ls32;->a:Z

    goto :goto_2e

    :cond_2a
    instance-of v0, p1, Lr32;

    if-eqz v0, :cond_36

    :goto_2e
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lq3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_47

    :cond_36
    instance-of p0, p1, Lu32;

    if-eqz p0, :cond_40

    const-string p0, ""

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    goto :goto_47

    :cond_40
    invoke-static {}, Lh9o;->p()V

    goto :goto_47

    :cond_44
    invoke-static {}, Lh9o;->p()V

    :goto_47
    return-void

    :pswitch_48
    check-cast p0, Lp62;

    iget-object p1, p0, Lp62;->c:Lg22;

    iget-object p1, p1, Lg22;->a:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->clear()V

    iget-object p0, p0, Lp62;->b:Lqyj;

    invoke-virtual {p0}, Lqyj;->m()V

    return-void

    :pswitch_57
    check-cast p0, Lole;

    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_66

    check-cast p1, Lrw7;

    iget-object p1, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Leqb;

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    goto :goto_6d

    :cond_66
    instance-of p0, p1, Lsw7;

    if-nez p0, :cond_6d

    invoke-static {}, Lh9o;->p()V

    :cond_6d
    :goto_6d
    return-void

    :pswitch_data_6e
    .packed-switch 0x16
        :pswitch_57
        :pswitch_7
        :pswitch_48
    .end packed-switch
.end method

.method public final s()V
    .registers 1

    iget-object p0, p0, Lbi;->b:Ljava/lang/Object;

    check-cast p0, Ld8j;

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Lg8j;->h()V

    return-void
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 3

    iget-byte p1, p0, Lbi;->a:B

    iget-object p0, p0, Lbi;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_20

    check-cast p0, Luw;

    invoke-virtual {p0}, Luw;->I0()Lcx;

    move-result-object p0

    iget-object p0, p0, Lcx;->f:Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p2}, LJ/N;->MzJtaipY(Z)V

    return-void

    :pswitch_16
    check-cast p0, Lwk;

    iget-object p0, p0, Lwk;->u:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "banner_blocker"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_data_20
    .packed-switch 0x2
        :pswitch_16
    .end packed-switch
.end method
