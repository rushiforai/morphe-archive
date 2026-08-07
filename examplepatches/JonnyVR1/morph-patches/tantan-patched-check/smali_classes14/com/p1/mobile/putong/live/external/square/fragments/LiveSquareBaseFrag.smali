.class public abstract Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;
.super Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;
.source "SourceFile"


# static fields
.field public static final ARGS_IS_DEFAULT:Ljava/lang/String; = "live_square_is_default_tab"

.field public static final ARGS_TAB_INFO:Ljava/lang/String; = "live_square_tab_info"

.field public static final LIVE_IS_FROM_INTL_HOME:Ljava/lang/String; = "live_is_from_intl_home"


# instance fields
.field protected volatile endSubscribeSignal:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field private eventBusFunc:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Lcom/tantan/live/home/eventbus/LiveHomeEventBus;",
            ">;"
        }
    .end annotation
.end field

.field protected isDefaultTab:Z

.field public layoutColumnNum:I

.field protected loaded:Z

.field public tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->isDefaultTab:Z

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->endSubscribeSignal:Lrx/subjects/b;

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->loaded:Z

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic X4(Ll/d3q;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    instance-of p0, p0, Ll/h2u;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private j5(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Ll/w6u;->b(Ll/l4g0;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-static {p0}, Ll/w6u;->a(Ll/l4g0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public S4(ZIJ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->S4(ZIJ)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->j5(Z)V

    .line 5
    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->e5()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->f5()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public U4(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->U4(Landroid/view/View;Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->b5()Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    invoke-static {p2}, Ll/wft;->b(I)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->a5()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const/4 p2, 0x0

    .line 24
    invoke-virtual {p1, p2, p0, p2, p2}, Landroid/view/View;->setPadding(IIII)V

    .line 25
    .line 26
    .line 27
    filled-new-array {p1}, [Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/bnl0;->g0([Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public Y4()V
    .locals 0

    .line 1
    return-void
.end method

.method public Z4()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->eventBusFunc:Ll/pcj;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->fragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v0, "live"

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    instance-of v0, p0, Lcom/p1/mobile/putong/live/external/square/home/LiveSquareHomeFrag;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    check-cast p0, Lcom/p1/mobile/putong/live/external/square/home/LiveSquareHomeFrag;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/square/home/LiveSquareHomeFrag;->N4()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_1
    new-instance p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 38
    .line 39
    invoke-direct {p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;-><init>()V

    .line 40
    .line 41
    .line 42
    return-object p0
.end method

.method public a5()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/high16 p0, 0x42b80000    # 92.0f

    .line 10
    .line 11
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/high16 p0, 0x42300000    # 44.0f

    .line 17
    .line 18
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public b5()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public c5()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public d4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v1, "live_square_tab_info"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 16
    .line 17
    const-string v1, "live_square_is_default_tab"

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->isDefaultTab:Z

    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->tabInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->layoutColumn:I

    .line 31
    .line 32
    iput v0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->layoutColumnNum:I

    .line 33
    .line 34
    :cond_1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public d5()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public e5()V
    .locals 0

    .line 1
    return-void
.end method

.method public f5()V
    .locals 0

    .line 1
    return-void
.end method

.method public g5(Z)V
    .locals 0

    .line 1
    sget-object p0, Ll/t4u;->e:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public h5(Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/t0u;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/t0u;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-ltz p0, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p1, p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public i5(Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Lcom/tantan/live/home/eventbus/LiveHomeEventBus;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->eventBusFunc:Ll/pcj;

    .line 2
    .line 3
    return-void
.end method

.method public onDestroyView()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;->onDestroyView()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->endSubscribeSignal:Lrx/subjects/b;

    .line 5
    .line 6
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
