.class public Ll/i3r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/t3r;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

.field public b:Ll/p2r;

.field public c:Ll/p2r;

.field public d:Ll/t3r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/t3r<",
            "Ll/rwn0;",
            "Ll/i3r;",
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
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;->r0(Landroid/view/LayoutInflater;)Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/i3r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

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
    iget-object p0, p0, Ll/i3r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

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

.method public a(Ll/t3r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i3r;->d:Ll/t3r;

    .line 2
    .line 3
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i3r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;->q0()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/i3r;->c:Ll/p2r;

    .line 7
    .line 8
    new-instance v1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/p2r;->G(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/i3r;->b:Ll/p2r;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/p2r;->G(Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public c()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i3r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/t3r;)V
    .locals 2

    .line 1
    new-instance v0, Ll/p2r;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/h3r;

    .line 7
    .line 8
    invoke-direct {v1, p1}, Ll/h3r;-><init>(Ll/t3r;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, p1, v1}, Ll/p2r;-><init>(Ll/t3r;Lcom/tantanapp/media/ttmediautils/download/Action2;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/i3r;->b:Ll/p2r;

    .line 15
    .line 16
    new-instance v0, Ll/p2r;

    .line 17
    .line 18
    new-instance v1, Ll/h3r;

    .line 19
    .line 20
    invoke-direct {v1, p1}, Ll/h3r;-><init>(Ll/t3r;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {v0, p1, v1}, Ll/p2r;-><init>(Ll/t3r;Lcom/tantanapp/media/ttmediautils/download/Action2;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/i3r;->c:Ll/p2r;

    .line 27
    .line 28
    iget-object v0, p0, Ll/i3r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;->t0(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView$b;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/i3r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

    .line 34
    .line 35
    iget-object v0, p0, Ll/i3r;->b:Ll/p2r;

    .line 36
    .line 37
    iget-object v1, p0, Ll/i3r;->c:Ll/p2r;

    .line 38
    .line 39
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;->s0(Ll/p2r;Ll/p2r;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/i3r;->b:Ll/p2r;

    .line 43
    .line 44
    new-instance p1, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/p2r;->G(Ljava/util/List;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/i3r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;->setListData(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/i3r;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvChooseSongPageView;->setSearchListData(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/t3r;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i3r;->a(Ll/t3r;)V

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
