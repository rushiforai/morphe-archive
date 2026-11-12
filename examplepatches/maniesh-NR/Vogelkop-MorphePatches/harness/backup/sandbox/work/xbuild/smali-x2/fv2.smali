.class public final synthetic Lfv2;
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

    iput-byte p2, p0, Lfv2;->a:B

    iput-object p1, p0, Lfv2;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    iget-byte v0, p0, Lfv2;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object p0, p0, Lfv2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2c0

    check-cast p0, Lza4;

    iget-object p0, p0, Lza4;->f:La64;

    invoke-static {p0, v2}, Lsgb;->k(Lnx5;Ljava/util/concurrent/CancellationException;)V

    return-void

    :pswitch_12
    check-cast p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;

    sget v0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->h:I

    iget-object v0, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->b:Lorg/chromium/third_party/android/media/MediaController;

    invoke-virtual {v0}, Lorg/chromium/third_party/android/media/MediaController;->d()V

    iget-object v0, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->a:Landroid/os/Handler;

    iget-object p0, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->f:Lfv2;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :pswitch_25
    check-cast p0, Lr9i;

    invoke-virtual {p0}, Lr9i;->G()Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_34

    :try_start_31
    invoke-virtual {p0}, Ljava/io/File;->delete()Z
    :try_end_34
    .catch Ljava/lang/SecurityException; {:try_start_31 .. :try_end_34} :catch_34

    :catch_34
    :cond_34
    return-void

    :pswitch_35
    check-cast p0, Lw04;

    iput-boolean v3, p0, Lw04;->c:Z

    iget-object v0, p0, Lw04;->d:Lfv2;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-object p0, p0, Lw04;->b:Lx05;

    iget-object v0, p0, Lx05;->d:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    move-result v0

    if-nez v0, :cond_4b

    invoke-virtual {p0}, Lx05;->start()V

    :cond_4b
    return-void

    :pswitch_4c
    check-cast p0, Lcom/opera/android/bubbleview/BubbleView;

    sget v0, Lcom/opera/android/bubbleview/BubbleView;->D:I

    iput-boolean v3, p0, Lcom/opera/android/bubbleview/BubbleView;->y:Z

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_72

    iget-object p0, p0, Lcom/opera/android/bubbleview/BubbleView;->w:Llz3;

    if-eqz p0, :cond_72

    iget-object p0, p0, Llz3;->c:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_62
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_72

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkz3;

    invoke-interface {v0}, Lkz3;->h()V

    goto :goto_62

    :cond_72
    return-void

    :pswitch_73
    check-cast p0, Loc2;

    invoke-virtual {p0}, Loc2;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_79
    check-cast p0, Lbp3;

    iput-boolean v3, p0, Lbp3;->b:Z

    return-void

    :pswitch_7e
    check-cast p0, Lorg/chromium/content/browser/BrowserStartupControllerImpl;

    invoke-virtual {p0, v1}, Lorg/chromium/content/browser/BrowserStartupControllerImpl;->b(I)V

    return-void

    :pswitch_84
    check-cast p0, Lcom/opera/android/browser/BrowserFragment;

    invoke-virtual {p0}, Lcom/opera/android/browser/BrowserFragment;->g0()V

    return-void

    :pswitch_8a
    check-cast p0, Luw3;

    invoke-virtual {p0}, Luw3;->S()V

    return-void

    :pswitch_90
    check-cast p0, Lysj;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    const v0, 0x7f140800

    const/16 v1, 0x9c4

    invoke-static {v0, v1, p0}, Lam2;->i(IILysj;)Lglj;

    move-result-object v0

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, v1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_a3
    check-cast p0, Lks3;

    iget-object v0, p0, Lks3;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/crashhandler/OperaCrashKeys;

    iget-object v2, v0, Lcom/opera/android/crashhandler/OperaCrashKeys;->a:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    move v4, v3

    :goto_ac
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v5

    if-ge v4, v5, :cond_be

    invoke-virtual {v2, v4}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v4, v5}, LJ/N;->MDEEK5$i(ILjava/lang/Object;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_ac

    :cond_be
    iput-boolean v1, v0, Lcom/opera/android/crashhandler/OperaCrashKeys;->b:Z

    iget-object p0, p0, Lks3;->f:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_c8
    :goto_c8
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_ff

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lym8;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lzd2;

    iget-object v4, v1, Lym8;->a:Landroid/content/Context;

    new-instance v5, Ltw2;

    const/16 v6, 0xa

    invoke-direct {v5, v1, v6}, Ltw2;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v2, v4, v0, v5}, Lzd2;-><init>(Landroid/content/Context;Lcom/opera/android/crashhandler/OperaCrashKeys;Ltw2;)V

    new-array v1, v3, [Ljava/lang/Void;

    invoke-static {v2, v1}, Lhe2;->a(Landroid/os/AsyncTask;[Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c8

    iget-object v1, v2, Lzd2;->d:Ljava/lang/Object;

    check-cast v1, Ltw2;

    iget-object v4, v2, Lzd2;->b:Ljava/lang/Object;

    check-cast v4, Landroid/content/Context;

    iget-object v1, v1, Ltw2;->b:Ljava/lang/Object;

    invoke-static {v4}, Lym8;->a(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v2, v1}, Lzd2;->a(Ljava/util/List;)V

    goto :goto_c8

    :cond_ff
    return-void

    :pswitch_100
    check-cast p0, Ljo3;

    iget-object p0, p0, Ljo3;->a:Lcom/opera/android/bar/BottomBar;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    iget-boolean v0, p0, Lcom/opera/android/bar/BottomBar;->f:Z

    if-eqz v0, :cond_114

    iput-boolean v3, p0, Lcom/opera/android/bar/BottomBar;->f:Z

    const/high16 v0, 0x20000

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    :cond_114
    return-void

    :pswitch_115
    check-cast p0, Lne5;

    iput-object v2, p0, Lne5;->f:Ljava/lang/Object;

    iget-object v0, p0, Lne5;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object p0, p0, Lne5;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/bookmarks/h;

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v2

    new-array v4, v1, [Lal3;

    aput-object v2, v4, v3

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Lalo;->u(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-static {p0}, Lalo;->G(Lcom/opera/android/bookmarks/h;)Z

    move-result v2

    if-eqz v2, :cond_150

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->l()Lcom/opera/android/bookmarks/c;

    move-result-object p0

    new-array v1, v1, [Lal3;

    aput-object p0, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lalo;->u(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_150
    return-void

    :pswitch_151
    check-cast p0, Lfn3;

    iget-object p0, p0, Lfn3;->b:Ljava/lang/Object;

    check-cast p0, Lgn3;

    iget-object v0, p0, Lgn3;->i:Ldb;

    iget-object v1, p0, Lgn3;->h:Lzwk;

    invoke-static {v0, v1}, Lxgh;->s(Ldb;Lzwk;)Z

    move-result v0

    if-eqz v0, :cond_18b

    sget-boolean v0, Lxgh;->a:Z

    if-nez v0, :cond_182

    iget-object v0, p0, Lgn3;->s:Lxm3;

    if-eqz v0, :cond_182

    iget-object v0, v0, Lxm3;->e:Lxvj;

    new-instance v1, Lqhc;

    const-wide/16 v4, -0x2

    const-string v2, ""

    invoke-static {v4, v5, v2, v2}, Llkj;->k(JLjava/lang/String;Ljava/lang/String;)Llkj;

    move-result-object v2

    const/16 v4, 0x8

    invoke-direct {v1, v2, v4}, Lqhc;-><init>(Lal3;I)V

    invoke-virtual {v0, v1}, Lxvj;->a(Ljava/lang/Object;)I

    iget-object v0, p0, Lgn3;->s:Lxm3;

    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_182
    iget-boolean v0, p0, Lgn3;->L:Z

    if-eqz v0, :cond_18b

    iput-boolean v3, p0, Lgn3;->L:Z

    invoke-virtual {p0}, Lgn3;->u()V

    :cond_18b
    return-void

    :pswitch_18c
    check-cast p0, Ldn3;

    iget-object v0, p0, Ldn3;->k:Lgn3;

    iget-object v1, v0, Lgn3;->s:Lxm3;

    if-eqz v1, :cond_1a9

    iget-object v1, v0, Lgn3;->i:Ldb;

    iget-object v2, v0, Lgn3;->h:Lzwk;

    sget-boolean v3, Lxgh;->a:Z

    if-nez v3, :cond_1a2

    invoke-static {v1, v2}, Lxgh;->s(Ldb;Lzwk;)Z

    move-result v1

    if-nez v1, :cond_1a9

    :cond_1a2
    iget-object v0, v0, Lgn3;->s:Lxm3;

    iget-object p0, p0, Le7n;->i:Lqhc;

    invoke-virtual {v0, p0}, Lxm3;->K(Lqhc;)V

    :cond_1a9
    return-void

    :pswitch_1aa
    check-cast p0, Ldn3;

    iget-object v0, p0, Ldn3;->k:Lgn3;

    iget-object v2, v0, Lgn3;->s:Lxm3;

    if-eqz v2, :cond_1c1

    iget-object v2, v0, Lgn3;->H:Lsom;

    invoke-virtual {v2, v1}, Lsom;->R(I)Z

    move-result v1

    if-nez v1, :cond_1c1

    iget-object v0, v0, Lgn3;->s:Lxm3;

    iget-object p0, p0, Le7n;->i:Lqhc;

    invoke-virtual {v0, p0}, Lxm3;->K(Lqhc;)V

    :cond_1c1
    return-void

    :pswitch_1c2
    check-cast p0, Lth3;

    iget-boolean v0, p0, Lth3;->e:Z

    if-nez v0, :cond_1cb

    invoke-virtual {p0}, Lth3;->k()V

    :cond_1cb
    return-void

    :pswitch_1cc
    check-cast p0, Lcom/opera/android/settings/BigSwitchButton;

    sget-object v0, Lcom/opera/android/settings/BigSwitchButton;->j:Lk2d;

    iget-object p0, p0, Lcom/opera/android/settings/BigSwitchButton;->a:Lvs;

    iget-object p0, p0, Lvs;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    sget-object v0, Lcom/opera/android/settings/BigSwitchButton;->l:Lk2d;

    invoke-virtual {p0, v0, v2}, Lcom/opera/android/widget/LottieAnimationView;->t(Lk2d;Ljava/lang/Runnable;)V

    return-void

    :pswitch_1dc
    check-cast p0, Ly93;

    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :pswitch_1e2
    check-cast p0, Lf9c;

    iget-object p0, p0, Lf9c;->s:Ljava/lang/Object;

    check-cast p0, Lzu;

    iget-object p0, p0, Lzu;->c:Lcom/opera/android/custom_views/OperaTextInputEditText;

    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lq9n;->G(Landroid/content/Context;Landroid/view/View;)Z

    return-void

    :pswitch_1f4
    check-cast p0, Lf93;

    invoke-virtual {p0}, Lf93;->e()V

    return-void

    :pswitch_1fa
    check-cast p0, Lwue;

    iput-boolean v3, p0, Lwue;->d:Z

    iget-boolean v0, p0, Lwue;->e:Z

    if-nez v0, :cond_239

    new-instance v0, La53;

    invoke-direct {v0, p0}, La53;-><init>(Lwue;)V

    iput-object v0, p0, Lwue;->c:La53;

    iget-object v1, p0, Lwue;->b:Ltw2;

    iget-object v1, v1, Ltw2;->b:Ljava/lang/Object;

    check-cast v1, Lxqe;

    iget-object v1, v1, Lxqe;->b:Lh7f;

    invoke-virtual {v1, v0}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object v0, p0, Lwue;->a:Lh7f;

    new-instance v1, Lg7f;

    invoke-direct {v1, v0}, Lg7f;-><init>(Lh7f;)V

    :goto_21b
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_239

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrw8;

    iget-object v2, p0, Lwue;->c:La53;

    iget-object v2, v2, La53;->a:Lwue;

    iget-object v2, v2, Lwue;->b:Ltw2;

    iget-object v2, v2, Ltw2;->b:Ljava/lang/Object;

    check-cast v2, Lxqe;

    invoke-virtual {v2}, Lxqe;->a()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v0, v2}, Lrw8;->a(Ljava/util/List;)V

    goto :goto_21b

    :cond_239
    return-void

    :pswitch_23a
    check-cast p0, Lr43;

    iget-object v0, p0, Lp43;->d:Lv84;

    if-eqz v0, :cond_245

    invoke-interface {v0}, Lv84;->cancel()V

    iput-object v2, p0, Lp43;->d:Lv84;

    :cond_245
    iget-object v0, p0, Lp43;->b:Lq65;

    invoke-virtual {v0}, Ln1;->S()V

    iget-boolean v0, p0, Lp43;->e:Z

    if-nez v0, :cond_257

    invoke-virtual {p0}, Lp43;->b()Lokhttp3/internal/connection/RealCall;

    move-result-object v0

    iput-object v0, p0, Lp43;->d:Lv84;

    invoke-interface {v0, p0}, Lv84;->enqueue(Lf94;)V

    :cond_257
    return-void

    :pswitch_258
    check-cast p0, Lp43;

    iget-boolean v0, p0, Lp43;->e:Z

    if-nez v0, :cond_267

    invoke-virtual {p0}, Lp43;->b()Lokhttp3/internal/connection/RealCall;

    move-result-object v0

    iput-object v0, p0, Lp43;->d:Lv84;

    invoke-interface {v0, p0}, Lv84;->enqueue(Lf94;)V

    :cond_267
    return-void

    :pswitch_268
    check-cast p0, Lzz2;

    iget-boolean v0, p0, Lzz2;->a:Z

    if-nez v0, :cond_274

    invoke-virtual {p0, v3}, Lzz2;->a(Z)V

    invoke-virtual {p0}, Lzz2;->b()V

    :cond_274
    return-void

    :pswitch_275
    check-cast p0, Lxz2;

    iget-object p0, p0, Lxz2;->d:Ljava/lang/Object;

    check-cast p0, Lyz2;

    iget-boolean v0, p0, Lzz2;->a:Z

    if-nez v0, :cond_285

    invoke-virtual {p0, v3}, Lyz2;->a(Z)V

    invoke-virtual {p0}, Lyz2;->b()V

    :cond_285
    iget-object v0, p0, Lyz2;->e:Landroid/view/ViewTreeObserver;

    iget-object v1, p0, Lyz2;->d:Lxz2;

    if-eqz v1, :cond_298

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_296

    iget-object v1, p0, Lyz2;->d:Lxz2;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    :cond_296
    iput-object v2, p0, Lyz2;->d:Lxz2;

    :cond_298
    return-void

    :pswitch_299
    check-cast p0, Lwz2;

    iget-boolean v0, p0, Lzz2;->a:Z

    if-nez v0, :cond_2a5

    invoke-virtual {p0, v3}, Lwz2;->a(Z)V

    invoke-virtual {p0}, Lwz2;->b()V

    :cond_2a5
    return-void

    :pswitch_2a6
    check-cast p0, Lhv2;

    iput-boolean v3, p0, Lhv2;->i:Z

    invoke-virtual {p0}, Lhv2;->e()V

    return-void

    :pswitch_2ae
    check-cast p0, Lgv2;

    iget-object v0, p0, Lgv2;->a:Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {p0, v0}, Lgv2;->a(Lcom/opera/android/autofill/AutofillManager;)Lkotlin/jvm/functions/Function1;

    move-result-object v0

    new-instance v1, Liu2;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Liu2;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_data_2c0
    .packed-switch 0x0
        :pswitch_2ae
        :pswitch_2a6
        :pswitch_299
        :pswitch_275
        :pswitch_268
        :pswitch_258
        :pswitch_23a
        :pswitch_1fa
        :pswitch_1f4
        :pswitch_1e2
        :pswitch_1dc
        :pswitch_1cc
        :pswitch_1c2
        :pswitch_1aa
        :pswitch_18c
        :pswitch_151
        :pswitch_115
        :pswitch_100
        :pswitch_a3
        :pswitch_90
        :pswitch_8a
        :pswitch_84
        :pswitch_7e
        :pswitch_79
        :pswitch_73
        :pswitch_4c
        :pswitch_35
        :pswitch_25
        :pswitch_12
    .end packed-switch
.end method
