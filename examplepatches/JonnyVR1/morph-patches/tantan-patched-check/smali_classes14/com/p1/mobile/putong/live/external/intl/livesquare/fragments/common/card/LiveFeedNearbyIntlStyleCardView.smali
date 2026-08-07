.class public Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

.field public b:Lv/VFrame;

.field public c:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;

.field public d:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:I


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
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;Lcom/p1/mobile/putong/live/base/data/BLiveLabel;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLabel;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->templateId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private setDistance(Lcom/p1/mobile/putong/data/Location;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/data/Location;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Ll/xau;->x(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->g:Lv/VText;

    .line 12
    .line 13
    const-string p1, ""

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->h:Lv/VText;

    .line 20
    .line 21
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->d(Lcom/p1/mobile/putong/data/Location;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    const/4 v1, 0x4

    .line 38
    if-le p1, v1, :cond_1

    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    invoke-virtual {v0, p1, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const-string v0, "..."

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->g:Lv/VText;

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->g:Lv/VText;

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private setLiveName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->f:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final b(D)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmpg-double v0, p1, v0

    .line 4
    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->h:Lv/VText;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {p1, p2}, Ll/y6u;->g(D)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->h:Lv/VText;

    .line 19
    .line 20
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    xor-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    invoke-static {p2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->h:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final c()V
    .locals 2

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->b:Lv/VFrame;

    .line 20
    .line 21
    sget v0, Ll/ldc0;->w2:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->c:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;

    .line 30
    .line 31
    sget v0, Ll/ldc0;->E2:I

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->d:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 40
    .line 41
    sget v0, Ll/ldc0;->V1:I

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lv/VText;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->e:Lv/VText;

    .line 50
    .line 51
    sget v0, Ll/ldc0;->f2:I

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lv/VText;

    .line 58
    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->f:Lv/VText;

    .line 60
    .line 61
    sget v0, Ll/ldc0;->Z1:I

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lv/VText;

    .line 68
    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->g:Lv/VText;

    .line 70
    .line 71
    sget v0, Ll/ldc0;->g2:I

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lv/VText;

    .line 78
    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->h:Lv/VText;

    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 82
    .line 83
    iget v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->i:I

    .line 84
    .line 85
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->getSimpleDraweeView()Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Ll/wlj;

    .line 99
    .line 100
    if-eqz v0, :cond_0

    .line 101
    .line 102
    sget v1, Ll/nbc0;->p0:I

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Ll/wlj;->D(I)V

    .line 105
    .line 106
    .line 107
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 108
    .line 109
    sget v0, Ll/qa00;->i:I

    .line 110
    .line 111
    int-to-float v0, v0

    .line 112
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->setRadius(F)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public final d(Lcom/p1/mobile/putong/data/Location;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/Location;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget p0, p1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 2
    .line 3
    const p1, 0x186a0

    .line 4
    .line 5
    .line 6
    if-lt p0, p1, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public e(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->n(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V
    .locals 5

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->getSimpleDraweeView()Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->coverUrl:Ljava/lang/String;

    .line 16
    .line 17
    iget v3, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->i:I

    .line 18
    .line 19
    const-string v4, "context_square"

    .line 20
    .line 21
    invoke-static {v4, v1, v2, v3, v3}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 22
    .line 23
    .line 24
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 25
    .line 26
    int-to-double v1, v1

    .line 27
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->b(D)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->location:Lcom/p1/mobile/putong/data/Location;

    .line 33
    .line 34
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->setDistance(Lcom/p1/mobile/putong/data/Location;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->name:Ljava/lang/String;

    .line 40
    .line 41
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->setLiveName(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->basicLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 47
    .line 48
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->g(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const/4 v1, 0x0

    .line 53
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->g(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    .line 54
    .line 55
    .line 56
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->isOnLive()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    xor-int/lit8 v1, v1, 0x1

    .line 61
    .line 62
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->h(Z)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 66
    .line 67
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->c:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;

    .line 72
    .line 73
    if-eqz v1, :cond_1

    .line 74
    .line 75
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 76
    .line 77
    invoke-virtual {v2, v1, v0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;->d(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_1
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;->c()V

    .line 82
    .line 83
    .line 84
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->d:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 85
    .line 86
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 87
    .line 88
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    xor-int/lit8 v1, v1, 0x1

    .line 93
    .line 94
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 98
    .line 99
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_2

    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->d:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;->O(Ljava/util/List;)V

    .line 110
    .line 111
    .line 112
    :cond_2
    return-void
.end method

.method public final g(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->e:Lv/VText;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->e:Lv/VText;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->value:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveLabels:Ljava/util/List;

    .line 22
    .line 23
    new-instance v0, Ll/efs;

    .line 24
    .line 25
    invoke-direct {v0, p1}, Ll/efs;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p2, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveLabel;

    .line 33
    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLabel;->textColor:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {p2}, Ll/ynp0;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->e:Lv/VText;

    .line 43
    .line 44
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLabel;->textSize:I

    .line 45
    .line 46
    int-to-float v1, v1

    .line 47
    const/4 v2, 0x2

    .line 48
    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 49
    .line 50
    .line 51
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->e:Lv/VText;

    .line 56
    .line 57
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->e:Lv/VText;

    .line 61
    .line 62
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLabel;->background:Lcom/p1/mobile/putong/live/base/data/BLiveBackground;

    .line 63
    .line 64
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBackground;->startColor:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {p2}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLabel;->background:Lcom/p1/mobile/putong/live/base/data/BLiveBackground;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBackground;->endColor:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {p1}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    const/4 v0, 0x4

    .line 79
    invoke-static {p2, p1, v0}, Ll/fc2;->j(III)Landroid/graphics/drawable/GradientDrawable;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 84
    .line 85
    .line 86
    :cond_1
    return-void
.end method

.method public final h(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->b:Lv/VFrame;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

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
    const/4 v0, 0x3

    .line 5
    invoke-static {v0}, Ll/vl4;->e(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->i:I

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/common/card/LiveFeedNearbyIntlStyleCardView;->c()V

    .line 12
    .line 13
    .line 14
    return-void
.end method
