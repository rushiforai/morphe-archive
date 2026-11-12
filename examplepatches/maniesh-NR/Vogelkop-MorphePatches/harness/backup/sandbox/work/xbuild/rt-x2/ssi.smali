.class public final Lssi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lih4;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    .line 17
    const/16 v0, 0xf

    iput-byte v0, p0, Lssi;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 15
    iput-byte p2, p0, Lssi;->a:B

    iput-object p1, p0, Lssi;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 16
    iput-byte p3, p0, Lssi;->a:B

    iput-object p2, p0, Lssi;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lpno;)V
    .registers 3

    const/16 v0, 0x1a

    iput-byte v0, p0, Lssi;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iget-object p1, p1, Lpno;->g:Landroid/webkit/WebView;

    .line 14
    iput-object p1, p0, Lssi;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Luuj;)V
    .registers 3

    const/16 v0, 0x18

    iput-byte v0, p0, Lssi;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lssi;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 11

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    :try_start_2
    iget-object v2, p0, Lssi;->b:Ljava/lang/Object;

    check-cast v2, Lb2j;

    iget-object v2, v2, Lb2j;->a:Ljava/util/ArrayDeque;

    monitor-enter v2
    :try_end_9
    .catchall {:try_start_2 .. :try_end_9} :catchall_54

    const/4 v3, 0x1

    if-nez v0, :cond_23

    :try_start_c
    iget-object v0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast v0, Lb2j;

    iget v4, v0, Lb2j;->d:I

    const/4 v5, 0x4

    if-ne v4, v5, :cond_19

    monitor-exit v2

    if-eqz v1, :cond_41

    goto :goto_3a

    :cond_19
    iget-wide v6, v0, Lb2j;->e:J

    const-wide/16 v8, 0x1

    add-long/2addr v6, v8

    iput-wide v6, v0, Lb2j;->e:J

    iput v5, v0, Lb2j;->d:I

    move v0, v3

    :cond_23
    iget-object v4, p0, Lssi;->b:Ljava/lang/Object;

    check-cast v4, Lb2j;

    iget-object v4, v4, Lb2j;->a:Ljava/util/ArrayDeque;

    invoke-virtual {v4}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Runnable;

    if-nez v4, :cond_42

    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lb2j;

    iput v3, p0, Lb2j;->d:I

    monitor-exit v2
    :try_end_38
    .catchall {:try_start_c .. :try_end_38} :catchall_52

    if-eqz v1, :cond_41

    :goto_3a
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    :cond_41
    return-void

    :cond_42
    :try_start_42
    monitor-exit v2
    :try_end_43
    .catchall {:try_start_42 .. :try_end_43} :catchall_52

    :try_start_43
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v2
    :try_end_47
    .catchall {:try_start_43 .. :try_end_47} :catchall_54

    or-int/2addr v1, v2

    :try_start_48
    invoke-interface {v4}, Ljava/lang/Runnable;->run()V
    :try_end_4b
    .catch Ljava/lang/RuntimeException; {:try_start_48 .. :try_end_4b} :catch_4c
    .catchall {:try_start_48 .. :try_end_4b} :catchall_54

    goto :goto_2

    :catch_4c
    :try_start_4c
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_4f
    .catchall {:try_start_4c .. :try_end_4f} :catchall_54

    goto :goto_2

    :goto_50
    :try_start_50
    monitor-exit v2
    :try_end_51
    .catchall {:try_start_50 .. :try_end_51} :catchall_52

    :try_start_51
    throw p0
    :try_end_52
    .catchall {:try_start_51 .. :try_end_52} :catchall_54

    :catchall_52
    move-exception p0

    goto :goto_50

    :catchall_54
    move-exception p0

    if-eqz v1, :cond_5e

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    :cond_5e
    throw p0
.end method

.method public final cancel()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lssi;->b:Ljava/lang/Object;

    return-void
.end method

