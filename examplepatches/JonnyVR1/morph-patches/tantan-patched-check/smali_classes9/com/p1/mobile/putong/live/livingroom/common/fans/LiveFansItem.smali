.class public Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public c:Landroid/widget/TextView;

.field public d:J

.field public e:J

.field public f:Ljava/lang/String;

.field public volatile g:Z

.field public volatile h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 24
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 23
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const-wide/16 p1, 0x3c

    .line 5
    .line 6
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->d:J

    .line 7
    .line 8
    const-wide/16 v0, 0x2

    .line 9
    .line 10
    sub-long/2addr p1, v0

    .line 11
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->e:J

    .line 12
    .line 13
    const-string p1, "user_id_unknown_flag"

    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->f:Ljava/lang/String;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->g:Z

    .line 19
    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->h:Z

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic a(Ll/nsv;Ll/w5g;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ll/w5g;

    .line 4
    .line 5
    iget-object p0, p0, Ll/w5g;->b:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->g:Z

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->e:J

    return-wide v0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->d:J

    return-wide v0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->h:Z

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->e:J

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->l(I)V

    return-void
.end method


# virtual methods
.method public final h(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ies;->a(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i(Ll/nsv;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/w5g;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/p6s;->u0()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->c:Landroid/widget/TextView;

    .line 15
    .line 16
    sget v1, Ll/obc0;->a0:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 22
    .line 23
    move-object v1, v0

    .line 24
    check-cast v1, Ll/w5g;

    .line 25
    .line 26
    iget-wide v2, v1, Ll/w5g;->c:J

    .line 27
    .line 28
    check-cast v0, Ll/w5g;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/w5g;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v4, "FansBoardTAG-LiveFansItem-render\uff0cdata="

    .line 35
    .line 36
    invoke-static {v4, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-wide/16 v4, 0x1

    .line 40
    .line 41
    cmp-long v0, v2, v4

    .line 42
    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->c:Landroid/widget/TextView;

    .line 46
    .line 47
    sget v2, Ll/obc0;->i0:I

    .line 48
    .line 49
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->c:Landroid/widget/TextView;

    .line 53
    .line 54
    sget v2, Ll/n9c0;->w:I

    .line 55
    .line 56
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    const-wide/16 v4, 0x2

    .line 65
    .line 66
    cmp-long v0, v2, v4

    .line 67
    .line 68
    if-nez v0, :cond_1

    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->c:Landroid/widget/TextView;

    .line 71
    .line 72
    sget v2, Ll/obc0;->J:I

    .line 73
    .line 74
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->c:Landroid/widget/TextView;

    .line 78
    .line 79
    sget v2, Ll/n9c0;->i:I

    .line 80
    .line 81
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    const-wide/16 v4, 0x3

    .line 90
    .line 91
    cmp-long v0, v2, v4

    .line 92
    .line 93
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->c:Landroid/widget/TextView;

    .line 94
    .line 95
    if-nez v0, :cond_2

    .line 96
    .line 97
    sget v0, Ll/obc0;->v0:I

    .line 98
    .line 99
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->c:Landroid/widget/TextView;

    .line 103
    .line 104
    sget v2, Ll/n9c0;->r:I

    .line 105
    .line 106
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_2
    sget v0, Ll/obc0;->Z:I

    .line 115
    .line 116
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->c:Landroid/widget/TextView;

    .line 120
    .line 121
    sget v2, Ll/n9c0;->e1:I

    .line 122
    .line 123
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 124
    .line 125
    .line 126
    move-result v2

    .line 127
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 128
    .line 129
    .line 130
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->c:Landroid/widget/TextView;

    .line 131
    .line 132
    iget-wide v1, v1, Ll/w5g;->d:J

    .line 133
    .line 134
    long-to-double v1, v1

    .line 135
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->c:Landroid/widget/TextView;

    .line 143
    .line 144
    const/high16 v1, 0x41000000    # 8.0f

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 147
    .line 148
    .line 149
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->a:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 150
    .line 151
    const/high16 v0, 0x42200000    # 40.0f

    .line 152
    .line 153
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    new-instance v1, Ll/ges;

    .line 158
    .line 159
    invoke-direct {v1, p1}, Ll/ges;-><init>(Ll/nsv;)V

    .line 160
    .line 161
    .line 162
    const/4 v2, 0x0

    .line 163
    invoke-static {p0, v0, p1, v1, v2}, Ll/biv;->c(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;I)V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public j(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->f:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->k()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->f:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->m()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->h:Z

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->e:J

    .line 32
    .line 33
    const-wide/16 v2, 0x0

    .line 34
    .line 35
    cmp-long p1, v0, v2

    .line 36
    .line 37
    if-lez p1, :cond_2

    .line 38
    .line 39
    long-to-int p1, v0

    .line 40
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->l(I)V

    .line 41
    .line 42
    .line 43
    :cond_2
    :goto_0
    return-void
.end method

.method public k()V
    .locals 4

    .line 1
    const-string v0, "user_id_unknown_flag"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->f:Ljava/lang/String;

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->d:J

    .line 6
    .line 7
    const-wide/16 v2, 0x2

    .line 8
    .line 9
    sub-long/2addr v0, v2

    .line 10
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->e:J

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 19
    .line 20
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final l(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem$b;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    const-string v2, "https://auto.tancdn.com/v1/raw/2238566a-56e3-42c2-ae85-63a2b0cb528711.so"

    .line 10
    .line 11
    invoke-virtual {v0, v2, p1, v1, p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->g(Ljava/lang/String;ILl/wo0;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final m()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->setClearsAfterStop(Z)V

    .line 5
    .line 6
    .line 7
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->h:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 10
    .line 11
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem$a;

    .line 12
    .line 13
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "https://auto.tancdn.com/v1/raw/3f0ab3c8-b5e0-46a0-bc3c-9214ad09e67510.so"

    .line 17
    .line 18
    invoke-virtual {v0, p0, v1, v2, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->g(Ljava/lang/String;ILl/wo0;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->g:Z

    .line 3
    .line 4
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->g:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->h:Z

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 9
    .line 10
    .line 11
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->h(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/vwt;->Q3()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->d:J

    .line 16
    .line 17
    return-void
.end method

.method public onGlobalLayout()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->c:Landroid/widget/TextView;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/16 v2, 0x8

    .line 18
    .line 19
    :goto_0
    const/4 v3, 0x6

    .line 20
    if-lt v2, v3, :cond_1

    .line 21
    .line 22
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->c:Landroid/widget/TextView;

    .line 23
    .line 24
    const/high16 v4, 0x41000000    # 8.0f

    .line 25
    .line 26
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 27
    .line 28
    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->c:Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    int-to-float v4, v1

    .line 40
    cmpg-float v3, v3, v4

    .line 41
    .line 42
    if-gtz v3, :cond_0

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    add-int/lit8 v2, v2, -0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    :goto_1
    return-void
.end method
