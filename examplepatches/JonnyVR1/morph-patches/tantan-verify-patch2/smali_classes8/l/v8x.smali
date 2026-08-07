.class public Ll/v8x;
.super Ll/k8x;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView$a;
.implements Lv/VTexturePlayer$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/v8x$c;,
        Ll/v8x$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/k8x<",
        "Ll/g9x;",
        ">;",
        "Lcom/p1/mobile/putong/core/ui/match/view/ViewPagerClickChangeView$a;",
        "Lv/VTexturePlayer$b;"
    }
.end annotation


# instance fields
.field public d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/v8x$b;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/v8x$c;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k8x;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 5
    .line 6
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/v8x;->f:Lrx/subjects/a;

    .line 11
    .line 12
    new-instance p1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/v8x;->g:Ljava/util/ArrayList;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic C0(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/u8x;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/u8x;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic D0(Ll/v8x;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v8x;->d1(Ljava/lang/String;Z)V

    return-void
.end method

.method public static synthetic E0(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->mq(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic F0(Ll/v8x;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/v8x;->W0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic G0(Ll/v8x;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v8x;->a1()V

    return-void
.end method

.method public static synthetic H0(Ll/v8x;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v8x;->X0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic I0(Ll/v8x;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v8x;->b1(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic J0(Ll/v8x;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v8x;->c1(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic L0(Ll/v8x;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/v8x;->Y0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic N0(Ll/v8x;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v8x;->V0()V

    return-void
.end method

.method public static bridge synthetic O0(Ll/v8x;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v8x;->g:Ljava/util/ArrayList;

    return-object p0
.end method

.method public static synthetic P0(Ll/v8x;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Q0(Ll/v8x;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic W0(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/toh0;->s()V

    .line 10
    .line 11
    .line 12
    iget p1, p0, Ll/k8x;->a:I

    .line 13
    .line 14
    const/16 v1, 0xd

    .line 15
    .line 16
    if-ne p1, v1, :cond_1

    .line 17
    .line 18
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/tx0;->B()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    invoke-static {}, Ll/spl0;->F()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_appstore_rating_filter_popup_store:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const/4 v2, 0x1

    .line 49
    invoke-virtual {p1, v1, v0, v2}, Ll/rj50;->b0(Ljava/lang/String;IZ)Z

    .line 50
    .line 51
    .line 52
    :cond_0
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const/high16 p1, 0x40a00000    # 5.0f

    .line 57
    .line 58
    const-string v1, "superlike"

    .line 59
    .line 60
    invoke-static {p0, v0, p1, v1}, Ll/tx0;->I(Lcom/p1/mobile/android/app/Act;ZFLjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    return-void
.end method

.method private synthetic Y0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    move-object v0, p1

    .line 8
    check-cast v0, Ll/g9x;

    .line 9
    .line 10
    iget-object v0, v0, Ll/g9x;->t:Ll/f0r;

    .line 11
    .line 12
    check-cast p1, Ll/g9x;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/g9x;->n()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, p1}, Ll/f0r;->g(Ll/d0r;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/v8x;->g1()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 26
    .line 27
    if-ne p1, v0, :cond_1

    .line 28
    .line 29
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast p1, Ll/g9x;

    .line 32
    .line 33
    iget-object p1, p1, Ll/g9x;->t:Ll/f0r;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p1, v0}, Ll/f0r;->g(Ll/d0r;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/v8x;->i1()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 44
    .line 45
    if-ne p1, v0, :cond_2

    .line 46
    .line 47
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 48
    .line 49
    check-cast p0, Ll/g9x;

    .line 50
    .line 51
    iget-object p0, p0, Ll/g9x;->t:Ll/f0r;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/f0r;->b()V

    .line 54
    .line 55
    .line 56
    :cond_2
    return-void
.end method


# virtual methods
.method public B()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/g9x;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/g9x;->v()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/g9x;

    .line 11
    .line 12
    iget-object v0, v0, Ll/g9x;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchPicViewPager;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Ll/v8x;->h:Ll/v8x$c;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    const/4 v3, 0x1

    .line 22
    if-gtz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/v8x$c;->getCount()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-virtual {p0, v2, v3, v0}, Ll/v8x;->j1(ZZI)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-virtual {v1}, Ll/v8x$c;->getCount()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {p0, v3, v3, v0}, Ll/v8x;->j1(ZZI)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 40
    .line 41
    move-object v0, p0

    .line 42
    check-cast v0, Ll/g9x;

    .line 43
    .line 44
    iget-object v0, v0, Ll/g9x;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchPicViewPager;

    .line 45
    .line 46
    check-cast p0, Ll/g9x;

    .line 47
    .line 48
    iget-object p0, p0, Ll/g9x;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchPicViewPager;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    sub-int/2addr p0, v3

    .line 55
    invoke-virtual {v0, p0, v2}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final R0()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/16 v1, 0x4e2

    .line 3
    .line 4
    filled-new-array {v0, v1}, [I

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-wide/16 v1, 0x4e2

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    .line 17
    new-instance v1, Ll/v8x$a;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/v8x$a;-><init>(Ll/v8x;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public S0()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/v8x$b;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/v8x;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public final U0(Lcom/p1/mobile/putong/data/User;ILjava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/k8x;->c:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    new-instance v0, Ll/v8x$c;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-direct {v0, p0, v1}, Ll/v8x$c;-><init>(Ll/v8x;Ll/x8x;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/v8x;->h:Ll/v8x$c;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/v8x;->g:Ljava/util/ArrayList;

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 35
    .line 36
    iget-object v2, p0, Ll/v8x;->g:Ljava/util/ArrayList;

    .line 37
    .line 38
    new-instance v3, Ll/v8x$b;

    .line 39
    .line 40
    invoke-direct {v3, v1}, Ll/v8x$b;-><init>(Lcom/p1/mobile/putong/data/Media;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 48
    .line 49
    check-cast v0, Ll/g9x;

    .line 50
    .line 51
    iget-object v1, p0, Ll/v8x;->h:Ll/v8x$c;

    .line 52
    .line 53
    invoke-virtual {v0, p1, v1, p2, p3}, Ll/g9x;->w(Lcom/p1/mobile/putong/data/User;Ll/cf60;ILjava/util/ArrayList;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ll/v8x;->R0()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance p2, Ll/p8x;

    .line 64
    .line 65
    invoke-direct {p2, p0}, Ll/p8x;-><init>(Ll/v8x;)V

    .line 66
    .line 67
    .line 68
    const-wide/16 v0, 0x64

    .line 69
    .line 70
    invoke-static {p1, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final synthetic V0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/g9x;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/g9x;->u()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0, v0}, Ll/v8x;->l1(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic X0(Ll/uxj0;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget v0, p0, Ll/k8x;->a:I

    .line 12
    .line 13
    iget-object v1, p0, Ll/v8x;->e:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {p0, p1, v0, v1}, Ll/v8x;->U0(Lcom/p1/mobile/putong/data/User;ILjava/util/ArrayList;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public Z()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/d79;->j0()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 15
    .line 16
    .line 17
    :cond_0
    new-instance v0, Ll/l8x;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/l8x;-><init>(Ll/v8x;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/v8x;->f:Lrx/subjects/a;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/m8x;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/m8x;-><init>(Ll/v8x;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/n8x;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/n8x;-><init>(Ll/v8x;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic a1()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v8x;->g1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic b1(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ai:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/k8x;->c:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p1, p0}, Ll/bfx;->f(ILcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic c1(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Th:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/k8x;->c:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p1, p0}, Ll/bfx;->f(ILcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic d1(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v8x;->f1(Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/k8x;->destroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v8x;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-le v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/v8x;->d:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v0, p0, Ll/v8x;->d:Ljava/util/ArrayList;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/v8x;->e:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/v8x;->f:Lrx/subjects/a;

    .line 32
    .line 33
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 40
    .line 41
    check-cast v0, Ll/g9x;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/g9x;->F()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public f1(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 8
    .line 9
    .line 10
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 13
    .line 14
    iget-object v0, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    new-instance v0, Ll/r8x;

    .line 27
    .line 28
    invoke-direct {v0, p2}, Ll/r8x;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    new-instance p2, Lcom/p1/mobile/putong/core/data/Message;

    .line 35
    .line 36
    invoke-direct {p2}, Lcom/p1/mobile/putong/core/data/Message;-><init>()V

    .line 37
    .line 38
    .line 39
    const-string v0, "text"

    .line 40
    .line 41
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 46
    .line 47
    iput-object p1, p2, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 48
    .line 49
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 52
    .line 53
    iget-object v0, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 54
    .line 55
    const/4 v1, 0x0

    .line 56
    invoke-virtual {p1, v0, p2, v1}, Lcom/p1/mobile/putong/core/api/g;->Dn(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Sticker;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance p2, Ll/s8x;

    .line 61
    .line 62
    invoke-direct {p2, p0}, Ll/s8x;-><init>(Ll/v8x;)V

    .line 63
    .line 64
    .line 65
    new-instance v0, Ll/t8x;

    .line 66
    .line 67
    invoke-direct {v0, p0}, Ll/t8x;-><init>(Ll/v8x;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ll/v8x;->e1()V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public final g1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

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
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v0, Ll/g9x;

    .line 12
    .line 13
    iget-object v0, v0, Ll/g9x;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchPicViewPager;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast v0, Ll/g9x;

    .line 24
    .line 25
    iget-object v0, v0, Ll/g9x;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchPicViewPager;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p0, v0}, Ll/v8x;->l1(I)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    return-void
.end method

.method public h1()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/v8x;->g:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Ll/v8x;->g:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ll/v8x$b;

    .line 17
    .line 18
    iget-object v1, v1, Ll/v8x$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 19
    .line 20
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    iget-object v1, p0, Ll/v8x;->g:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ll/v8x$b;

    .line 31
    .line 32
    iget-object v1, v1, Ll/v8x$b;->c:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 33
    .line 34
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/PictureView;->W()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_0

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/PictureView;->U()V

    .line 47
    .line 48
    .line 49
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    return-void
.end method

.method public final i1()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v8x;->h1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j1(ZZI)V
    .locals 0

    .line 1
    const-string p0, "can_switch"

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    const-string p1, "left"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p1, "right"

    .line 13
    .line 14
    :goto_0
    const-string p2, "change_photo_direction"

    .line 15
    .line 16
    invoke-static {p2, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string p2, "photo_numbers"

    .line 21
    .line 22
    invoke-static {p2, p3}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    filled-new-array {p0, p1, p2}, [Ll/sfj0$a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p1, "e_matched_photo"

    .line 31
    .line 32
    const-string p2, "p_successful_match_view"

    .line 33
    .line 34
    invoke-static {p1, p2, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public k1(Ljava/lang/String;Z)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    new-array v0, v0, [Ll/sfj0$a;

    .line 9
    .line 10
    const-string v1, "e_matched_send_message"

    .line 11
    .line 12
    const-string v2, "p_successful_match_view"

    .line 13
    .line 14
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Ll/uqb0;->Z:Ll/a4j;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Vi:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ti:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Si:I

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ui:I

    .line 52
    .line 53
    new-instance v2, Ll/q8x;

    .line 54
    .line 55
    invoke-direct {v2, p0, p1, p2}, Ll/q8x;-><init>(Ll/v8x;Ljava/lang/String;Z)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 63
    .line 64
    .line 65
    new-instance p1, Ljava/util/HashSet;

    .line 66
    .line 67
    sget-object p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r:Ll/xyd0;

    .line 68
    .line 69
    invoke-virtual {p2}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    check-cast p2, Ljava/util/Collection;

    .line 74
    .line 75
    invoke-direct {p1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 76
    .line 77
    .line 78
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 79
    .line 80
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 81
    .line 82
    iget-object p0, p0, Ll/k8x;->b:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p2, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p1, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r:Ll/xyd0;

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/v8x;->f1(Ljava/lang/String;Z)V

    .line 100
    .line 101
    .line 102
    :cond_1
    return-void
.end method

.method public l1(I)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/v8x;->g:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_2

    .line 9
    .line 10
    iget-object v1, p0, Ll/v8x;->g:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ll/v8x$b;

    .line 17
    .line 18
    iget-object v1, v1, Ll/v8x$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 19
    .line 20
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    iget-object v1, p0, Ll/v8x;->g:Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ll/v8x$b;

    .line 31
    .line 32
    iget-object v1, v1, Ll/v8x$b;->c:Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 33
    .line 34
    if-ne p1, v0, :cond_0

    .line 35
    .line 36
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/PictureView;->V()V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_0
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_1

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/PictureView;->W()Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-eqz v2, :cond_1

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/PictureView;->U()V

    .line 59
    .line 60
    .line 61
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    return-void
.end method

.method public onComplete()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/o8x;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/o8x;-><init>(Ll/v8x;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x96

    .line 11
    .line 12
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onError(II)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPause()V
    .locals 0

    .line 1
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 1
    return-void
.end method

.method public q0(Ljava/lang/String;ILjava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/k8x;->q0(Ljava/lang/String;ILjava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/v8x;->d:Ljava/util/ArrayList;

    .line 5
    .line 6
    iput-object p4, p0, Ll/v8x;->e:Ljava/util/ArrayList;

    .line 7
    .line 8
    return-void
.end method

.method public w()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/g9x;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/g9x;->v()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/g9x;

    .line 11
    .line 12
    iget-object v0, v0, Ll/g9x;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchPicViewPager;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Ll/v8x;->h:Ll/v8x$c;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/v8x$c;->getCount()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v2, 0x1

    .line 25
    sub-int/2addr v1, v2

    .line 26
    iget-object v3, p0, Ll/v8x;->h:Ll/v8x$c;

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    if-lt v0, v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {v3}, Ll/v8x$c;->getCount()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-virtual {p0, v4, v4, v0}, Ll/v8x;->j1(ZZI)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-virtual {v3}, Ll/v8x$c;->getCount()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-virtual {p0, v2, v4, v0}, Ll/v8x;->j1(ZZI)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 47
    .line 48
    move-object v0, p0

    .line 49
    check-cast v0, Ll/g9x;

    .line 50
    .line 51
    iget-object v0, v0, Ll/g9x;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchPicViewPager;

    .line 52
    .line 53
    check-cast p0, Ll/g9x;

    .line 54
    .line 55
    iget-object p0, p0, Ll/g9x;->b:Lcom/p1/mobile/putong/core/ui/match/view/MatchPicViewPager;

    .line 56
    .line 57
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    add-int/2addr p0, v2

    .line 62
    invoke-virtual {v0, p0, v4}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public y()V
    .locals 0

    .line 1
    return-void
.end method
