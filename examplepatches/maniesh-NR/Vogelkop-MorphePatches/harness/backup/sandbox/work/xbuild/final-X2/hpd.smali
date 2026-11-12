.class public final synthetic Lhpd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lhpd;->a:B

    iput-object p1, p0, Lhpd;->b:Ljava/lang/Object;

    iput-object p2, p0, Lhpd;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 14

    iget-byte v0, p0, Lhpd;->a:B

    const/4 v1, 0x3

    const/16 v2, 0x8

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    iget-object v6, p0, Lhpd;->c:Ljava/lang/Object;

    iget-object p0, p0, Lhpd;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3d0

    check-cast p0, Lq2f;

    check-cast v6, Lhjm;

    iget-object p0, p0, Lq2f;->d:Lkqd;

    if-eqz p0, :cond_33

    iget-object p0, p0, Lkqd;->b:Ljava/lang/Object;

    check-cast p0, Luwf;

    iget-object v0, p0, Luwf;->a:Landroid/util/Pair;

    if-eqz v0, :cond_33

    iget-object v1, p0, Luwf;->b:Landroid/view/ViewGroup;

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object v0, p0, Luwf;->a:Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ls2f;

    invoke-virtual {v0, v6}, Ls2f;->finish(Lhjm;)V

    iput-object v3, p0, Luwf;->a:Landroid/util/Pair;

    :cond_33
    return-void

    :pswitch_34
    check-cast p0, Lorm;

    check-cast v6, Lcom/leanplum/ActionContext;

    invoke-static {p0, v6}, Lcom/leanplum/messagetemplates/OperaRateSheet$register$1;->a(Lorm;Lcom/leanplum/ActionContext;)V

    return-void

    :pswitch_3c
    check-cast p0, Lcom/opera/android/OperaApplication;

    check-cast v6, Llkk;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-static {p0, v6, v5}, Lxf8;->n0(Landroid/content/Context;Llkk;Z)V

    return-void

    :pswitch_46
    check-cast p0, Lnff;

    check-cast v6, Lt1;

    invoke-virtual {v6}, Lt1;->get()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lekc;->n(Ljava/lang/Object;)V

    return-void

    :pswitch_52
    check-cast p0, Lwsf;

    check-cast v6, Lcom/opera/android/startup/WelcomeActivity;

    invoke-static {}, LJ/N;->MGjyv7Lz()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {}, Lcom/leanplum/internal/Util;->getDeviceModel()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Li0l;->g()Z

    move-result v2

    if-eqz v2, :cond_69

    sget-object v2, Lme0;->d:Lme0;

    goto :goto_74

    :cond_69
    invoke-static {v6}, Lr9n;->B(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_72

    sget-object v2, Lme0;->c:Lme0;

    goto :goto_74

    :cond_72
    sget-object v2, Lme0;->b:Lme0;

    :goto_74
    new-instance v3, Lyo7;

    const/16 v4, 0x19

    invoke-direct {v3, v0, v1, v2, v4}, Lyo7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v3}, Lwsf;->a(Lkotlin/jvm/functions/Function1;)V

    return-void

    :pswitch_7f
    check-cast p0, Lmdf;

    check-cast v6, Lpdf;

    sget-object v0, Lkl0;->d:Lkl0;

    sget-object v1, Lgl0;->d:Lgl0;

    invoke-virtual {p0, v0, v1}, Lmdf;->a(Lkl0;Lgl0;)V

    iget-object p0, v6, Lpdf;->m:Ll5b;

    iget-object v7, v6, Lpdf;->l:Lyl6;

    iget-object v8, v6, Lpdf;->i:Lorm;

    iget-boolean v0, p0, Ll5b;->b:Z

    xor-int/lit8 v11, v0, 0x1

    const/4 v12, 0x0

    sget-object v9, Lvb0;->d:Lvb0;

    sget-object v10, Lac0;->e:Lac0;

    invoke-virtual/range {v7 .. v12}, Lyl6;->i(Lorm;Lvb0;Lac0;ZLjava/lang/String;)V

    iput-boolean v5, p0, Ll5b;->b:Z

    return-void

    :pswitch_9f
    check-cast p0, Lbyi;

    check-cast v6, Lgdf;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, v6, v0}, Lbyi;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void

    :pswitch_a9
    check-cast p0, Lgbf;

    check-cast v6, Lb2l;

    iput-object v3, p0, Lgbf;->w:Lhh4;

    invoke-virtual {p0}, Lgbf;->o()Lcom/opera/android/bar/FindInPage;

    move-result-object p0

    move-object v0, v6

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->R()Lzg;

    move-result-object v0

    check-cast v6, Ld7l;

    iget-object v1, v6, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->m()Z

    move-result v1

    iput-object v0, p0, Lcom/opera/android/bar/FindInPage;->d:Lzg;

    iput-object p0, v0, Lzg;->d:Ljava/lang/Object;

    iput-boolean v1, p0, Lcom/opera/android/bar/FindInPage;->p:Z

    iput v5, p0, Lcom/opera/android/bar/FindInPage;->e:I

    iput v5, p0, Lcom/opera/android/bar/FindInPage;->f:I

    iput-boolean v5, p0, Lcom/opera/android/bar/FindInPage;->g:Z

    invoke-virtual {p0}, Lcom/opera/android/bar/FindInPage;->g()V

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->k:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->l:Lcom/opera/android/custom_views/ObservableEditText;

    if-eqz v1, :cond_df

    iget-object v1, p0, Lcom/opera/android/bar/FindInPage;->o:Ljava/lang/String;

    goto :goto_e1

    :cond_df
    iget-object v1, p0, Lcom/opera/android/bar/FindInPage;->n:Ljava/lang/String;

    :goto_e1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->l:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->selectAll()V

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->l:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    iget-object p0, p0, Lcom/opera/android/bar/FindInPage;->v:Lqie;

    if-eqz p0, :cond_117

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Lgbf;

    iget-object v0, p0, Lgbf;->u:Lcom/opera/android/bar/FindInPage;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lgbf;->u:Lcom/opera/android/bar/FindInPage;

    iget-object v1, v0, Lcom/opera/android/bar/FindInPage;->l:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z

    move-result v1

    if-eqz v1, :cond_10c

    invoke-virtual {v0}, Landroid/view/View;->findFocus()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lq9n;->H(Landroid/view/View;)Z

    :cond_10c
    iget-object v0, p0, Lgbf;->b:Lz43;

    iget-object p0, p0, Lgbf;->u:Lcom/opera/android/bar/FindInPage;

    iget-object v0, v0, Lz43;->e:Ljava/lang/Object;

    check-cast v0, Lysl;

    invoke-interface {v0, p0}, Lysl;->r(Ljava/lang/Object;)V

    :cond_117
    return-void

    :pswitch_118
    check-cast p0, Lcom/opera/api/Callback;

    check-cast v6, Lsz4;

    invoke-static {v6}, Lyi4;->y(Lsz4;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_128
    check-cast p0, Lwub;

    check-cast v6, Li16;

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Ll2f;

    iget-object v0, v6, Li16;->c:Ljava/lang/Object;

    check-cast v0, Lcm;

    iget-object v1, v0, Lcm;->c:Ljava/lang/String;

    iget v0, v0, Lcm;->b:I

    iget-object v2, v6, Li16;->b:Ljava/lang/Object;

    check-cast v2, Landroid/app/Notification;

    invoke-virtual {p0, v1, v0, v2}, Ll2f;->b(Ljava/lang/String;ILandroid/app/Notification;)V

    return-void

    :pswitch_140
    check-cast p0, Lwub;

    check-cast v6, Landroid/app/NotificationChannelGroup;

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Ll2f;

    iget-object p0, p0, Ll2f;->b:Landroid/app/NotificationManager;

    invoke-virtual {p0, v6}, Landroid/app/NotificationManager;->createNotificationChannelGroup(Landroid/app/NotificationChannelGroup;)V

    return-void

    :pswitch_14e
    check-cast p0, Lwub;

    check-cast v6, Landroid/app/NotificationChannel;

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Ll2f;

    iget-object p0, p0, Ll2f;->b:Landroid/app/NotificationManager;

    invoke-virtual {p0, v6}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    return-void

    :pswitch_15c
    check-cast p0, Lr1f;

    check-cast v6, Lndc;

    iget-object v0, p0, Lp1f;->b:Lnrl;

    invoke-virtual {v0}, Lnrl;->K()V

    iget-object v0, p0, Lr1f;->f:Ljava/lang/Object;

    check-cast v0, Lxc9;

    new-instance v1, Ls1f;

    invoke-direct {v1, p0}, Ls1f;-><init>(Lr1f;)V

    new-instance p0, Lvme;

    const/16 v2, 0x13

    invoke-direct {p0, v2}, Lvme;-><init>(B)V

    invoke-static {v0, v6, v1, p0}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void

    :pswitch_179
    check-cast p0, Lpqe;

    check-cast v6, Lg82;

    iget-object v0, p0, Lpqe;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lpqe;->d:Lesk;

    invoke-interface {p0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt82;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lcom/opera/android/browser/UrlMangler$Builder;

    const-string v2, "article"

    iget-object v4, v6, Lg82;->c:Ljava/lang/String;

    invoke-direct {v1, v2, v4}, Lcom/opera/android/browser/UrlMangler$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lt82;->a:Ljava/lang/String;

    invoke-virtual {v1, p0}, Lcom/opera/android/browser/UrlMangler$Builder;->displayString(Ljava/lang/String;)Lcom/opera/android/browser/UrlMangler$Builder;

    iget-object p0, v6, Lg82;->a:Ljava/lang/String;

    const-string v2, "article_id"

    iget-object v4, v1, Lcom/opera/android/browser/UrlMangler$Builder;->c:Ljava/util/HashMap;

    invoke-virtual {v4, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "article_transcoded"

    const-string v2, "1"

    invoke-virtual {v4, p0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1}, Lcom/opera/android/browser/UrlMangler$Builder;->build()Ljava/lang/String;

    move-result-object p0

    sget-object v1, Llqm;->i:Llqm;

    invoke-static {p0, v3, v1}, Lwqm;->f(Ljava/lang/String;Lsqh;Llqm;)Llsc;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->v(Llsc;)V

    return-void

    :pswitch_1b6
    check-cast p0, Lup1;

    check-cast v6, Landroid/content/Context;

    iget-object p0, p0, Lup1;->b:Ljava/lang/Object;

    check-cast p0, Lgpe;

    const-string v0, "connectivity"

    invoke-virtual {v6, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    const/4 v3, 0x5

    if-eqz v0, :cond_201

    :try_start_1c9
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0
    :try_end_1cd
    .catch Ljava/lang/SecurityException; {:try_start_1c9 .. :try_end_1cd} :catch_201

    if-eqz v0, :cond_1ff

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v5

    if-eqz v5, :cond_1ff

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v5

    const/4 v7, 0x2

    const/16 v8, 0x9

    const/4 v9, 0x6

    const/4 v10, 0x4

    if-eqz v5, :cond_1ee

    if-eq v5, v4, :cond_1f9

    if-eq v5, v10, :cond_1ee

    if-eq v5, v3, :cond_1ee

    if-eq v5, v9, :cond_1fb

    if-eq v5, v8, :cond_1ec

    move v1, v2

    goto :goto_202

    :cond_1ec
    const/4 v1, 0x7

    goto :goto_202

    :cond_1ee
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v0

    packed-switch v0, :pswitch_data_40e

    :pswitch_1f5
    move v1, v9

    goto :goto_202

    :pswitch_1f7
    move v1, v8

    goto :goto_202

    :cond_1f9
    :pswitch_1f9
    move v1, v7

    goto :goto_202

    :cond_1fb
    :pswitch_1fb
    move v1, v3

    goto :goto_202

    :pswitch_1fd
    move v1, v10

    goto :goto_202

    :cond_1ff
    move v1, v4

    goto :goto_202

    :catch_201
    :cond_201
    move v1, v5

    :goto_202
    :pswitch_202
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    if-lt v0, v2, :cond_20e

    if-ne v1, v3, :cond_20e

    invoke-static {v6, p0}, Lm41;->d(Landroid/content/Context;Lgpe;)V

    goto :goto_211

    :cond_20e
    invoke-virtual {p0, v1}, Lgpe;->d(I)V

    :goto_211
    return-void

    :pswitch_212
    check-cast p0, Lgpe;

    check-cast v6, Landroid/content/Context;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    new-instance v1, Lup1;

    const/16 v2, 0xc

    invoke-direct {v1, p0, v2}, Lup1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v6, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void

    :pswitch_22b
    check-cast p0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    check-cast v6, Ljava/lang/Runnable;

    invoke-static {p0, v6}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->a(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;Ljava/lang/Runnable;)V

    return-void

    :pswitch_233
    check-cast p0, Lq6e;

    check-cast v6, Ll6e;

    iget-object p0, p0, Lq6e;->b:Liri;

    :try_start_239
    invoke-virtual {p0, v6}, Liri;->n(Ll6e;)Z

    move-result v0

    if-eqz v0, :cond_242

    invoke-virtual {v6}, Ll6e;->q()V
    :try_end_242
    .catchall {:try_start_239 .. :try_end_242} :catchall_246

    :cond_242
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V

    return-void

    :catchall_246
    move-exception v0

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V

    throw v0

    :pswitch_24b
    check-cast p0, Lcom/opera/android/favorites/e;

    check-cast v6, Laul;

    iget-object p0, p0, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    invoke-static {p0}, Lsfe;->X(Ltq8;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {v6, p0}, Laul;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_259
    check-cast p0, Lrn9;

    check-cast v6, Lm0e;

    iput-boolean v5, p0, Lrn9;->b:Z

    invoke-virtual {v6}, Lm0e;->b()V

    invoke-virtual {p0}, Lrn9;->M()V

    return-void

    :pswitch_266
    check-cast p0, Lf0e;

    check-cast v6, Ls6h;

    sget v0, Lf0e;->h:I

    invoke-virtual {p0}, Lf0e;->U()V

    invoke-virtual {v6}, Ls6h;->Q()V

    return-void

    :pswitch_273
    check-cast p0, Lrn9;

    check-cast v6, Lb0e;

    iput-boolean v5, p0, Lrn9;->b:Z

    iget-object p0, v6, Lb0e;->l:Ltsd;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxzd;

    if-nez p0, :cond_28c

    new-instance p0, Lx77;

    sget-object v0, Ll08;->a:Ll08;

    invoke-direct {p0, v0}, Lx77;-><init>(Ljava/util/List;)V

    goto/16 :goto_331

    :cond_28c
    iget-object v0, v6, Lb0e;->f:Lk6l;

    iget-object v1, p0, Lxzd;->a:Lu3l;

    sget-object v2, Ly6l;->a:Ly6l;

    invoke-static {v0, v1, v2}, Lexg;->p(Lk6l;Lu3l;Lnxg;)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v7, v5

    :goto_2a5
    if-ge v7, v3, :cond_32c

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Lb2l;

    move-object v9, v8

    check-cast v9, Ld7l;

    iget-object v9, v9, Ld7l;->j:Le7l;

    invoke-interface {v9}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v9

    iget v9, v9, Lcom/opera/android/browser/TabInfo;->d:I

    if-eqz v9, :cond_317

    iget-object v9, p0, Lxzd;->b:Ljava/util/Set;

    move-object v10, v8

    check-cast v10, Ld7l;

    iget-object v11, v10, Ld7l;->j:Le7l;

    invoke-interface {v11}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v11

    iget v11, v11, Lcom/opera/android/browser/TabInfo;->d:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v9, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_317

    iget-object v9, v10, Ld7l;->j:Le7l;

    invoke-interface {v9}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v9

    iget v9, v9, Lcom/opera/android/browser/TabInfo;->d:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/List;

    if-eqz v9, :cond_2eb

    invoke-interface {v9, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2a5

    :cond_2eb
    new-array v9, v4, [Lb2l;

    aput-object v8, v9, v5

    invoke-static {v9}, Lj95;->j([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v9

    new-instance v11, Lyzd;

    iget-object v12, v10, Ld7l;->j:Le7l;

    invoke-interface {v12}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v12

    iget v12, v12, Lcom/opera/android/browser/TabInfo;->d:I

    invoke-interface {v8}, Lb9l;->T()Lp6l;

    move-result-object v8

    invoke-direct {v11, v12, v9, v8}, Lyzd;-><init>(ILjava/util/ArrayList;Lp6l;)V

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v8, v10, Ld7l;->j:Le7l;

    invoke-interface {v8}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v8

    iget v8, v8, Lcom/opera/android/browser/TabInfo;->d:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v2, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2a5

    :cond_317
    new-instance v9, Lzzd;

    move-object v10, v8

    check-cast v10, Ld7l;

    iget-object v10, v10, Ld7l;->j:Le7l;

    invoke-interface {v10}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v10

    iget v10, v10, Lcom/opera/android/browser/TabInfo;->d:I

    invoke-direct {v9, v8, v10}, Lzzd;-><init>(Lb2l;I)V

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2a5

    :cond_32c
    new-instance p0, Lx77;

    invoke-direct {p0, v1}, Lx77;-><init>(Ljava/util/List;)V

    :goto_331
    iput-object p0, v6, Lb0e;->m:Lx77;

    iget-object p0, p0, Lx77;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    sget-object v0, Lb0e;->n:Lnv6;

    invoke-virtual {v6, p0, v0}, Ldt1;->L(Ljava/util/List;Lo87;)V

    return-void

    :pswitch_33d
    check-cast p0, Lwyd;

    check-cast v6, Landroid/net/Uri;

    iget-object v0, p0, Lwyd;->d:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lyqd;

    invoke-direct {v2, v6, v1}, Lyqd;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lwyd;->c:Lglh;

    new-instance v1, Ltyd;

    invoke-direct {v1, p0, v5}, Ltyd;-><init>(Lwyd;B)V

    invoke-virtual {v0, v1}, Lglh;->f(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_356
    check-cast p0, Landroid/view/Surface;

    check-cast v6, Landroid/graphics/SurfaceTexture;

    invoke-virtual {p0}, Landroid/view/Surface;->release()V

    invoke-virtual {v6}, Landroid/graphics/SurfaceTexture;->release()V

    return-void

    :pswitch_361
    check-cast p0, Ltxd;

    check-cast v6, Ltya;

    invoke-interface {v6, p0}, Ltya;->o(Luya;)V

    return-void

    :pswitch_369
    check-cast p0, Lop5;

    check-cast v6, Lprd;

    invoke-interface {p0, v6}, Lop5;->accept(Ljava/lang/Object;)V

    return-void

    :pswitch_371
    check-cast p0, Lxqd;

    check-cast v6, Lnod;

    iget-object p0, p0, Lxqd;->b:Lvzk;

    invoke-virtual {p0, v6}, Lvzk;->B(Lnod;)V

    return-void

    :pswitch_37b
    check-cast p0, Lxqd;

    check-cast v6, Lksa;

    iget-object p0, p0, Lxqd;->b:Lvzk;

    invoke-interface {v6}, Landroid/os/IInterface;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-virtual {p0, v0}, Lvzk;->I(Ljava/lang/Object;)Lnod;

    move-result-object v0

    if-eqz v0, :cond_38e

    invoke-virtual {p0, v0}, Lvzk;->Z(Lnod;)V

    :cond_38e
    return-void

    :pswitch_38f
    check-cast p0, Lr0b;

    check-cast v6, Landroid/os/ResultReceiver;

    :try_start_393
    iget-object p0, p0, Lr0b;->a:Ljava/lang/Object;

    check-cast p0, Le4j;

    const-string v0, "SessionResult must not be null"

    invoke-static {p0, v0}, Lz4o;->D(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_39c
    .catch Ljava/util/concurrent/CancellationException; {:try_start_393 .. :try_end_39c} :catch_3ab
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_393 .. :try_end_39c} :catch_39d
    .catch Ljava/lang/InterruptedException; {:try_start_393 .. :try_end_39c} :catch_39d

    goto :goto_3b7

    :catch_39d
    move-exception v0

    move-object p0, v0

    const-string v0, "Custom command failed"

    invoke-static {v0, p0}, Lw7d;->L(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance p0, Le4j;

    const/4 v0, -0x1

    invoke-direct {p0, v0}, Le4j;-><init>(I)V

    goto :goto_3b7

    :catch_3ab
    move-exception v0

    move-object p0, v0

    const-string v0, "Custom command cancelled"

    invoke-static {v0, p0}, Lw7d;->L(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance p0, Le4j;

    invoke-direct {p0, v4}, Le4j;-><init>(I)V

    :goto_3b7
    iget v0, p0, Le4j;->a:I

    iget-object p0, p0, Le4j;->b:Landroid/os/Bundle;

    invoke-virtual {v6, v0, p0}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    return-void

    :pswitch_3bf
    check-cast p0, Lnpd;

    check-cast v6, Lc5j;

    invoke-virtual {p0}, Lnpd;->n()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v6, p0}, Lm4;->set(Ljava/lang/Object;)Z

    return-void

    nop

    :pswitch_data_3d0
    .packed-switch 0x0
        :pswitch_3bf
        :pswitch_38f
        :pswitch_37b
        :pswitch_371
        :pswitch_369
        :pswitch_361
        :pswitch_356
        :pswitch_33d
        :pswitch_273
        :pswitch_266
        :pswitch_259
        :pswitch_24b
        :pswitch_233
        :pswitch_22b
        :pswitch_212
        :pswitch_1b6
        :pswitch_179
        :pswitch_15c
        :pswitch_14e
        :pswitch_140
        :pswitch_128
        :pswitch_118
        :pswitch_a9
        :pswitch_9f
        :pswitch_7f
        :pswitch_52
        :pswitch_46
        :pswitch_3c
        :pswitch_34
    .end packed-switch

    :pswitch_data_40e
    .packed-switch 0x1
        :pswitch_202
        :pswitch_202
        :pswitch_1fd
        :pswitch_1fd
        :pswitch_1fd
        :pswitch_1fd
        :pswitch_1fd
        :pswitch_1fd
        :pswitch_1fd
        :pswitch_1fd
        :pswitch_1fd
        :pswitch_1fd
        :pswitch_1fb
        :pswitch_1fd
        :pswitch_1fd
        :pswitch_1f5
        :pswitch_1fd
        :pswitch_1f9
        :pswitch_1f5
        :pswitch_1f7
    .end packed-switch
.end method
