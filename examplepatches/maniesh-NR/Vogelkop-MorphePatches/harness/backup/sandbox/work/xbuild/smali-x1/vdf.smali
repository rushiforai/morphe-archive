.class public final synthetic Lvdf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lvdf;->a:B

    iput-object p1, p0, Lvdf;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 17

    move-object/from16 v0, p0

    iget-byte v1, v0, Lvdf;->a:B

    const/4 v2, 0x3

    const-wide/16 v3, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    iget-object v0, v0, Lvdf;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_476

    check-cast v0, Luig;

    invoke-virtual {v0}, Luig;->p()V

    return-void

    :pswitch_15
    check-cast v0, Lmig;

    invoke-virtual {v0}, Lmig;->j()V

    return-void

    :pswitch_1b
    check-cast v0, Lbig;

    iget v1, v0, Lbig;->m:I

    sub-int/2addr v1, v5

    iput v1, v0, Lbig;->m:I

    return-void

    :pswitch_23
    check-cast v0, Lit5;

    iget-object v0, v0, Lit5;->b:Ljava/lang/Object;

    check-cast v0, Lbeg;

    invoke-virtual {v0}, Lbeg;->i()V

    return-void

    :pswitch_2d
    check-cast v0, Lqag;

    invoke-virtual {v0}, Lqag;->c()V

    return-void

    :pswitch_33
    check-cast v0, Lyqd;

    sget-object v1, Ls9g;->h:Ls9g;

    invoke-virtual {v1, v7}, Ls9g;->e(Z)V

    if-eqz v0, :cond_3f

    invoke-virtual {v0}, Lyqd;->run()V

    :cond_3f
    return-void

    :pswitch_40
    check-cast v0, Ltn;

    iget-object v1, v0, Ltn;->b:Ljava/lang/Object;

    check-cast v1, Lorg/chromium/ui/base/WindowAndroid;

    iget-object v2, v0, Ltn;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    invoke-static {v1, v2}, Lf03;->A(Lorg/chromium/ui/base/WindowAndroid;[Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    iget-object v0, v0, Ltn;->d:Ljava/lang/Object;

    check-cast v0, Lbag;

    if-eqz v1, :cond_68

    invoke-interface {v0}, Lbag;->t()V

    goto :goto_6b

    :cond_68
    invoke-interface {v0}, Lbag;->s()V

    :goto_6b
    return-void

    :pswitch_6c
    check-cast v0, La32;

    invoke-virtual {v0}, La32;->a()V

    return-void

    :pswitch_72
    check-cast v0, Lmgf;

    invoke-virtual {v0}, Lmgf;->a()V

    return-void

    :pswitch_78
    check-cast v0, Laag;

    invoke-virtual {v0}, Laag;->a()V

    return-void

    :pswitch_7e
    check-cast v0, Ls9g;

    iget-object v0, v0, Ls9g;->f:Li7f;

    new-instance v1, Lqg2;

    const/16 v2, 0xa

    invoke-direct {v1, v2}, Lqg2;-><init>(B)V

    invoke-interface {v0, v1}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    return-void

    :pswitch_8d
    check-cast v0, Lvl6;

    iput-object v6, v0, Lvl6;->e:Ljava/lang/Object;

    iget-object v1, v0, Lvl6;->c:Ljava/lang/Object;

    check-cast v1, Lfp1;

    invoke-static {v1}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object v1

    if-eqz v1, :cond_de

    new-instance v2, Lrxh;

    const v3, 0x7f14117a

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    new-instance v3, Lx8g;

    invoke-direct {v3, v0, v7}, Lx8g;-><init>(Lvl6;B)V

    new-instance v4, Lx8g;

    invoke-direct {v4, v0, v5}, Lx8g;-><init>(Lvl6;B)V

    new-instance v0, Lgkj;

    invoke-direct {v0, v7, v7}, Lnz0;-><init>(ZZ)V

    iput-object v6, v0, Lgkj;->a:Ljava/lang/String;

    iput-object v6, v0, Lgkj;->b:Ljava/lang/String;

    iput-object v6, v0, Lgkj;->c:Ljava/lang/String;

    iput-object v6, v0, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v6, v0, Lgkj;->e:Lekj;

    iput-object v6, v0, Lgkj;->f:Lfkj;

    iput-object v6, v0, Lgkj;->g:Lqp2;

    iput-object v3, v0, Lgkj;->h:Ldkj;

    iput-object v4, v0, Lgkj;->i:Ldkj;

    iput-object v6, v0, Lgkj;->j:Lql;

    const v3, 0x7f14132b

    iput v3, v0, Lgkj;->k:I

    const v3, 0x7f140b4b

    iput v3, v0, Lgkj;->l:I

    const v3, 0x7f14117b

    iput v3, v0, Lgkj;->m:I

    iput-boolean v5, v0, Lgkj;->n:Z

    iput-object v2, v0, Lgkj;->o:Lpxh;

    sget-object v2, Lijm;->b:Lijm;

    invoke-virtual {v1, v0, v2}, Lr22;->b(Ljjm;Lijm;)V

    :cond_de
    return-void

    :pswitch_df
    check-cast v0, Lt6g;

    invoke-virtual {v0}, Lt6g;->h()V

    return-void

    :pswitch_e5
    check-cast v0, Lx5g;

    invoke-virtual {v0, v6}, Lx5g;->a(Lcom/opera/api/Callback;)V

    invoke-virtual {v0}, Lx5g;->c()V

    iget-object v1, v0, Lx5g;->a:Lcom/opera/android/autofill/PasswordManager;

    new-instance v2, Lo8f;

    const/16 v3, 0xd

    invoke-direct {v2, v0, v3}, Lo8f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v2, v0}, LJ/N;->MwwLnzkg(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :pswitch_102
    check-cast v0, Lo16;

    new-instance v1, Lo8f;

    const/16 v2, 0xc

    invoke-direct {v1, v0, v2}, Lo8f;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lcom/opera/android/autofill/PasswordManager;->a(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_10f
    check-cast v0, Lcom/opera/android/autofill/PasswordImporter;

    iget-wide v1, v0, Lcom/opera/android/autofill/PasswordImporter;->c:J

    cmp-long v5, v1, v3

    if-eqz v5, :cond_11c

    invoke-static {v1, v2}, LJ/N;->MZLGJDmT(J)V

    iput-wide v3, v0, Lcom/opera/android/autofill/PasswordImporter;->c:J

    :cond_11c
    return-void

    :pswitch_11d
    check-cast v0, Lqt8;

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iget-object v2, v0, Lqt8;->f:Ljava/lang/Object;

    check-cast v2, Lyv4;

    if-eqz v2, :cond_12c

    iput-object v6, v0, Lqt8;->f:Ljava/lang/Object;

    invoke-virtual {v2, v1}, Lyv4;->d(Ljava/util/List;)V

    :cond_12c
    return-void

    :pswitch_12d
    check-cast v0, Lmyf;

    invoke-virtual {v0}, Lmyf;->d()V

    return-void

    :pswitch_133
    check-cast v0, Lgyf;

    invoke-virtual {v0}, Lgyf;->a()V

    return-void

    :pswitch_139
    check-cast v0, Lkwf;

    invoke-virtual {v0}, Lo73;->b()Z

    return-void

    :pswitch_13f
    check-cast v0, Lzsf;

    iget-object v1, v0, Lzsf;->i:Ljava/lang/Object;

    monitor-enter v1

    :try_start_144
    invoke-virtual {v0, v7}, Lzsf;->d(Z)V

    monitor-exit v1

    return-void

    :goto_149
    monitor-exit v1
    :try_end_14a
    .catchall {:try_start_144 .. :try_end_14a} :catchall_14b

    throw v0

    :catchall_14b
    move-exception v0

    goto :goto_149

    :pswitch_14d
    check-cast v0, Landroidx/mediarouter/app/OperaMediaRouteButton;

    sget-object v1, Landroidx/mediarouter/app/OperaMediaRouteButton;->p:Lcnf;

    iget-object v1, v0, Landroidx/mediarouter/app/OperaMediaRouteButton;->e:Lr16;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "android.permission.ACCESS_LOCAL_NETWORK"

    invoke-static {v2, v1}, Lfr3;->Q(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_165

    invoke-virtual {v0}, Landroidx/mediarouter/app/OperaMediaRouteButton;->g()Z

    :cond_165
    return-void

    :pswitch_166
    check-cast v0, Ljlf;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v8, v0, Ljlf;->b:Ljava/lang/Object;

    monitor-enter v8

    :try_start_170
    iget-object v2, v0, Ljlf;->c:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :catch_184
    :cond_184
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1bb

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "failure_"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_184

    invoke-interface {v2, v4, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5
    :try_end_19c
    .catchall {:try_start_170 .. :try_end_19c} :catchall_1d5

    if-eqz v5, :cond_184

    const/16 v6, 0x8

    :try_start_1a0
    invoke-virtual {v4, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_1b5

    sget-object v4, Lng0;->a:Lng0;
    :try_end_1ac
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1a0 .. :try_end_1ac} :catch_184
    .catchall {:try_start_1a0 .. :try_end_1ac} :catchall_1d5

    :goto_1ac
    add-int/lit8 v6, v5, -0x1

    if-lez v5, :cond_184

    :try_start_1b0
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1b3
    .catchall {:try_start_1b0 .. :try_end_1b3} :catchall_1d5

    move v5, v6

    goto :goto_1ac

    :cond_1b5
    :try_start_1b5
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4
    :try_end_1bb
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1b5 .. :try_end_1bb} :catch_184
    .catchall {:try_start_1b5 .. :try_end_1bb} :catchall_1d5

    :cond_1bb
    :try_start_1bb
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    monitor-exit v8
    :try_end_1c7
    .catchall {:try_start_1bb .. :try_end_1c7} :catchall_1d5

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_1d2

    iget-object v0, v0, Ljlf;->a:Lhz;

    invoke-virtual {v0, v1}, Lhz;->run(Ljava/lang/Object;)V

    :cond_1d2
    return-void

    :goto_1d3
    :try_start_1d3
    monitor-exit v8
    :try_end_1d4
    .catchall {:try_start_1d3 .. :try_end_1d4} :catchall_1d5

    throw v0

    :catchall_1d5
    move-exception v0

    goto :goto_1d3

    :pswitch_1d7
    check-cast v0, Lrth;

    :try_start_1d9
    new-instance v1, Les9;

    iget-object v8, v0, Lrth;->f:Landroid/os/Bundle;

    const-string v9, "from"

    invoke-virtual {v8, v9}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Landroid/content/Intent;

    invoke-direct {v9}, Landroid/content/Intent;-><init>()V

    iget-object v0, v0, Lrth;->f:Landroid/os/Bundle;

    invoke-virtual {v9, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    invoke-virtual {v9}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    invoke-direct {v1, v8, v0}, Les9;-><init>(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object v8, v1, Les9;->a:Ljava/lang/String;

    iget-object v9, v1, Les9;->b:Ljava/lang/String;
    :try_end_1f8
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1d9 .. :try_end_1f8} :catch_3ff

    sget-object v10, Le7d;->a:Ljava/lang/Object;

    monitor-enter v10

    :try_start_1fb
    sget v0, Le7d;->b:I

    monitor-exit v10
    :try_end_1fe
    .catchall {:try_start_1fb .. :try_end_1fe} :catchall_3fd

    if-ne v0, v2, :cond_203

    move v10, v7

    goto/16 :goto_2b4

    :cond_203
    invoke-static {v9, v8}, Lsko;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lwyh;->I(Ljava/lang/String;)Z

    move-result v10

    iget-object v11, v1, Les9;->f:Ljava/lang/String;

    if-eqz v11, :cond_221

    const-string v12, "normal"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_221

    const-string v12, "high"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_221

    move v11, v5

    goto :goto_222

    :cond_221
    move v11, v7

    :goto_222
    if-eqz v10, :cond_228

    if-nez v11, :cond_228

    move v10, v5

    goto :goto_229

    :cond_228
    move v10, v7

    :goto_229
    if-eqz v10, :cond_2b4

    sget-object v11, Lt8;->a:Landroid/content/Context;

    const-string v12, "org.chromium.components.gcm_driver.lazy_subscriptions"

    invoke-virtual {v11, v12, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v11

    const-string v12, "[]"

    invoke-interface {v11, v0, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    :try_start_239
    new-instance v13, Lorg/json/JSONArray;

    invoke-direct {v13, v12}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    iget-object v12, v1, Les9;->d:Ljava/lang/String;

    if-eqz v12, :cond_26b

    new-instance v14, Lorg/json/JSONArray;

    invoke-direct {v14}, Lorg/json/JSONArray;-><init>()V

    move v15, v7

    :goto_248
    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v15, v3, :cond_26a

    invoke-virtual {v13, v15}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "collapseKey"

    invoke-virtual {v3, v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_264

    const-string v4, "senderId"

    invoke-virtual {v3, v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_267

    :cond_264
    invoke-virtual {v14, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :goto_267
    add-int/lit8 v15, v15, 0x1

    goto :goto_248

    :cond_26a
    move-object v13, v14

    :cond_26b
    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ne v3, v2, :cond_28d

    invoke-virtual {v13, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "senderId"

    invoke-virtual {v3, v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    move v4, v5

    :goto_280
    if-ge v4, v2, :cond_28c

    invoke-virtual {v13, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v3, v12}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v4, v4, 0x1

    goto :goto_280

    :cond_28c
    move-object v13, v3

    :cond_28d
    new-instance v2, Li06;

    const/16 v3, 0xb

    invoke-direct {v2, v3}, Li06;-><init>(B)V

    invoke-virtual {v1, v2}, Les9;->b(Lds9;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/JSONObject;

    invoke-virtual {v13, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    invoke-interface {v11}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-virtual {v13}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v0, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {v0, v5}, Lwyh;->X(Ljava/lang/String;Z)V
    :try_end_2af
    .catch Lorg/json/JSONException; {:try_start_239 .. :try_end_2af} :catch_2b0

    goto :goto_2b4

    :catch_2b0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    :cond_2b4
    :goto_2b4
    if-nez v10, :cond_3ff

    iget-object v0, v1, Les9;->f:Ljava/lang/String;

    if-eqz v0, :cond_30f

    const-string v2, "normal"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_30f

    const-string v2, "high"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30f

    invoke-static {v9, v8}, Lsko;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Ltgk;->l()Ltgk;

    move-result-object v2

    :try_start_2d2
    sget-object v3, Lt8;->a:Landroid/content/Context;

    const-string v4, "org.chromium.components.gcm_driver.subscription_flags"

    invoke-virtual {v3, v4, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3, v0, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0
    :try_end_2de
    .catchall {:try_start_2d2 .. :try_end_2de} :catchall_304

    const/4 v3, 0x2

    and-int/2addr v0, v3

    if-ne v0, v3, :cond_2e3

    move v7, v5

    :cond_2e3
    invoke-virtual {v2}, Ltgk;->close()V

    if-eqz v7, :cond_30f

    :try_start_2e8
    sget-object v0, Lt8;->a:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/opera/android/pushmessaging/GCMBackgroundService;

    invoke-direct {v2, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance v3, Lhv5;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v1, v3}, Les9;->b(Lds9;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Bundle;

    invoke-virtual {v2, v3}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    invoke-virtual {v0, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_302
    .catch Ljava/lang/IllegalStateException; {:try_start_2e8 .. :try_end_302} :catch_30f

    goto/16 :goto_3ff

    :catchall_304
    move-exception v0

    move-object v1, v0

    :try_start_306
    invoke-virtual {v2}, Ltgk;->close()V
    :try_end_309
    .catchall {:try_start_306 .. :try_end_309} :catchall_30a

    goto :goto_30e

    :catchall_30a
    move-exception v0

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_30e
    throw v1

    :catch_30f
    :cond_30f
    new-instance v0, Lhv5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v1, v0}, Les9;->b(Lds9;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    new-instance v1, Landroid/os/PersistableBundle;

    invoke-direct {v1}, Landroid/os/PersistableBundle;-><init>()V

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v0}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_32c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3bc

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v4}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_342

    invoke-virtual {v1, v4, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_32c

    :cond_342
    instance-of v8, v7, Ljava/lang/Boolean;

    if-eqz v8, :cond_350

    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    invoke-virtual {v1, v4, v7}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_32c

    :cond_350
    instance-of v8, v7, [Z

    if-eqz v8, :cond_35a

    check-cast v7, [Z

    invoke-virtual {v1, v4, v7}, Landroid/os/BaseBundle;->putBooleanArray(Ljava/lang/String;[Z)V

    goto :goto_32c

    :cond_35a
    instance-of v8, v7, Ljava/lang/Double;

    if-eqz v8, :cond_368

    check-cast v7, Ljava/lang/Double;

    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v7

    invoke-virtual {v1, v4, v7, v8}, Landroid/os/BaseBundle;->putDouble(Ljava/lang/String;D)V

    goto :goto_32c

    :cond_368
    instance-of v8, v7, [D

    if-eqz v8, :cond_372

    check-cast v7, [D

    invoke-virtual {v1, v4, v7}, Landroid/os/BaseBundle;->putDoubleArray(Ljava/lang/String;[D)V

    goto :goto_32c

    :cond_372
    instance-of v8, v7, Ljava/lang/Integer;

    if-eqz v8, :cond_380

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {v1, v4, v7}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    goto :goto_32c

    :cond_380
    instance-of v8, v7, [I

    if-eqz v8, :cond_38a

    check-cast v7, [I

    invoke-virtual {v1, v4, v7}, Landroid/os/BaseBundle;->putIntArray(Ljava/lang/String;[I)V

    goto :goto_32c

    :cond_38a
    instance-of v8, v7, Ljava/lang/Long;

    if-eqz v8, :cond_398

    check-cast v7, Ljava/lang/Long;

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-virtual {v1, v4, v7, v8}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    goto :goto_32c

    :cond_398
    instance-of v8, v7, [J

    if-eqz v8, :cond_3a2

    check-cast v7, [J

    invoke-virtual {v1, v4, v7}, Landroid/os/BaseBundle;->putLongArray(Ljava/lang/String;[J)V

    goto :goto_32c

    :cond_3a2
    instance-of v8, v7, Ljava/lang/String;

    if-eqz v8, :cond_3ac

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v1, v4, v7}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_32c

    :cond_3ac
    instance-of v8, v7, [Ljava/lang/String;

    if-eqz v8, :cond_3b7

    check-cast v7, [Ljava/lang/String;

    invoke-virtual {v1, v4, v7}, Landroid/os/BaseBundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    goto/16 :goto_32c

    :cond_3b7
    invoke-virtual {v2, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto/16 :goto_32c

    :cond_3bc
    invoke-virtual {v2}, Ljava/util/HashSet;->size()I

    move-result v0

    if-lez v0, :cond_3d3

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3c6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3d3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    goto :goto_3c6

    :cond_3d3
    new-instance v0, Lwcl;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v2, 0x0

    iput-wide v2, v0, Lwcl;->b:J

    iput-boolean v5, v0, Lwcl;->d:Z

    new-instance v2, Lorg/chromium/components/background_task_scheduler/b;

    invoke-direct {v2, v0}, Lorg/chromium/components/background_task_scheduler/b;-><init>(Lwcl;)V

    new-instance v0, Lorg/chromium/components/background_task_scheduler/a;

    invoke-direct {v0, v5, v2}, Lorg/chromium/components/background_task_scheduler/a;-><init>(ILorg/chromium/components/background_task_scheduler/TaskInfo$TimingInfo;)V

    iput-object v1, v0, Lorg/chromium/components/background_task_scheduler/a;->b:Landroid/os/PersistableBundle;

    new-instance v1, Lorg/chromium/components/background_task_scheduler/TaskInfo;

    invoke-direct {v1, v0}, Lorg/chromium/components/background_task_scheduler/TaskInfo;-><init>(Lorg/chromium/components/background_task_scheduler/a;)V

    invoke-static {}, Lp37;->J()Lt03;

    move-result-object v0

    sget-object v2, Lt8;->a:Landroid/content/Context;

    check-cast v0, Lu03;

    invoke-virtual {v0, v2, v1}, Lu03;->b(Landroid/content/Context;Lorg/chromium/components/background_task_scheduler/TaskInfo;)Z

    goto :goto_3ff

    :goto_3fb
    :try_start_3fb
    monitor-exit v10
    :try_end_3fc
    .catchall {:try_start_3fb .. :try_end_3fc} :catchall_3fd

    throw v0

    :catchall_3fd
    move-exception v0

    goto :goto_3fb

    :catch_3ff
    :cond_3ff
    :goto_3ff
    return-void

    :pswitch_400
    check-cast v0, Lukf;

    invoke-virtual {v0}, Lukf;->c()V

    return-void

    :pswitch_406
    check-cast v0, Lcom/opera/android/custom_views/OperaEditText;

    sget v1, Lcom/opera/android/custom_views/OperaEditText;->r:I

    invoke-virtual {v0}, Landroid/view/View;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_41f

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_41f

    sget-object v1, Lq9n;->c:Ll5b;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lq9n;->G(Landroid/content/Context;Landroid/view/View;)Z

    :cond_41f
    return-void

    :pswitch_420
    check-cast v0, Lcom/opera/android/browser/OperaDownloadManagerDelegate$TargetCallback;

    const-string v1, ""

    iget-wide v2, v0, Lcom/opera/android/browser/OperaDownloadManagerDelegate$TargetCallback;->a:J

    invoke-static {v0, v2, v3, v1}, LJ/N;->MkE07MDU(Ljava/lang/Object;JLjava/lang/Object;)V

    return-void

    :pswitch_42a
    check-cast v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    sget v1, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    invoke-virtual {v0, v6}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->t(Landroid/os/Bundle;)V

    return-void

    :pswitch_432
    move-object v1, v0

    check-cast v1, Lrn;

    sget-boolean v0, Loo8;->r:Z

    if-eqz v0, :cond_44d

    iget-object v0, v1, Lrn;->l:Ljava/lang/Object;

    check-cast v0, Loo8;

    const-string v2, "ads provider not available"

    iget-object v0, v0, Lbqi;->g:Ljava/lang/String;

    invoke-static {v2, v0}, Lbqi;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x0

    invoke-virtual/range {v1 .. v6}, Lk43;->b(ZLjava/lang/String;ZLv50;Ljava/lang/Long;)V

    goto :goto_450

    :cond_44d
    invoke-virtual {v1}, Lrn;->g()V

    :goto_450
    return-void

    :pswitch_451
    check-cast v0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;

    iput-object v6, v0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->c:Loml;

    iget-wide v3, v0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->e:J

    const-wide/16 v8, 0x0

    cmp-long v1, v3, v8

    if-eqz v1, :cond_462

    invoke-static {v3, v4}, LJ/N;->M0DYcGoV(J)V

    iput-wide v8, v0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->e:J

    :cond_462
    iget-object v1, v0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->c:Loml;

    if-eqz v1, :cond_46b

    invoke-virtual {v1, v7}, Loml;->cancel(Z)Z

    iput-object v6, v0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->c:Loml;

    :cond_46b
    iget v1, v0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->d:I

    add-int/2addr v1, v5

    iput v1, v0, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->d:I

    if-ge v1, v2, :cond_475

    invoke-virtual {v0}, Lcom/opera/android/settings/cleardata/OnboardingProfileReset$Request;->a()V

    :cond_475
    return-void

    :pswitch_data_476
    .packed-switch 0x0
        :pswitch_451
        :pswitch_432
        :pswitch_42a
        :pswitch_420
        :pswitch_406
        :pswitch_400
        :pswitch_1d7
        :pswitch_166
        :pswitch_14d
        :pswitch_13f
        :pswitch_139
        :pswitch_133
        :pswitch_12d
        :pswitch_11d
        :pswitch_10f
        :pswitch_102
        :pswitch_e5
        :pswitch_df
        :pswitch_8d
        :pswitch_7e
        :pswitch_78
        :pswitch_72
        :pswitch_6c
        :pswitch_40
        :pswitch_33
        :pswitch_2d
        :pswitch_23
        :pswitch_1b
        :pswitch_15
    .end packed-switch
.end method
