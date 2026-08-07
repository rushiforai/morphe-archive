.class public Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/view/View;

.field public c:Lcom/p1/mobile/putong/live/base/view/LiveTagView;

.field public d:Lv/VLinear;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;Ll/ats;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->d(Ll/ats;Landroid/view/View;)V

    return-void
.end method

.method private setAvatarBg(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x1

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->a:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    sget v0, Ll/obc0;->K2:I

    .line 18
    .line 19
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->d:Lv/VLinear;

    .line 27
    .line 28
    const/high16 p1, 0x42480000    # 50.0f

    .line 29
    .line 30
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    const-wide/16 v0, 0x2

    .line 39
    .line 40
    cmp-long v0, p1, v0

    .line 41
    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->a:Lv/VDraweeView;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    sget p2, Ll/obc0;->L2:I

    .line 55
    .line 56
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    const-wide/16 v0, 0x3

    .line 65
    .line 66
    cmp-long p1, p1, v0

    .line 67
    .line 68
    if-nez p1, :cond_2

    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->a:Lv/VDraweeView;

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    sget p2, Ll/obc0;->N2:I

    .line 81
    .line 82
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/iuk;->a(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->g:Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;

    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->a:Lv/VDraweeView;

    .line 8
    .line 9
    sget v1, Ll/obc0;->Q2:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x2

    .line 16
    if-ne p1, v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->a:Lv/VDraweeView;

    .line 19
    .line 20
    sget v1, Ll/obc0;->M2:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 v0, 0x3

    .line 27
    if-ne p1, v0, :cond_2

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->a:Lv/VDraweeView;

    .line 30
    .line 31
    sget v1, Ll/obc0;->O2:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 34
    .line 35
    .line 36
    :cond_2
    :goto_0
    int-to-long v0, p1

    .line 37
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->setAvatarBg(J)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->e:Lv/VText;

    .line 41
    .line 42
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 43
    .line 44
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->l6:I

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->f:Lv/VText;

    .line 54
    .line 55
    const-string v0, ""

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->f:Lv/VText;

    .line 61
    .line 62
    const/4 v0, 0x0

    .line 63
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->c:Lcom/p1/mobile/putong/live/base/view/LiveTagView;

    .line 67
    .line 68
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->b:Landroid/view/View;

    .line 72
    .line 73
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final synthetic d(Ll/ats;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->g:Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ll/ats;->G(Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(Ll/ats;Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;I)V
    .locals 4

    .line 1
    int-to-long v0, p3

    .line 2
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->setAvatarBg(J)V

    .line 3
    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->c(I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->g:Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;

    .line 12
    .line 13
    new-instance p3, Ll/huk;

    .line 14
    .line 15
    invoke-direct {p3, p0, p1}, Ll/huk;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;Ll/ats;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->a:Lv/VDraweeView;

    .line 22
    .line 23
    const/4 p3, 0x1

    .line 24
    invoke-static {p1, p3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->g:Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->userImage:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->a:Lv/VDraweeView;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->g:Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->userImage:Ljava/lang/String;

    .line 42
    .line 43
    const/high16 v1, 0x42980000    # 76.0f

    .line 44
    .line 45
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    const-string v3, "context_single_room"

    .line 54
    .line 55
    invoke-static {v3, p1, v0, v2, v1}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 56
    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->c:Lcom/p1/mobile/putong/live/base/view/LiveTagView;

    .line 59
    .line 60
    const-string v0, "#ff852a"

    .line 61
    .line 62
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    const-string v1, "#ff3a00"

    .line 67
    .line 68
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/live/base/view/LiveTagView;->c(II)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->g:Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->liveStates:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 78
    .line 79
    const-string v0, "onlive"

    .line 80
    .line 81
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->c:Lcom/p1/mobile/putong/live/base/view/LiveTagView;

    .line 86
    .line 87
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->b:Landroid/view/View;

    .line 91
    .line 92
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->e:Lv/VText;

    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->g:Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;

    .line 98
    .line 99
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->userName:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->f:Lv/VText;

    .line 105
    .line 106
    invoke-static {p1, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->f:Lv/VText;

    .line 110
    .line 111
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->K5:I

    .line 112
    .line 113
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGuardboardRecord;->amount:Ljava/lang/String;

    .line 114
    .line 115
    invoke-static {p2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 116
    .line 117
    .line 118
    move-result-wide p2

    .line 119
    invoke-static {p2, p3}, Ll/yau;->c(D)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p2

    .line 123
    invoke-static {p1, p2}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
