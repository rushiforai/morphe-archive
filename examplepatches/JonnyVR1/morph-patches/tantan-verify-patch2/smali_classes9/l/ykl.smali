.class public Ll/ykl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ell;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/HourLeaderBoardContentView;

.field public b:Ll/ell;

.field public final c:Ll/uhl;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ykl$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ykl$a;-><init>(Ll/ykl;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ykl;->c:Ll/uhl;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/HourLeaderBoardContentView;->l0(Landroid/view/LayoutInflater;)Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/HourLeaderBoardContentView;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/ykl;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/HourLeaderBoardContentView;

    .line 20
    .line 21
    return-void
.end method

.method public static bridge synthetic a(Ll/ykl;)Ll/ell;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ykl;->b:Ll/ell;

    return-object p0
.end method

.method private d()Ll/evl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ykl;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/HourLeaderBoardContentView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance p0, Ll/vhl;

    .line 7
    .line 8
    invoke-direct {p0}, Ll/vhl;-><init>()V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/ell;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ykl;->b:Ll/ell;

    .line 2
    .line 3
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ykl;->d()Ll/evl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/evl;->onDestroy()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ykl;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainlandnew/HourLeaderBoardContentView;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ykl;->d()Ll/evl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/evl;->G()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public i(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/ykl;->d()Ll/evl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/evl;->l(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ell;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ykl;->b(Ll/ell;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ykl;->d()Ll/evl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/evl;->Y(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ykl;->d()Ll/evl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/evl;->H(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public l()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/ykl;->d()Ll/evl;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/ykl;->c:Ll/uhl;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ll/evl;->K(Ll/uhl;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ll/ykl;->d()Ll/evl;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-interface {p0, v0}, Ll/evl;->I(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
