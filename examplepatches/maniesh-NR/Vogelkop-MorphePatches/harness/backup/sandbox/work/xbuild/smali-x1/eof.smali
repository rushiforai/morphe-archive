.class public final synthetic Leof;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lhu5;Lp3g;Lr3g;)V
    .registers 4

    .line 12
    const/4 p2, 0x4

    iput-byte p2, p0, Leof;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Leof;->b:Ljava/lang/Object;

    iput-object p3, p0, Leof;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 13
    iput-byte p3, p0, Leof;->a:B

    iput-object p1, p0, Leof;->b:Ljava/lang/Object;

    iput-object p2, p0, Leof;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lrmh;Ljava/util/ArrayList;Lcom/opera/api/Callback;)V
    .registers 4

    const/16 p1, 0xe

    iput-byte p1, p0, Leof;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Leof;->b:Ljava/lang/Object;

    iput-object p3, p0, Leof;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 27

    move-object/from16 v0, p0

    iget-byte v1, v0, Leof;->a:B

    sget-object v2, Lijm;->b:Lijm;

    const/4 v3, 0x3

    const-wide/16 v4, 0x0

    sget-object v6, Lek8;->a:Lek8;

    const/4 v7, 0x2

    const/4 v8, -0x1

    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    iget-object v12, v0, Leof;->c:Ljava/lang/Object;

    iget-object v0, v0, Leof;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_70a

    check-cast v0, Lmyk;

    check-cast v12, Lcom/opera/api/Callback;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Long;

    if-eqz v1, :cond_3f

    iget-object v0, v0, Lmyk;->j:Lr72;

    if-eqz v0, :cond_3f

    iget-object v2, v0, Lr72;->c:Ljava/lang/Object;

    check-cast v2, Lih4;

    if-nez v2, :cond_3d

    iget-object v2, v0, Lr72;->b:Ljava/lang/Object;

    check-cast v2, Lq65;

    iget-object v0, v0, Lr72;->d:Ljava/lang/Object;

    check-cast v0, Lmyk;

    iget-object v0, v0, Lmyk;->d:Lumi;

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v4, 0x2

    invoke-virtual {v2, v0, v4, v5, v3}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    goto :goto_3f

    :cond_3d
    iput-byte v7, v0, Lr72;->a:B

    :cond_3f
    :goto_3f
    invoke-interface {v12, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_43
    check-cast v0, Ldyk;

    check-cast v12, Lfpf;

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/drawable/Drawable;

    iget-object v0, v0, Ldyk;->n:Lode;

    new-instance v2, Lbyk;

    iget-object v3, v12, Lfpf;->b:Ljava/lang/String;

    iget-object v4, v12, Lfpf;->c:Ljava/lang/String;

    invoke-direct {v2, v3, v4, v1}, Lbyk;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v2}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_5a
    check-cast v0, Lxbf;

    check-cast v12, Ljava/util/List;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iget-object v2, v0, Lxbf;->e:Ljava/lang/Object;

    check-cast v2, Lumi;

    iget-object v3, v0, Lxbf;->d:Ljava/lang/Object;

    check-cast v3, Lglh;

    invoke-virtual {v3}, Lglh;->e()Z

    move-result v3

    if-eqz v3, :cond_74

    sput-object v11, Lxbf;->h:Lxbf;

    goto/16 :goto_18b

    :cond_74
    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    move-result v3

    const-string v4, ".mhtml"

    const-string v5, "file"

    if-eqz v3, :cond_c3

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_82
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_ad

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lilh;

    iget-object v6, v3, Lilh;->f:Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_82

    iget-object v3, v3, Lilh;->f:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_82

    invoke-virtual {v3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_82

    goto :goto_b3

    :cond_ad
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_b4

    :goto_b3
    move v9, v10

    :cond_b4
    sput-object v11, Lxbf;->h:Lxbf;

    if-eqz v9, :cond_18b

    iget-object v0, v0, Lxbf;->g:Ljava/lang/Object;

    check-cast v0, Lpjg;

    if-eqz v0, :cond_18b

    invoke-virtual {v0}, Lpjg;->run()V

    goto/16 :goto_18b

    :cond_c3
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3, v12}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move-object v8, v11

    :goto_d7
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_15c

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lilh;

    iget-object v9, v9, Lilh;->f:Ljava/lang/String;

    invoke-virtual {v9, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_ef

    invoke-interface {v7}, Ljava/util/Iterator;->remove()V

    goto :goto_d7

    :cond_ef
    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    invoke-virtual {v10}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v13

    if-nez v13, :cond_102

    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v10}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v10

    :cond_102
    invoke-virtual {v3, v10}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_10c

    invoke-interface {v7}, Ljava/util/Iterator;->remove()V

    goto :goto_d7

    :cond_10c
    invoke-virtual {v10}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_157

    if-nez v8, :cond_145

    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_121
    :goto_121
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_145

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/net/Uri;

    invoke-virtual {v13}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_121

    iget-object v14, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v14, Landroid/content/Context;

    invoke-static {v14, v13}, Lv61;->d(Landroid/content/Context;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v14

    if-eqz v14, :cond_121

    invoke-virtual {v8, v14, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_121

    :cond_145
    invoke-virtual {v8, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/net/Uri;

    if-eqz v9, :cond_157

    invoke-virtual {v3, v9}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_157

    invoke-interface {v7}, Ljava/util/Iterator;->remove()V

    goto :goto_d7

    :cond_157
    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_d7

    :cond_15c
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_188

    iget-object v4, v0, Lxbf;->f:Ljava/lang/Object;

    check-cast v4, Lqie;

    new-instance v5, Ljbd;

    const/16 v7, 0x16

    invoke-direct {v5, v0, v6, v1, v7}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v2, v5}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v1

    new-instance v5, Ljbd;

    const/16 v7, 0x17

    invoke-direct {v5, v0, v3, v6, v7}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v2, v5}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    invoke-virtual {v1, v0}, Lnml;->b(Lnml;)V

    new-instance v0, Loml;

    invoke-direct {v0, v1}, Loml;-><init>(Lnml;)V

    invoke-virtual {v4, v0, v11}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    goto :goto_18b

    :cond_188
    invoke-virtual {v0, v6, v3}, Lxbf;->e(Ljava/util/ArrayList;Ljava/util/HashSet;)V

    :cond_18b
    :goto_18b
    return-void

    :pswitch_18c
    check-cast v0, Ldxk;

    check-cast v12, Lhu5;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1ae

    new-instance v1, Laxk;

    new-instance v2, Lqlk;

    const/16 v3, 0xb

    invoke-direct {v2, v12, v3}, Lqlk;-><init>(Ljava/lang/Object;B)V

    iget-object v3, v0, Ldxk;->h:Lumi;

    iget-object v4, v0, Ldxk;->d:Lzwk;

    invoke-direct {v1, v2, v3, v4}, Laxk;-><init>(Lqlk;Lumi;Lzwk;)V

    invoke-virtual {v0}, Ldxk;->R()V

    goto :goto_1b3

    :cond_1ae
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v12, v0}, Lhu5;->run(Ljava/lang/Object;)V

    :goto_1b3
    return-void

    :pswitch_1b4
    check-cast v0, Lxbf;

    check-cast v12, Lcom/opera/api/Callback;

    move-object/from16 v1, p1

    check-cast v1, Lcom/opera/android/oauth2/OperaAccessToken;

    iput-object v1, v0, Lxbf;->f:Ljava/lang/Object;

    if-eqz v1, :cond_1c6

    iget-object v0, v1, Lcom/opera/android/oauth2/OperaAccessToken;->a:Ljava/lang/String;

    invoke-interface {v12, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_1c9

    :cond_1c6
    invoke-interface {v12, v11}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :goto_1c9
    return-void

    :pswitch_1ca
    check-cast v0, Ltmk;

    check-cast v12, Leof;

    move-object/from16 v1, p1

    check-cast v1, Lfk8;

    instance-of v2, v1, Ldk8;

    if-nez v2, :cond_1fc

    invoke-static {v1, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_200

    iget-object v2, v0, Ltmk;->a:Lmcj;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-object v2, v2, Lmcj;->a:Ljava/lang/Object;

    check-cast v2, Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v5, "last_extend_response"

    invoke-interface {v2, v5, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {v0}, Ltmk;->l()V

    :cond_1fc
    invoke-virtual {v12, v1}, Leof;->run(Ljava/lang/Object;)V

    goto :goto_203

    :cond_200
    invoke-static {}, Lh9o;->p()V

    :goto_203
    return-void

    :pswitch_204
    check-cast v0, Lslk;

    check-cast v12, Lo8f;

    move-object/from16 v1, p1

    check-cast v1, Lh0d;

    iget-object v0, v0, Lslk;->c:Lpy9;

    invoke-virtual {v0}, Lpy9;->f()Lqtg;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-object v3, v0, Lpy9;->a:Lmcj;

    iget-object v3, v3, Lmcj;->a:Ljava/lang/Object;

    check-cast v3, Lb59;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    const-string v8, "last_eligibility_check"

    invoke-interface {v3, v8, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    sub-long/2addr v6, v3

    sget-wide v3, Lpy9;->h:J

    invoke-static {v3, v4}, Lpn7;->f(J)J

    move-result-wide v3

    cmp-long v3, v6, v3

    if-gez v3, :cond_234

    move v9, v10

    :cond_234
    iget v3, v2, Lqtg;->a:I

    if-nez v3, :cond_247

    if-eqz v9, :cond_247

    new-instance v2, Lhu5;

    const/16 v3, 0x12

    invoke-direct {v2, v12, v0, v3}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const-string v3, "DEFAULT"

    invoke-virtual {v0, v1, v3, v2}, Lpy9;->b(Lh0d;Ljava/lang/String;Lcom/opera/api/Callback;)V

    goto :goto_24a

    :cond_247
    invoke-virtual {v12, v2}, Lo8f;->run(Ljava/lang/Object;)V

    :goto_24a
    return-void

    :pswitch_24b
    check-cast v0, Lslk;

    check-cast v12, Lzzh;

    move-object/from16 v1, p1

    check-cast v1, Lfk8;

    instance-of v2, v1, Ldk8;

    if-eqz v2, :cond_266

    check-cast v1, Ldk8;

    iget-boolean v1, v1, Ldk8;->a:Z

    if-nez v1, :cond_260

    invoke-virtual {v0, v11}, Lslk;->b(Ljava/lang/Runnable;)V

    :cond_260
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v12, v0}, Lzzh;->run(Ljava/lang/Object;)V

    goto :goto_278

    :cond_266
    invoke-static {v1, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_275

    invoke-virtual {v0, v11}, Lslk;->b(Ljava/lang/Runnable;)V

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v12, v0}, Lzzh;->run(Ljava/lang/Object;)V

    goto :goto_278

    :cond_275
    invoke-static {}, Lh9o;->p()V

    :goto_278
    return-void

    :pswitch_279
    check-cast v0, Ln9c;

    check-cast v12, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Lsb;

    iput-object v11, v0, Ln9c;->p:Ljava/lang/Object;

    if-nez v1, :cond_287

    move v1, v8

    goto :goto_28f

    :cond_287
    sget-object v2, Lalk;->a:[I

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v1, v2, v1

    :goto_28f
    if-eq v1, v8, :cond_2b8

    if-eq v1, v9, :cond_2b8

    if-eq v1, v7, :cond_29b

    if-eq v1, v3, :cond_2b8

    invoke-static {}, Lh9o;->p()V

    goto :goto_2b8

    :cond_29b
    iget-object v1, v0, Ln9c;->o:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/account/push/AccountPushManager;

    if-nez v12, :cond_2ab

    iget-wide v0, v1, Lcom/opera/android/account/push/AccountPushManager;->d:J

    cmp-long v2, v0, v4

    if-eqz v2, :cond_2b8

    invoke-static {v0, v1, v10}, LJ/N;->MpOIiOCJ(JI)V

    goto :goto_2b8

    :cond_2ab
    iget-object v0, v0, Lc59;->c:Lj59;

    iget-object v0, v0, Lj59;->h:Ljava/lang/String;

    iget-wide v1, v1, Lcom/opera/android/account/push/AccountPushManager;->d:J

    cmp-long v3, v1, v4

    if-eqz v3, :cond_2b8

    invoke-static {v1, v2, v10, v0, v12}, LJ/N;->MePl_s5l(JILjava/lang/Object;Ljava/lang/Object;)V

    :cond_2b8
    :goto_2b8
    return-void

    :pswitch_2b9
    check-cast v0, Lh5k;

    check-cast v12, Li5k;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    iget-object v2, v12, Li5k;->a:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v3, v0, Lh5k;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/HashSet;

    iget-object v4, v0, Lh5k;->b:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashMap;

    if-eqz v1, :cond_2ed

    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    if-eqz v1, :cond_2e9

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2e9

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Li5k;

    invoke-virtual {v0, v1}, Lh5k;->i(Li5k;)V

    goto :goto_30a

    :cond_2e9
    invoke-virtual {v3, v2}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_30a

    :cond_2ed
    invoke-virtual {v3, v2}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v4, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_30a

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_2fc
    if-ge v10, v1, :cond_30a

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v10, v10, 0x1

    check-cast v2, Li5k;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_2fc

    :cond_30a
    :goto_30a
    return-void

    :pswitch_30b
    check-cast v0, Lo8f;

    check-cast v12, Lw2g;

    move-object/from16 v1, p1

    check-cast v1, Landroid/util/SparseBooleanArray;

    iget-object v2, v12, Lw2g;->b:Ljava/lang/Object;

    check-cast v2, Ll2g;

    iget v2, v2, Ll2g;->a:I

    invoke-virtual {v1, v2}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lo8f;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_325
    check-cast v0, Lkuj;

    check-cast v12, Ltl3;

    move-object/from16 v1, p1

    check-cast v1, Lre7;

    iget-object v0, v0, Lkuj;->A:Ldx3;

    iget-object v0, v0, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lqim;->e:Lysj;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v12, v2}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_33d
    check-cast v0, Lcof;

    iget-object v0, v0, Lcof;->c:Ljava/lang/String;

    check-cast v12, Lg8j;

    move-object/from16 v1, p1

    check-cast v1, Logf;

    if-eqz v1, :cond_361

    new-instance v1, Landroid/content/Intent;

    sget-object v2, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v0, "com.opera.android.extra.DO_NOT_INTERCEPT"

    invoke-virtual {v1, v0, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v0, v12, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_36c

    :cond_361
    sget-object v1, Llqm;->u:Llqm;

    invoke-static {v0, v1, v10}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    iput v3, v0, Lvx3;->b:I

    invoke-static {v0, v9, v0}, Lo18;->t(Lvx3;ZLvx3;)V

    :goto_36c
    return-void

    :pswitch_36d
    check-cast v0, Lawi;

    check-cast v12, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    iget-object v2, v0, Lawi;->u:Lei;

    iget-object v2, v2, Lei;->d:Landroid/view/View;

    check-cast v2, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-static {v12, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3fb

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_3d1

    iget-object v1, v0, Lawi;->u:Lei;

    iget-object v1, v1, Lei;->e:Landroid/view/View;

    check-cast v1, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v1, v10}, Lcom/google/android/material/textfield/TextInputLayout;->q(Z)V

    iget-object v1, v0, Lawi;->u:Lei;

    iget-object v1, v1, Lei;->e:Landroid/view/View;

    check-cast v1, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, v1, Lcom/google/android/material/textfield/TextInputLayout;->c:Lz28;

    invoke-virtual {v1, v8}, Lz28;->h(I)V

    iget-object v1, v0, Lawi;->u:Lei;

    iget-object v1, v1, Lei;->e:Landroid/view/View;

    check-cast v1, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v1, v1, Lcom/google/android/material/textfield/TextInputLayout;->c:Lz28;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f080517

    invoke-static {v3, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget-object v3, v1, Lz28;->a:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v4, v1, Lz28;->f:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v4, v2}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    if-eqz v2, :cond_3c7

    iget-object v2, v1, Lz28;->j:Landroid/content/res/ColorStateList;

    iget-object v5, v1, Lz28;->k:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v3, v4, v2, v5}, Lic4;->k(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)V

    iget-object v1, v1, Lz28;->j:Landroid/content/res/ColorStateList;

    invoke-static {v3, v4, v1}, Lic4;->H(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;)V

    :cond_3c7
    iget-object v0, v0, Lawi;->u:Lei;

    iget-object v0, v0, Lei;->e:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0, v11}, Lcom/google/android/material/textfield/TextInputLayout;->r(Ljava/lang/CharSequence;)V

    goto :goto_3fb

    :cond_3d1
    const v1, 0x7f14069e

    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, Lawi;->u:Lei;

    iget-object v2, v2, Lei;->e:Landroid/view/View;

    check-cast v2, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v2, v2, Lcom/google/android/material/textfield/TextInputLayout;->c:Lz28;

    invoke-virtual {v2, v10}, Lz28;->h(I)V

    iget-object v2, v0, Lawi;->u:Lei;

    iget-object v2, v2, Lei;->e:Landroid/view/View;

    check-cast v2, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v2, v2, Lcom/google/android/material/textfield/TextInputLayout;->c:Lz28;

    iget-object v3, v2, Lz28;->a:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v2, v2, Lz28;->f:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {v2, v11}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, v0, Lawi;->u:Lei;

    iget-object v0, v0, Lei;->e:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    :cond_3fb
    :goto_3fb
    return-void

    :pswitch_3fc
    check-cast v0, Lvqi;

    check-cast v12, Ls4f;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iget-object v0, v0, Lvqi;->f:Lode;

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {v12}, Ls4f;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_40d
    check-cast v0, Ljava/util/ArrayList;

    check-cast v12, Lcom/opera/api/Callback;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_42f

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :cond_41f
    if-ge v10, v1, :cond_436

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v10, v10, 0x1

    check-cast v2, Lan8;

    instance-of v3, v2, Lofh;

    if-eqz v3, :cond_41f

    move-object v11, v2

    goto :goto_436

    :cond_42f
    invoke-interface {v1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Lwcj;

    :cond_436
    :goto_436
    if-eqz v11, :cond_43b

    invoke-interface {v12, v11}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_43b
    return-void

    :pswitch_43c
    check-cast v0, Landroid/content/Context;

    check-cast v12, Liu2;

    move-object/from16 v1, p1

    check-cast v1, Lilh;

    if-eqz v1, :cond_451

    const v2, 0x7f140bb4

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lolh;->b(Lilh;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    :cond_451
    invoke-virtual {v12, v11}, Liu2;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_455
    check-cast v0, Lolh;

    check-cast v12, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/Bitmap;

    if-eqz v1, :cond_478

    iget-object v0, v0, Lolh;->a:Lglh;

    iget-object v2, v0, Lglh;->d:Lqie;

    iget-object v3, v0, Lglh;->c:Lumi;

    new-instance v4, Ljbd;

    const/16 v5, 0xe

    invoke-direct {v4, v0, v12, v1, v5}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v3, v4}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v1, Loml;

    invoke-direct {v1, v0}, Loml;-><init>(Lnml;)V

    invoke-virtual {v2, v1, v11}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    :cond_478
    return-void

    :pswitch_479
    check-cast v0, Lnlh;

    check-cast v12, Lilh;

    move-object/from16 v5, p1

    check-cast v5, Ljava/lang/String;

    iget-object v2, v0, Lnlh;->D:Lglh;

    iget-wide v3, v12, Lilh;->a:J

    iget-object v0, v2, Lglh;->d:Lqie;

    iget-object v7, v2, Lglh;->c:Lumi;

    new-instance v1, Lelh;

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Lelh;-><init>(Lglh;JLjava/lang/String;B)V

    invoke-interface {v7, v1}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v1

    new-instance v5, Loi2;

    const/4 v6, 0x7

    invoke-direct {v5, v2, v3, v4, v6}, Loi2;-><init>(Ljava/lang/Object;JB)V

    invoke-interface {v7, v5}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v2

    invoke-virtual {v1, v2}, Lnml;->b(Lnml;)V

    new-instance v2, Loml;

    invoke-direct {v2, v1}, Loml;-><init>(Lnml;)V

    invoke-virtual {v0, v2, v11}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void

    :pswitch_4a9
    check-cast v0, Lalh;

    check-cast v12, Lilh;

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/Bitmap;

    if-nez v1, :cond_4cc

    iput-object v11, v0, Lalh;->k:Lp8i;

    iget-object v1, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, v12, Lilh;->b:Ljava/lang/String;

    sget v1, Lvmj;->g:I

    const/4 v6, 0x0

    const/16 v7, 0x3c

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v2 .. v7}, Ltmj;->m(Landroid/content/Context;Ljava/lang/String;IILna5;I)Lvmj;

    move-result-object v1

    invoke-virtual {v0, v1}, Lyzi;->b0(Landroid/graphics/drawable/Drawable;)V

    goto :goto_505

    :cond_4cc
    iget-object v2, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/high16 v3, 0x42200000    # 40.0f

    invoke-static {v3, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    iget-object v3, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const/high16 v4, 0x41a00000    # 20.0f

    invoke-static {v4, v3}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v3

    iget-object v4, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    sget-object v5, Ls8i;->d:Landroid/view/animation/PathInterpolator;

    new-instance v5, Lp8i;

    invoke-direct {v5, v2, v3, v4, v1}, Lp8i;-><init>(IILandroid/content/Context;Landroid/graphics/Bitmap;)V

    iput-object v5, v0, Lalh;->k:Lp8i;

    iget-object v1, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lf03;->s(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v5, v1}, Lp8i;->a(I)V

    iget-object v1, v0, Lalh;->k:Lp8i;

    invoke-virtual {v0, v1}, Lyzi;->b0(Landroid/graphics/drawable/Drawable;)V

    :goto_505
    return-void

    :pswitch_506
    check-cast v0, Lo2g;

    check-cast v12, Lwvg;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_54e

    iget-object v1, v12, Lwvg;->j:Ljava/lang/String;

    if-eqz v1, :cond_54e

    iget-object v3, v0, Lo2g;->d:Ljava/lang/Object;

    check-cast v3, Lni6;

    iget-object v4, v12, Lwvg;->a:Ljava/lang/String;

    iget-object v3, v3, Lni6;->a:Lb59;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    invoke-static {v3, v4, v1}, Lcom/appsflyer/internal/j;->c(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v0, Lo2g;->b:Ljava/lang/Object;

    check-cast v0, Li3j;

    iget-object v1, v0, Li3j;->b:Ljava/lang/Object;

    check-cast v1, Lz77;

    new-instance v3, Loxg;

    iget-object v4, v0, Li3j;->a:Ljava/lang/Object;

    check-cast v4, Lc61;

    iget-object v5, v0, Li3j;->d:Ljava/lang/Object;

    check-cast v5, Lx5f;

    iget-object v0, v0, Li3j;->c:Ljava/lang/Object;

    check-cast v0, Lcxc;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbxc;

    invoke-direct {v3, v12, v4, v5, v0}, Loxg;-><init>(Lwvg;Lc61;Lx5f;Lbxc;)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v3, v2}, Lr22;->b(Ljjm;Lijm;)V

    :cond_54e
    return-void

    :pswitch_54f
    check-cast v0, Lcvg;

    check-cast v12, Ljava/lang/Runnable;

    move-object/from16 v1, p1

    check-cast v1, Landroid/os/Bundle;

    const-string v2, "result_code"

    invoke-virtual {v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result v1

    if-ne v1, v8, :cond_56f

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v1

    invoke-virtual {v1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v1

    new-instance v2, Lob;

    invoke-direct {v2, v0, v12}, Lob;-><init>(Lcvg;Ljava/lang/Runnable;)V

    invoke-virtual {v1, v2}, Ltcc;->a(Lmdc;)V

    :cond_56f
    return-void

    :pswitch_570
    check-cast v0, Lf9g;

    check-cast v12, Lkag;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_581

    invoke-virtual {v0, v12}, Lf9g;->a(Lkag;)V

    :cond_581
    return-void

    :pswitch_582
    check-cast v0, Lx5g;

    check-cast v12, Lcom/opera/api/Callback;

    move-object/from16 v1, p1

    check-cast v1, La4g;

    iget-object v2, v0, Lx5g;->e:La4g;

    if-eqz v2, :cond_591

    invoke-virtual {v2}, La4g;->a()V

    :cond_591
    iput-object v1, v0, Lx5g;->e:La4g;

    iget-object v0, v0, Lx5g;->b:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_599
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5a9

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lw5g;

    invoke-interface {v2}, Lw5g;->a()V

    goto :goto_599

    :cond_5a9
    if-eqz v12, :cond_5ae

    invoke-interface {v12, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_5ae
    return-void

    :pswitch_5af
    check-cast v0, Li4d;

    check-cast v12, Ldg7;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    iget-object v0, v0, Li4d;->b:Ljava/lang/Object;

    check-cast v0, Lq4g;

    iget-object v2, v0, Lq4g;->C:Lp4g;

    if-eqz v2, :cond_5c4

    iget-object v3, v0, Lq4g;->v:Lw3g;

    invoke-interface {v2, v3}, Lp4g;->B(Lw3g;)V

    :cond_5c4
    invoke-virtual {v12, v1}, Ldg7;->run(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/w;->U()V

    return-void

    :pswitch_5cf
    check-cast v0, Lhu5;

    check-cast v12, Lr3g;

    move-object/from16 v1, p1

    check-cast v1, La4g;

    iget-object v2, v1, La4g;->a:Ljava/util/List;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5e3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5fd

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lw3g;

    iget-object v4, v4, Lw3g;->f:Ljava/lang/String;

    invoke-interface {v12}, Lr3g;->R0()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5e3

    goto :goto_5fe

    :cond_5fd
    move-object v3, v11

    :goto_5fe
    check-cast v3, Lw3g;

    if-eqz v3, :cond_627

    :try_start_602
    invoke-virtual {v1, v3}, La4g;->c(Lw3g;)Ljava/lang/String;

    move-result-object v9

    new-instance v4, Ln3g;

    iget v2, v3, Lw3g;->a:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, v3, Lw3g;->c:Ljava/lang/String;

    iget-object v7, v3, Lw3g;->g:Ljava/lang/String;

    iget-object v8, v3, Lw3g;->f:Ljava/lang/String;

    iget-boolean v2, v3, Lw3g;->h:Z

    if-nez v2, :cond_622

    iget-boolean v2, v3, Lw3g;->i:Z

    if-nez v2, :cond_622

    iget-object v2, v3, Lw3g;->b:Lorg/chromium/url/GURL;

    iget-object v2, v2, Lorg/chromium/url/GURL;->a:Ljava/lang/String;

    move-object v10, v2

    goto :goto_623

    :cond_622
    move-object v10, v7

    :goto_623
    invoke-direct/range {v4 .. v10}, Ln3g;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object v11, v4

    :cond_627
    invoke-virtual {v0, v11}, Lhu5;->run(Ljava/lang/Object;)V
    :try_end_62a
    .catchall {:try_start_602 .. :try_end_62a} :catchall_62e

    invoke-virtual {v1}, La4g;->a()V

    return-void

    :catchall_62e
    move-exception v0

    invoke-virtual {v1}, La4g;->a()V

    throw v0

    :pswitch_633
    check-cast v0, Lsu;

    check-cast v12, Ls3g;

    move-object/from16 v1, p1

    check-cast v1, La4g;

    iget-object v2, v1, La4g;->a:Ljava/util/List;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_647
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_669

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lw3g;

    iget-object v5, v4, Lw3g;->f:Ljava/lang/String;

    iget-object v6, v12, Ls3g;->a:Ljava/lang/String;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_668

    iget-object v4, v4, Lw3g;->f:Ljava/lang/String;

    iget-object v5, v12, Ls3g;->d:Ljava/lang/String;

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_647

    :cond_668
    move-object v11, v3

    :cond_669
    check-cast v11, Lw3g;

    invoke-virtual {v1}, La4g;->a()V

    if-nez v11, :cond_671

    move v9, v10

    :cond_671
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lsu;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_679
    check-cast v0, Lqt8;

    check-cast v12, Ll2g;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    iget-object v2, v0, Lqt8;->h:Ljava/lang/Object;

    check-cast v2, Lvdf;

    invoke-static {v2}, Lvml;->a(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_6c5

    iget-object v1, v12, Ll2g;->c:Ljava/lang/String;

    sget-object v2, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v1}, Laik;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lwqm;->e:[Ljava/lang/String;

    invoke-static {v1, v2}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Laik;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    iget-object v15, v12, Ll2g;->d:Ljava/lang/String;

    iget-object v1, v12, Ll2g;->b:Ljava/lang/String;

    iget-object v2, v12, Ll2g;->f:Ljava/lang/String;

    iget v3, v12, Ll2g;->a:I

    new-instance v13, Lcom/opera/android/suggestion/Suggestion;

    const/16 v22, 0x0

    const/16 v14, 0x11

    const-string v16, ""

    const/16 v18, 0x0

    const v20, 0x7fffffff

    const/16 v24, 0x0

    move-object/from16 v17, v1

    move-object/from16 v21, v2

    move/from16 v23, v3

    invoke-direct/range {v13 .. v24}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    invoke-static {v13}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    goto :goto_6c7

    :cond_6c5
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_6c7
    iget-object v2, v0, Lqt8;->f:Ljava/lang/Object;

    check-cast v2, Lyv4;

    if-eqz v2, :cond_6d2

    iput-object v11, v0, Lqt8;->f:Ljava/lang/Object;

    invoke-virtual {v2, v1}, Lyv4;->d(Ljava/util/List;)V

    :cond_6d2
    return-void

    :pswitch_6d3
    check-cast v0, Lkwf;

    check-cast v12, Landroid/widget/ImageView;

    move-object/from16 v1, p1

    check-cast v1, Lwcj;

    invoke-virtual {v12}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v1, v2}, Lwcj;->d(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v12, v3}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-static {v12, v3, v10}, Ln1h;->o(Landroid/view/View;Ljava/lang/CharSequence;I)V

    invoke-interface {v1, v2}, Lwcj;->b(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v12, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v12, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    new-instance v2, Ljf7;

    const/16 v3, 0x1d

    invoke-direct {v2, v0, v1, v3}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v12, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_6fe
    check-cast v0, Lcom/leanplum/ActionContext;

    check-cast v12, Lorm;

    move-object/from16 v1, p1

    check-cast v1, Lcom/leanplum/messagetemplates/ResourceWrapper;

    invoke-static {v0, v12, v1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->e(Lcom/leanplum/ActionContext;Lorm;Lcom/leanplum/messagetemplates/ResourceWrapper;)V

    return-void

    :pswitch_data_70a
    .packed-switch 0x0
        :pswitch_6fe
        :pswitch_6d3
        :pswitch_679
        :pswitch_633
        :pswitch_5cf
        :pswitch_5af
        :pswitch_582
        :pswitch_570
        :pswitch_54f
        :pswitch_506
        :pswitch_4a9
        :pswitch_479
        :pswitch_455
        :pswitch_43c
        :pswitch_40d
        :pswitch_3fc
        :pswitch_36d
        :pswitch_33d
        :pswitch_325
        :pswitch_30b
        :pswitch_2b9
        :pswitch_279
        :pswitch_24b
        :pswitch_204
        :pswitch_1ca
        :pswitch_1b4
        :pswitch_18c
        :pswitch_5a
        :pswitch_43
    .end packed-switch
.end method
