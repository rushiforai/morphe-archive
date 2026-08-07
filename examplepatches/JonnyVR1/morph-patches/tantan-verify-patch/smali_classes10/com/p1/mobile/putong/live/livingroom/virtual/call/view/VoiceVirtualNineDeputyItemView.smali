.class public Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/vdp0;


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Landroid/widget/ImageView;

.field public c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public d:Landroid/view/View;

.field public e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public f:Landroid/widget/ImageView;

.field public g:Landroid/widget/TextView;

.field public h:Lv/VLinear;

.field public i:Lv/VDraweeView;

.field public j:Landroid/widget/TextView;

.field public k:Lv/VText;

.field public l:Lv/VLinear;

.field public m:Landroid/widget/ImageView;

.field public n:Landroid/widget/TextView;

.field public o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public p:Ljava/lang/String;

.field public q:Ll/qdh0;

.field public r:Ll/d55;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, -0x1

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic g(Ll/scp0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/scp0;->h4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Ll/h64;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h64;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i(Ll/scp0;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/scp0;->i4(Ljava/lang/Integer;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic j(Ll/scp0;Ll/nsv;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ll/h64;

    .line 4
    .line 5
    iget-object p1, p1, Ll/h64;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/scp0;->j4(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->m(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->q()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public b(IZLl/scp0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p3}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->f(ILl/scp0;)V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->i0()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->p()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveMember;Ll/nsv;Ll/scp0;)V
    .locals 5
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveMember;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/nsv;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ll/scp0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMember;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;",
            "Ll/scp0<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p4}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p1}, Ll/guk0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/4 v3, 0x0

    .line 22
    if-eqz v2, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->g:Landroid/widget/TextView;

    .line 26
    .line 27
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-boolean v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 31
    .line 32
    if-nez v2, :cond_1

    .line 33
    .line 34
    iget-boolean v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 35
    .line 36
    if-nez v2, :cond_1

    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->i:Lv/VDraweeView;

    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    invoke-virtual {v2, v4}, Lcom/facebook/drawee/view/DraweeView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 42
    .line 43
    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->i:Lv/VDraweeView;

    .line 45
    .line 46
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->i:Lv/VDraweeView;

    .line 51
    .line 52
    sget v4, Ll/obc0;->Da:I

    .line 53
    .line 54
    invoke-virtual {v2, v4}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 55
    .line 56
    .line 57
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->i:Lv/VDraweeView;

    .line 58
    .line 59
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->q()V

    .line 63
    .line 64
    .line 65
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 66
    .line 67
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getRealAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->k:Lv/VText;

    .line 75
    .line 76
    const/4 v4, -0x1

    .line 77
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 78
    .line 79
    .line 80
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->k:Lv/VText;

    .line 81
    .line 82
    iget-object v4, p3, Ll/nsv;->a:Ljava/lang/Object;

    .line 83
    .line 84
    check-cast v4, Ll/h64;

    .line 85
    .line 86
    iget-object v4, v4, Ll/h64;->b:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->k:Lv/VText;

    .line 92
    .line 93
    sget-object v4, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 94
    .line 95
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 96
    .line 97
    .line 98
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 99
    .line 100
    new-instance v4, Ll/ufp0;

    .line 101
    .line 102
    invoke-direct {v4, p4, p1}, Ll/ufp0;-><init>(Ll/scp0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v2, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 106
    .line 107
    .line 108
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 109
    .line 110
    if-nez v2, :cond_2

    .line 111
    .line 112
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->j:Landroid/widget/TextView;

    .line 113
    .line 114
    const-string v2, "\u4e3b\u6301"

    .line 115
    .line 116
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_2
    if-eqz p2, :cond_3

    .line 121
    .line 122
    iget-boolean p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->isManager:Z

    .line 123
    .line 124
    if-eqz p2, :cond_3

    .line 125
    .line 126
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->j:Landroid/widget/TextView;

    .line 127
    .line 128
    const-string v2, "\u7ba1\u7406"

    .line 129
    .line 130
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->j:Landroid/widget/TextView;

    .line 135
    .line 136
    add-int/2addr v2, v1

    .line 137
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 142
    .line 143
    .line 144
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->j:Landroid/widget/TextView;

    .line 145
    .line 146
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 147
    .line 148
    .line 149
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->b:Landroid/widget/ImageView;

    .line 150
    .line 151
    invoke-static {p2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0, p1, p3, v0, p4}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->n(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;Ll/scp0;)V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public d(Ljava/lang/String;)V
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->l(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public e(ILl/scp0;)V
    .locals 1
    .param p2    # Ll/scp0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/scp0<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->b:Landroid/widget/ImageView;

    .line 2
    .line 3
    new-instance v0, Ll/vfp0;

    .line 4
    .line 5
    invoke-direct {v0, p2, p1}, Ll/vfp0;-><init>(Ll/scp0;I)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public f(ILl/scp0;)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->j:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->i:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->g:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->k:Lv/VText;

    .line 18
    .line 19
    sget v1, Ll/n9c0;->m1:I

    .line 20
    .line 21
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 26
    .line 27
    .line 28
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->k:Lv/VText;

    .line 29
    .line 30
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string v1, "%s\u53f7\u9ea6\u4f4d"

    .line 39
    .line 40
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->k:Lv/VText;

    .line 48
    .line 49
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 50
    .line 51
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->k:Lv/VText;

    .line 55
    .line 56
    const/4 p2, 0x4

    .line 57
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->o(Landroid/widget/TextView;I)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 61
    .line 62
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->b:Landroid/widget/ImageView;

    .line 66
    .line 67
    const/4 v1, 0x1

    .line 68
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->l:Lv/VLinear;

    .line 72
    .line 73
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->n:Landroid/widget/TextView;

    .line 77
    .line 78
    const-string p2, "0"

    .line 79
    .line 80
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->q()V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->r:Ll/d55;

    .line 87
    .line 88
    invoke-virtual {p1}, Ll/d55;->b()V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->d:Landroid/view/View;

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/yfp0;->a(Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final l(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

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
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 17
    .line 18
    const/4 v0, -0x1

    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->k(Ljava/lang/String;IZ)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final m(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->circleVoicingUrl:Ljava/lang/String;

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_1
    :goto_0
    const-string p1, "https://auto.tancdn.com/v1/raw/a5705b18-7436-41ec-8ab5-b094eacd298211.pdf"

    .line 12
    .line 13
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->p:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->p:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 33
    .line 34
    const/4 v1, -0x1

    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->q:Ll/qdh0;

    .line 36
    .line 37
    invoke-virtual {v0, p1, v1, p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoice;Ll/scp0;)V
    .locals 5
    .param p4    # Ll/scp0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
            "Ll/scp0<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->l:Lv/VLinear;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->n:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget v2, Ll/n9c0;->m1:I

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 24
    .line 25
    .line 26
    invoke-static {p2}, Ll/f3t;->h(Ll/nsv;)Ll/nsv;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-static {p2}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 35
    .line 36
    const/high16 v2, 0x42920000    # 73.0f

    .line 37
    .line 38
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    new-instance v3, Ll/wfp0;

    .line 43
    .line 44
    invoke-direct {v3}, Ll/wfp0;-><init>()V

    .line 45
    .line 46
    .line 47
    const/4 v4, 0x1

    .line 48
    invoke-static {v1, v2, p2, v3, v4}, Ll/biv;->c(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;I)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->m:Landroid/widget/ImageView;

    .line 52
    .line 53
    sget v2, Ll/obc0;->Ea:I

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->n:Landroid/widget/TextView;

    .line 59
    .line 60
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 61
    .line 62
    long-to-double v2, v2

    .line 63
    invoke-static {v2, v3}, Ll/yau;->c(D)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->l:Lv/VLinear;

    .line 71
    .line 72
    new-instance v1, Ll/xfp0;

    .line 73
    .line 74
    invoke-direct {v1, p4, p2}, Ll/xfp0;-><init>(Ll/scp0;Ll/nsv;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->r:Ll/d55;

    .line 81
    .line 82
    invoke-virtual {p1, p2}, Ll/d55;->e(Ll/nsv;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p3}, Ll/l6o0;->d()Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_0

    .line 90
    .line 91
    iget-object p1, p3, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 92
    .line 93
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 94
    .line 95
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->checkNeedChangeVoice()Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_0

    .line 102
    .line 103
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getRealAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->d:Landroid/view/View;

    .line 113
    .line 114
    const-string p1, "#382121"

    .line 115
    .line 116
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    invoke-static {p1}, Ll/fc2;->h(I)Landroid/graphics/drawable/GradientDrawable;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 129
    .line 130
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getRealAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-static {p1, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->d:Landroid/view/View;

    .line 138
    .line 139
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public final o(Landroid/widget/TextView;I)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setMaxEms(I)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->q()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->i0()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->p()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->r:Ll/d55;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/d55;->b()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->k(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/qdh0;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-direct {v0, v1, v2}, Ll/qdh0;-><init>(Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->q:Ll/qdh0;

    .line 16
    .line 17
    new-instance v0, Ll/d55;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getCountDownProgressView()Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-direct {v0, v1}, Ll/d55;-><init>(Lcom/p1/mobile/putong/live/base/view/CircularProgressView;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->r:Ll/d55;

    .line 29
    .line 30
    return-void
.end method

.method public final p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->o:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

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
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->t0()V

    .line 12
    .line 13
    .line 14
    const-string v0, ""

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->p:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public r(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/h64;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ")V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    iget-boolean v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 6
    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    iget-boolean v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isSpeak:Z

    .line 10
    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    invoke-static {p2}, Ll/guk0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2}, Ll/l6o0;->d()Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_2

    .line 29
    .line 30
    invoke-static {p1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p1, p1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 35
    .line 36
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    if-eqz p2, :cond_1

    .line 41
    .line 42
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 43
    .line 44
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-eqz p2, :cond_1

    .line 49
    .line 50
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 51
    .line 52
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 53
    .line 54
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-eqz p2, :cond_1

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->checkNeedChangeVoice()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_1

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->s0()V

    .line 73
    .line 74
    .line 75
    :cond_1
    return-void

    .line 76
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->t0()V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_3
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->t0()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public setItemPlaceRes(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->b:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
