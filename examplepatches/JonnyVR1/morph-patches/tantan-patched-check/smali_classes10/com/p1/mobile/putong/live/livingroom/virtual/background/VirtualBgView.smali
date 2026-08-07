.class public Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "Ll/v2m0;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public f:Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;

.field public g:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->m0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lxl0;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Ll/v2m0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/v2m0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->i0(Ll/v2m0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public j0()V
    .locals 2

    .line 1
    sget v0, Ll/obc0;->N0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->d:Lv/VDraweeView;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->d:Lv/VDraweeView;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->g:Lv/VImage;

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->m0()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public k0()V
    .locals 2

    .line 1
    sget v0, Ll/obc0;->z3:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->d:Lv/VDraweeView;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->d:Lv/VDraweeView;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->g:Lv/VImage;

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->m0()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public l0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 3
    .line 4
    .line 5
    const-string v1, "svga"

    .line 6
    .line 7
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, 0x1

    .line 12
    if-nez v2, :cond_3

    .line 13
    .line 14
    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    const-string v1, "mp4"

    .line 22
    .line 23
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_2

    .line 28
    .line 29
    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->d:Lv/VDraweeView;

    .line 37
    .line 38
    invoke-static {p1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 42
    .line 43
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->m0()V

    .line 47
    .line 48
    .line 49
    const-string p1, "context_livingAct"

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->d:Lv/VDraweeView;

    .line 52
    .line 53
    invoke-static {p1, v1, p2}, Ll/izs;->k(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->d:Lv/VDraweeView;

    .line 58
    .line 59
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 63
    .line 64
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->f:Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;

    .line 68
    .line 69
    invoke-static {p1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->f:Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;

    .line 73
    .line 74
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->m(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->d:Lv/VDraweeView;

    .line 79
    .line 80
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 84
    .line 85
    invoke-static {p1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->m0()V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 92
    .line 93
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView$a;

    .line 94
    .line 95
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;)V

    .line 96
    .line 97
    .line 98
    const/4 v2, -0x1

    .line 99
    invoke-virtual {p1, p2, v2, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 100
    .line 101
    .line 102
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->g:Lv/VImage;

    .line 103
    .line 104
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final m0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->f:Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->f:Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/LiveMediaBgView;->o()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/background/VirtualBgView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
