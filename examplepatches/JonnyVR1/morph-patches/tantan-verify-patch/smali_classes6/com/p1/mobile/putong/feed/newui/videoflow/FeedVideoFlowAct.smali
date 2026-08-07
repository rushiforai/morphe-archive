.class public Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct$a;
    }
.end annotation


# instance fields
.field public c:Ll/wai;

.field public d:Ll/mai;

.field public e:Ll/qai;

.field public f:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->e2(Ll/bkj0;)V

    return-void
.end method


# virtual methods
.method public final Z1()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->d:Ll/mai;

    .line 4
    .line 5
    iget-object v1, v1, Ll/mai;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v2, v1}, Ll/jka;->Rb(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/dai;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/dai;-><init>(Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;)V

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/eai;

    .line 25
    .line 26
    invoke-direct {p0}, Ll/eai;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public a2()Ll/qai;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->e:Ll/qai;

    .line 2
    .line 3
    return-object p0
.end method

.method public b2()Ll/wai;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->c:Ll/wai;

    .line 2
    .line 3
    return-object p0
.end method

.method public c2()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->b2()Ll/wai;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/wai;->l()Ll/gai;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/gai;->P()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public d2()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->b2()Ll/wai;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/wai;->l()Ll/gai;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/gai;->Q()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final synthetic e2(Ll/bkj0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->d:Ll/mai;

    .line 2
    .line 3
    iget-object v0, v0, Ll/mai;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 13
    .line 14
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p1, Ll/pf60;

    .line 17
    .line 18
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p1, Lcom/p1/mobile/putong/data/Music;

    .line 21
    .line 22
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Video;->music:Lcom/p1/mobile/putong/data/Music;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->c:Ll/wai;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/wai;->l()Ll/gai;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Video;->music:Lcom/p1/mobile/putong/data/Music;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/gai;->U(Lcom/p1/mobile/putong/data/Music;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public finish()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->c:Ll/wai;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wai;->l()Ll/gai;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/gai;->J()V

    .line 8
    .line 9
    .line 10
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->e:Ll/qai;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/qai;->i()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public g2()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->d:Ll/mai;

    .line 2
    .line 3
    iget-object v0, v0, Ll/mai;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->Z1()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public h2()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/k9c0;->o0:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/high16 v1, -0x1000000

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->dimStatusBar(Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hasCustomTransition()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    sget v0, Ll/a8c0;->c:I

    .line 38
    .line 39
    sget v1, Ll/a8c0;->d:I

    .line 40
    .line 41
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->c:Ll/wai;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/wai;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingSuperCall"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initPageHelper()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const-string v1, "VIDEO_FLOW_SOURCE"

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v1, "start_home_card"

    .line 28
    .line 29
    const/4 v3, 0x0

    .line 30
    invoke-virtual {v0, v1, v3}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->f:Z

    .line 35
    .line 36
    :cond_0
    new-instance v0, Ll/qai;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/qai;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->e:Ll/qai;

    .line 42
    .line 43
    new-instance v0, Ll/wai;

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    invoke-direct {v0, p0, v1, v1}, Ll/wai;-><init>(Ll/ner;ZZ)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->c:Ll/wai;

    .line 50
    .line 51
    new-instance v0, Ll/mai;

    .line 52
    .line 53
    invoke-direct {v0, p0}, Ll/mai;-><init>(Ll/ner;)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->d:Ll/mai;

    .line 57
    .line 58
    invoke-virtual {v0, p0}, Ll/mai;->q0(Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->d:Ll/mai;

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Ll/mai;->r0(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->d:Ll/mai;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->c:Ll/wai;

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Ll/mai;->i0(Ll/wai;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public initSubscription()V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingSuperCall"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->d:Ll/mai;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/mai;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDestroyLifecycle()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onDestroyLifecycle()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onResumeLifecycle()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->onResumeLifecycle()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->b2()Ll/wai;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/wai;->l()Ll/gai;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/gai;->T()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_video_recommend"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->h2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
