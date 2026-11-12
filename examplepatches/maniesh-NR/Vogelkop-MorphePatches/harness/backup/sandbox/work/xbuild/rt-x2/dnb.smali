.class public final synthetic Ldnb;
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

    iput-byte p2, p0, Ldnb;->a:B

    iput-object p1, p0, Ldnb;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a()V
    .registers 6

    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Ln3d;

    iget-object v0, p0, Ln3d;->d:Ll3d;

    if-nez v0, :cond_9

    return-void

    :cond_9
    iget-object v1, v0, Ll3d;->a:Ljava/lang/Object;

    const/4 v2, 0x0

    if-eqz v1, :cond_2e

    monitor-enter p0

    :try_start_f
    new-instance v0, Ljava/util/ArrayList;

    iget-object v3, p0, Ln3d;->a:Ljava/util/LinkedHashSet;

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    :goto_1a
    if-ge v2, v3, :cond_28

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    check-cast v4, Lj3d;

    invoke-interface {v4, v1}, Lj3d;->onResult(Ljava/lang/Object;)V
    :try_end_27
    .catchall {:try_start_f .. :try_end_27} :catchall_2c

    goto :goto_1a

    :cond_28
    monitor-exit p0

    return-void

    :goto_2a
    :try_start_2a
    monitor-exit p0
    :try_end_2b
    .catchall {:try_start_2a .. :try_end_2b} :catchall_2c

    throw v0

    :catchall_2c
    move-exception v0

    goto :goto_2a

    :cond_2e
    iget-object v0, v0, Ll3d;->b:Ljava/lang/Throwable;

    monitor-enter p0

    :try_start_31
    new-instance v1, Ljava/util/ArrayList;

    iget-object v3, p0, Ln3d;->b:Ljava/util/LinkedHashSet;

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_45

    const-string v0, "Lottie encountered an error but no failure listener was added:"

    invoke-static {v0}, Lizc;->c(Ljava/lang/String;)V
    :try_end_43
    .catchall {:try_start_31 .. :try_end_43} :catchall_5b

    monitor-exit p0

    return-void

    :cond_45
    :try_start_45
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    :goto_49
    if-ge v2, v3, :cond_57

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    check-cast v4, Lj3d;

    invoke-interface {v4, v0}, Lj3d;->onResult(Ljava/lang/Object;)V
    :try_end_56
    .catchall {:try_start_45 .. :try_end_56} :catchall_5b

    goto :goto_49

    :cond_57
    monitor-exit p0

    return-void

    :goto_59
    :try_start_59
    monitor-exit p0
    :try_end_5a
    .catchall {:try_start_59 .. :try_end_5a} :catchall_5b

    throw v0

    :catchall_5b
    move-exception v0

    goto :goto_59
.end method


