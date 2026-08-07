.class public Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardHeaderView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardHeaderView;

.field public e:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardInfoView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardAwardGroup;

.field public g:Landroid/view/View;

.field public h:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;

.field public i:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;

.field public j:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;

.field public k:Ll/ats;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tss;->a(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardHeaderView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Ll/ats;Ll/lsw;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ats;",
            "Ll/lsw;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardHeaderView;->k:Ll/ats;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardHeaderView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardInfoView;

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardInfoView;->i0(Ll/lsw;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardHeaderView;->f:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardAwardGroup;

    .line 9
    .line 10
    const/4 p2, 0x1

    .line 11
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardHeaderView;->j0(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final j0(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    const/4 v1, 0x3

    .line 3
    if-ge v0, v1, :cond_4

    .line 4
    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-le v2, v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    const/4 v2, 0x0

    .line 25
    :goto_1
    const/4 v3, 0x1

    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    const/4 v4, 0x2

    .line 29
    if-eq v0, v3, :cond_2

    .line 30
    .line 31
    if-eq v0, v4, :cond_1

    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardHeaderView;->j:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;

    .line 35
    .line 36
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardHeaderView;->k:Ll/ats;

    .line 37
    .line 38
    invoke-virtual {v3, v4, v2, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->e(Ll/ats;Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;I)V

    .line 39
    .line 40
    .line 41
    goto :goto_2

    .line 42
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardHeaderView;->h:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;

    .line 43
    .line 44
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardHeaderView;->k:Ll/ats;

    .line 45
    .line 46
    invoke-virtual {v1, v3, v2, v4}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->e(Ll/ats;Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;I)V

    .line 47
    .line 48
    .line 49
    goto :goto_2

    .line 50
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardHeaderView;->i:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;

    .line 51
    .line 52
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardHeaderView;->k:Ll/ats;

    .line 53
    .line 54
    invoke-virtual {v1, v4, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->e(Ll/ats;Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;I)V

    .line 55
    .line 56
    .line 57
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardBoardHeaderView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
