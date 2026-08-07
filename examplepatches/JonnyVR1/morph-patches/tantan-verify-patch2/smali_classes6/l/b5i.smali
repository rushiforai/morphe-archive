.class public Ll/b5i;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile i:Ll/b5i;

.field public static j:Lcom/p1/mobile/putong/data/User;


# instance fields
.field public final a:Ll/byd0;

.field public b:Ll/l4g0;

.field public c:Landroid/widget/PopupWindow;

.field public d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

.field public e:Lcom/p1/mobile/putong/feed/data/StateQuestion;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/Runnable;

.field public h:Z


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/byd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "feed_state_post_guide_pop_dialog_last_show_time_"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-wide/16 v2, 0x0

    .line 29
    .line 30
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/b5i;->a:Ll/byd0;

    .line 38
    .line 39
    new-instance v0, Ll/b5i$a;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/b5i$a;-><init>(Ll/b5i;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/b5i;->g:Ljava/lang/Runnable;

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    iput-boolean v0, p0, Ll/b5i;->h:Z

    .line 48
    .line 49
    return-void
.end method

.method public static synthetic a(Ll/b5i;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/b5i;->u()V

    return-void
.end method

.method public static synthetic b(Ll/b5i;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b5i;->v(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static synthetic c(Ll/b5i;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b5i;->r(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/b5i;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b5i;->q(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic e(Ll/b5i;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b5i;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/b5i;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b5i;->t(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic g(Ll/b5i;)Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    return-object p0
.end method

.method public static bridge synthetic h(Ll/b5i;)Landroid/widget/PopupWindow;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b5i;->c:Landroid/widget/PopupWindow;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/b5i;Landroid/widget/PopupWindow;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b5i;->c:Landroid/widget/PopupWindow;

    return-void
.end method

.method public static m()Ll/b5i;
    .locals 2

    .line 1
    sget-object v0, Ll/b5i;->i:Ll/b5i;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/b5i;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/b5i;->i:Ll/b5i;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/b5i;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/b5i;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/b5i;->i:Ll/b5i;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sput-object v1, Ll/b5i;->j:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception v1

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    :goto_0
    monitor-exit v0

    .line 33
    goto :goto_2

    .line 34
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    throw v1

    .line 36
    :cond_1
    :goto_2
    sget-object v0, Ll/b5i;->i:Ll/b5i;

    .line 37
    .line 38
    return-object v0
.end method


# virtual methods
.method public final A(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p0, p1}, Ll/b5i;->p(Lcom/p1/mobile/android/app/Act;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/b5i;->c:Landroid/widget/PopupWindow;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_1
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_2
    iget-object v0, p0, Ll/b5i;->a:Ll/byd0;

    .line 20
    .line 21
    invoke-static {}, Ll/pzi0;->o()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/b5i;->g:Ljava/lang/Runnable;

    .line 33
    .line 34
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/b5i;->g:Ljava/lang/Runnable;

    .line 38
    .line 39
    const-wide/16 v1, 0x1388

    .line 40
    .line 41
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/b5i;->y()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/b5i;->e:Lcom/p1/mobile/putong/feed/data/StateQuestion;

    .line 48
    .line 49
    if-nez v0, :cond_3

    .line 50
    .line 51
    :goto_0
    return-void

    .line 52
    :cond_3
    iget-object v0, p0, Ll/b5i;->c:Landroid/widget/PopupWindow;

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    const/4 v2, 0x0

    .line 63
    invoke-virtual {p0, p1}, Ll/b5i;->n(Lcom/p1/mobile/android/app/Act;)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    const/16 v3, 0x31

    .line 68
    .line 69
    invoke-virtual {v0, v1, v3, v2, p1}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/b5i;->B()V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final B()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/b5i;->C()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final C()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Ll/b5i;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 9
    .line 10
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 11
    .line 12
    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 13
    .line 14
    new-instance v7, Landroid/view/animation/DecelerateInterpolator;

    .line 15
    .line 16
    invoke-direct {v7}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    new-array v8, v0, [F

    .line 21
    .line 22
    fill-array-data v8, :array_0

    .line 23
    .line 24
    .line 25
    const-wide/16 v3, 0x0

    .line 26
    .line 27
    const-wide/16 v5, 0x12c

    .line 28
    .line 29
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object p0, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 34
    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 36
    .line 37
    sget-object v3, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 38
    .line 39
    new-instance v8, Landroid/view/animation/DecelerateInterpolator;

    .line 40
    .line 41
    invoke-direct {v8}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 42
    .line 43
    .line 44
    const/high16 p0, 0x41a00000    # 20.0f

    .line 45
    .line 46
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    neg-int p0, p0

    .line 51
    int-to-float p0, p0

    .line 52
    new-array v9, v0, [F

    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    aput p0, v9, v0

    .line 56
    .line 57
    const/4 p0, 0x0

    .line 58
    const/4 v0, 0x1

    .line 59
    aput p0, v9, v0

    .line 60
    .line 61
    const-wide/16 v4, 0x0

    .line 62
    .line 63
    const-wide/16 v6, 0x12c

    .line 64
    .line 65
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    filled-new-array {v1, p0}, [Landroid/animation/Animator;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public j()Z
    .locals 4

    .line 1
    invoke-static {}, Ll/d5i;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 10
    .line 11
    iget-object v0, v0, Ll/sre0;->d:Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Tg()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v2, Ll/v4i;

    .line 18
    .line 19
    invoke-direct {v2, p0}, Ll/v4i;-><init>(Ll/b5i;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    iget-boolean v0, p0, Ll/b5i;->h:Z

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    return v1

    .line 34
    :cond_1
    iget-object v0, p0, Ll/b5i;->a:Ll/byd0;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ljava/lang/Long;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    const-wide/16 v2, 0x0

    .line 47
    .line 48
    cmp-long v0, v0, v2

    .line 49
    .line 50
    const/4 v1, 0x1

    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    return v1

    .line 54
    :cond_2
    iget-object p0, p0, Ll/b5i;->a:Ll/byd0;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Ljava/lang/Long;

    .line 61
    .line 62
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 63
    .line 64
    .line 65
    move-result-wide v2

    .line 66
    invoke-static {v2, v3}, Ll/p6i;->n(J)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    xor-int/2addr p0, v1

    .line 71
    return p0
.end method

.method public final k()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b5i;->c:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->a0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b5i;->g:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/b5i;->g:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final n(Lcom/p1/mobile/android/app/Act;)I
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "dimen"

    .line 10
    .line 11
    const-string v1, "android"

    .line 12
    .line 13
    const-string v2, "status_bar_height"

    .line 14
    .line 15
    invoke-virtual {p0, v2, v0, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-lez p0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0
.end method

.method public final o()V
    .locals 4

    .line 1
    new-instance v0, Ll/l4g0;

    .line 2
    .line 3
    const-class v1, Ll/b5i;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "p_fast_state_post"

    .line 10
    .line 11
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/b5i;->b:Ll/l4g0;

    .line 15
    .line 16
    const-string v1, "refer_source"

    .line 17
    .line 18
    iget-object v2, p0, Ll/b5i;->f:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v2, p0, Ll/b5i;->e:Lcom/p1/mobile/putong/feed/data/StateQuestion;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/StateQuestion;->question:Ljava/lang/String;

    .line 27
    .line 28
    const-string v3, "question"

    .line 29
    .line 30
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/b5i;->b:Ll/l4g0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/b5i;->b:Ll/l4g0;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final p(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/b5i;->c:Landroid/widget/PopupWindow;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Landroid/widget/PopupWindow;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget v1, Ll/tec0;->w3:I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {}, Ll/bnl0;->y0()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/high16 v2, 0x436c0000    # 236.0f

    .line 23
    .line 24
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    const/4 v3, 0x0

    .line 29
    invoke-direct {v0, p1, v1, v2, v3}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/b5i;->c:Landroid/widget/PopupWindow;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    sget v0, Ll/hdc0;->B0:I

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 45
    .line 46
    iput-object p1, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/b5i;->k()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iget-object p1, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->g:Lv/VText;

    .line 58
    .line 59
    const/4 v0, 0x3

    .line 60
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const/4 v1, 0x1

    .line 65
    invoke-virtual {p1, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/b5i;->c:Landroid/widget/PopupWindow;

    .line 69
    .line 70
    invoke-virtual {p1, v3}, Landroid/widget/PopupWindow;->setClippingEnabled(Z)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 76
    .line 77
    invoke-virtual {p1, v1}, Landroid/view/View;->setClickable(Z)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 81
    .line 82
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->h:Lv/VLinear;

    .line 83
    .line 84
    new-instance v0, Ll/w4i;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Ll/w4i;-><init>(Ll/b5i;)V

    .line 87
    .line 88
    .line 89
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 93
    .line 94
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->k:Lv/VLinear;

    .line 95
    .line 96
    new-instance v0, Ll/x4i;

    .line 97
    .line 98
    invoke-direct {v0, p0}, Ll/x4i;-><init>(Ll/b5i;)V

    .line 99
    .line 100
    .line 101
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 105
    .line 106
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->f:Lv/VImage;

    .line 107
    .line 108
    new-instance v0, Ll/y4i;

    .line 109
    .line 110
    invoke-direct {v0, p0}, Ll/y4i;-><init>(Ll/b5i;)V

    .line 111
    .line 112
    .line 113
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Ll/b5i;->c:Landroid/widget/PopupWindow;

    .line 117
    .line 118
    new-instance v0, Ll/z4i;

    .line 119
    .line 120
    invoke-direct {v0, p0}, Ll/z4i;-><init>(Ll/b5i;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 124
    .line 125
    .line 126
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic q(Ll/bkj0;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Ll/b5i;->h:Z

    .line 10
    .line 11
    return-void

    .line 12
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Ll/b5i;->h:Z

    .line 14
    .line 15
    return-void
.end method

.method public final synthetic r(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/b5i;->e:Lcom/p1/mobile/putong/feed/data/StateQuestion;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/StateQuestion;->stateOptions:Ljava/util/List;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/feed/data/StateOption;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/b5i;->x(Lcom/p1/mobile/putong/feed/data/StateOption;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/b5i;->l()V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/b5i;->e:Lcom/p1/mobile/putong/feed/data/StateQuestion;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/StateQuestion;->question:Ljava/lang/String;

    .line 21
    .line 22
    const-string v1, "question"

    .line 23
    .line 24
    invoke-static {v1, p1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p0, p0, Ll/b5i;->e:Lcom/p1/mobile/putong/feed/data/StateQuestion;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/StateQuestion;->stateOptions:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Lcom/p1/mobile/putong/feed/data/StateOption;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/StateOption;->option:Ljava/lang/String;

    .line 39
    .line 40
    const-string v0, "options"

    .line 41
    .line 42
    invoke-static {v0, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    filled-new-array {p1, p0}, [Ll/tfj0$a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string p1, "e_set_my_state_post"

    .line 51
    .line 52
    const-string v0, "p_fast_state_post"

    .line 53
    .line 54
    invoke-static {p1, v0, p0}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final synthetic s(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/b5i;->e:Lcom/p1/mobile/putong/feed/data/StateQuestion;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/StateQuestion;->stateOptions:Ljava/util/List;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/feed/data/StateOption;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/b5i;->x(Lcom/p1/mobile/putong/feed/data/StateOption;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/b5i;->l()V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/b5i;->e:Lcom/p1/mobile/putong/feed/data/StateQuestion;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/StateQuestion;->question:Ljava/lang/String;

    .line 21
    .line 22
    const-string v1, "question"

    .line 23
    .line 24
    invoke-static {v1, p1}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p0, p0, Ll/b5i;->e:Lcom/p1/mobile/putong/feed/data/StateQuestion;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/StateQuestion;->stateOptions:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Lcom/p1/mobile/putong/feed/data/StateOption;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/StateOption;->option:Ljava/lang/String;

    .line 39
    .line 40
    const-string v0, "options"

    .line 41
    .line 42
    invoke-static {v0, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    filled-new-array {p1, p0}, [Ll/tfj0$a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string p1, "e_set_my_state_post"

    .line 51
    .line 52
    const-string v0, "p_fast_state_post"

    .line 53
    .line 54
    invoke-static {p1, v0, p0}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final synthetic t(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/b5i;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic u()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b5i;->b:Ll/l4g0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/b5i;->b:Ll/l4g0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b5i;->A(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public w()V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    sput-object p0, Ll/b5i;->i:Ll/b5i;

    .line 3
    .line 4
    sput-object p0, Ll/b5i;->j:Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    return-void
.end method

.method public final x(Lcom/p1/mobile/putong/feed/data/StateOption;)V
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/StateOption;->defaultContent:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/StateOption;->stateEmotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/BubbleInfo;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/16 v2, 0x3c

    .line 21
    .line 22
    if-le v1, v2, :cond_0

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    :cond_0
    iput-object p0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p1, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 32
    .line 33
    new-instance p0, Lcom/p1/mobile/putong/data/TextTheme;

    .line 34
    .line 35
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/TextTheme;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 39
    .line 40
    iput-object v1, p0, Lcom/p1/mobile/putong/data/TextTheme;->backgroundColor:Ljava/util/List;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->iconColor:Ljava/util/List;

    .line 43
    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/data/TextTheme;->iconColor:Ljava/util/List;

    .line 45
    .line 46
    iput-object p0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 47
    .line 48
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 49
    .line 50
    const-string p1, "p_fast_state_post"

    .line 51
    .line 52
    invoke-virtual {p0, v0, p1}, Ll/ms8;->V0(Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Lrx/c;

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final y()V
    .locals 6

    .line 1
    invoke-static {}, Ll/d5i;->b()Lcom/p1/mobile/putong/feed/data/StateQuestion;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/b5i;->e:Lcom/p1/mobile/putong/feed/data/StateQuestion;

    .line 6
    .line 7
    if-eqz v0, :cond_7

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/StateQuestion;->stateOptions:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_0

    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Ll/b5i;->k()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    goto/16 :goto_0

    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Ll/b5i;->e:Lcom/p1/mobile/putong/feed/data/StateQuestion;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/StateQuestion;->stateOptions:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_3

    .line 40
    .line 41
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Lcom/p1/mobile/putong/feed/data/StateOption;

    .line 46
    .line 47
    if-eqz v1, :cond_7

    .line 48
    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/StateOption;->stateEmotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 50
    .line 51
    if-eqz v1, :cond_7

    .line 52
    .line 53
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    goto/16 :goto_0

    .line 62
    .line 63
    :cond_3
    invoke-virtual {p0}, Ll/b5i;->o()V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->h:Lv/VLinear;

    .line 69
    .line 70
    const/4 v1, 0x0

    .line 71
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->k:Lv/VLinear;

    .line 77
    .line 78
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/b5i;->e:Lcom/p1/mobile/putong/feed/data/StateQuestion;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/StateQuestion;->stateOptions:Ljava/util/List;

    .line 84
    .line 85
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    const/4 v3, 0x1

    .line 90
    if-lt v2, v3, :cond_4

    .line 91
    .line 92
    iget-object v2, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 93
    .line 94
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->h:Lv/VLinear;

    .line 95
    .line 96
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    iget-object v2, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 100
    .line 101
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->j:Lv/VText;

    .line 102
    .line 103
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    check-cast v4, Lcom/p1/mobile/putong/feed/data/StateOption;

    .line 108
    .line 109
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/StateOption;->option:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 115
    .line 116
    iget-object v4, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 117
    .line 118
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->i:Lv/VDraweeView;

    .line 119
    .line 120
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v5

    .line 124
    check-cast v5, Lcom/p1/mobile/putong/feed/data/StateOption;

    .line 125
    .line 126
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/StateOption;->stateEmotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 127
    .line 128
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {v2, v4, v5}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    const/4 v4, 0x2

    .line 138
    if-lt v2, v4, :cond_5

    .line 139
    .line 140
    iget-object v2, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 141
    .line 142
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->k:Lv/VLinear;

    .line 143
    .line 144
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 145
    .line 146
    .line 147
    iget-object v2, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 148
    .line 149
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->m:Lv/VText;

    .line 150
    .line 151
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v4

    .line 155
    check-cast v4, Lcom/p1/mobile/putong/feed/data/StateOption;

    .line 156
    .line 157
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/StateOption;->option:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    .line 161
    .line 162
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 163
    .line 164
    iget-object v4, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 165
    .line 166
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->l:Lv/VDraweeView;

    .line 167
    .line 168
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    check-cast v0, Lcom/p1/mobile/putong/feed/data/StateOption;

    .line 173
    .line 174
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/StateOption;->stateEmotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 175
    .line 176
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 177
    .line 178
    invoke-virtual {v2, v4, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    :cond_5
    iget-object v0, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 182
    .line 183
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->g:Lv/VText;

    .line 184
    .line 185
    iget-object v2, p0, Ll/b5i;->e:Lcom/p1/mobile/putong/feed/data/StateQuestion;

    .line 186
    .line 187
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/StateQuestion;->question:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 190
    .line 191
    .line 192
    iget-object v0, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 193
    .line 194
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->n:Lv/VText;

    .line 195
    .line 196
    const-string v2, "\u70b9\u51fb\u5373\u53ef\u53d1\u5e03\u72b6\u6001"

    .line 197
    .line 198
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 199
    .line 200
    .line 201
    sget-object v0, Ll/b5i;->j:Lcom/p1/mobile/putong/data/User;

    .line 202
    .line 203
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    if-eqz v0, :cond_6

    .line 208
    .line 209
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 210
    .line 211
    iget-object v2, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 212
    .line 213
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->p:Lv/VDraweeView;

    .line 214
    .line 215
    sget-object v3, Ll/b5i;->j:Lcom/p1/mobile/putong/data/User;

    .line 216
    .line 217
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 218
    .line 219
    .line 220
    move-result-object v3

    .line 221
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    invoke-virtual {v0, v2, v3, v1}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 226
    .line 227
    .line 228
    :cond_6
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 229
    .line 230
    iget-object p0, p0, Ll/b5i;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 231
    .line 232
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->q:Lv/VDraweeView;

    .line 233
    .line 234
    sget v1, Ll/lbc0;->H0:I

    .line 235
    .line 236
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 237
    .line 238
    .line 239
    :cond_7
    :goto_0
    return-void
.end method

.method public z(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p2, p0, Ll/b5i;->f:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    if-nez p2, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    invoke-virtual {p2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    if-nez p2, :cond_2

    .line 18
    .line 19
    :goto_0
    return-void

    .line 20
    :cond_2
    new-instance v0, Ll/u4i;

    .line 21
    .line 22
    invoke-direct {v0, p0, p1}, Ll/u4i;-><init>(Ll/b5i;Lcom/p1/mobile/android/app/Act;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 26
    .line 27
    .line 28
    return-void
.end method
