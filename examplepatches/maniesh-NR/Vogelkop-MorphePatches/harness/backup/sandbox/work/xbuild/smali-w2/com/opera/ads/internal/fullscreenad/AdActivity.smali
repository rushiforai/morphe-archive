.class public final Lcom/opera/ads/internal/fullscreenad/AdActivity;
.super Landroid/app/Activity;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/opera/ads/internal/fullscreenad/AdActivity;",
        "Landroid/app/Activity;",
        "<init>",
        "()V",
        "sdk_okhttp4Release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
.end annotation


# static fields
.field public static final synthetic e:I


# instance fields
.field public a:Lcko;

.field public b:Lwi;

.field public c:Lsm;

.field public d:J


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    iget-wide v0, p0, Lcom/opera/ads/internal/fullscreenad/AdActivity;->d:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_14

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/opera/ads/internal/fullscreenad/AdActivity;->d:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_14

    const/4 v0, 0x1

    goto :goto_15

    :cond_14
    const/4 v0, 0x0

    :goto_15
    iget-object v1, p0, Lcom/opera/ads/internal/fullscreenad/AdActivity;->a:Lcko;

    if-eqz v1, :cond_20

    iget-boolean v1, v1, Lcko;->b:Z

    if-nez v1, :cond_20

    if-nez v0, :cond_20

    return-void

    :cond_20
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final onBackPressed()V
    .registers 1

    invoke-virtual {p0}, Lcom/opera/ads/internal/fullscreenad/AdActivity;->a()V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 23

    move-object/from16 v1, p0

    invoke-super/range {p0 .. p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v2, 0x1000000

    invoke-virtual {v0, v2}, Landroid/view/Window;->addFlags(I)V

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Locp;->p(Landroid/view/Window;Z)V

    invoke-virtual {v0, v2}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {v0, v2}, Landroid/view/Window;->setNavigationBarColor(I)V

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v4, 0x1

    const/16 v5, 0x1e

    if-lt v3, v5, :cond_28

    const/4 v6, 0x3

    goto :goto_29

    :cond_28
    move v6, v4

    :goto_29
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v7

    iget v8, v7, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    if-eq v8, v6, :cond_36

    iput v6, v7, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    invoke-virtual {v0, v7}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    :cond_36
    invoke-virtual {v0, v2}, Landroid/view/Window;->setStatusBarContrastEnforced(Z)V

    invoke-virtual {v0, v2}, Landroid/view/Window;->setNavigationBarContrastEnforced(Z)V

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const/16 v0, 0x21

    if-eqz v6, :cond_59

    const-string v8, "extra_ad_format"

    if-lt v3, v0, :cond_4f

    const-class v9, Lsm;

    invoke-virtual {v6, v8, v9}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;Ljava/lang/Class;)Ljava/io/Serializable;

    move-result-object v8

    goto :goto_56

    :cond_4f
    invoke-virtual {v6, v8}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v8

    if-nez v8, :cond_56

    const/4 v8, 0x0

    :cond_56
    :goto_56
    check-cast v8, Lsm;

    goto :goto_5a

    :cond_59
    const/4 v8, 0x0

    :goto_5a
    iput-object v8, v1, Lcom/opera/ads/internal/fullscreenad/AdActivity;->c:Lsm;

    if-eqz v8, :cond_76

    sget-object v9, Luro;->e:Ljava/util/EnumMap;

    invoke-virtual {v8}, Lsm;->d()Z

    sget-object v9, Luro;->e:Ljava/util/EnumMap;

    invoke-virtual {v9, v8}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Luro;

    if-nez v10, :cond_77

    new-instance v10, Luro;

    invoke-direct {v10}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v9, v8, v10}, Ljava/util/EnumMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_77

    :cond_76
    const/4 v10, 0x0

    :cond_77
    :goto_77
    iget-object v8, v1, Lcom/opera/ads/internal/fullscreenad/AdActivity;->a:Lcko;

    if-nez v8, :cond_22a

    if-eqz v10, :cond_22a

    iget-object v8, v10, Luro;->a:Lylp;

    if-eqz v8, :cond_22a

    invoke-virtual {v8}, Lvoo;->a()Z

    move-result v8

    if-nez v8, :cond_22a

    new-instance v8, Lcko;

    iget-object v9, v10, Luro;->a:Lylp;

    invoke-direct {v8, v1, v9}, Lcko;-><init>(Lcom/opera/ads/internal/fullscreenad/AdActivity;Lylp;)V

    iput-object v8, v1, Lcom/opera/ads/internal/fullscreenad/AdActivity;->a:Lcko;

    invoke-virtual {v1, v4}, Landroid/app/Activity;->requestWindowFeature(I)Z

    invoke-virtual {v1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v8

    if-eqz v8, :cond_9c

    invoke-virtual {v8}, Landroid/app/ActionBar;->hide()V

    :cond_9c
    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v8

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v9

    new-instance v10, Loji;

    invoke-direct {v10, v9}, Loji;-><init>(Landroid/view/View;)V

    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0x23

    if-lt v9, v11, :cond_b9

    new-instance v5, Lj3o;

    invoke-direct {v5, v8, v10}, Li3o;-><init>(Landroid/view/Window;Loji;)V

    goto :goto_c6

    :cond_b9
    if-lt v9, v5, :cond_c1

    new-instance v5, Li3o;

    invoke-direct {v5, v8, v10}, Li3o;-><init>(Landroid/view/Window;Loji;)V

    goto :goto_c6

    :cond_c1
    new-instance v5, Lh3o;

    invoke-direct {v5, v8, v10}, Lh3o;-><init>(Landroid/view/Window;Loji;)V

    :goto_c6
    const/16 v8, 0x207

    invoke-virtual {v5, v8}, Lw1h;->p(I)V

    invoke-virtual {v5}, Lw1h;->x()V

    if-lt v3, v0, :cond_de

    new-instance v0, Lwi;

    invoke-direct {v0, v1, v2}, Lwi;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1}, Landroid/app/Activity;->getOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    move-result-object v3

    invoke-interface {v3, v2, v0}, Landroid/window/OnBackInvokedDispatcher;->registerOnBackInvokedCallback(ILandroid/window/OnBackInvokedCallback;)V

    iput-object v0, v1, Lcom/opera/ads/internal/fullscreenad/AdActivity;->b:Lwi;

    :cond_de
    iget-object v10, v1, Lcom/opera/ads/internal/fullscreenad/AdActivity;->a:Lcko;

    if-eqz v10, :cond_219

    iget-object v11, v10, Lcko;->c:Lylp;

    iget-object v9, v10, Lcko;->a:Lcom/opera/ads/internal/fullscreenad/AdActivity;

    invoke-virtual {v11}, Lylp;->e()Lyjo;

    move-result-object v3

    iget-object v5, v11, Lvoo;->b:Lpro;

    sget-object v0, Lfap;->a:Lzyk;

    invoke-static {v9}, Lfap;->d(Landroid/content/Context;)Landroid/util/Size;

    move-result-object v0

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v14

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v15

    invoke-static {v9}, Ld1p;->d(Landroid/content/Context;)Lt5p;

    move-result-object v8

    iget-object v13, v5, Lpro;->c:Leq;

    :try_start_100
    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v12, "status_bar_height"

    const-string v7, "dimen"

    const-string v4, "android"

    invoke-virtual {v0, v12, v7, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-static {v9, v0}, Lnxg;->f(Landroid/content/Context;I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0
    :try_end_11c
    .catchall {:try_start_100 .. :try_end_11c} :catchall_11d

    goto :goto_126

    :catchall_11d
    move-exception v0

    sget-object v4, Lt0i;->b:Lp0i;

    new-instance v4, Lq0i;

    invoke-direct {v4, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v4

    :goto_126
    instance-of v4, v0, Lq0i;

    if-eqz v4, :cond_12b

    const/4 v0, 0x0

    :cond_12b
    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_134

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_136

    :cond_134
    const/16 v0, 0x18

    :goto_136
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    invoke-virtual {v8}, Lt5p;->a()Ljava/lang/String;

    move-result-object v17

    iget-boolean v0, v8, Lt5p;->c:Z

    move/from16 v18, v0

    move-object v12, v9

    invoke-virtual/range {v11 .. v18}, Lylp;->f(Landroid/content/Context;Leq;IILjava/lang/Integer;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    move-object v4, v11

    move-object v7, v12

    if-nez v0, :cond_176

    invoke-virtual {v10}, Lcko;->e()Lp7p;

    move-result-object v0

    if-eqz v0, :cond_156

    const/16 v3, 0x3ea

    invoke-virtual {v0, v3}, Lp7p;->a(I)V

    :cond_156
    new-instance v0, Lcm;

    const-string v3, "Invalid parameter!"

    const/4 v5, 0x2

    invoke-direct {v0, v5, v3, v2}, Lcm;-><init>(ILjava/lang/String;B)V

    const/4 v2, 0x1

    iput-boolean v2, v10, Lcko;->r:Z

    invoke-virtual {v10}, Lcko;->f()Lvm;

    move-result-object v2

    invoke-static {v4}, Locp;->d(Lvoo;)Luro;

    move-result-object v3

    const/4 v4, 0x0

    iput-object v4, v3, Luro;->a:Lylp;

    iput-object v4, v3, Luro;->b:Lp7p;

    iput-object v4, v3, Luro;->c:Lwoo;

    iput-object v4, v3, Luro;->d:Lmmo;

    if-eqz v2, :cond_216

    goto/16 :goto_211

    :cond_176
    new-instance v8, Lu7k;

    invoke-direct {v8, v10}, Lu7k;-><init>(Ljava/lang/Object;)V

    :try_start_17b
    new-instance v16, La3p;

    iget-object v9, v4, Lvoo;->x:Ljava/io/File;

    if-eqz v9, :cond_184

    move-object/from16 v17, v9

    goto :goto_186

    :cond_184
    const/16 v17, 0x0

    :goto_186
    iget-object v5, v5, Lpro;->b:Lsm;

    move-object/from16 v18, v16

    invoke-virtual {v10}, Lcko;->e()Lp7p;

    move-result-object v16

    iget-boolean v9, v4, Lylp;->A:Z

    move-object v13, v8

    new-instance v8, Lcfn;

    const-class v11, Lcko;

    const-string v12, "onAdmReady"

    move-object v14, v13

    const-string v13, "onAdmReady()V"

    move-object v15, v14

    const/4 v14, 0x0

    move-object/from16 v19, v15

    const/16 v15, 0x12

    move/from16 v20, v9

    const/4 v9, 0x0

    invoke-direct/range {v8 .. v15}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V
    :try_end_1a6
    .catch Ljava/lang/RuntimeException; {:try_start_17b .. :try_end_1a6} :catch_1e7

    move-object/from16 v13, v19

    const/16 v19, 0x0

    move-object v12, v10

    move-object/from16 v10, v17

    move/from16 v17, v20

    const/16 v20, 0x460

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v9, v18

    move-object/from16 v18, v8

    move-object v8, v9

    move-object v11, v5

    move-object v9, v7

    :try_start_1ba
    invoke-direct/range {v8 .. v20}, La3p;-><init>(Landroid/content/Context;Ljava/io/File;Lsm;Lbpo;Lm1p;IILp7p;ZLkotlin/jvm/functions/Function0;Lbxk;I)V
    :try_end_1bd
    .catch Ljava/lang/RuntimeException; {:try_start_1ba .. :try_end_1bd} :catch_1e5

    move-object v10, v12

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v2, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v8, v2}, Landroid/app/Activity;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Llzo;

    iget-object v4, v4, Lvoo;->j:Ljava/lang/String;

    invoke-direct {v2, v8, v3, v4, v0}, Llzo;-><init>(La3p;Lyjo;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Llzo;->c()V

    iput-object v2, v10, Lcko;->d:Llzo;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, v10, Lcko;->f:J

    invoke-virtual {v10}, Lcko;->f()Lvm;

    move-result-object v0

    if-eqz v0, :cond_219

    check-cast v0, Lwoo;

    invoke-virtual {v0}, Lwoo;->onAdOpened()V

    goto :goto_219

    :catch_1e5
    move-object v7, v9

    move-object v10, v12

    :catch_1e7
    invoke-virtual {v10}, Lcko;->e()Lp7p;

    move-result-object v0

    if-eqz v0, :cond_1f2

    const/16 v3, 0x3ef

    invoke-virtual {v0, v3}, Lp7p;->a(I)V

    :cond_1f2
    new-instance v0, Lcm;

    const/16 v3, 0x69

    const-string v5, "Can\'t create WebView for ad display"

    invoke-direct {v0, v3, v5, v2}, Lcm;-><init>(ILjava/lang/String;B)V

    const/4 v2, 0x1

    iput-boolean v2, v10, Lcko;->r:Z

    invoke-virtual {v10}, Lcko;->f()Lvm;

    move-result-object v2

    invoke-static {v4}, Locp;->d(Lvoo;)Luro;

    move-result-object v3

    const/4 v4, 0x0

    iput-object v4, v3, Luro;->a:Lylp;

    iput-object v4, v3, Luro;->b:Lp7p;

    iput-object v4, v3, Luro;->c:Lwoo;

    iput-object v4, v3, Luro;->d:Lmmo;

    if-eqz v2, :cond_216

    :goto_211
    check-cast v2, Lwoo;

    invoke-virtual {v2, v0}, Lwoo;->C(Lcm;)V

    :cond_216
    invoke-virtual {v7}, Landroid/app/Activity;->finish()V

    :cond_219
    :goto_219
    const-string v0, "extra_orientation"

    invoke-virtual {v6, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_229

    const/4 v2, 0x1

    :try_start_222
    invoke-virtual {v6, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/app/Activity;->setRequestedOrientation(I)V
    :try_end_229
    .catch Ljava/lang/Exception; {:try_start_222 .. :try_end_229} :catch_229

    :catch_229
    :cond_229
    return-void

    :cond_22a
    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final onDestroy()V
    .registers 5

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    const/4 v2, 0x0

    if-lt v0, v1, :cond_17

    iget-object v0, p0, Lcom/opera/ads/internal/fullscreenad/AdActivity;->b:Lwi;

    if-eqz v0, :cond_15

    invoke-virtual {p0}, Landroid/app/Activity;->getOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/window/OnBackInvokedDispatcher;->unregisterOnBackInvokedCallback(Landroid/window/OnBackInvokedCallback;)V

    :cond_15
    iput-object v2, p0, Lcom/opera/ads/internal/fullscreenad/AdActivity;->b:Lwi;

    :cond_17
    iget-object v0, p0, Lcom/opera/ads/internal/fullscreenad/AdActivity;->a:Lcko;

    if-eqz v0, :cond_42

    iget-object v1, v0, Lcko;->e:Ldpo;

    if-eqz v1, :cond_2c

    iget-object v3, v1, Lsxo;->a:Luio;

    if-eqz v3, :cond_26

    invoke-virtual {v3}, Luio;->c()V

    :cond_26
    iput-object v2, v1, Lsxo;->a:Luio;

    iput-object v2, v1, Lsxo;->b:Lzy9;

    iput-object v2, v1, Lsxo;->c:Lqe6;

    :cond_2c
    iput-object v2, v0, Lcko;->e:Ldpo;

    iget-object v1, v0, Lcko;->d:Llzo;

    if-eqz v1, :cond_35

    invoke-virtual {v1}, Llzo;->a()V

    :cond_35
    iput-object v2, v0, Lcko;->d:Llzo;

    iget-boolean v1, v0, Lcko;->r:Z

    if-nez v1, :cond_42

    iget-boolean v1, v0, Lcko;->n:Z

    if-nez v1, :cond_42

    invoke-virtual {v0}, Lcko;->g()V

    :cond_42
    iput-object v2, p0, Lcom/opera/ads/internal/fullscreenad/AdActivity;->a:Lcko;

    return-void
.end method

.method public final onPause()V
    .registers 7

    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    iget-object p0, p0, Lcom/opera/ads/internal/fullscreenad/AdActivity;->a:Lcko;

    if-eqz p0, :cond_3b

    iget-object v0, p0, Lcko;->d:Llzo;

    if-eqz v0, :cond_e

    invoke-virtual {v0}, Llzo;->b()V

    :cond_e
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcko;->q:Z

    iget-object v0, p0, Lcko;->a:Lcom/opera/ads/internal/fullscreenad/AdActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1f

    iget v0, p0, Lcko;->k:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcko;->k:I

    :cond_1f
    iget-wide v0, p0, Lcko;->l:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_3b

    iget-boolean v0, p0, Lcko;->n:Z

    if-nez v0, :cond_37

    iget-wide v0, p0, Lcko;->m:J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-wide v4, p0, Lcko;->l:J

    sub-long/2addr v2, v4

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcko;->m:J

    :cond_37
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcko;->l:J

    :cond_3b
    return-void
.end method

.method public final onResume()V
    .registers 5

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    iget-object p0, p0, Lcom/opera/ads/internal/fullscreenad/AdActivity;->a:Lcko;

    if-eqz p0, :cond_3f

    iget-object v0, p0, Lcko;->d:Llzo;

    if-eqz v0, :cond_26

    iget-object v1, v0, Llzo;->e:Lng2;

    iget-byte v2, v1, Lng2;->b:B

    const/4 v3, 0x2

    if-eq v2, v3, :cond_15

    const/4 v3, 0x4

    if-ne v2, v3, :cond_26

    :cond_15
    iget-object v0, v0, Llzo;->a:La3p;

    iget-object v0, v0, La3p;->o:Lj2p;

    if-eqz v0, :cond_23

    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    sget-object v2, Lito;->a:[Lito;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onResume()V

    :cond_23
    const/4 v0, 0x3

    iput-byte v0, v1, Lng2;->b:B

    :cond_26
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcko;->q:Z

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcko;->d(Z)V

    iget-boolean v0, p0, Lcko;->o:Z

    if-eqz v0, :cond_3f

    iget-wide v0, p0, Lcko;->l:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_3f

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcko;->l:J

    :cond_3f
    return-void
.end method

.method public final onStart()V
    .registers 6

    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    iget-object v0, p0, Lcom/opera/ads/internal/fullscreenad/AdActivity;->a:Lcko;

    if-eqz v0, :cond_e

    iget-object v0, v0, Lcko;->d:Llzo;

    if-eqz v0, :cond_e

    invoke-virtual {v0}, Llzo;->d()V

    :cond_e
    iget-wide v0, p0, Lcom/opera/ads/internal/fullscreenad/AdActivity;->d:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_3f

    iget-object v0, p0, Lcom/opera/ads/internal/fullscreenad/AdActivity;->c:Lsm;

    if-nez v0, :cond_1c

    const/4 v0, -0x1

    goto :goto_24

    :cond_1c
    sget-object v1, Lyi;->a:[I

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    aget v0, v1, v0

    :goto_24
    const/4 v1, 0x1

    if-eq v0, v1, :cond_40

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3f

    const/4 v1, 0x3

    if-eq v0, v1, :cond_3f

    const/4 v1, 0x4

    if-eq v0, v1, :cond_38

    iget-object p0, p0, Lcom/opera/ads/internal/fullscreenad/AdActivity;->c:Lsm;

    if-eqz p0, :cond_3f

    invoke-virtual {p0}, Lsm;->d()Z

    return-void

    :cond_38
    invoke-static {}, Laap;->f()Lz8p;

    move-result-object v0

    iget v0, v0, Lz8p;->t:I

    goto :goto_46

    :cond_3f
    return-void

    :cond_40
    invoke-static {}, Laap;->f()Lz8p;

    move-result-object v0

    iget v0, v0, Lz8p;->s:I

    :goto_46
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    sget-object v3, Lpn7;->b:Lon7;

    sget-object v3, Lun7;->e:Lun7;

    invoke-static {v0, v3}, Lcs5;->x0(ILun7;)J

    move-result-wide v3

    invoke-static {v3, v4}, Lpn7;->f(J)J

    move-result-wide v3

    add-long/2addr v3, v1

    iput-wide v3, p0, Lcom/opera/ads/internal/fullscreenad/AdActivity;->d:J

    return-void
.end method
