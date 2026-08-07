.class public Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;

.field public e:Landroid/view/View;

.field public f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public g:Landroid/widget/ImageView;

.field public h:Lv/VFrame;

.field public i:Lv/VDraweeView;

.field public j:Lv/VDraweeView;

.field public k:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public l:Lv/VText;

.field public m:Landroid/view/View;

.field public n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;


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
.method public getRoot()Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0(Landroid/view/ViewGroup;)V
    .locals 6

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->e:Landroid/view/View;

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    const-string v1, "_background"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v1, 0x0

    .line 19
    :goto_0
    const/4 v2, 0x1

    .line 20
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 25
    .line 26
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 27
    .line 28
    if-nez v3, :cond_1

    .line 29
    .line 30
    const-string v1, "_avatar"

    .line 31
    .line 32
    :cond_1
    const/4 v3, 0x2

    .line 33
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    check-cast v4, Landroid/widget/ImageView;

    .line 38
    .line 39
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->g:Landroid/widget/ImageView;

    .line 40
    .line 41
    if-nez v4, :cond_2

    .line 42
    .line 43
    const-string v1, "_state"

    .line 44
    .line 45
    :cond_2
    const/4 v4, 0x3

    .line 46
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    check-cast v5, Lv/VFrame;

    .line 51
    .line 52
    iput-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->h:Lv/VFrame;

    .line 53
    .line 54
    if-nez v5, :cond_3

    .line 55
    .line 56
    const-string v1, "_state_container"

    .line 57
    .line 58
    :cond_3
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    check-cast v5, Landroid/view/ViewGroup;

    .line 63
    .line 64
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lv/VDraweeView;

    .line 69
    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->i:Lv/VDraweeView;

    .line 71
    .line 72
    if-nez v0, :cond_4

    .line 73
    .line 74
    const-string v1, "_state_background"

    .line 75
    .line 76
    :cond_4
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Landroid/view/ViewGroup;

    .line 81
    .line 82
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Lv/VDraweeView;

    .line 87
    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->j:Lv/VDraweeView;

    .line 89
    .line 90
    if-nez v0, :cond_5

    .line 91
    .line 92
    const-string v1, "_mute_icon"

    .line 93
    .line 94
    :cond_5
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Landroid/view/ViewGroup;

    .line 99
    .line 100
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 105
    .line 106
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->k:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 107
    .line 108
    if-nez v0, :cond_6

    .line 109
    .line 110
    const-string v1, "_volume_svg"

    .line 111
    .line 112
    :cond_6
    const/4 v0, 0x4

    .line 113
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Lv/VText;

    .line 118
    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 120
    .line 121
    if-nez v0, :cond_7

    .line 122
    .line 123
    const-string v1, "_index"

    .line 124
    .line 125
    :cond_7
    const/4 v0, 0x5

    .line 126
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->m:Landroid/view/View;

    .line 131
    .line 132
    if-nez v0, :cond_8

    .line 133
    .line 134
    const-string v1, "_place_line"

    .line 135
    .line 136
    :cond_8
    const/4 v0, 0x6

    .line 137
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    check-cast p1, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 142
    .line 143
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 144
    .line 145
    if-nez p1, :cond_9

    .line 146
    .line 147
    const-string v1, "_svga_cp"

    .line 148
    .line 149
    :cond_9
    if-nez v1, :cond_a

    .line 150
    .line 151
    return-void

    .line 152
    :cond_a
    const-string p0, "Missing required view with ID:"

    .line 153
    .line 154
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->h0(Landroid/view/ViewGroup;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
