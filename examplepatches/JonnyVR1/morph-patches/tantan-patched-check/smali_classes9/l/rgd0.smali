.class public Ll/rgd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ogd0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

.field public b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

.field public c:Landroid/view/ViewStub;

.field public d:Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;

.field public e:Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;

.field public f:Ll/ogd0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/rgd0;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rgd0;->q(Z)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;->getPresenter()Ll/x5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;->getPresenter()Ll/x5;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/l6t;->s2()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static bridge synthetic c(Ll/rgd0;)Ll/ogd0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0;->f:Ll/ogd0;

    return-object p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/rgd0;->j()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/sgd0;->b(Ll/rgd0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 2
    .line 3
    new-instance v0, Ll/qgd0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/qgd0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->z(Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->G(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Ll/ogd0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rgd0;->f:Ll/ogd0;

    .line 2
    .line 3
    return-void
.end method

.method public i()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->getBackupView()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ogd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rgd0;->f(Ll/ogd0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rgd0;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/rgd0;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 6
    .line 7
    new-instance v0, Ll/pgd0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/pgd0;-><init>(Ll/rgd0;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->G(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V

    .line 13
    .line 14
    .line 15
    return-object p1
.end method

.method public j()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->getCurrentView()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public k()Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->getViewStates()Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0;->e:Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->h()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public m()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0;->e:Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->f()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 6
    .line 7
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->A()V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Ll/rgd0;->f:Ll/ogd0;

    .line 11
    .line 12
    invoke-virtual {v2}, Ll/ogd0;->n1()V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    sub-long/2addr v2, v0

    .line 20
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "[live]quickPlay"

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    sget v0, Ll/yec0;->m5:I

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-static {p1, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;

    .line 37
    .line 38
    iget-object v1, p0, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->setIndicatorView(Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 44
    .line 45
    new-instance v1, Ll/rgd0$a;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/rgd0$a;-><init>(Ll/rgd0;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->setOnLiveScrollListener(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$b;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 54
    .line 55
    new-instance v1, Ll/rgd0$b;

    .line 56
    .line 57
    invoke-direct {v1, p0, p1}, Ll/rgd0$b;-><init>(Ll/rgd0;Lcom/p1/mobile/android/app/Act;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->setOnViewListener(Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$c;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->getViewStates()Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->k()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final synthetic q(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->getBackupView()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;->getPresenter()Ll/x5;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->getBackupView()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;->getPresenter()Ll/x5;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, p1}, Ll/x5;->g4(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->getCurrentView()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;->getPresenter()Ll/x5;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->getCurrentView()Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;->getPresenter()Ll/x5;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0, p1}, Ll/x5;->g4(Z)V

    .line 49
    .line 50
    .line 51
    :cond_1
    iget-object p0, p0, Ll/rgd0;->d:Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/side/LiveSideView;->x(Z)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->I(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->S(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->setEnable(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w(ZZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0;->a:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->T(Z)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->L(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public x(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->J(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public y(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rgd0;->e:Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/rgd0;->c:Landroid/view/ViewStub;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;

    .line 12
    .line 13
    iput-object v0, p0, Ll/rgd0;->e:Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Ll/rgd0;->e:Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;

    .line 16
    .line 17
    iget-object v1, p0, Ll/rgd0;->f:Ll/ogd0;

    .line 18
    .line 19
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->g(Ll/rgd0;Ll/ogd0;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/rgd0;->e:Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomScrollGuideView;->n(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public z()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->K()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
