.class public Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

.field public b:Lv/VFrame;

.field public c:Lv/VFrame;

.field public d:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

.field public e:Landroid/view/ViewStub;

.field public f:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;

.field public g:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelDView;

.field public h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelLeftTopView;

.field public i:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelEView;

.field public j:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

.field public k:Landroid/view/ViewStub;

.field public l:Lv/VDraweeView;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:I

.field public q:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->q:Landroid/view/View;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->q:Landroid/view/View;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->q:Landroid/view/View;

    return-void
.end method

.method private r()V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongViewCast"
        }
    .end annotation

    .line 1
    sget v0, Ll/ldc0;->W0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 10
    .line 11
    sget v0, Ll/ldc0;->A2:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/VFrame;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->b:Lv/VFrame;

    .line 20
    .line 21
    sget v0, Ll/ldc0;->P:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lv/VFrame;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->c:Lv/VFrame;

    .line 30
    .line 31
    sget v0, Ll/ldc0;->n0:I

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Landroid/view/ViewStub;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->e:Landroid/view/ViewStub;

    .line 40
    .line 41
    sget v0, Ll/ldc0;->w2:I

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->f:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;

    .line 50
    .line 51
    sget v0, Ll/ldc0;->y2:I

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelDView;

    .line 58
    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->g:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelDView;

    .line 60
    .line 61
    sget v0, Ll/ldc0;->x2:I

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelLeftTopView;

    .line 68
    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelLeftTopView;

    .line 70
    .line 71
    sget v0, Ll/ldc0;->z2:I

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelEView;

    .line 78
    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->i:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveNewLabelEView;

    .line 80
    .line 81
    sget v0, Ll/ldc0;->E2:I

    .line 82
    .line 83
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 88
    .line 89
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->j:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 90
    .line 91
    sget v0, Ll/ldc0;->Y0:I

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Landroid/view/ViewStub;

    .line 98
    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->k:Landroid/view/ViewStub;

    .line 100
    .line 101
    sget v0, Ll/ldc0;->g:I

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Lv/VDraweeView;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->l:Lv/VDraweeView;

    .line 110
    .line 111
    sget v0, Ll/ldc0;->f2:I

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Lv/VText;

    .line 118
    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->m:Lv/VText;

    .line 120
    .line 121
    sget v0, Ll/ldc0;->c2:I

    .line 122
    .line 123
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    check-cast v0, Lv/VText;

    .line 128
    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->n:Lv/VText;

    .line 130
    .line 131
    sget v0, Ll/ldc0;->d2:I

    .line 132
    .line 133
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Lv/VText;

    .line 138
    .line 139
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->o:Lv/VText;

    .line 140
    .line 141
    sget v0, Ll/ldc0;->j0:I

    .line 142
    .line 143
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 148
    .line 149
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->d:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 150
    .line 151
    return-void
.end method

.method private s()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->l:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private setAnchorGrade(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;)V
    .locals 4

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->hierarchy:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p1, v0, v2

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->s()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object p1, Ll/tbs;->f:Ll/j6t;

    .line 14
    .line 15
    invoke-virtual {p1, v0, v1}, Ll/j6t;->e(J)Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;->backendUrl:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->l:Lv/VDraweeView;

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;->backendUrl:Ljava/lang/String;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->l:Lv/VDraweeView;

    .line 39
    .line 40
    sget v0, Ll/i0k;->a:I

    .line 41
    .line 42
    invoke-static {p1, p0, v0}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->s()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private setAudienceAmount(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->n:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private setDistance(Lcom/p1/mobile/putong/data/Location;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/Location;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->o:Lv/VText;

    .line 2
    .line 3
    invoke-static {p1}, Ll/xau;->x(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private setLiveName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->m:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private z(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->b:Lv/VFrame;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public B()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->q()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    invoke-static {v0}, Ll/vl4;->e(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->p:I

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->r()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->p()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->c:Lv/VFrame;

    .line 18
    .line 19
    sget v0, Ll/nbc0;->s0:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final p()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->p:I

    .line 2
    .line 3
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->p:I

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    new-array v1, v1, [Landroid/view/View;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    aput-object p0, v1, v2

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->c:Lv/VFrame;

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->p:I

    .line 20
    .line 21
    div-int/lit8 v1, v1, 0x2

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    sget v0, Ll/qa00;->i:I

    .line 27
    .line 28
    invoke-static {p0, v0}, Ll/ynp0;->m(Landroid/view/View;I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public u(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->n(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final v(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;->frameId:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {}, Ll/ahn;->a()Ll/ahn;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;->frameId:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ll/ahn;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveFrame;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->d:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 28
    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFrame;->framePicUrl:Ljava/lang/String;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFrame;->frameSvgUrl:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->d:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 44
    .line 45
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V
    .locals 10

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->location:Lcom/p1/mobile/putong/data/Location;

    .line 4
    .line 5
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->setDistance(Lcom/p1/mobile/putong/data/Location;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 9
    .line 10
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->setAnchorGrade(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 14
    .line 15
    sget v1, Ll/qa00;->i:I

    .line 16
    .line 17
    int-to-float v1, v1

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->setRadius(F)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->getSimpleDraweeView()Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 28
    .line 29
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->coverUrl:Ljava/lang/String;

    .line 30
    .line 31
    iget v4, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->p:I

    .line 32
    .line 33
    invoke-static {}, Ll/irn;->a()Z

    .line 34
    .line 35
    .line 36
    move-result v8

    .line 37
    const/4 v9, 0x0

    .line 38
    const-string v1, "context_square"

    .line 39
    .line 40
    const/4 v6, 0x1

    .line 41
    const/4 v7, 0x0

    .line 42
    move v5, v4

    .line 43
    invoke-static/range {v1 .. v9}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->title:Ljava/lang/String;

    .line 49
    .line 50
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->setLiveName(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->m:Lv/VText;

    .line 54
    .line 55
    const/high16 v1, 0x41600000    # 14.0f

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 58
    .line 59
    .line 60
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 61
    .line 62
    int-to-float v0, v0

    .line 63
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    int-to-long v0, v0

    .line 68
    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->setAudienceAmount(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->isOnLive()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    xor-int/lit8 v0, v0, 0x1

    .line 80
    .line 81
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->z(Z)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 85
    .line 86
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_0

    .line 91
    .line 92
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 93
    .line 94
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_0

    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->f:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;

    .line 101
    .line 102
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 103
    .line 104
    sget-object v2, Ll/tbs;->b:Ll/vwt;

    .line 105
    .line 106
    invoke-virtual {v2}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;->d(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->f:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;->c()V

    .line 117
    .line 118
    .line 119
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->j:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 120
    .line 121
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 122
    .line 123
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    xor-int/lit8 v1, v1, 0x1

    .line 128
    .line 129
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 133
    .line 134
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-nez v0, :cond_1

    .line 139
    .line 140
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->j:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 141
    .line 142
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;->O(Ljava/util/List;)V

    .line 145
    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 149
    .line 150
    invoke-static {v0, p0}, Ll/dwn;->a(Ljava/util/List;Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;)V

    .line 151
    .line 152
    .line 153
    :goto_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedSuggesstIntlStyleCardView;->v(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 154
    .line 155
    .line 156
    return-void
.end method
