.class public Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;
.source "SourceFile"


# instance fields
.field public o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public p:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Ll/h64;",
            ">;"
        }
    .end annotation
.end field

.field public q:Ll/d55;

.field public r:Ljava/lang/String;

.field public s:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic i0(Ll/h64;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h64;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private k0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string p1, "https://auto.tancdn.com/v1/raw/5efbe412-9a82-49e6-80ea-36e6fa0dd34b10.pdf"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->horizontalVoicingUrl:Ljava/lang/String;

    .line 9
    .line 10
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->k:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->r:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->j:Lv/VDraweeView;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->k:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->r:Ljava/lang/String;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->k:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 42
    .line 43
    const/4 v0, -0x1

    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private p0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->k:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->k:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGAnimationView;->setAnimListener(Lcom/tantan/library/svga/AnimListener;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->j:Lv/VDraweeView;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->k:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    const-string v0, ""

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->r:Ljava/lang/String;

    .line 29
    .line 30
    :cond_0
    return-void
.end method


# virtual methods
.method public getCallUser()Ll/nsv;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/nsv<",
            "Ll/h64;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->p:Ll/nsv;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->s:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->s:Ljava/lang/String;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 35
    .line 36
    const/4 v0, -0x1

    .line 37
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public l0(Ljava/lang/String;Ll/nsv;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "guideGoCallUser"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->g:Landroid/widget/ImageView;

    .line 12
    .line 13
    sget p2, Ll/obc0;->J2:I

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->g:Landroid/widget/ImageView;

    .line 19
    .line 20
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->e:Landroid/view/View;

    .line 24
    .line 25
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->e:Landroid/view/View;

    .line 29
    .line 30
    sget p2, Ll/obc0;->N:I

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 36
    .line 37
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->q:Ll/d55;

    .line 41
    .line 42
    invoke-virtual {p1}, Ll/d55;->b()V

    .line 43
    .line 44
    .line 45
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->p0()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 50
    .line 51
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->g:Landroid/widget/ImageView;

    .line 55
    .line 56
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    invoke-static {p2}, Ll/f3t;->h(Ll/nsv;)Ll/nsv;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->p:Ll/nsv;

    .line 64
    .line 65
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 70
    .line 71
    const/high16 v3, 0x42680000    # 58.0f

    .line 72
    .line 73
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    new-instance v4, Ll/p8m0;

    .line 78
    .line 79
    invoke-direct {v4}, Ll/p8m0;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-static {v2, v3, p1, v4, v1}, Ll/biv;->c(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2}, Ll/l6o0;->d()Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-eqz v2, :cond_1

    .line 90
    .line 91
    iget-object p2, p2, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 92
    .line 93
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 94
    .line 95
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 96
    .line 97
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->checkNeedChangeVoice()Z

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    if-eqz p2, :cond_1

    .line 102
    .line 103
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 104
    .line 105
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getRealAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-static {p2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->e:Landroid/view/View;

    .line 113
    .line 114
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->q:Ll/d55;

    .line 118
    .line 119
    invoke-virtual {p2, p1}, Ll/d55;->e(Ll/nsv;)V

    .line 120
    .line 121
    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->e:Landroid/view/View;

    .line 123
    .line 124
    const-string p1, "#382121"

    .line 125
    .line 126
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    invoke-static {p1}, Ll/fc2;->h(I)Landroid/graphics/drawable/GradientDrawable;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 139
    .line 140
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getRealAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->e:Landroid/view/View;

    .line 148
    .line 149
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 150
    .line 151
    .line 152
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->q:Ll/d55;

    .line 153
    .line 154
    invoke-virtual {p0}, Ll/d55;->b()V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public m0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->p0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public n0(Ll/s7m0;Ljava/lang/String;ILjava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/s7m0<",
            "*>;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/i9o0;->h(Ll/i6t;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Ll/i9o0;->i(Ll/i6t;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->i:Lv/VDraweeView;

    .line 10
    .line 11
    const/4 v3, -0x1

    .line 12
    invoke-virtual {v2, v3}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 13
    .line 14
    .line 15
    const-string v2, "anchor"

    .line 16
    .line 17
    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/high16 v4, 0x41200000    # 10.0f

    .line 22
    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Ll/rwn0;

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/rwn0;->i3()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 40
    .line 41
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->wf:I

    .line 42
    .line 43
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 48
    .line 49
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->uf:I

    .line 50
    .line 51
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 52
    .line 53
    .line 54
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 55
    .line 56
    sget p2, Ll/n9c0;->w1:I

    .line 57
    .line 58
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->i:Lv/VDraweeView;

    .line 66
    .line 67
    const-string p2, "#A35D25"

    .line 68
    .line 69
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result p3

    .line 77
    invoke-static {p2, p3}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 82
    .line 83
    .line 84
    goto/16 :goto_2

    .line 85
    .line 86
    :cond_1
    const-string v2, "manager"

    .line 87
    .line 88
    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    if-eqz v2, :cond_2

    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 95
    .line 96
    sget p2, Ll/n9c0;->w1:I

    .line 97
    .line 98
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->i:Lv/VDraweeView;

    .line 106
    .line 107
    const-string p2, "#0B68AD"

    .line 108
    .line 109
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 114
    .line 115
    .line 116
    move-result p3

    .line 117
    invoke-static {p2, p3}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 125
    .line 126
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->l7:I

    .line 127
    .line 128
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 129
    .line 130
    .line 131
    goto/16 :goto_2

    .line 132
    .line 133
    :cond_2
    const-string v2, "default"

    .line 134
    .line 135
    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    if-eqz p2, :cond_3

    .line 140
    .line 141
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 142
    .line 143
    invoke-static {p2}, Ll/guk0;->j(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 144
    .line 145
    .line 146
    move-result p2

    .line 147
    if-eqz p2, :cond_3

    .line 148
    .line 149
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 150
    .line 151
    sget p2, Ll/n9c0;->w1:I

    .line 152
    .line 153
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 154
    .line 155
    .line 156
    move-result p2

    .line 157
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 158
    .line 159
    .line 160
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->i:Lv/VDraweeView;

    .line 161
    .line 162
    const-string p2, "#7b70ff"

    .line 163
    .line 164
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 165
    .line 166
    .line 167
    move-result p2

    .line 168
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 169
    .line 170
    .line 171
    move-result p3

    .line 172
    invoke-static {p2, p3}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 180
    .line 181
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->jd:I

    .line 182
    .line 183
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 184
    .line 185
    .line 186
    goto :goto_2

    .line 187
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 188
    .line 189
    sget v2, Ll/n9c0;->p1:I

    .line 190
    .line 191
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 192
    .line 193
    .line 194
    move-result v2

    .line 195
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 196
    .line 197
    .line 198
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->i:Lv/VDraweeView;

    .line 199
    .line 200
    sget v2, Ll/n9c0;->M:I

    .line 201
    .line 202
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 207
    .line 208
    .line 209
    move-result v5

    .line 210
    invoke-static {v2, v5}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    invoke-virtual {p2, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 215
    .line 216
    .line 217
    invoke-static {p4}, Ll/guk0;->i(Ljava/lang/String;)Z

    .line 218
    .line 219
    .line 220
    move-result p2

    .line 221
    if-eqz p2, :cond_4

    .line 222
    .line 223
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 224
    .line 225
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->jd:I

    .line 226
    .line 227
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 228
    .line 229
    .line 230
    goto :goto_2

    .line 231
    :cond_4
    if-ne v3, p3, :cond_6

    .line 232
    .line 233
    if-nez v1, :cond_5

    .line 234
    .line 235
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    check-cast p1, Ll/rwn0;

    .line 240
    .line 241
    invoke-virtual {p1}, Ll/rwn0;->p()Z

    .line 242
    .line 243
    .line 244
    move-result p1

    .line 245
    if-nez p1, :cond_5

    .line 246
    .line 247
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 248
    .line 249
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->xf:I

    .line 250
    .line 251
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 252
    .line 253
    .line 254
    goto :goto_1

    .line 255
    :cond_5
    if-eqz v0, :cond_7

    .line 256
    .line 257
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 258
    .line 259
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->K6:I

    .line 260
    .line 261
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 262
    .line 263
    .line 264
    goto :goto_1

    .line 265
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 266
    .line 267
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object p2

    .line 271
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 272
    .line 273
    .line 274
    :cond_7
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 275
    .line 276
    sget p2, Ll/n9c0;->p1:I

    .line 277
    .line 278
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 279
    .line 280
    .line 281
    move-result p2

    .line 282
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 283
    .line 284
    .line 285
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 286
    .line 287
    if-eqz p1, :cond_8

    .line 288
    .line 289
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isVoiceGaming:Z

    .line 290
    .line 291
    if-eqz p1, :cond_8

    .line 292
    .line 293
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->i:Lv/VDraweeView;

    .line 294
    .line 295
    sget p2, Ll/n9c0;->j:I

    .line 296
    .line 297
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 298
    .line 299
    .line 300
    move-result p2

    .line 301
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 302
    .line 303
    .line 304
    move-result p3

    .line 305
    invoke-static {p2, p3}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 306
    .line 307
    .line 308
    move-result-object p2

    .line 309
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 310
    .line 311
    .line 312
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 313
    .line 314
    const-string p2, "\u6e38\u620f\u4e2d"

    .line 315
    .line 316
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 317
    .line 318
    .line 319
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 320
    .line 321
    if-eqz p1, :cond_b

    .line 322
    .line 323
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->playInfoStatus:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 324
    .line 325
    const-string p2, "playing"

    .line 326
    .line 327
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 328
    .line 329
    .line 330
    move-result p1

    .line 331
    if-nez p1, :cond_a

    .line 332
    .line 333
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 334
    .line 335
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->playInfoStatus:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 336
    .line 337
    const-string p2, "pause"

    .line 338
    .line 339
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 340
    .line 341
    .line 342
    move-result p1

    .line 343
    if-nez p1, :cond_a

    .line 344
    .line 345
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 346
    .line 347
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->playInfoStatus:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 348
    .line 349
    const-string p2, "prepare"

    .line 350
    .line 351
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 352
    .line 353
    .line 354
    move-result p1

    .line 355
    if-eqz p1, :cond_9

    .line 356
    .line 357
    goto :goto_3

    .line 358
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 359
    .line 360
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->playInfoStatus:Lcom/p1/mobile/putong/live/base/data/BLiveKtvPlayInfoStatus;

    .line 361
    .line 362
    const-string p2, "waiting"

    .line 363
    .line 364
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 365
    .line 366
    .line 367
    move-result p1

    .line 368
    if-eqz p1, :cond_b

    .line 369
    .line 370
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 371
    .line 372
    const-string p2, "\u51c6\u5907"

    .line 373
    .line 374
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 375
    .line 376
    .line 377
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 378
    .line 379
    sget p2, Ll/n9c0;->e1:I

    .line 380
    .line 381
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 382
    .line 383
    .line 384
    move-result p2

    .line 385
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 386
    .line 387
    .line 388
    goto :goto_4

    .line 389
    :cond_a
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 390
    .line 391
    const-string p2, "\u6f14\u5531\u4e2d"

    .line 392
    .line 393
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 394
    .line 395
    .line 396
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->i:Lv/VDraweeView;

    .line 397
    .line 398
    sget p2, Ll/n9c0;->j:I

    .line 399
    .line 400
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 401
    .line 402
    .line 403
    move-result p2

    .line 404
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 405
    .line 406
    .line 407
    move-result p3

    .line 408
    invoke-static {p2, p3}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 409
    .line 410
    .line 411
    move-result-object p2

    .line 412
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 413
    .line 414
    .line 415
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->l:Lv/VText;

    .line 416
    .line 417
    sget p2, Ll/n9c0;->e1:I

    .line 418
    .line 419
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 420
    .line 421
    .line 422
    move-result p2

    .line 423
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 424
    .line 425
    .line 426
    :cond_b
    :goto_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 427
    .line 428
    if-eqz p1, :cond_c

    .line 429
    .line 430
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 431
    .line 432
    if-eqz p1, :cond_c

    .line 433
    .line 434
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->i:Lv/VDraweeView;

    .line 435
    .line 436
    const/4 p2, 0x0

    .line 437
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 438
    .line 439
    .line 440
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->i:Lv/VDraweeView;

    .line 441
    .line 442
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 443
    .line 444
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 445
    .line 446
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->horizontalBg:Ljava/lang/String;

    .line 447
    .line 448
    const/high16 p2, 0x41a00000    # 20.0f

    .line 449
    .line 450
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 451
    .line 452
    .line 453
    move-result p2

    .line 454
    const/high16 p3, 0x41500000    # 13.0f

    .line 455
    .line 456
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 457
    .line 458
    .line 459
    move-result p3

    .line 460
    const-string p4, "context_livingAct"

    .line 461
    .line 462
    invoke-static {p4, p1, p0, p2, p3}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 463
    .line 464
    .line 465
    :cond_c
    return-void
.end method

.method public final o0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    const-string v0, ""

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->s:Ljava/lang/String;

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->m0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->setMaskUnLimit(Z)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/d55;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getCountDownProgressView()Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, v1}, Ll/d55;-><init>(Lcom/p1/mobile/putong/live/base/view/CircularProgressView;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->q:Ll/d55;

    .line 22
    .line 23
    return-void
.end method

.method public q0(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->j0(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->o0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public r0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isSpeak:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-static {p1}, Ll/guk0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->k0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->p0()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final s0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 6
    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isSpeak:Z

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    invoke-static {p1}, Ll/guk0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->p:Ll/nsv;

    .line 21
    .line 22
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ll/l6o0;->d()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->p:Ll/nsv;

    .line 33
    .line 34
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p1, p1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->checkNeedChangeVoice()Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_1

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->s0()V

    .line 77
    .line 78
    .line 79
    :cond_1
    return-void

    .line 80
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->t0()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public setCallInfo(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->o:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    const-string v0, "[live][voice]"

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const-string p1, "call is null"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->p0()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->h:Lv/VFrame;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->toJson()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->h:Lv/VFrame;

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isVoiceGaming:Z

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->j:Lv/VDraweeView;

    .line 40
    .line 41
    sget v1, Ll/obc0;->R8:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 48
    .line 49
    const-string v1, "context_livingAct"

    .line 50
    .line 51
    if-nez v0, :cond_3

    .line 52
    .line 53
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 54
    .line 55
    if-nez v0, :cond_3

    .line 56
    .line 57
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 58
    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->j:Lv/VDraweeView;

    .line 60
    .line 61
    if-nez v0, :cond_2

    .line 62
    .line 63
    sget v0, Ll/obc0;->S9:I

    .line 64
    .line 65
    invoke-virtual {v2, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->defaultIcon:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v1, v2, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 76
    .line 77
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceMemberItemViewBindings;->j:Lv/VDraweeView;

    .line 78
    .line 79
    if-nez v0, :cond_4

    .line 80
    .line 81
    sget v0, Ll/obc0;->R9:I

    .line 82
    .line 83
    invoke-virtual {v2, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_4
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->muteIcon:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v1, v2, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->r0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/item/VirtualVoiceMemberItemView;->s0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method
