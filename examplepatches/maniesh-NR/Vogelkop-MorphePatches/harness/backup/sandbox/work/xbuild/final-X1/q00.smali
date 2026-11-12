.class public Lq00;
.super Lk43;
.source "SourceFile"


# instance fields
.field public final synthetic k:B

.field public final synthetic l:Ls00;


# direct methods
.method public constructor <init>(Ls00;Landroid/app/Activity;Lzy;Ldl;B)V
    .registers 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p5

    iput-byte v2, v0, Lq00;->k:B

    iput-object v1, v0, Lq00;->l:Ls00;

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v3}, Lk43;-><init>(Lbqi;Lzy;Ldl;)V

    iget-object v0, v1, Ls00;->q:Lesk;

    sget-boolean v1, Ls00;->u:Z

    if-nez v1, :cond_1ef

    invoke-static/range {p2 .. p2}, Lhn9;->g(Landroid/app/Activity;)V

    const/4 v1, 0x1

    :try_start_1b
    new-instance v2, Landroid/webkit/WebView;

    move-object/from16 v3, p2

    invoke-direct {v2, v3}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2}, Landroid/webkit/WebView;->destroy()V
    :try_end_25
    .catch Landroid/util/AndroidRuntimeException; {:try_start_1b .. :try_end_25} :catch_1ea

    sput-boolean v1, Lx79;->g:Z

    invoke-static {}, Lw06;->values()[Lw06;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    new-instance v4, Lo00;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Lo00;-><init>(B)V

    invoke-static {v2, v4}, Lsfe;->Q(Ljava/lang/Iterable;Lsrg;)Lzlb;

    move-result-object v2

    const-class v4, Lw06;

    invoke-static {v4}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v4

    invoke-static {v4, v2}, Lsfe;->z(Ljava/util/AbstractCollection;Lzlb;)V

    sget-object v2, Lg1p;->k:Ljava/util/EnumSet;

    invoke-virtual {v2}, Ljava/util/AbstractCollection;->clear()V

    invoke-virtual {v2, v4}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    sget-object v2, Lphf;->a:Lx79;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {}, Lcom/opera/android/browser/obml/Platform;->c()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v7, "PlaceHolder"

    sget-boolean v8, Lx79;->f:Z

    const/4 v9, 0x3

    if-nez v8, :cond_1de

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    iput-object v4, v2, Lx79;->a:Ljava/lang/Object;

    const-string v4, "adxsdk_for_opera_ofa_beta"

    sput-object v4, Lg1p;->c:Ljava/lang/String;

    sput-object v6, Lg1p;->d:Ljava/lang/String;

    sput-object v0, Lg1p;->e:Ljava/lang/String;

    const-string v0, "d746898f0d754d828bdaef0559982a8b"

    sput-object v0, Lg1p;->f:Ljava/lang/String;

    invoke-static {}, Lc0p;->values()[Lc0p;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_82
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_96

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lc0p;

    sget-object v6, Lg1p;->n:Ljava/util/HashMap;

    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v6, v4, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_82

    :cond_96
    const-string v4, "missingUrls"

    const/4 v0, 0x6

    const/4 v6, 0x0

    const/4 v8, 0x2

    :try_start_9b
    sget-object v10, Lsjo;->a:Ljava/util/List;

    iget-object v10, v2, Lx79;->a:Ljava/lang/Object;

    check-cast v10, Landroid/content/Context;

    invoke-static {v10, v4}, Lsjo;->k(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10
    :try_end_a5
    .catch Ljava/lang/Exception; {:try_start_9b .. :try_end_a5} :catch_102
    .catchall {:try_start_9b .. :try_end_a5} :catchall_ef

    :try_start_a5
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11
    :try_end_a9
    .catch Ljava/lang/Exception; {:try_start_a5 .. :try_end_a9} :catch_103
    .catchall {:try_start_a5 .. :try_end_a9} :catchall_ec

    if-eqz v11, :cond_b2

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_114

    goto :goto_109

    :cond_b2
    :try_start_b2
    invoke-virtual {v10, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    array-length v12, v11
    :try_end_b7
    .catch Ljava/lang/Exception; {:try_start_b2 .. :try_end_b7} :catch_103
    .catchall {:try_start_b2 .. :try_end_b7} :catchall_ec

    if-gtz v12, :cond_c0

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_114

    goto :goto_109

    :cond_c0
    :try_start_c0
    array-length v12, v11

    move v13, v5

    :goto_c2
    if-ge v13, v12, :cond_e5

    aget-object v14, v11, v13

    const-string v15, "ExpireTimestamp"

    invoke-virtual {v14, v15}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    array-length v15, v14

    if-lt v15, v8, :cond_e2

    aget-object v15, v14, v1

    invoke-static {v15}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v15

    invoke-static {}, Lsjo;->o()J

    move-result-wide v17

    cmp-long v15, v17, v15

    if-gez v15, :cond_e2

    aget-object v14, v14, v5

    invoke-static {v14, v0}, Lphj;->t(Ljava/lang/String;I)V
    :try_end_e2
    .catch Ljava/lang/Exception; {:try_start_c0 .. :try_end_e2} :catch_103
    .catchall {:try_start_c0 .. :try_end_e2} :catchall_ec

    :cond_e2
    add-int/lit8 v13, v13, 0x1

    goto :goto_c2

    :cond_e5
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_114

    goto :goto_109

    :catchall_ec
    move-exception v0

    move-object v6, v10

    goto :goto_f0

    :catchall_ef
    move-exception v0

    :goto_f0
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_101

    invoke-static {}, Lsjo;->n()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_101
    throw v0

    :catch_102
    move-object v10, v6

    :catch_103
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_114

    :goto_109
    invoke-static {}, Lsjo;->n()Landroid/content/SharedPreferences$Editor;

    move-result-object v10

    invoke-interface {v10, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_114
    const-string v4, "NewCreativeTypeRetryData"

    :try_start_116
    sget-object v10, Lphf;->a:Lx79;

    iget-object v10, v10, Lx79;->a:Ljava/lang/Object;

    check-cast v10, Landroid/content/Context;

    invoke-static {v10, v4}, Lsjo;->k(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_18e

    invoke-static {v4, v6}, Lsjo;->j(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v10, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    array-length v7, v4

    if-lez v7, :cond_18e

    array-length v7, v4

    move v10, v5

    :goto_132
    if-ge v10, v7, :cond_18e

    aget-object v11, v4, v10

    const-string v12, "NewCreativeType"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    array-length v12, v11

    if-ne v12, v9, :cond_14b

    aget-object v12, v11, v5

    aget-object v15, v11, v1

    aget-object v13, v11, v8

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    if-gtz v13, :cond_14e

    :cond_14b
    move/from16 p0, v1

    goto :goto_189

    :cond_14e
    invoke-static {v12}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v13

    new-instance v14, Lvdi;
    :try_end_154
    .catch Ljava/lang/Exception; {:try_start_116 .. :try_end_154} :catch_18e

    move/from16 p0, v1

    const/16 v1, 0x12

    :try_start_158
    invoke-direct {v14, v11, v12, v15, v1}, Lvdi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v13}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_15f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_189

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_177

    invoke-static {v14}, Lhyg;->b(Lmjo;)V

    move-object/from16 v18, v14

    goto :goto_186

    :cond_177
    new-instance v13, Ljro;

    const/16 v17, 0x1

    const/16 v16, 0x0

    move-object/from16 v18, v14

    move-object v14, v11

    invoke-direct/range {v13 .. v18}, Ljro;-><init>(Ljava/lang/String;Ljava/lang/String;IILmjo;)V

    invoke-static {v13}, Lhyg;->c(Ljro;)V
    :try_end_186
    .catch Ljava/lang/Exception; {:try_start_158 .. :try_end_186} :catch_190

    :goto_186
    move-object/from16 v14, v18

    goto :goto_15f

    :cond_189
    :goto_189
    add-int/lit8 v10, v10, 0x1

    move/from16 v1, p0

    goto :goto_132

    :catch_18e
    :cond_18e
    move/from16 p0, v1

    :catch_190
    sget-object v1, Lgxo;->c:Lgxo;

    new-instance v4, Lkoj;

    const/16 v5, 0xa

    invoke-direct {v4, v5}, Lkoj;-><init>(B)V

    invoke-virtual {v1, v4}, Lgxo;->b(Ljava/lang/Runnable;)V

    new-instance v1, Lkoj;

    const/16 v4, 0xe

    invoke-direct {v1, v4}, Lkoj;-><init>(B)V

    invoke-static {v1}, Lgxo;->a(Ljava/lang/Runnable;)V

    iget-object v1, v2, Lx79;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    new-instance v4, Lanf;

    invoke-direct {v4, v0}, Lanf;-><init>(B)V

    iput-object v4, v2, Lx79;->d:Ljava/lang/Object;

    new-instance v4, Landroid/content/IntentFilter;

    const-string v0, "android.intent.action.DOWNLOAD_COMPLETE"

    invoke-direct {v4, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    :try_start_1b8
    iget-object v0, v2, Lx79;->d:Ljava/lang/Object;

    check-cast v0, Lanf;

    invoke-virtual {v1, v0, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_1bf
    .catch Ljava/lang/SecurityException; {:try_start_1b8 .. :try_end_1bf} :catch_1c0

    goto :goto_1ce

    :catch_1c0
    move-exception v0

    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x21

    if-le v5, v7, :cond_1dd

    iget-object v0, v2, Lx79;->d:Ljava/lang/Object;

    check-cast v0, Lanf;

    invoke-static {v1, v0, v4, v6}, Lnb6;->P(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;)Landroid/content/Intent;

    :goto_1ce
    sget-object v0, Lezo;->b:Lygo;

    new-instance v1, Lkoj;

    const/16 v2, 0xb

    invoke-direct {v1, v2}, Lkoj;-><init>(B)V

    invoke-static {v0, v1}, Li7c;->b(Li7c;Ljava/lang/Runnable;)V

    sput-boolean p0, Lx79;->f:Z

    goto :goto_1e0

    :cond_1dd
    throw v0

    :cond_1de
    move/from16 p0, v1

    :goto_1e0
    new-instance v0, Lox;

    invoke-direct {v0, v9}, Lox;-><init>(B)V

    sput-object v0, Lcom/opera/ad/interstitial/AdActivity;->b:Lox;

    sput-boolean p0, Ls00;->u:Z

    goto :goto_1f1

    :catch_1ea
    move/from16 p0, v1

    sput-boolean p0, Ls00;->v:Z

    goto :goto_1fb

    :cond_1ef
    move-object/from16 v3, p2

    :goto_1f1
    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lyi4;->m(Landroid/content/Context;)Z

    move-result v0

    sput-boolean v0, Lg1p;->i:Z

    :goto_1fb
    return-void
.end method


# virtual methods
.method public a()V
    .registers 15

    iget-byte v0, p0, Lq00;->k:B

    const-string v1, "ads provider not available"

    iget-object v2, p0, Lq00;->l:Ls00;

    packed-switch v0, :pswitch_data_138

    sget-boolean v0, Ls00;->v:Z

    if-eqz v0, :cond_1c

    iget-object v0, v2, Lbqi;->g:Ljava/lang/String;

    invoke-static {v1, v0}, Lbqi;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Lk43;->b(ZLjava/lang/String;ZLv50;Ljava/lang/Long;)V

    goto :goto_20

    :cond_1c
    move-object v8, p0

    invoke-virtual {v8}, Lq00;->i()V

    :goto_20
    return-void

    :pswitch_21
    move-object v8, p0

    sget-boolean p0, Ls00;->v:Z

    if-eqz p0, :cond_36

    iget-object p0, v2, Lbqi;->g:Ljava/lang/String;

    invoke-static {v1, p0}, Lbqi;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    sget-object v12, Lv50;->k:Lv50;

    const/4 v13, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v8 .. v13}, Lk43;->b(ZLjava/lang/String;ZLv50;Ljava/lang/Long;)V

    goto/16 :goto_137

    :cond_36
    new-instance p0, Lchb;

    iget-object v0, v2, Lbqi;->j:Landroid/content/Context;

    iget-object v1, v8, Lk43;->c:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lchb;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    new-instance v0, Lqii;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, v0}, Lbzo;->e(Lltm;)V

    iget-object v0, v2, Ls00;->t:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_61

    iget-object v0, v2, Ls00;->t:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_61

    sget-object v3, Lg1p;->h:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_61

    sput-object v0, Lg1p;->h:Ljava/lang/String;

    :cond_61
    invoke-virtual {v2}, Ls00;->r()[D

    move-result-object v0

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v0, :cond_70

    aget-wide v5, v0, v4

    aget-wide v9, v0, v3

    invoke-virtual {p0, v5, v6, v9, v10}, Lbzo;->d(DD)V

    :cond_70
    sget-object v0, Lahb;->a:Lahb;

    iget-object v5, p0, Lchb;->r:Luuj;

    iput-object v0, v5, Luuj;->b:Ljava/lang/Object;

    new-instance v0, Ll45;

    invoke-direct {v0, v8, p0, v1}, Ll45;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, p0, Lchb;->q:Ll45;

    new-instance v0, Lqe6;

    const/16 v1, 0x15

    invoke-direct {v0, p0, v1}, Lqe6;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lbzo;->b:Lbn;

    iget-object v0, p0, Lbzo;->h:Lpqo;

    const/4 v1, 0x3

    iput-byte v1, v0, Lpqo;->e:B

    iput-boolean v4, v0, Lpqo;->f:Z

    invoke-virtual {v2}, Lbqi;->m()Landroid/app/Activity;

    move-result-object v4

    if-eqz v4, :cond_124

    invoke-virtual {v2}, Lbqi;->m()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f140087

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    const v5, 0x7f140088

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    const v6, 0x7f14009f

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    const v7, 0x7f14009e

    invoke-virtual {v2, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    const v8, 0x7f14009c

    invoke-virtual {v2, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    const v9, 0x7f14009d

    invoke-virtual {v2, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    const v10, 0x7f1400a0

    invoke-virtual {v2, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v4, p0, Lbzo;->k:Ljava/lang/String;

    iput-object v5, p0, Lbzo;->l:Ljava/lang/String;

    iput-object v6, p0, Lbzo;->m:Ljava/lang/String;

    iget-object v4, p0, Lbzo;->n:Ljava/util/ArrayList;

    if-nez v4, :cond_df

    new-instance v4, Ljava/util/ArrayList;

    const/4 v5, 0x5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v4, p0, Lbzo;->n:Ljava/util/ArrayList;

    goto :goto_e2

    :cond_df
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    :goto_e2
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_f2

    iget-object v4, p0, Lbzo;->n:Ljava/util/ArrayList;

    new-instance v5, Lrmo;

    invoke-direct {v5, v7, v3}, Lrmo;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_f2
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_103

    iget-object v3, p0, Lbzo;->n:Ljava/util/ArrayList;

    new-instance v4, Lrmo;

    const/4 v5, 0x2

    invoke-direct {v4, v8, v5}, Lrmo;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_103
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_113

    iget-object v3, p0, Lbzo;->n:Ljava/util/ArrayList;

    new-instance v4, Lrmo;

    invoke-direct {v4, v9, v1}, Lrmo;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_113
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_124

    iget-object v1, p0, Lbzo;->n:Ljava/util/ArrayList;

    new-instance v3, Lrmo;

    const/4 v4, 0x4

    invoke-direct {v3, v2, v4}, Lrmo;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_124
    new-instance v1, Lpqo;

    invoke-direct {v1, v0}, Lpqo;-><init>(Lpqo;)V

    invoke-virtual {p0, v1}, Lbzo;->c(Lpqo;)Lqyo;

    move-result-object v0

    new-instance v2, Lroj;

    const/16 v3, 0x19

    invoke-direct {v2, p0, v1, v3}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, v2}, Lqyo;->h(Lpqo;Lg94;)V

    :goto_137
    return-void

    :pswitch_data_138
    .packed-switch 0x0
        :pswitch_21
    .end packed-switch
.end method

.method public g(Lcie;)V
    .registers 5

    iget-object p0, p1, Lbzo;->h:Lpqo;

    new-instance v0, Lpqo;

    invoke-direct {v0, p0}, Lpqo;-><init>(Lpqo;)V

    invoke-virtual {p1, v0}, Lcie;->c(Lpqo;)Lqyo;

    move-result-object p0

    new-instance v1, Lroj;

    const/16 v2, 0x19

    invoke-direct {v1, p1, v0, v2}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0, v1}, Lqyo;->h(Lpqo;Lg94;)V

    return-void
.end method

.method public h(Lcie;Ljava/lang/String;Lp00;)V
    .registers 11

    iget-object v0, p1, Lbzo;->d:Lw06;

    invoke-virtual {v0}, Lw06;->d()Z

    move-result v0

    if-eqz v0, :cond_13

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v2, 0x0

    const-string v3, "Facebook bidding is no longer supported"

    const/4 v4, 0x0

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Lk43;->b(ZLjava/lang/String;ZLv50;Ljava/lang/Long;)V

    return-void

    :cond_13
    move-object v1, p0

    invoke-virtual {v1, p1, p2, p3}, Lq00;->j(Lcie;Ljava/lang/String;Lp00;)V

    return-void
.end method

.method public final i()V
    .registers 10

    new-instance v4, Lp00;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lcie;

    iget-object v6, p0, Lq00;->l:Ls00;

    iget-object v0, v6, Lbqi;->j:Landroid/content/Context;

    sget-object v1, Ldro;->c:Ldro;

    iget-object v3, p0, Lk43;->c:Ljava/lang/String;

    invoke-direct {v2, v0, v3, v1}, Lbzo;-><init>(Landroid/content/Context;Ljava/lang/String;Ldro;)V

    const/4 v0, -0x1

    iput v0, v2, Lcie;->V:I

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, v2, Lcie;->W:F

    sget v0, Lz1m;->b:I

    iput v0, v2, Lcie;->z0:I

    const/4 v7, 0x1

    iput-boolean v7, v2, Lcie;->q0:Z

    new-instance v0, Ls9i;

    const/4 v5, 0x3

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Ls9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, v2, Lbzo;->b:Lbn;

    sget-object p0, Ly55;->a:Ly55;

    iput-object p0, v2, Lcie;->T:Ly55;

    new-instance p0, Lydp;

    const/16 v0, 0xf

    invoke-direct {p0, v0}, Lydp;-><init>(B)V

    invoke-virtual {v2, p0}, Lbzo;->e(Lltm;)V

    invoke-virtual {v6}, Ls00;->r()[D

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_45

    aget-wide v3, p0, v0

    aget-wide v7, p0, v7

    invoke-virtual {v2, v3, v4, v7, v8}, Lbzo;->d(DD)V

    :cond_45
    iget-object p0, v6, Ls00;->t:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_5f

    iget-object p0, v6, Ls00;->t:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5f

    sget-object v3, Lg1p;->h:Ljava/lang/String;

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5f

    sput-object p0, Lg1p;->h:Ljava/lang/String;

    :cond_5f
    iget-object p0, v2, Lbzo;->h:Lpqo;

    const/4 v3, 0x3

    iput-byte v3, p0, Lpqo;->e:B

    iput-boolean v0, p0, Lpqo;->f:Z

    invoke-virtual {v1, v2}, Lq00;->g(Lcie;)V

    return-void
.end method

.method public final j(Lcie;Ljava/lang/String;Lp00;)V
    .registers 17

    sget v0, Ls00;->w:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Ls00;->w:I

    iget-object v1, p0, Lq00;->l:Ls00;

    iget-object v11, v1, Lbqi;->h:Li3j;

    iget-wide v1, p1, Lbzo;->e:D

    invoke-static {v1, v2}, Lap;->a(D)Lap;

    move-result-object v12

    move v1, v0

    new-instance v0, Lw10;

    iget-object v2, p1, Lcie;->q:Ljava/lang/String;

    sget-object v3, Laik;->a:[Ljava/lang/String;

    const-string v3, ""

    if-nez v2, :cond_1c

    move-object v2, v3

    :cond_1c
    iget-object v4, p1, Lcie;->r:Ljava/lang/String;

    if-eqz v4, :cond_21

    move-object v3, v4

    :cond_21
    iget-object v4, p1, Lcie;->p:Ljava/lang/String;

    move v5, v1

    move-object v1, v2

    move-object v2, v3

    move-object v3, v4

    iget-object v4, p1, Lcie;->o:Ljava/lang/String;

    const-string v6, ","

    move-object v7, p2

    invoke-static {p2, v6}, Lu35;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v8, p1, Lcie;->t:Ljava/lang/String;

    iget-object v7, p0, Lk43;->d:Ldl;

    move-object v9, p1

    move-object v6, p2

    move-object/from16 v10, p3

    invoke-direct/range {v0 .. v12}, Lw10;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ldl;Ljava/lang/String;Lcie;Lp00;Li3j;Lap;)V

    invoke-virtual {p0, v0}, Lk43;->d(Laqi;)V

    return-void
.end method