.method public final run()V
    .registers 10

    iget-byte v0, p0, Lssi;->a:B

    const/4 v1, 0x4

    const/4 v2, 0x2

    const/4 v3, -0x1

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x3

    const/4 v7, 0x0

    const/4 v8, 0x0

    packed-switch v0, :pswitch_data_3ae

    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Ltko;

    iget-object p0, p0, Ltko;->b:Ljava/lang/Object;

    check-cast p0, Lg7m;

    iget-object v0, p0, Lg7m;->k:Ljava/lang/Object;

    check-cast v0, Landroid/os/IInterface;

    if-eqz v0, :cond_30

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v0, Landroid/os/IInterface;

    invoke-interface {v0}, Landroid/os/IInterface;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    iget-object v1, p0, Lg7m;->i:Ljava/lang/Object;

    check-cast v1, Lxip;

    invoke-interface {v0, v1, v8}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z

    iput-object v7, p0, Lg7m;->k:Ljava/lang/Object;

    invoke-virtual {p0}, Lg7m;->r()V

    :cond_30
    iput-boolean v8, p0, Lg7m;->a:Z

    return-void

    :pswitch_33
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lwtm;

    iget-object v0, p0, Lwtm;->a:Ljava/lang/Object;

    check-cast v0, Landroid/app/Activity;

    iget-object v1, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast v1, Landroid/view/View;

    if-eqz v1, :cond_9d

    invoke-virtual {v0}, Landroid/app/Activity;->isInPictureInPictureMode()Z

    move-result v2

    if-eqz v2, :cond_5c

    iget-object v0, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_9d

    iget-object v1, p0, Lwtm;->a:Ljava/lang/Object;

    check-cast v1, Landroid/app/Activity;

    new-instance v2, Lvr9;

    const/16 v3, 0x1d

    invoke-direct {v2, p0, v0, v3}, Lvr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_9d

    :cond_5c
    :try_start_5c
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager$LayoutParams;

    if-eqz v2, :cond_9d

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0708b0

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    invoke-static {v0}, Lhyg;->s(Landroid/app/Activity;)I

    move-result v5

    int-to-float v5, v5

    const v6, 0x3f19999a    # 0.6f

    mul-float/2addr v5, v6

    float-to-int v5, v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    iput v4, v2, Landroid/view/WindowManager$LayoutParams;->height:I

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget v4, v4, Landroid/content/res/Configuration;->screenWidthDp:I

    const/16 v5, 0x280

    if-le v4, v5, :cond_94

    invoke-static {v0, v5}, Lhyg;->r(Landroid/app/Activity;I)I

    move-result v0

    iput v0, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    goto :goto_96

    :cond_94
    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    :goto_96
    iget-object p0, p0, Lwtm;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/WindowManager;

    invoke-interface {p0, v1, v2}, Landroid/view/ViewManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_9d
    .catch Ljava/lang/RuntimeException; {:try_start_5c .. :try_end_9d} :catch_9d

    :catch_9d
    :cond_9d
    :goto_9d
    return-void

    :pswitch_9e
    iget-object v0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast v0, Louo;

    iget-object v1, v0, Louo;->d:Landroid/media/AudioManager;

    invoke-virtual {v1, v6}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v2

    invoke-virtual {v1, v6}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v1

    iget-object v3, v0, Louo;->h:Ljava/lang/Object;

    check-cast v3, Lcpj;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-lez v1, :cond_c2

    if-lez v2, :cond_c2

    int-to-float v2, v2

    int-to-float v1, v1

    div-float v5, v2, v1

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v2, v5, v1

    if-lez v2, :cond_c2

    move v5, v1

    :cond_c2
    iget-object v1, v0, Louo;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1, v8}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v1, v0, Louo;->e:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    cmpl-float v1, v1, v5

    if-eqz v1, :cond_e5

    iget-object v0, v0, Louo;->b:Landroid/os/Handler;

    new-instance v1, Lhto;

    invoke-direct {v1, p0, v5, v8}, Lhto;-><init>(Ljava/lang/Runnable;FB)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_e5
    return-void

    :pswitch_e6
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Landroid/webkit/WebView;

    invoke-virtual {p0}, Landroid/webkit/WebView;->destroy()V

    return-void

    :pswitch_ee
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lhoo;

    iget-object p0, p0, Lhoo;->d:Lmjo;

    new-instance v0, Lumo;

    const-string v1, "timeout"

    invoke-direct {v0, v3, v1}, Lfoo;-><init>(ILjava/lang/String;)V

    new-instance v1, Llio;

    invoke-direct {v1, v0}, Llio;-><init>(Ljava/lang/Exception;)V

    invoke-interface {p0, v1}, Lmjo;->d(Lqio;)V

    return-void

    :pswitch_104
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Luuj;

    iget-object v0, p0, Luuj;->c:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewGroup;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Luuj;->c:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Luuj;->c:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iput-object v7, p0, Luuj;->c:Ljava/lang/Object;

    return-void

    :pswitch_125
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lsgi;

    iput-boolean v8, p0, Lsgi;->c:Z

    iget-object p0, p0, Lsgi;->e:Ljava/lang/Object;

    check-cast p0, Lrdn;

    invoke-virtual {p0}, Lrdn;->run()V

    return-void

    :pswitch_133
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lcdn;

    iget-object v0, p0, Lcdn;->m:Ltvk;

    iget-object v1, p0, Lcdn;->h:Leej;

    iget-object v3, p0, Lcdn;->g:Lk6l;

    iget v5, p0, Lcdn;->l:I

    if-eq v5, v4, :cond_19a

    iget-object v6, p0, Lcdn;->o:Lddn;

    if-nez v6, :cond_19a

    if-ne v5, v2, :cond_161

    iget-object v5, p0, Lcdn;->q:Lcom/opera/android/browser/chromium/NetworkTester$NonProxiedTest;

    if-nez v5, :cond_161

    invoke-virtual {p0}, Lcdn;->R()Lydn;

    move-result-object v5

    iget-object v5, v5, Lydn;->c:Lgfn;

    invoke-interface {v5}, Lgfn;->isEnabled()Z

    move-result v5

    if-nez v5, :cond_161

    new-instance v0, Lcom/opera/android/browser/chromium/NetworkTester$NonProxiedTest;

    iget-object v1, p0, Lcdn;->p:Ldcl;

    invoke-direct {v0, v1}, Lcom/opera/android/browser/chromium/NetworkTester$NonProxiedTest;-><init>(Ldcl;)V

    iput-object v0, p0, Lcdn;->q:Lcom/opera/android/browser/chromium/NetworkTester$NonProxiedTest;

    goto :goto_19a

    :cond_161
    iget v5, p0, Lcdn;->l:I

    iput v4, p0, Lcdn;->l:I

    iget-object v4, v3, Lk6l;->o:Lb2l;

    if-eqz v4, :cond_19a

    invoke-virtual {p0}, Lcdn;->R()Lydn;

    move-result-object v4

    iget-object v4, v4, Lydn;->c:Lgfn;

    invoke-interface {v4}, Lgfn;->isEnabled()Z

    move-result v4

    if-eqz v4, :cond_189

    if-ne v5, v2, :cond_19a

    iget-object v2, v3, Lk6l;->o:Lb2l;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Ltg7;

    invoke-direct {v3, v5, v0}, Ltg7;-><init>(ILtvk;)V

    iget-object v0, v1, Leej;->b:Laal;

    invoke-virtual {v0, v3, v2, v8}, Laal;->S(Lo93;Lb2l;Z)V

    iput-object v3, p0, Lcdn;->o:Lddn;

    goto :goto_19a

    :cond_189
    iget-object v2, v3, Lk6l;->o:Lb2l;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Ledn;

    invoke-direct {v3, v5, v0}, Ledn;-><init>(ILtvk;)V

    iget-object v0, v1, Leej;->b:Laal;

    invoke-virtual {v0, v3, v2}, Laal;->R(Lcej;Lb2l;)V

    iput-object v3, p0, Lcdn;->o:Lddn;

    :cond_19a
    :goto_19a
    return-void

    :pswitch_19b
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {p0, v8}, Landroidx/viewpager/widget/ViewPager;->setScrollState(I)V

    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->populate()V

    return-void

    :pswitch_1a6
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lx5n;

    invoke-virtual {p0, v8}, Lx5n;->m(I)V

    return-void

    :pswitch_1ae
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Li3n;

    iput-boolean v8, p0, Li3n;->G:Z

    iget-object v0, p0, Li3n;->i:Landroid/hardware/camera2/CameraDevice;

    if-eqz v0, :cond_1c5

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraDevice;->close()V

    invoke-virtual {p0, v6}, Li3n;->i(I)V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Li3n;->s:Landroid/graphics/Rect;

    :cond_1c5
    return-void

    :pswitch_1c6
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lpom;

    invoke-virtual {p0}, Lpom;->S()V

    invoke-virtual {p0, v8}, Lpom;->T(I)V

    return-void

    :pswitch_1d1
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Ln9h;

    iget-object p0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p0, Lm6m;

    iput-object v7, p0, Lm6m;->e:Lk6m;

    return-void

    :pswitch_1dc
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lg6m;

    iget-object p0, p0, Lg6m;->e:Liuh;

    iget-object v0, p0, Liuh;->c:Ljava/lang/Object;

    check-cast v0, Lwtm;

    new-instance v1, Lzto;

    invoke-direct {v1, p0}, Lqno;-><init>(Liuh;)V

    iput-object v0, v1, Lqno;->a:Lwtm;

    iget-object p0, v0, Lwtm;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayDeque;

    invoke-virtual {p0, v1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    iget-object v1, v0, Lwtm;->c:Ljava/lang/Object;

    check-cast v1, Lqno;

    if-nez v1, :cond_20d

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqno;

    iput-object p0, v0, Lwtm;->c:Ljava/lang/Object;

    if-eqz p0, :cond_20d

    iget-object v0, v0, Lwtm;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/ThreadPoolExecutor;

    new-array v1, v8, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_20d
    return-void

    :pswitch_20e
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lwe9;

    if-eqz p0, :cond_217

    invoke-virtual {p0}, Lwe9;->run()V

    :cond_217
    return-void

    :pswitch_218
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lrzg;

    invoke-virtual {p0}, Lrzg;->g()V

    return-void

    :pswitch_220
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lusl;

    iget-object v0, p0, Lusl;->b:Lsp1;

    invoke-virtual {p0}, Lusl;->w()Litd;

    move-result-object p0

    if-eqz p0, :cond_22e

    move-object v1, p0

    goto :goto_22f

    :cond_22e
    move-object v1, v7

    :goto_22f
    if-eqz v1, :cond_234

    invoke-virtual {v1}, Litd;->w()V

    :cond_234
    :try_start_234
    invoke-virtual {p0}, Litd;->clear()V

    invoke-virtual {v0, v8, p0}, Lsp1;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result v2

    if-eqz v2, :cond_243

    invoke-virtual {v0, v8, v7, p0}, Lsp1;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v0

    if-nez v0, :cond_246

    :cond_243
    invoke-virtual {p0}, Litd;->clear()V
    :try_end_246
    .catchall {:try_start_234 .. :try_end_246} :catchall_24c

    :cond_246
    if-eqz v1, :cond_24b

    invoke-virtual {v1}, Litd;->v()V

    :cond_24b
    return-void

    :catchall_24c
    move-exception p0

    if-eqz v1, :cond_252

    invoke-virtual {v1}, Litd;->v()V

    :cond_252
    throw p0

    :pswitch_253
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->F()Z

    return-void

    :pswitch_25b
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Ldnl;

    iget-object v0, p0, Ldnl;->d:Lorg/chromium/content/browser/input/ImeAdapterImpl;

    invoke-virtual {v0}, Lorg/chromium/content/browser/input/ImeAdapterImpl;->t()Z

    move-result v0

    if-nez v0, :cond_27b

    invoke-static {}, Lwxe;->n()V

    sget-object v0, Ldnl;->m:Lcnl;

    invoke-static {}, Lwxe;->n()V

    :try_start_26f
    iget-object v1, p0, Ldnl;->g:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/LinkedBlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_274
    .catch Ljava/lang/InterruptedException; {:try_start_26f .. :try_end_274} :catch_274

    :catch_274
    iget-object v0, p0, Ldnl;->e:Landroid/os/Handler;

    iget-object p0, p0, Ldnl;->a:Lyml;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_27b
    return-void

    :pswitch_27c
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/textfield/TextInputLayout;

    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->c:Lz28;

    iget-object p0, p0, Lz28;->f:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    invoke-virtual {p0}, Landroid/view/View;->jumpDrawablesToCurrentState()V

    return-void

    :pswitch_28b
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lxbf;

    iget-object v0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lxbf;->f:Ljava/lang/Object;

    check-cast v1, Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object v1, p0, Lxbf;->g:Ljava/lang/Object;

    check-cast v1, Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object v0, p0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setTranslationX(F)V

    iget-object p0, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;

    invoke-virtual {p0, v5}, Landroid/view/View;->setTranslationX(F)V

    return-void

    :pswitch_2b3
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lcy3;

    iget-object p0, p0, Lcy3;->d:Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;

    invoke-virtual {p0, v8, v8}, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->c(ZZ)V

    return-void

    :pswitch_2bd
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lt0g;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Lt0g;->setValue(Ljava/lang/Object;)V

    return-void

    :pswitch_2c7
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p()Z

    return-void

    :pswitch_2cf
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/SplashView;

    const v0, 0x7f0a0ab3

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0, v8}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_2de
    iget-object v0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast v0, Lsyj;

    iget-object v1, v0, Lsyj;->f:Lsyj;

    monitor-enter v1

    :try_start_2e5
    iget-object v0, v0, Lsyj;->g:Ljava/lang/Long;
    :try_end_2e7
    .catchall {:try_start_2e5 .. :try_end_2e7} :catchall_32b

    monitor-exit v1

    if-eqz v0, :cond_32a

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    const-wide/16 v6, 0x14

    div-long/2addr v2, v6

    sub-long/2addr v2, v0

    long-to-int v0, v2

    iget-object v1, p0, Lssi;->b:Ljava/lang/Object;

    check-cast v1, Lsyj;

    iget-object v2, v1, Lsyj;->a:Lode;

    iget-object v3, v1, Lsyj;->e:Ljava/util/ArrayList;

    monitor-enter v3

    :try_start_300
    iget-object v4, v1, Lsyj;->e:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v0, v4, :cond_314

    iget-object v1, v1, Lsyj;->e:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v5
    :try_end_314
    .catchall {:try_start_300 .. :try_end_314} :catchall_327

    :cond_314
    monitor-exit v3

    iget-object v0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast v0, Lsyj;

    iget v0, v0, Lsyj;->c:F

    mul-float/2addr v5, v0

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v2, v0}, Lekc;->r(Ljava/lang/Object;)V

    invoke-static {p0, v6, v7}, Lvml;->d(Ljava/lang/Runnable;J)V

    goto :goto_32a

    :catchall_327
    move-exception p0

    monitor-exit v3

    throw p0

    :cond_32a
    :goto_32a
    return-void

    :catchall_32b
    move-exception p0

    monitor-exit v1

    throw p0

    :pswitch_32e
    iget-object v0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/SmoothProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgress()I

    move-result v2

    iget v3, v0, Lcom/opera/android/custom_views/SmoothProgressBar;->b:I

    if-eq v2, v3, :cond_358

    iget-boolean v2, v0, Lcom/opera/android/custom_views/SmoothProgressBar;->a:Z

    if-nez v2, :cond_342

    invoke-virtual {v0, v3}, Lcom/opera/android/custom_views/SmoothProgressBar;->a(I)V

    goto :goto_358

    :cond_342
    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgress()I

    move-result v2

    iget v3, v0, Lcom/opera/android/custom_views/SmoothProgressBar;->b:I

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgress()I

    move-result v4

    sub-int/2addr v3, v4

    add-int/2addr v3, v6

    div-int/2addr v3, v1

    add-int/2addr v3, v2

    invoke-virtual {v0, v3}, Lcom/opera/android/custom_views/SmoothProgressBar;->a(I)V

    const-wide/16 v1, 0x10

    invoke-virtual {v0, p0, v1, v2}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    :cond_358
    :goto_358
    return-void

    :pswitch_359
    :try_start_359
    invoke-virtual {p0}, Lssi;->a()V
    :try_end_35c
    .catch Ljava/lang/Error; {:try_start_359 .. :try_end_35c} :catch_35d

    return-void

    :catch_35d
    move-exception v0

    iget-object v1, p0, Lssi;->b:Ljava/lang/Object;

    check-cast v1, Lb2j;

    iget-object v1, v1, Lb2j;->a:Ljava/util/ArrayDeque;

    monitor-enter v1

    :try_start_365
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lb2j;

    iput v4, p0, Lb2j;->d:I

    monitor-exit v1
    :try_end_36c
    .catchall {:try_start_365 .. :try_end_36c} :catchall_36f

    throw v0

    :goto_36d
    :try_start_36d
    monitor-exit v1
    :try_end_36e
    .catchall {:try_start_36d .. :try_end_36e} :catchall_36f

    throw p0

    :catchall_36f
    move-exception p0

    goto :goto_36d

    :pswitch_371
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    sget-boolean v0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->R:Z

    invoke-static {}, Landroid/view/ViewConfiguration;->getDefaultActionModeHideDuration()J

    move-result-wide v0

    iget-object v2, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->b:Landroid/os/Handler;

    iget-object v3, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->k:Lssi;

    const-wide/16 v4, 0x1

    sub-long v4, v0, v4

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    invoke-virtual {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->g()Z

    move-result v2

    if-eqz v2, :cond_391

    iget-object p0, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->n:Landroid/view/ActionMode;

    invoke-virtual {p0, v0, v1}, Landroid/view/ActionMode;->hide(J)V

    :cond_391
    return-void

    :pswitch_392
    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;

    check-cast p0, Lvsi;

    iget v0, p0, Lvsi;->h:I

    sub-int/2addr v0, v4

    iput v0, p0, Lvsi;->h:I

    if-nez v0, :cond_3ad

    iget-object v0, p0, Lvsi;->e:Ltsi;

    if-eqz v0, :cond_3ad

    invoke-virtual {p0, v8}, Lvsi;->c(Z)V

    iget v0, p0, Lvsi;->b:I

    if-eq v0, v2, :cond_3ad

    iget-object v0, p0, Lvsi;->e:Ltsi;

    invoke-virtual {p0, v0}, Lvsi;->f(Ltsi;)V

    :cond_3ad
    return-void

    :pswitch_data_3ae
    .packed-switch 0x0
        :pswitch_392
        :pswitch_371
        :pswitch_359
        :pswitch_32e
        :pswitch_2de
        :pswitch_2cf
        :pswitch_2c7
        :pswitch_2bd
        :pswitch_2b3
        :pswitch_28b
        :pswitch_27c
        :pswitch_25b
        :pswitch_253
        :pswitch_220
        :pswitch_218
        :pswitch_20e
        :pswitch_1dc
        :pswitch_1d1
        :pswitch_1c6
        :pswitch_1ae
        :pswitch_1a6
        :pswitch_19b
        :pswitch_133
        :pswitch_125
        :pswitch_104
        :pswitch_ee
        :pswitch_e6
        :pswitch_9e
        :pswitch_33
    .end packed-switch
.end method