# virtual methods
.method public final run()V
    .registers 8

    iget-byte v0, p0, Ldnb;->a:B

    const/16 v1, 0x16

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    packed-switch v0, :pswitch_data_380

    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lfmd;

    const/4 v0, -0x1

    iput v0, p0, Lfmd;->n:I

    return-void

    :pswitch_13
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lrld;

    iget-object p0, p0, Lrld;->p:Lnld;

    iput-boolean v4, p0, Lnld;->n:Z

    iget-boolean v0, p0, Lnld;->l:Z

    if-eqz v0, :cond_22

    invoke-virtual {p0}, Lnld;->c()V

    :cond_22
    return-void

    :pswitch_23
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lg77;

    iget-object v0, p0, Lg77;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/media3/ui/PlayerView;

    iget-object v0, v0, Landroidx/media3/ui/PlayerView;->k:Luig;

    if-eqz v0, :cond_32

    invoke-virtual {v0}, Luig;->d()V

    :cond_32
    iget-object p0, p0, Lg77;->a:Ljava/lang/Object;

    check-cast p0, Li4d;

    iget-object p0, p0, Li4d;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->isLaidOut()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_45

    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    goto :goto_5f

    :cond_45
    const/high16 v0, 0x43160000    # 150.0f

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v2

    mul-float/2addr v2, v0

    float-to-int v0, v2

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    sget-object v0, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-virtual {p0, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    :goto_5f
    return-void

    :pswitch_60
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Li3j;

    iput-object v3, p0, Li3j;->c:Ljava/lang/Object;

    iget-object v0, p0, Li3j;->d:Ljava/lang/Object;

    check-cast v0, Ljkd;

    if-eqz v0, :cond_6f

    invoke-virtual {p0, v0}, Li3j;->N(Ljkd;)V

    :cond_6f
    return-void

    :pswitch_70
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Ltn;

    iget-object v0, p0, Ltn;->b:Ljava/lang/Object;

    check-cast v0, Lhkd;

    iget-object v1, v0, Lhkd;->a:Lyhe;

    if-nez v1, :cond_c8

    iget-object v1, p0, Ltn;->d:Ljava/lang/Object;

    check-cast v1, Ldnb;

    if-eqz v1, :cond_8b

    iget-object v2, p0, Ltn;->c:Ljava/lang/Object;

    check-cast v2, Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iput-object v3, p0, Ltn;->d:Ljava/lang/Object;

    :cond_8b
    const-string p0, "org.chromium.components.browser_ui.media.ACTION_SWIPE"

    iget-object v1, v0, Lhkd;->d:Lbnf;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lbnf;->c:Landroid/util/SparseArray;

    iget v5, v1, Lbnf;->b:I

    invoke-virtual {v2, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzmf;

    iget-object v2, v2, Lzmf;->a:Ljava/lang/Class;

    new-instance v5, Landroid/content/Intent;

    sget-object v6, Lt8;->a:Landroid/content/Context;

    invoke-direct {v5, v6, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v5, p0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    iget v1, v1, Lbnf;->a:I

    const-string v2, "org.chromium.components.browser_ui.media.EXTRA_NOTIFICATION_ID"

    invoke-virtual {p0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    sget-object v2, Lt8;->a:Landroid/content/Context;

    const/high16 v5, 0x14000000

    invoke-static {v4}, Lc26;->s(Z)I

    move-result v4

    or-int/2addr v5, v4

    new-instance v4, Lyhe;

    invoke-static {v2, v1, p0, v5}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    const/16 v1, 0x8

    invoke-direct {v4, p0, v1}, Lyhe;-><init>(Ljava/lang/Object;B)V

    iput-object v4, v0, Lhkd;->a:Lyhe;

    iput-object v3, v0, Lhkd;->b:Ltn;

    :cond_c8
    return-void

    :pswitch_c9
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/media/MediaDrmBridge;

    sget-object v0, Lorg/chromium/media/MediaDrmBridge;->n:Ljava/util/UUID;

    invoke-virtual {p0}, Lorg/chromium/media/MediaDrmBridge;->b()Z

    return-void

    :pswitch_d3
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lghd;

    invoke-virtual {p0}, Lghd;->release()V

    return-void

    :pswitch_db
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    sget-object v0, Lcom/google/android/material/button/MaterialButton;->O:[I

    iget-boolean v0, p0, Lcom/google/android/material/button/MaterialButton;->E:Z

    if-eqz v0, :cond_fa

    iget-boolean v0, p0, Lcom/google/android/material/button/MaterialButton;->G:Z

    if-eqz v0, :cond_fa

    iget-object v0, p0, Lcom/google/android/material/button/MaterialButton;->e:Lhdd;

    invoke-virtual {v0, v4}, Lhdd;->a(Z)Lzdd;

    move-result-object v0

    if-eqz v0, :cond_fa

    invoke-virtual {v0}, Lzdd;->j()F

    move-result v0

    const v1, 0x3de147ae    # 0.11f

    mul-float/2addr v0, v1

    float-to-int v4, v0

    :cond_fa
    iput v4, p0, Lcom/google/android/material/button/MaterialButton;->F:I

    invoke-virtual {p0}, Lcom/google/android/material/button/MaterialButton;->M()V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_103
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, La9d;

    iput-boolean v4, p0, La9d;->t:Z

    invoke-virtual {p0}, La9d;->g()V

    return-void

    :pswitch_10d
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/MakeOperaDefaultBanner;

    sget v0, Lcom/opera/android/custom_views/MakeOperaDefaultBanner;->h:I

    invoke-virtual {p0}, Lcom/opera/android/custom_views/MakeOperaDefaultBanner;->d()V

    return-void

    :pswitch_117
    sget-object v0, Lkr0;->b:Lkr0;

    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lm7d;

    iget-object v4, p0, Lm7d;->c:Lwv1;

    iget-byte v6, p0, Lm7d;->e:B

    if-eqz v6, :cond_17c

    if-eq v6, v5, :cond_149

    if-ne v6, v2, :cond_183

    iget-object v1, p0, Lm7d;->d:Li7d;

    if-eqz v1, :cond_183

    iget-object v1, v4, Lwv1;->b:Lb6h;

    invoke-interface {v1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorm;

    if-eqz v1, :cond_13a

    check-cast v1, Lx5f;

    invoke-virtual {v1, v0}, Lx5f;->L0(Lkr0;)V

    :cond_13a
    iget-object v0, p0, Lm7d;->d:Li7d;

    iget-object v0, v0, Li7d;->k:Lvl6;

    if-eqz v0, :cond_183

    iget-object v0, v0, Lvl6;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->I(I)V

    goto :goto_183

    :cond_149
    iget-object v2, p0, Lm7d;->d:Li7d;

    if-eqz v2, :cond_183

    iget-object v2, v4, Lwv1;->b:Lb6h;

    invoke-interface {v2}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorm;

    if-eqz v2, :cond_15c

    check-cast v2, Lx5f;

    invoke-virtual {v2, v0}, Lx5f;->L0(Lkr0;)V

    :cond_15c
    iget-object v0, p0, Lm7d;->d:Li7d;

    iget-object v2, v0, Li7d;->m:Lh7d;

    if-eqz v2, :cond_183

    new-instance v4, Ly0a;

    const/16 v5, 0x13

    invoke-direct {v4, v2, v5}, Ly0a;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v0, Li7d;->l:Lpt1;

    iget-object v2, v2, Lpt1;->d:Ljava/lang/Object;

    check-cast v2, Lor2;

    iget-object v2, v2, Lor2;->c:Landroid/view/View;

    check-cast v2, Landroid/widget/LinearLayout;

    new-instance v5, Lzr9;

    invoke-direct {v5, v0, v4, v1}, Lzr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2, v5}, Lq9n;->A(Landroid/view/View;Ljava/lang/Runnable;)V

    goto :goto_183

    :cond_17c
    iget-object v0, p0, Lm7d;->d:Li7d;

    if-eqz v0, :cond_183

    invoke-virtual {v0}, Li7d;->o0()V

    :cond_183
    :goto_183
    iput-object v3, p0, Lm7d;->d:Li7d;

    return-void

    :pswitch_186
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lc5d;

    iget-object p0, p0, Lc5d;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/ad/mraid/MRAIDView;

    const-string v0, "mraid.setPlacementType(\'inline\');"

    invoke-virtual {p0, v0}, Lcom/opera/ad/mraid/MRAIDView;->D(Ljava/lang/String;)V

    const/4 v0, 0x6

    invoke-static {v0}, Lsko;->w(I)Ljava/lang/String;

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    const-string v1, "mraid.logLevel = mraid.LogLevelEnum.NONE;"

    new-instance v2, Lz4d;

    invoke-direct {v2, v4}, Lz4d;-><init>(B)V

    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    invoke-virtual {p0}, Lcom/opera/ad/mraid/MRAIDView;->z()V

    invoke-virtual {p0}, Lcom/opera/ad/mraid/MRAIDView;->x()V

    invoke-virtual {p0}, Lcom/opera/ad/mraid/MRAIDView;->I()V

    const-string v0, "mraid.fireReadyEvent();"

    invoke-virtual {p0, v0}, Lcom/opera/ad/mraid/MRAIDView;->D(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/opera/ad/mraid/MRAIDView;->D:Z

    if-eqz v0, :cond_1b8

    invoke-virtual {p0}, Lcom/opera/ad/mraid/MRAIDView;->J()V

    :cond_1b8
    return-void

    :pswitch_1b9
    invoke-direct {p0}, Ldnb;->a()V

    return-void

    :pswitch_1bd
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lf3d;

    iget-object v0, p0, Lf3d;->B:Ljava/util/concurrent/Semaphore;

    iget-object v1, p0, Lf3d;->l:Lgi5;

    if-eqz v1, :cond_1dc

    :try_start_1c7
    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->acquire()V

    iget-object p0, p0, Lf3d;->b:Lp3d;

    invoke-virtual {p0}, Lp3d;->b()F

    move-result p0

    invoke-virtual {v1, p0}, Lgi5;->q(F)V
    :try_end_1d3
    .catch Ljava/lang/InterruptedException; {:try_start_1c7 .. :try_end_1d3} :catch_1d9
    .catchall {:try_start_1c7 .. :try_end_1d3} :catchall_1d4

    goto :goto_1d9

    :catchall_1d4
    move-exception p0

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    throw p0

    :catch_1d9
    :goto_1d9
    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    :cond_1dc
    return-void

    :pswitch_1dd
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lg1d;

    invoke-virtual {p0, v2}, Lg1d;->b(I)V

    return-void

    :pswitch_1e5
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Layc;

    invoke-interface {p0}, Layc;->stop()V

    return-void

    :pswitch_1ed
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Ltxc;

    iput-object v3, p0, Ltxc;->f:Ldnb;

    invoke-virtual {p0, v3}, Ltxc;->onLocationChanged(Landroid/location/Location;)V

    return-void

    :pswitch_1f7
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Ldx3;

    sget-object v0, Ldp7;->a:Ld06;

    iget-object v0, v0, Ld06;->a:Ljava/lang/Object;

    check-cast v0, Lz8b;

    iget-object v0, v0, Lz8b;->a:Ljava/lang/Object;

    check-cast v0, Lua7;

    if-eqz v0, :cond_20a

    invoke-virtual {v0, p0}, Lua7;->C(Lxd5;)V

    :cond_20a
    return-void

    :pswitch_20b
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lunb;

    if-eqz p0, :cond_214

    invoke-interface {p0, v3}, Lunb;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_214
    return-void

    :pswitch_215
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lp12;

    iget-object v0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast v0, Lwg4;

    if-eqz v0, :cond_257

    invoke-virtual {p0}, Lp12;->A()V

    iget-object v0, p0, Lp12;->f:Ljava/lang/Object;

    check-cast v0, Lcdc;

    iget-object p0, p0, Lp12;->h:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashSet;

    iget-object v1, v0, Lcdc;->a:Ljava/lang/Object;

    monitor-enter v1

    :try_start_22d
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_231
    :goto_231
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_251

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lxn2;

    iget-object v3, v0, Lcdc;->b:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_231

    iget-object v3, v0, Lcdc;->b:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lxcc;

    invoke-virtual {v0, v2}, Lcdc;->l(Lxcc;)V

    goto :goto_231

    :cond_251
    monitor-exit v1

    goto :goto_257

    :goto_253
    monitor-exit v1
    :try_end_254
    .catchall {:try_start_22d .. :try_end_254} :catchall_255

    throw p0

    :catchall_255
    move-exception p0

    goto :goto_253

    :cond_257
    :goto_257
    return-void

    :pswitch_258
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lkm5;

    iput-boolean v5, p0, Lkm5;->a:Z

    iget-object p0, p0, Lkm5;->c:Ljava/lang/Object;

    check-cast p0, Leek;

    invoke-virtual {p0}, Leek;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_266
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lf1p;

    iget-object v0, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast v0, Lumi;

    new-instance v2, Lrml;

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v2, v3, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lnna;

    invoke-direct {v0, p0, v1}, Lnna;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    sget-object v0, Lpn7;->b:Lon7;

    sget-object v0, Lun7;->e:Lun7;

    invoke-static {v5, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lplk;->q(J)V

    return-void

    :pswitch_28a
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Ldac;

    iget-object p0, p0, Ldac;->b:Lcac;

    const-string v0, "UTM source"

    iget-object v1, p0, Lcac;->a:Landroid/content/Context;

    const/4 v2, 0x4

    invoke-static {v5, v1}, Lvtp;->G(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2ae

    iget-object v2, p0, Lcac;->b:Le84;

    invoke-virtual {v2, v0, v1}, Le84;->c(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2ae

    invoke-static {v0, v1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcac;->b(Ljava/util/Map;)V

    :cond_2ae
    return-void

    :pswitch_2af
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Li9c;

    iget-object v0, p0, Li9c;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v2, v4

    :cond_2bc
    if-ge v2, v1, :cond_2cb

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lh9c;

    iget-boolean v3, v3, Lh9c;->f:Z

    if-nez v3, :cond_2bc

    goto :goto_2cc

    :cond_2cb
    move v4, v5

    :goto_2cc
    iget-boolean v0, p0, Li9c;->b:Z

    if-eq v0, v4, :cond_2df

    iput-boolean v4, p0, Li9c;->b:Z

    iget-object p0, p0, Li9c;->g:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    if-eqz p0, :cond_2df

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_2df
    return-void

    :pswitch_2e0
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lp1c;

    iget-boolean v0, p0, Lp1c;->r:Z

    if-nez v0, :cond_2ed

    iput-boolean v5, p0, Lp1c;->r:Z

    invoke-virtual {p0}, Lp1c;->f()V

    :cond_2ed
    return-void

    :pswitch_2ee
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Ltvb;

    invoke-interface {p0}, Ltvb;->run()V

    return-void

    :pswitch_2f6
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lonb;

    iget-object v0, p0, Lonb;->c:Ljava/util/ArrayDeque;

    monitor-enter v0

    :try_start_2fd
    iget-boolean v1, p0, Lonb;->d:Z

    if-eqz v1, :cond_303

    monitor-exit v0

    goto :goto_343

    :cond_303
    iget-object v1, p0, Lonb;->c:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->pollFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    if-eqz v1, :cond_30f

    move v2, v5

    goto :goto_310

    :cond_30f
    move v2, v4

    :goto_310
    iput-boolean v2, p0, Lonb;->d:Z

    monitor-exit v0
    :try_end_313
    .catchall {:try_start_2fd .. :try_end_313} :catchall_346

    :goto_313
    if-eqz v1, :cond_343

    :try_start_315
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V
    :try_end_318
    .catchall {:try_start_315 .. :try_end_318} :catchall_330

    iget-object v0, p0, Lonb;->c:Ljava/util/ArrayDeque;

    monitor-enter v0

    :try_start_31b
    iget-object v1, p0, Lonb;->c:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->pollFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    if-eqz v1, :cond_327

    move v2, v5

    goto :goto_328

    :cond_327
    move v2, v4

    :goto_328
    iput-boolean v2, p0, Lonb;->d:Z

    monitor-exit v0

    goto :goto_313

    :goto_32c
    monitor-exit v0
    :try_end_32d
    .catchall {:try_start_31b .. :try_end_32d} :catchall_32e

    throw p0

    :catchall_32e
    move-exception p0

    goto :goto_32c

    :catchall_330
    move-exception v0

    iget-object v1, p0, Lonb;->c:Ljava/util/ArrayDeque;

    monitor-enter v1

    :try_start_334
    iput-boolean v4, p0, Lonb;->d:Z
    :try_end_336
    .catchall {:try_start_334 .. :try_end_336} :catchall_341

    :try_start_336
    iget-object v2, p0, Lonb;->a:Ljnb;

    iget-object p0, p0, Lonb;->b:Ldnb;

    invoke-virtual {v2, p0}, Ljnb;->execute(Ljava/lang/Runnable;)V
    :try_end_33d
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_336 .. :try_end_33d} :catch_33d
    .catchall {:try_start_336 .. :try_end_33d} :catchall_341

    :catch_33d
    :try_start_33d
    monitor-exit v1
    :try_end_33e
    .catchall {:try_start_33d .. :try_end_33e} :catchall_341

    throw v0

    :goto_33f
    :try_start_33f
    monitor-exit v1
    :try_end_340
    .catchall {:try_start_33f .. :try_end_340} :catchall_341

    throw p0

    :catchall_341
    move-exception p0

    goto :goto_33f

    :cond_343
    :goto_343
    return-void

    :goto_344
    :try_start_344
    monitor-exit v0
    :try_end_345
    .catchall {:try_start_344 .. :try_end_345} :catchall_346

    throw p0

    :catchall_346
    move-exception p0

    goto :goto_344

    :pswitch_348
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lmnb;

    :try_start_34c
    iget-object v0, p0, Lmnb;->d:Lpnb;

    iget-object v1, v0, Lpnb;->u:Lipe;

    iget v0, v0, Lpnb;->t:I

    int-to-long v2, v0

    invoke-virtual {p0}, Lmnb;->a()Ly16;

    move-result-object p0

    invoke-virtual {v1, v2, v3, p0}, Lipe;->P(JLy16;)V
    :try_end_35a
    .catch Ljava/lang/RuntimeException; {:try_start_34c .. :try_end_35a} :catch_35a

    :catch_35a
    return-void

    :pswitch_35b
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lgl6;

    const-string v0, "Cronet JavaUrlRequest.AsyncUrlRequestCallback#executeOnFallbackExecutor  onFailed running callback"

    invoke-static {v0}, Llni;->h(Ljava/lang/String;)V

    :try_start_364
    invoke-virtual {p0}, Lgl6;->run()V
    :try_end_367
    .catchall {:try_start_364 .. :try_end_367} :catchall_36b

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_36b
    move-exception p0

    :try_start_36c
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_36f
    .catchall {:try_start_36c .. :try_end_36f} :catchall_370

    goto :goto_374

    :catchall_370
    move-exception v0

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_374
    throw p0

    :pswitch_375
    iget-object p0, p0, Ldnb;->b:Ljava/lang/Object;

    check-cast p0, Lfnb;

    iget v0, p0, Lfnb;->h:I

    add-int/2addr v0, v5

    iput v0, p0, Lfnb;->h:I

    return-void

    nop

    :pswitch_data_380
    .packed-switch 0x0
        :pswitch_375
        :pswitch_35b
        :pswitch_348
        :pswitch_2f6
        :pswitch_2ee
        :pswitch_2e0
        :pswitch_2af
        :pswitch_28a
        :pswitch_266
        :pswitch_258
        :pswitch_215
        :pswitch_20b
        :pswitch_1f7
        :pswitch_1ed
        :pswitch_1e5
        :pswitch_1dd
        :pswitch_1bd
        :pswitch_1b9
        :pswitch_186
        :pswitch_117
        :pswitch_10d
        :pswitch_103
        :pswitch_db
        :pswitch_d3
        :pswitch_c9
        :pswitch_70
        :pswitch_60
        :pswitch_23
        :pswitch_13
    .end packed-switch
.end method
