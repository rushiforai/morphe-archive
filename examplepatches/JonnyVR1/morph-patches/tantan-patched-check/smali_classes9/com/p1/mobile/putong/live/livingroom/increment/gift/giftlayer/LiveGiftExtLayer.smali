.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public c:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

.field public e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->a:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->previewUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    const/high16 v2, 0x42c80000    # 100.0f

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 17
    .line 18
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->previewUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 23
    .line 24
    invoke-static {p0, v0, p1}, Ll/biv;->f(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->senderShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->receiverShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->a:Landroid/widget/FrameLayout;

    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->b:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 42
    .line 43
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->senderShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 48
    .line 49
    invoke-static {v0, v1, v3}, Ll/biv;->f(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->c:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 53
    .line 54
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->receiverShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 59
    .line 60
    invoke-static {v0, v1, v2}, Ll/biv;->f(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

    .line 64
    .line 65
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->senderShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

    .line 73
    .line 74
    const-string v1, "#00CCFF"

    .line 75
    .line 76
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->setStrokeColor(I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

    .line 84
    .line 85
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->receiverShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 86
    .line 87
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

    .line 93
    .line 94
    const-string v0, "#FF68AC"

    .line 95
    .line 96
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;->setStrokeColor(I)V

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 104
    .line 105
    const/4 p1, -0x1

    .line 106
    const/4 v0, 0x0

    .line 107
    const-string v1, "https://auto.tancdn.com/v1/raw/ea1d53f7-efa2-4e15-8c7b-e491fea4febd14.svga"

    .line 108
    .line 109
    invoke-virtual {p0, v1, p1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 110
    .line 111
    .line 112
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->J5:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/FrameLayout;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->a:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->r6:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->u:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->b:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 33
    .line 34
    sget v0, Ll/mdc0;->v:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->c:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 43
    .line 44
    sget v0, Ll/mdc0;->H6:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->d:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

    .line 53
    .line 54
    sget v0, Ll/mdc0;->I6:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveStrokeTextView;

    .line 63
    .line 64
    sget v0, Ll/mdc0;->s5:I

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 73
    .line 74
    return-void
.end method
