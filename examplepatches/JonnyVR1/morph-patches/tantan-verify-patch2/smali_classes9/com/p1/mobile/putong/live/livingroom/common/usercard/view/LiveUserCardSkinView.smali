.class public Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VDraweeView;

.field public f:Lv/VDraweeView;

.field public g:Lv/VDraweeView;

.field public h:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

.field public i:Lv/VDraweeView;

.field public j:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

.field public k:Landroid/view/View;

.field public l:Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;


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

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->q(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->r0(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->q0()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->p0(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;)V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->o0()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final B0(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->j:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->i:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;->resourceId:I

    .line 16
    .line 17
    if-lez v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->t0(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;->staticUrl:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->i:Lv/VDraweeView;

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->i:Lv/VDraweeView;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;->staticUrl:Ljava/lang/String;

    .line 40
    .line 41
    const-string v0, "context_single_room"

    .line 42
    .line 43
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->j:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 48
    .line 49
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->i:Lv/VDraweeView;

    .line 53
    .line 54
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public D0(Landroid/view/View;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->f:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->g:Lv/VDraweeView;

    .line 11
    .line 12
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v0, v1

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 22
    :goto_1
    if-eqz v0, :cond_2

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    goto :goto_2

    .line 26
    :cond_2
    sget v2, Ll/obc0;->C8:I

    .line 27
    .line 28
    invoke-static {v2}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    :goto_2
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->k:Landroid/view/View;

    .line 36
    .line 37
    if-eqz p2, :cond_3

    .line 38
    .line 39
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_3
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public m0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->f:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->d:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->g:Lv/VDraweeView;

    .line 18
    .line 19
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->e:Lv/VDraweeView;

    .line 26
    .line 27
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public n0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->d:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->e:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->f:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->g:Lv/VDraweeView;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->h:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->stop()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->i:Lv/VDraweeView;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->s0()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic o0()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->l:Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->N1:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->k:Landroid/view/View;

    .line 11
    .line 12
    sget v0, Ll/mdc0;->R1:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lv/VDraweeView;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->d:Lv/VDraweeView;

    .line 21
    .line 22
    sget v0, Ll/mdc0;->Q1:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lv/VDraweeView;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->e:Lv/VDraweeView;

    .line 31
    .line 32
    sget v0, Ll/mdc0;->P1:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lv/VDraweeView;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->f:Lv/VDraweeView;

    .line 41
    .line 42
    sget v0, Ll/mdc0;->O1:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lv/VDraweeView;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->g:Lv/VDraweeView;

    .line 51
    .line 52
    sget v0, Ll/mdc0;->l0:I

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 59
    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->h:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 61
    .line 62
    sget v0, Ll/mdc0;->k0:I

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lv/VDraweeView;

    .line 69
    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->i:Lv/VDraweeView;

    .line 71
    .line 72
    sget v0, Ll/mdc0;->m0:I

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 79
    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->j:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->h:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 83
    .line 84
    sget-object v0, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$RenderMode;->TEXTURE_VIEW:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$RenderMode;

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->setRenderMode(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer$RenderMode;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final synthetic p0(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->l:Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const-string v0, "loop"

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;->playType:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->B0(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;->staticUrl:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x1

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->j:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 34
    .line 35
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->i:Lv/VDraweeView;

    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->i:Lv/VDraweeView;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;->staticUrl:Ljava/lang/String;

    .line 47
    .line 48
    const-string v0, "context_single_room"

    .line 49
    .line 50
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic q0()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->l:Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic r0(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->l:Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const-string v0, "loop"

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;->playType:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->u0(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;->staticUrl:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x1

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->h:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 34
    .line 35
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->i:Lv/VDraweeView;

    .line 40
    .line 41
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->i:Lv/VDraweeView;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;->staticUrl:Ljava/lang/String;

    .line 47
    .line 48
    const-string v0, "context_single_room"

    .line 49
    .line 50
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public s0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->f:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->g:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->d:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->e:Lv/VDraweeView;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->i:Lv/VDraweeView;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->h:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 28
    .line 29
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setDialogHost(Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->l:Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;

    .line 2
    .line 3
    sget v0, Ll/mdc0;->Y6:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/xfu;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/xfu;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final t0(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;)V
    .locals 2

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;->resourceId:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/hre;

    .line 8
    .line 9
    invoke-direct {v1, v0}, Ll/hre;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/agu;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/agu;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ll/hre;->m(Ll/pcj;)Ll/hre;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;->dynamicEffectExtends:Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/hre;->j(Ljava/util/List;)Ll/hre;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/bgu;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1}, Ll/bgu;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/hre;->i(Ll/x20;)Ll/hre;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->j:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 37
    .line 38
    invoke-static {p0, p1}, Ll/jhe;->r(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final u0(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;)V
    .locals 3

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;->resourceId:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->i:Lv/VDraweeView;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/hre;

    .line 14
    .line 15
    invoke-direct {v1, v0}, Ll/hre;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Ll/yfu;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/yfu;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ll/hre;->m(Ll/pcj;)Ll/hre;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/zfu;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1}, Ll/zfu;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/hre;->i(Ll/x20;)Ll/hre;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->h:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 37
    .line 38
    invoke-static {p0, p1}, Ll/jfl0;->n(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/hre;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final v0(Ll/nsv;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->m0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/e3t;->d()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    sget p0, Ll/obc0;->q:I

    .line 18
    .line 19
    invoke-static {p0}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    sget p0, Ll/obc0;->p:I

    .line 28
    .line 29
    invoke-static {p0}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public w0(Lv/VDraweeView;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/wlj;

    .line 18
    .line 19
    new-instance p3, Landroid/graphics/PointF;

    .line 20
    .line 21
    const/high16 v0, 0x3f000000    # 0.5f

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-direct {p3, v0, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p3}, Ll/wlj;->v(Landroid/graphics/PointF;)V

    .line 28
    .line 29
    .line 30
    const-string p0, "context_single_room"

    .line 31
    .line 32
    invoke-static {p0, p1, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-static {p2, p1}, Ll/jlk0;->g(Ljava/lang/String;Lv/VDraweeView;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    const/4 p0, 0x0

    .line 41
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public y0(Ll/nsv;Landroid/view/View;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/nsv;->g()Ll/pyl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Ll/e3t;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Ll/e3t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->profileConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskProfileConfig;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    if-eqz p1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/nsv;->g()Ll/pyl;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    instance-of v0, v0, Ll/l6o0;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v0, v0, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->profileConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskProfileConfig;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 v0, 0x0

    .line 40
    :goto_0
    if-nez v0, :cond_2

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->s0()V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskProfileConfig;->profileVersion:I

    .line 47
    .line 48
    const/4 v2, 0x2

    .line 49
    if-eq v1, v2, :cond_5

    .line 50
    .line 51
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Ll/p6s;->E1()Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    const/4 v2, 0x1

    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskProfileConfig;->profileVersion:I

    .line 63
    .line 64
    if-ne v1, v2, :cond_3

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_3
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskProfileConfig;->profileVersion:I

    .line 68
    .line 69
    if-ne v1, v2, :cond_4

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskProfileConfig;->wholeFrameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->z0(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;)V

    .line 74
    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->d:Lv/VDraweeView;

    .line 78
    .line 79
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskProfileConfig;->topFrameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 80
    .line 81
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 82
    .line 83
    const/4 v4, 0x0

    .line 84
    invoke-virtual {p0, v1, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->w0(Lv/VDraweeView;Ljava/lang/String;Z)V

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->e:Lv/VDraweeView;

    .line 88
    .line 89
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskProfileConfig;->topFrameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 90
    .line 91
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {p0, v1, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->w0(Lv/VDraweeView;Ljava/lang/String;Z)V

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->f:Lv/VDraweeView;

    .line 97
    .line 98
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskProfileConfig;->backgroundPictureConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 99
    .line 100
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {p0, v1, v3, v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->w0(Lv/VDraweeView;Ljava/lang/String;Z)V

    .line 103
    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->g:Lv/VDraweeView;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskProfileConfig;->backgroundPictureConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {p0, v1, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->w0(Lv/VDraweeView;Ljava/lang/String;Z)V

    .line 112
    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_5
    :goto_1
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskProfileConfig;->wholeFrameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;

    .line 116
    .line 117
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->B0(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;)V

    .line 118
    .line 119
    .line 120
    :goto_2
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->v0(Ll/nsv;Landroid/view/View;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public final z0(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->h:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->i:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;->resourceId:I

    .line 16
    .line 17
    if-lez v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->u0(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;->staticUrl:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->i:Lv/VDraweeView;

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->i:Lv/VDraweeView;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardWholeFrameConfig;->staticUrl:Ljava/lang/String;

    .line 40
    .line 41
    const-string v0, "context_single_room"

    .line 42
    .line 43
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->h:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 48
    .line 49
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->i:Lv/VDraweeView;

    .line 53
    .line 54
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    return-void
.end method
