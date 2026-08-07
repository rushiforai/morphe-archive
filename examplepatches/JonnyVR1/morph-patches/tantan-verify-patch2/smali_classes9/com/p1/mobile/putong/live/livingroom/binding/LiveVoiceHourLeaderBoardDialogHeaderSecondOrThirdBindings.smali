.class public Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardSecondOrThirdView;

.field public e:Lv/VDraweeView;

.field public f:Lv/VImage;

.field public g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public i:Lv/VDraweeView;

.field public j:Lv/VImage;

.field public k:Landroid/view/View;

.field public l:Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;

.field public m:Lv/VText;

.field public n:Lv/VText;


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
.method public getRoot()Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardSecondOrThirdView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardSecondOrThirdView;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0(Landroid/view/ViewGroup;)V
    .locals 2

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardSecondOrThirdView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardSecondOrThirdView;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lv/VDraweeView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->e:Lv/VDraweeView;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string v0, "_bg_view"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    const/4 v1, 0x1

    .line 22
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lv/VImage;

    .line 27
    .line 28
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->f:Lv/VImage;

    .line 29
    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    const-string v0, "_bg"

    .line 33
    .line 34
    :cond_1
    const/4 v1, 0x2

    .line 35
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->g:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 42
    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    const-string v0, "_rank_svga"

    .line 46
    .line 47
    :cond_2
    const/4 v1, 0x3

    .line 48
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->h:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 55
    .line 56
    if-nez v1, :cond_3

    .line 57
    .line 58
    const-string v0, "_avatar"

    .line 59
    .line 60
    :cond_3
    const/4 v1, 0x4

    .line 61
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Lv/VDraweeView;

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->i:Lv/VDraweeView;

    .line 68
    .line 69
    if-nez v1, :cond_4

    .line 70
    .line 71
    const-string v0, "_mvp"

    .line 72
    .line 73
    :cond_4
    const/4 v1, 0x5

    .line 74
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Lv/VImage;

    .line 79
    .line 80
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->j:Lv/VImage;

    .line 81
    .line 82
    if-nez v1, :cond_5

    .line 83
    .line 84
    const-string v0, "_crown"

    .line 85
    .line 86
    :cond_5
    const/4 v1, 0x6

    .line 87
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->k:Landroid/view/View;

    .line 92
    .line 93
    if-nez v1, :cond_6

    .line 94
    .line 95
    const-string v0, "_avatar_bottom"

    .line 96
    .line 97
    :cond_6
    const/4 v1, 0x7

    .line 98
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    check-cast v1, Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;

    .line 103
    .line 104
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->l:Lcom/p1/mobile/putong/live/base/view/LivingNewTagView;

    .line 105
    .line 106
    if-nez v1, :cond_7

    .line 107
    .line 108
    const-string v0, "_living"

    .line 109
    .line 110
    :cond_7
    const/16 v1, 0x8

    .line 111
    .line 112
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    check-cast v1, Lv/VText;

    .line 117
    .line 118
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->m:Lv/VText;

    .line 119
    .line 120
    if-nez v1, :cond_8

    .line 121
    .line 122
    const-string v0, "_name"

    .line 123
    .line 124
    :cond_8
    const/16 v1, 0x9

    .line 125
    .line 126
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    check-cast p1, Lv/VText;

    .line 131
    .line 132
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->n:Lv/VText;

    .line 133
    .line 134
    if-nez p1, :cond_9

    .line 135
    .line 136
    const-string v0, "_heart"

    .line 137
    .line 138
    :cond_9
    if-nez v0, :cond_a

    .line 139
    .line 140
    return-void

    .line 141
    :cond_a
    const-string p0, "Missing required view with ID:"

    .line 142
    .line 143
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHourLeaderBoardDialogHeaderSecondOrThirdBindings;->h0(Landroid/view/ViewGroup;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
