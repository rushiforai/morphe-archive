.class public Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public g:Landroid/widget/FrameLayout;

.field public h:Landroid/widget/FrameLayout;

.field public i:Lv/VDraweeView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/TextView;


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
    invoke-static {p0, p1}, Ll/j520;->a(Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Ll/i420;Z)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/i420;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Ll/i420;->e()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {p1, v0}, Ll/gfj0;->g(Ll/i420;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;->d:Lv/VDraweeView;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/i420;->b()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->getCoverUrl()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const-string v3, "context_square"

    .line 26
    .line 27
    invoke-static {v3, v0, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ll/i420;->c()Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;->j0(Ljava/lang/Boolean;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;->j:Landroid/widget/TextView;

    .line 54
    .line 55
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 56
    .line 57
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 58
    .line 59
    .line 60
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;->k:Landroid/widget/TextView;

    .line 61
    .line 62
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 63
    .line 64
    .line 65
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;->k:Landroid/widget/TextView;

    .line 66
    .line 67
    invoke-virtual {p1}, Ll/i420;->b()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;->e:Landroid/widget/FrameLayout;

    .line 77
    .line 78
    const/4 v0, 0x0

    .line 79
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;->g:Landroid/widget/FrameLayout;

    .line 83
    .line 84
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    const/4 p2, 0x1

    .line 88
    if-eqz v1, :cond_2

    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;->e:Landroid/widget/FrameLayout;

    .line 91
    .line 92
    invoke-static {v0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 96
    .line 97
    const-string v0, "https://auto.tancdn.com/v1/raw/abba7f84-cd90-45f7-ae91-088c8c77a40111.pdf"

    .line 98
    .line 99
    const/4 v1, -0x1

    .line 100
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1}, Ll/i420;->d()Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;->j:Landroid/widget/TextView;

    .line 108
    .line 109
    if-eqz p1, :cond_1

    .line 110
    .line 111
    sget p1, Lcom/p1/mobile/putong/live/external/R$string;->N:I

    .line 112
    .line 113
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_1
    sget p1, Lcom/p1/mobile/putong/live/external/R$string;->B:I

    .line 118
    .line 119
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;->g:Landroid/widget/FrameLayout;

    .line 124
    .line 125
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;->j:Landroid/widget/TextView;

    .line 129
    .line 130
    sget p1, Lcom/p1/mobile/putong/live/external/R$string;->a0:I

    .line 131
    .line 132
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public j0(Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const-string v0, "context_square"

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-static {p1}, Ll/g23;->g(I)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;->i:Lv/VDraweeView;

    .line 17
    .line 18
    iget-object v1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v1, Ljava/lang/Integer;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast p1, Ljava/lang/Integer;

    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-static {v0, p0, p2, v1, p1}, Ll/izs;->p(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;->i:Lv/VDraweeView;

    .line 39
    .line 40
    invoke-static {v0, p0, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileVideoItemView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
