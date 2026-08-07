.class public Ll/a5r;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ll/a5r;Ll/nfn0;)Lkotlin/Pair;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/a5r;->K3(Ll/nfn0;)Lkotlin/Pair;

    move-result-object p0

    return-object p0
.end method

.method private K3(Ll/nfn0;)Lkotlin/Pair;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nfn0;",
            ")",
            "Lkotlin/Pair<",
            "[I",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;->c:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->getPlayInfo()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v1, p1, Ll/nfn0;->d:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    new-instance p1, Lkotlin/Pair;

    .line 24
    .line 25
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;->c:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->get_avatar()Lv/VDraweeView;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Ll/i0k;->b(Landroid/view/View;)[I

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 40
    .line 41
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;->c:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;->get_avatar()Lv/VDraweeView;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-direct {p1, v0, p0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    return-object p1

    .line 61
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 62
    .line 63
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

    .line 66
    .line 67
    iget-object p1, p1, Ll/nfn0;->d:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;->u(Ljava/lang/String;)Lkotlin/Pair;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0
.end method


# virtual methods
.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 5
    .line 6
    iget-boolean v1, v0, Ll/dum;->d:Z

    .line 7
    .line 8
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/s7m0;

    .line 13
    .line 14
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;

    .line 15
    .line 16
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

    .line 17
    .line 18
    invoke-direct {v1, v0, v2}, Ll/s7m0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    new-instance v1, Ll/d2m0;

    .line 26
    .line 27
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

    .line 30
    .line 31
    invoke-direct {v1, v0, v2}, Ll/d2m0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 35
    .line 36
    .line 37
    :goto_0
    new-instance v0, Ll/r4r;

    .line 38
    .line 39
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 40
    .line 41
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;

    .line 44
    .line 45
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvPanelViewModel;->c:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;

    .line 46
    .line 47
    invoke-direct {v0, v1, v2}, Ll/r4r;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvNewStageView;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 51
    .line 52
    .line 53
    new-instance v0, Ll/z4r;

    .line 54
    .line 55
    invoke-direct {v0, p0}, Ll/z4r;-><init>(Ll/a5r;)V

    .line 56
    .line 57
    .line 58
    const-class v1, Ll/nfn0;

    .line 59
    .line 60
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method
