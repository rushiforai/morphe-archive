.class public Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VText;

.field public e:Lv/VImage;

.field public f:Lv/VImage;

.field public g:Lv/VDraweeView;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VButton;

.field public k:Lv/VText;


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

.method public static synthetic h0(Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;Ll/q2l;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->k0(Ll/q2l;Ll/y20;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s2l;->a(Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j0(Ll/q2l;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/q2l;",
            "Ll/y20<",
            "Ll/q2l;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/q2l;->g()Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->todayDisable:Z

    .line 6
    .line 7
    if-nez p0, :cond_3

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/q2l;->j()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p1}, Ll/q2l;->k()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->X0:I

    .line 23
    .line 24
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-virtual {p1}, Ll/q2l;->h()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_2

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/q2l;->i()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_3

    .line 39
    .line 40
    :cond_2
    invoke-interface {p2, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    :cond_3
    :goto_0
    return-void
.end method

.method public final synthetic k0(Ll/q2l;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->j0(Ll/q2l;Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l0(Ll/q2l;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/q2l;->g()Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->j:Lv/VButton;

    .line 10
    .line 11
    sget v2, Ll/mbc0;->j:I

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->j:Lv/VButton;

    .line 17
    .line 18
    const/4 v2, -0x1

    .line 19
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isActive()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->todayDisable:Z

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->j:Lv/VButton;

    .line 33
    .line 34
    sget v2, Lcom/p1/mobile/putong/live/base/R$string;->g0:I

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isGray()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->j:Lv/VButton;

    .line 51
    .line 52
    sget v2, Lcom/p1/mobile/putong/live/base/R$string;->U0:I

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->j:Lv/VButton;

    .line 62
    .line 63
    sget v1, Ll/mbc0;->g:I

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->j:Lv/VButton;

    .line 69
    .line 70
    const-string v1, "#bfbfbf"

    .line 71
    .line 72
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isActive()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eqz v1, :cond_2

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->j:Lv/VButton;

    .line 87
    .line 88
    sget v2, Lcom/p1/mobile/putong/live/base/R$string;->R0:I

    .line 89
    .line 90
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isLocked()Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->j:Lv/VButton;

    .line 103
    .line 104
    if-eqz v1, :cond_3

    .line 105
    .line 106
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->h0:I

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_3
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->q1:I

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    .line 124
    .line 125
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->e:Lv/VImage;

    .line 126
    .line 127
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isEquipped()Z

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->f:Lv/VImage;

    .line 135
    .line 136
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isLocked()Z

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public m0(Ll/q2l;Ll/y20;)V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StringFormatMatches"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/q2l;",
            "Ll/y20<",
            "Ll/q2l;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/q2l;->g()Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->d:Lv/VText;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {v2, v0}, Ll/o9d0;->e(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->d:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isGray()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    const/4 v3, 0x1

    .line 25
    xor-int/2addr v2, v3

    .line 26
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->g:Lv/VDraweeView;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->getThumbnailUrl()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const-string v4, "context_common"

    .line 36
    .line 37
    invoke-static {v4, v1, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->h:Lv/VText;

    .line 41
    .line 42
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->rightName:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v2}, Ll/bpj;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->i:Lv/VText;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->description:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v0}, Ll/bpj;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Ll/q2l;->e()Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;->switchCount:I

    .line 67
    .line 68
    sget-object v1, Ll/tbs;->a:Landroid/app/Application;

    .line 69
    .line 70
    sget v2, Lcom/p1/mobile/putong/live/base/R$string;->O:I

    .line 71
    .line 72
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-virtual {v1, v2, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->k:Lv/VText;

    .line 85
    .line 86
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->k:Lv/VText;

    .line 90
    .line 91
    if-lez v0, :cond_0

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_0
    const/4 v3, 0x0

    .line 95
    :goto_0
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->l0(Ll/q2l;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->j:Lv/VButton;

    .line 102
    .line 103
    new-instance v1, Ll/r2l;

    .line 104
    .line 105
    invoke-direct {v1, p0, p1, p2}, Ll/r2l;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;Ll/q2l;Ll/y20;)V

    .line 106
    .line 107
    .line 108
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 109
    .line 110
    .line 111
    const/4 p1, 0x2

    .line 112
    invoke-static {p1}, Ll/wft;->b(I)Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-nez p1, :cond_1

    .line 117
    .line 118
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->i:Lv/VText;

    .line 119
    .line 120
    const/4 p2, 0x3

    .line 121
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 122
    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->j:Lv/VButton;

    .line 125
    .line 126
    const/high16 p1, 0x41400000    # 12.0f

    .line 127
    .line 128
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 133
    .line 134
    .line 135
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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
