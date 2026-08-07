.class public Ll/h8v;
.super Ll/cyr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cyr<",
        "Ll/i9v;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/nus;

.field public b:Ll/o9v;

.field public c:Ljava/lang/String;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/r6s;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/lang/String;

.field public f:Ll/tcv;

.field public g:Ll/jbt;


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
    iput-object v0, p0, Ll/h8v;->d:Ljava/util/List;

    .line 12
    .line 13
    iput-object p1, p0, Ll/h8v;->a:Ll/nus;

    .line 14
    .line 15
    new-instance v0, Ll/o9v;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/o9v;-><init>(Ll/nus;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/h8v;->b:Ll/o9v;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic A2(Ll/h8v;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/h8v;->U2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic B2(Ll/h8v;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareHeaderBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h8v;->Q2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareHeaderBean;)V

    return-void
.end method

.method public static synthetic C2(Ll/h8v;Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h8v;->P2(Lcom/p1/mobile/putong/data/PushMessage;)V

    return-void
.end method

.method public static synthetic D2(Ll/h8v;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h8v;->S2(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V

    return-void
.end method

.method public static synthetic E2(Ll/h8v;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/h8v;->V2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;Landroid/view/View;)V

    return-void
.end method

.method private I2()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/i9v;

    .line 4
    .line 5
    iget-object v0, v0, Ll/i9v;->d:Lv/VPullDownRefreshLayout;

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
    check-cast p0, Ll/i9v;

    .line 16
    .line 17
    iget-object p0, p0, Ll/i9v;->d:Lv/VPullDownRefreshLayout;

    .line 18
    .line 19
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->t()Ll/mvc0;

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static synthetic q2(Ll/pf60;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 4
    .line 5
    if-ne v0, p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic r2(Ll/h8v;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/h8v;->W2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s2(Ll/h8v;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h8v;->T2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic u2(Ll/pf60;)Lcom/p1/mobile/putong/data/PushMessage;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/data/PushMessage;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic v2(Lcom/p1/mobile/putong/data/PushMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Ll/z0n;->b(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic w2(Ll/h8v;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h8v;->R2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic y2(Ll/h8v;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/h8v;->c3(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;)V

    return-void
.end method

.method public static synthetic z2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public F2(Ll/i9v;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/cyr;->C(Ll/iam;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final H2()Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;
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

.method public K2()Ll/nus;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h8v;->a:Ll/nus;

    .line 2
    .line 3
    return-object p0
.end method

.method public final L2(Ljava/util/List;)V
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
    iget-object v0, p0, Ll/h8v;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/h8v;->d:Ljava/util/List;

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
    iget-object v0, p0, Ll/h8v;->d:Ljava/util/List;

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
    check-cast p0, Ll/i9v;

    .line 30
    .line 31
    iget-object p0, p0, Ll/i9v;->f:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;->b0(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public M2()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/h8v;->f:Ll/tcv;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/tcv;

    .line 6
    .line 7
    iget-object v1, p0, Ll/h8v;->a:Ll/nus;

    .line 8
    .line 9
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v2, Ll/i9v;

    .line 12
    .line 13
    iget-object v2, v2, Ll/i9v;->c:Lv/navigationbar/VNavigationBar;

    .line 14
    .line 15
    invoke-direct {v0, v1, v2}, Ll/tcv;-><init>(Ll/nus;Lv/navigationbar/VNavigationBar;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/h8v;->f:Ll/tcv;

    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Ll/h8v;->f:Ll/tcv;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/tcv;->w2()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public N2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/h8v;->Y2()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/h8v;->Z2()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/z0n;->a()Ll/z0n;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/z0n;->d()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0}, Ll/cyr;->lifecycle()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Ll/cu30;

    .line 20
    .line 21
    invoke-direct {v2}, Ll/cu30;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/u7v;

    .line 33
    .line 34
    invoke-direct {v1}, Ll/u7v;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/y7v;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/y7v;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/z7v;

    .line 51
    .line 52
    invoke-direct {v1}, Ll/z7v;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/a8v;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/a8v;-><init>(Ll/h8v;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final synthetic P2(Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    invoke-interface {v0, p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->hj(Ll/iam;Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic Q2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareHeaderBean;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/i9v;

    .line 4
    .line 5
    iget-object v0, v0, Ll/i9v;->f:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;

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
    check-cast v0, Ll/i9v;

    .line 20
    .line 21
    iget-object v0, v0, Ll/i9v;->f:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;

    .line 22
    .line 23
    iget-object v1, p0, Ll/h8v;->a:Ll/nus;

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
    invoke-virtual {p0, p1}, Ll/h8v;->L2(Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0}, Ll/h8v;->I2()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic R2(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/i9v;

    .line 4
    .line 5
    iget-object p1, p1, Ll/i9v;->f:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalHeaderView;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ll/h8v;->I2()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic S2(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;)V
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
    iget-object v0, p0, Ll/h8v;->b:Ll/o9v;

    .line 11
    .line 12
    iget-object v1, p0, Ll/h8v;->c:Ljava/lang/String;

    .line 13
    .line 14
    iget-object p0, p0, Ll/h8v;->e:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, p1, v1, p0}, Ll/o9v;->v2(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/h8v;->b:Ll/o9v;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/h8v;->H2()Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Ll/h8v;->c:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p0, p0, Ll/h8v;->e:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1, p0}, Ll/o9v;->v2(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;Ljava/lang/String;Ljava/lang/String;)V

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

.method public final synthetic T2(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/h8v;->b:Ll/o9v;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/h8v;->H2()Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Ll/h8v;->c:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Ll/h8v;->e:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, p0}, Ll/o9v;->v2(Lcom/p1/mobile/putong/live/base/apibean/BaseLiveListBean;Ljava/lang/String;Ljava/lang/String;)V

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

.method public final synthetic U2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getTrackData()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getTrackData()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;->getPageId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    new-instance v0, Ll/pf60;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getTrackData()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v1, "voice_template"

    .line 22
    .line 23
    invoke-virtual {p1, v1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v1, "popup_type"

    .line 28
    .line 29
    invoke-direct {v0, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    new-instance p1, Ll/pf60;

    .line 33
    .line 34
    const-string v1, "button_type"

    .line 35
    .line 36
    const-string v2, "close"

    .line 37
    .line 38
    invoke-direct {p1, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    filled-new-array {v0, p1}, [Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string v0, "e_audio_room_guide_pop_button"

    .line 46
    .line 47
    invoke-static {v0, p2, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    iget-object p0, p0, Ll/h8v;->g:Ll/jbt;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/jbt;->dismiss()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final synthetic V2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getGoAction()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p2, p0, Ll/h8v;->a:Ll/nus;

    .line 9
    .line 10
    invoke-virtual {p2}, Ll/nus;->a()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getGoAction()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {p2, v0}, Ll/yrs;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getTrackData()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMc(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/h8v;->g:Ll/jbt;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/jbt;->dismiss()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic W2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getGoAction()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p2, p0, Ll/h8v;->a:Ll/nus;

    .line 9
    .line 10
    invoke-virtual {p2}, Ll/nus;->a()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getGoAction()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {p2, v0}, Ll/yrs;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getTrackData()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMc(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/h8v;->g:Ll/jbt;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/jbt;->dismiss()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public X2()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/h8v;->Y2()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/h8v;->b:Ll/o9v;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/o9v;->u2()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll/h8v;->f:Ll/tcv;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/tcv;->C2()V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public Y2()V
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
    new-instance v1, Ll/d8v;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/d8v;-><init>(Ll/h8v;)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/e8v;

    .line 15
    .line 16
    invoke-direct {v2, p0}, Ll/e8v;-><init>(Ll/h8v;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    sget-object v0, Ll/itd0;->c:Ll/itd0;

    .line 27
    .line 28
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Ll/gm3;

    .line 33
    .line 34
    iget-boolean v1, v1, Ll/gm3;->f:Z

    .line 35
    .line 36
    if-nez v1, :cond_0

    .line 37
    .line 38
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ll/gm3;

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    iput-boolean v1, v0, Ll/gm3;->f:Z

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;->squarePopup()Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/f8v;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/f8v;-><init>(Ll/h8v;)V

    .line 58
    .line 59
    .line 60
    new-instance p0, Ll/g8v;

    .line 61
    .line 62
    invoke-direct {p0}, Ll/g8v;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    :cond_0
    return-void
.end method

.method public final Z2()V
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
    new-instance v1, Ll/b8v;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/b8v;-><init>(Ll/h8v;)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/c8v;

    .line 15
    .line 16
    invoke-direct {v2, p0}, Ll/c8v;-><init>(Ll/h8v;)V

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

.method public a3(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h8v;->c:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/h8v;->b:Ll/o9v;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/o9v;->w2(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public b3(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h8v;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final c3(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;)V
    .locals 13

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getType()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_3

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Ll/h8v;->a:Ll/nus;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/nus;->a()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Ll/xec0;->i2:I

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Landroid/widget/FrameLayout;

    .line 33
    .line 34
    new-instance v1, Ll/jbt;

    .line 35
    .line 36
    iget-object v3, p0, Ll/h8v;->a:Ll/nus;

    .line 37
    .line 38
    invoke-virtual {v3}, Ll/nus;->a()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-direct {v1, v3, v0}, Ll/jbt;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Ll/h8v;->g:Ll/jbt;

    .line 46
    .line 47
    sget v1, Ll/ldc0;->R1:I

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Landroid/widget/TextView;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getTitle()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    sget v1, Ll/ldc0;->u0:I

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, Lv/VDraweeView;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getIcon()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    const/high16 v4, 0x42c80000    # 100.0f

    .line 75
    .line 76
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    const-string v5, "context_square"

    .line 81
    .line 82
    invoke-static {v5, v1, v3, v4}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 83
    .line 84
    .line 85
    sget v3, Ll/ldc0;->C1:I

    .line 86
    .line 87
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    check-cast v3, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 92
    .line 93
    sget v4, Ll/ldc0;->l0:I

    .line 94
    .line 95
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    sget v5, Ll/ldc0;->k0:I

    .line 100
    .line 101
    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    check-cast v5, Lv/VImage;

    .line 106
    .line 107
    sget v6, Ll/ldc0;->e:I

    .line 108
    .line 109
    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v6

    .line 113
    check-cast v6, Landroid/widget/TextView;

    .line 114
    .line 115
    sget v7, Ll/ldc0;->M2:I

    .line 116
    .line 117
    invoke-virtual {v0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v7

    .line 121
    check-cast v7, Landroid/widget/TextView;

    .line 122
    .line 123
    sget v8, Ll/ldc0;->A1:I

    .line 124
    .line 125
    invoke-virtual {v0, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object v8

    .line 129
    check-cast v8, Landroid/widget/TextView;

    .line 130
    .line 131
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getType()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v9

    .line 135
    const-string v10, "game"

    .line 136
    .line 137
    invoke-static {v9, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 138
    .line 139
    .line 140
    move-result v9

    .line 141
    const/4 v10, -0x1

    .line 142
    const/4 v11, 0x0

    .line 143
    const/4 v12, 0x1

    .line 144
    if-eqz v9, :cond_1

    .line 145
    .line 146
    const-string v5, "https://auto.tancdn.com/v1/raw/4b095ed8-ed24-4e45-93e2-54e0dca9e5c014.svga"

    .line 147
    .line 148
    invoke-virtual {v3, v5, v10, v2, v12}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->g(Ljava/lang/String;ILl/wo0;Z)V

    .line 149
    .line 150
    .line 151
    invoke-static {v4, v11}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 152
    .line 153
    .line 154
    invoke-static {v7, v11}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 155
    .line 156
    .line 157
    invoke-static {v8, v12}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getSubtitle()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    invoke-virtual {v8, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 165
    .line 166
    .line 167
    const/high16 v2, 0x41200000    # 10.0f

    .line 168
    .line 169
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    invoke-static {v1, v2}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 174
    .line 175
    .line 176
    goto/16 :goto_2

    .line 177
    .line 178
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getUserInfo()Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean$UserInfoBean;

    .line 179
    .line 180
    .line 181
    move-result-object v9

    .line 182
    if-eqz v9, :cond_4

    .line 183
    .line 184
    const-string v9, "https://auto.tancdn.com/v1/raw/e64b0c62-d2bc-4f77-995c-ebc830fd418414.svga"

    .line 185
    .line 186
    invoke-virtual {v3, v9, v10, v2, v12}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->g(Ljava/lang/String;ILl/wo0;Z)V

    .line 187
    .line 188
    .line 189
    invoke-static {v4, v12}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 190
    .line 191
    .line 192
    invoke-static {v7, v12}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 193
    .line 194
    .line 195
    invoke-static {v8, v11}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getUserInfo()Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean$UserInfoBean;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    iget-object v2, v2, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean$UserInfoBean;->gender:Ljava/lang/String;

    .line 203
    .line 204
    const-string v3, "male"

    .line 205
    .line 206
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 207
    .line 208
    .line 209
    move-result v2

    .line 210
    if-eqz v2, :cond_2

    .line 211
    .line 212
    sget v2, Ll/obc0;->V5:I

    .line 213
    .line 214
    goto :goto_0

    .line 215
    :cond_2
    sget v2, Ll/obc0;->T5:I

    .line 216
    .line 217
    :goto_0
    invoke-virtual {v5, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 218
    .line 219
    .line 220
    const/high16 v2, 0x42400000    # 48.0f

    .line 221
    .line 222
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    invoke-static {v1, v2}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getUserInfo()Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean$UserInfoBean;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    iget-object v2, v2, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean$UserInfoBean;->gender:Ljava/lang/String;

    .line 234
    .line 235
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 236
    .line 237
    .line 238
    move-result v2

    .line 239
    if-eqz v2, :cond_3

    .line 240
    .line 241
    sget v2, Ll/m9c0;->x:I

    .line 242
    .line 243
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    goto :goto_1

    .line 248
    :cond_3
    sget v2, Ll/m9c0;->w:I

    .line 249
    .line 250
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 251
    .line 252
    .line 253
    move-result v2

    .line 254
    :goto_1
    const/high16 v3, 0x40800000    # 4.0f

    .line 255
    .line 256
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 257
    .line 258
    .line 259
    move-result v3

    .line 260
    int-to-float v3, v3

    .line 261
    invoke-static {v2, v3}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 262
    .line 263
    .line 264
    move-result-object v2

    .line 265
    invoke-virtual {v4, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 266
    .line 267
    .line 268
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 269
    .line 270
    invoke-virtual {v6, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getUserInfo()Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean$UserInfoBean;

    .line 274
    .line 275
    .line 276
    move-result-object v2

    .line 277
    iget v2, v2, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean$UserInfoBean;->age:I

    .line 278
    .line 279
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    invoke-virtual {v6, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 284
    .line 285
    .line 286
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getUserInfo()Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean$UserInfoBean;

    .line 287
    .line 288
    .line 289
    move-result-object v2

    .line 290
    iget-object v2, v2, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean$UserInfoBean;->zodiac:Ljava/lang/String;

    .line 291
    .line 292
    invoke-static {v2}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 293
    .line 294
    .line 295
    move-result-object v2

    .line 296
    invoke-static {v2}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object v2

    .line 300
    invoke-virtual {v7, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 301
    .line 302
    .line 303
    :cond_4
    :goto_2
    sget v2, Ll/ldc0;->A:I

    .line 304
    .line 305
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 306
    .line 307
    .line 308
    move-result-object v2

    .line 309
    new-instance v3, Ll/v7v;

    .line 310
    .line 311
    invoke-direct {v3, p0, p1}, Ll/v7v;-><init>(Ll/h8v;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;)V

    .line 312
    .line 313
    .line 314
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 315
    .line 316
    .line 317
    sget v2, Ll/ldc0;->I:I

    .line 318
    .line 319
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 320
    .line 321
    .line 322
    move-result-object v2

    .line 323
    check-cast v2, Landroid/widget/TextView;

    .line 324
    .line 325
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getButtonText()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v3

    .line 329
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->getTrackData()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 333
    .line 334
    .line 335
    move-result-object v2

    .line 336
    invoke-static {v2}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMv(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 337
    .line 338
    .line 339
    sget v2, Ll/ldc0;->I:I

    .line 340
    .line 341
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    new-instance v2, Ll/w7v;

    .line 346
    .line 347
    invoke-direct {v2, p0, p1}, Ll/w7v;-><init>(Ll/h8v;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;)V

    .line 348
    .line 349
    .line 350
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 351
    .line 352
    .line 353
    new-instance v0, Ll/x7v;

    .line 354
    .line 355
    invoke-direct {v0, p0, p1}, Ll/x7v;-><init>(Ll/h8v;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;)V

    .line 356
    .line 357
    .line 358
    invoke-static {v1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 359
    .line 360
    .line 361
    iget-object p0, p0, Ll/h8v;->g:Ll/jbt;

    .line 362
    .line 363
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 364
    .line 365
    .line 366
    :cond_5
    :goto_3
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/i9v;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/i9v;->r()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/i9v;

    .line 11
    .line 12
    iget-object v1, p0, Ll/h8v;->a:Ll/nus;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/nus;->a()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ll/i9v;->d(Lcom/p1/mobile/android/app/Act;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/h8v;->f:Ll/tcv;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/tcv;->y2()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/h8v;->b:Ll/o9v;

    .line 27
    .line 28
    new-instance v1, Ll/u9v;

    .line 29
    .line 30
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 31
    .line 32
    move-object v2, p0

    .line 33
    check-cast v2, Ll/i9v;

    .line 34
    .line 35
    iget-object v2, v2, Ll/i9v;->g:Lcom/google/android/material/tabs/TabLayout;

    .line 36
    .line 37
    check-cast p0, Ll/i9v;

    .line 38
    .line 39
    iget-object p0, p0, Ll/i9v;->h:Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;

    .line 40
    .line 41
    invoke-direct {v1, v2, p0}, Ll/u9v;-><init>(Lcom/google/android/material/tabs/TabLayout;Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ll/cyr;->C(Ll/iam;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
