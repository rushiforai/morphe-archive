.class public Ll/y2r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/f3r;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;

.field public b:Ll/k2r;

.field public c:Ll/f3r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/f3r<",
            "Ll/rwn0;",
            "Ll/y2r;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;->i0(Landroid/view/LayoutInflater;)Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/y2r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/y2r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public a(Ll/f3r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y2r;->c:Ll/f3r;

    .line 2
    .line 3
    return-void
.end method

.method public b()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y2r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y2r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;->f:Lv/VLinear;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/y2r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;->e:Lv/VRecyclerView;

    .line 12
    .line 13
    const/16 v0, 0x8

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public d(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVOrder;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/y2r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;->f:Lv/VLinear;

    .line 4
    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/y2r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;->e:Lv/VRecyclerView;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/y2r;->b:Ll/k2r;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/k2r;->G(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/f3r;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y2r;->a(Ll/f3r;)V

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

.method public init()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/y2r;->c:Ll/f3r;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/rwn0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/hrk0;->r()Ll/ado0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/ado0;->G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->isManager:Z

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Ll/y2r;->c:Ll/f3r;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ll/rwn0;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    const/4 v0, 0x0

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 49
    :goto_1
    new-instance v1, Ll/k2r;

    .line 50
    .line 51
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget-object v3, p0, Ll/y2r;->c:Ll/f3r;

    .line 56
    .line 57
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    new-instance v4, Ll/x2r;

    .line 61
    .line 62
    invoke-direct {v4, v3}, Ll/x2r;-><init>(Ll/f3r;)V

    .line 63
    .line 64
    .line 65
    invoke-direct {v1, v2, v4, v0}, Ll/k2r;-><init>(Lcom/p1/mobile/android/app/Act;Ll/y20;Z)V

    .line 66
    .line 67
    .line 68
    iput-object v1, p0, Ll/y2r;->b:Ll/k2r;

    .line 69
    .line 70
    iget-object p0, p0, Ll/y2r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;

    .line 71
    .line 72
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvAlreadyChooseSongPageView;->setAdapter(Ll/k2r;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method
