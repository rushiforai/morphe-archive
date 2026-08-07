.class public Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Ll/ax00;

.field public d:Ll/cx00;


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

.method public static synthetic X1(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->e2()V

    return-void
.end method

.method public static Y1(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->Z1(Landroid/content/Context;Ljava/lang/String;IZ)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static Z1(Landroid/content/Context;Ljava/lang/String;IZ)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "moment id"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "current position"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "need draganimation"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public static a2(Landroid/content/Context;Ljava/lang/String;IZLjava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->Z1(Landroid/content/Context;Ljava/lang/String;IZ)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "from"

    .line 6
    .line 7
    invoke-virtual {p0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public static b2(Landroid/content/Context;Ljava/lang/String;IZLjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->a2(Landroid/content/Context;Ljava/lang/String;IZLjava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "otherId"

    .line 6
    .line 7
    invoke-virtual {p0, p1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method private synthetic e2()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final c2(Ll/cx00;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "from"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iput-object p0, p1, Ll/cx00;->f:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public d2(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jka;->w7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->X3(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    return-object p0
.end method

.method public finish()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hasCustomTransition()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    sget v0, Ll/a8c0;->a:I

    .line 11
    .line 12
    sget v1, Ll/a8c0;->b:I

    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public g2()V
    .locals 0

    .line 1
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
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 32
    .line 33
    const/16 v1, 0x1a

    .line 34
    .line 35
    if-lt v0, v1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    or-int/lit8 v0, v0, 0x10

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 60
    .line 61
    .line 62
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hasCustomTransition()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    sget v0, Ll/a8c0;->c:I

    .line 69
    .line 70
    sget v1, Ll/a8c0;->d:I

    .line 71
    .line 72
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 73
    .line 74
    .line 75
    :cond_1
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->d:Ll/cx00;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/cx00;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setTopViewLayout(Landroid/view/View;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 5

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "moment id"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->d2(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const-string v3, "from"

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    const-string v4, "otherId"

    .line 35
    .line 36
    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-static {v0, v2, v3}, Lcom/p1/mobile/putong/feed/helper/MomentPreviewNullMomentException;->reportNullMoment(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finishWithoutCustomAnimation()V

    .line 44
    .line 45
    .line 46
    :cond_0
    new-instance v0, Ll/ax00;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/ax00;-><init>(Ll/ner;)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->c:Ll/ax00;

    .line 52
    .line 53
    new-instance v0, Ll/cx00;

    .line 54
    .line 55
    invoke-direct {v0, p0}, Ll/cx00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;)V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->d:Ll/cx00;

    .line 59
    .line 60
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->c:Ll/ax00;

    .line 61
    .line 62
    iput-object v1, v2, Ll/ax00;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 63
    .line 64
    invoke-virtual {v2, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->d:Ll/cx00;

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->c2(Ll/cx00;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->c:Ll/ax00;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->c:Ll/ax00;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ax00;->a0()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->d:Ll/cx00;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->d:Ll/cx00;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/cx00;->f()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    instance-of v1, v0, Lv/VFrame;

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    sget v1, Ll/hdc0;->L0:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 26
    .line 27
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-virtual {v1, v2}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->setOnImageEventListener(Lv/fresco/subscaleview/SubsamplingScaleImageView$h;)V

    .line 35
    .line 36
    .line 37
    const/16 v2, 0x8

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 40
    .line 41
    .line 42
    check-cast v0, Lv/VFrame;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 45
    .line 46
    .line 47
    new-instance v0, Ll/rw00;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/rw00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;)V

    .line 50
    .line 51
    .line 52
    const-wide/16 v1, 0x64

    .line 53
    .line 54
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_moment_fullscreen_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->h2()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->c:Ll/ax00;

    .line 9
    .line 10
    const-string v0, "moment id"

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "current position"

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const-string v3, "need draganimation"

    .line 24
    .line 25
    invoke-virtual {p1, v3, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-virtual {p0, v0, v1, p1}, Ll/ax00;->l0(Ljava/lang/String;IZ)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public trackedArgs()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->c:Ll/ax00;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ax00;->m0()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
