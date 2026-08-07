.class public Ll/o8v;
.super Ll/cyr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cyr<",
        "Ll/k9v;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/nus;

.field public b:Ll/q9v;

.field public final c:Ll/fav;

.field public d:Ljava/lang/String;

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/r6s;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/lang/String;

.field public g:Ll/w8v;


# direct methods
.method public constructor <init>(Ll/nus;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/cyr;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/o8v;->e:Ljava/util/List;

    .line 12
    .line 13
    iput-object p1, p0, Ll/o8v;->a:Ll/nus;

    .line 14
    .line 15
    new-instance v0, Ll/q9v;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/q9v;-><init>(Ll/nus;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/o8v;->b:Ll/q9v;

    .line 21
    .line 22
    new-instance p1, Ll/fav;

    .line 23
    .line 24
    invoke-direct {p1}, Ll/fav;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Ll/o8v;->c:Ll/fav;

    .line 28
    .line 29
    return-void
.end method

.method private A2()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/k9v;

    .line 4
    .line 5
    iget-object v0, v0, Ll/k9v;->d:Lv/VPullDownRefreshLayout;

    .line 6
    .line 7
    invoke-virtual {v0}, Lv/smart_refresh/SmartRefreshLayout;->B()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Ll/k9v;

    .line 16
    .line 17
    iget-object p0, p0, Ll/k9v;->d:Lv/VPullDownRefreshLayout;

    .line 18
    .line 19
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->t()Ll/mvc0;

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method private C2(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/r6s;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/o8v;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/o8v;->e:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    new-instance p1, Ll/hk4;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/hk4;-><init>(Ll/ner;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "0"

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ll/hk4;->d(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/o8v;->e:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {p1, v0}, Ll/e4s;->b(Ll/hk4;Ljava/util/List;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Ll/k9v;

    .line 30
    .line 31
    iget-object p0, p0, Ll/k9v;->f:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->b0(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private synthetic I2(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o8v;->c:Ll/fav;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/k9v;

    .line 6
    .line 7
    iget-object p0, p0, Ll/k9v;->b:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {v0, p0, p1}, Ll/fav;->h(Landroid/widget/FrameLayout;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private R2()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;->requestTab()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/k8v;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/k8v;-><init>(Ll/o8v;)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/l8v;

    .line 15
    .line 16
    invoke-direct {v2, p0}, Ll/l8v;-><init>(Ll/o8v;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic q2(Ll/o8v;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o8v;->H2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V

    return-void
.end method

.method public static synthetic r2(Ll/o8v;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareHeaderBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o8v;->K2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareHeaderBean;)V

    return-void
.end method

.method public static synthetic s2(Ll/o8v;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/o8v;->I2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic u2(Ll/o8v;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o8v;->N2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic v2(Ll/o8v;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o8v;->L2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic w2(Ll/o8v;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o8v;->M2(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    return-void
.end method

.method private z2()Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean<",
            "Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v2, "0"

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;->setTabId(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v2, "\u63a8\u8350"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareTabBean;->setName(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->setList(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    return-object p0
.end method


# virtual methods
.method public B2()Ll/nus;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o8v;->a:Ll/nus;

    .line 2
    .line 3
    return-object p0
.end method

.method public D2()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/o8v;->g:Ll/w8v;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/w8v;

    .line 6
    .line 7
    iget-object v1, p0, Ll/o8v;->a:Ll/nus;

    .line 8
    .line 9
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v2, Ll/k9v;

    .line 12
    .line 13
    iget-object v2, v2, Ll/k9v;->c:Lv/navigationbar/VNavigationBar;

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v0, v1, v2, v3}, Ll/w8v;-><init>(Ll/nus;Lv/navigationbar/VNavigationBar;Z)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/o8v;->g:Ll/w8v;

    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Ll/o8v;->g:Ll/w8v;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/w8v;->z2()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public E2()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o8v;->a:Ll/nus;

    .line 2
    .line 3
    iget-object v0, v0, Ll/nus;->a:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveVoiceInternalWidgetEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVoiceInternalWidgetEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVoiceInternalWidgetEvent;->bottomWidget()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lrx/c;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/i8v;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/i8v;-><init>(Ll/o8v;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/o8v;->a:Ll/nus;

    .line 34
    .line 35
    iget-object v0, v0, Ll/nus;->a:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveVoiceInternalWidgetEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVoiceInternalWidgetEvent;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVoiceInternalWidgetEvent;->scrollDirectionForWidget()Ll/v3f$d;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lrx/c;

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/j8v;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/j8v;-><init>(Ll/o8v;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ll/o8v;->Q2()V

    .line 66
    .line 67
    .line 68
    invoke-direct {p0}, Ll/o8v;->R2()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public F2(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/k9v;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/k9v;->r()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/k9v;

    .line 11
    .line 12
    iget-object v1, p0, Ll/o8v;->a:Ll/nus;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/nus;->a()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ll/k9v;->d(Lcom/p1/mobile/android/app/Act;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/o8v;->g:Ll/w8v;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ll/w8v;->A2(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/o8v;->c:Ll/fav;

    .line 27
    .line 28
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast v0, Ll/k9v;

    .line 31
    .line 32
    iget-object v0, v0, Ll/k9v;->b:Landroid/widget/FrameLayout;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {p1, v0, v1}, Ll/fav;->i(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/o8v;->b:Ll/q9v;

    .line 39
    .line 40
    new-instance v0, Ll/x9v;

    .line 41
    .line 42
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 43
    .line 44
    move-object v1, p0

    .line 45
    check-cast v1, Ll/k9v;

    .line 46
    .line 47
    iget-object v1, v1, Ll/k9v;->g:Lcom/google/android/material/tabs/TabLayout;

    .line 48
    .line 49
    check-cast p0, Ll/k9v;

    .line 50
    .line 51
    iget-object p0, p0, Ll/k9v;->h:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 52
    .line 53
    invoke-direct {v0, v1, p0}, Ll/x9v;-><init>(Lcom/google/android/material/tabs/TabLayout;Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ll/cyr;->C(Ll/iam;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic H2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o8v;->c:Ll/fav;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/k9v;

    .line 6
    .line 7
    iget-object p0, p0, Ll/k9v;->b:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-virtual {v0, p0, p1}, Ll/fav;->i(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic K2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareHeaderBean;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/k9v;

    .line 4
    .line 5
    iget-object v0, v0, Ll/k9v;->f:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast v0, Ll/k9v;

    .line 20
    .line 21
    iget-object v0, v0, Ll/k9v;->f:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;

    .line 22
    .line 23
    iget-object v1, p0, Ll/o8v;->a:Ll/nus;

    .line 24
    .line 25
    iget-object v1, v1, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareHeaderBean;->getEntrys()Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->c0(Lcom/p1/mobile/android/app/Frag;Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareHeaderBean;->getCards()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-direct {p0, p1}, Ll/o8v;->C2(Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0}, Ll/o8v;->A2()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic L2(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/k9v;

    .line 4
    .line 5
    iget-object p1, p1, Ll/k9v;->f:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ll/o8v;->A2()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic M2(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;->getList()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/o8v;->b:Ll/q9v;

    .line 11
    .line 12
    iget-object v1, p0, Ll/o8v;->d:Ljava/lang/String;

    .line 13
    .line 14
    iget-object p0, p0, Ll/o8v;->f:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, p1, v1, p0}, Ll/q9v;->v2(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/o8v;->b:Ll/q9v;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/o8v;->z2()Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Ll/o8v;->d:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p0, p0, Ll/o8v;->f:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1, p0}, Ll/q9v;->v2(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 34
    .line 35
    const-string p1, "live virtual square tab list is null"

    .line 36
    .line 37
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic N2(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o8v;->b:Ll/q9v;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/o8v;->z2()Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Ll/o8v;->d:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Ll/o8v;->f:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, p0}, Ll/q9v;->v2(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 15
    .line 16
    const-string v0, "live virtual square tab request error"

    .line 17
    .line 18
    invoke-direct {p0, v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public P2()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/o8v;->Q2()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/o8v;->g:Ll/w8v;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/w8v;->E2()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll/o8v;->b:Ll/q9v;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/q9v;->u2()V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public Q2()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;->requestHeaders()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/m8v;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/m8v;-><init>(Ll/o8v;)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/n8v;

    .line 15
    .line 16
    invoke-direct {v2, p0}, Ll/n8v;-><init>(Ll/o8v;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public S2(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o8v;->d:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/o8v;->b:Ll/q9v;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/q9v;->w2(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public T2(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o8v;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public y2(Ll/k9v;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/cyr;->C(Ll/iam;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
