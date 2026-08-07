.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public _anchor_level_icon:Lv/VDraweeView;

.field public _cover:Lv/VFrame;

.field public _media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

.field public _tv_live_audience_amount:Lv/VText;

.field public _tv_live_distance:Lv/VText;

.field public _tv_live_name:Lv/VText;

.field public _view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

.field private final recommendedSideLength:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/bnl0;->y0()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    div-int/lit8 p1, p1, 0x2

    .line 9
    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->recommendedSideLength:I

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 13
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 14
    invoke-static {}, Ll/bnl0;->y0()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->recommendedSideLength:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    invoke-static {}, Ll/bnl0;->y0()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->recommendedSideLength:I

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;Ll/byu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->c(Ll/byu;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_anchor_level_icon:Lv/VDraweeView;

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

.method public final synthetic c(Ll/byu;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p1, Ll/byu;->localTrackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-static {p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMc(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p2, p1, Ll/byu;->localGoAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 9
    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-object p1, p1, Ll/byu;->localGoAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 17
    .line 18
    invoke-static {p0, p1}, Ll/yrs;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_cover:Lv/VFrame;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->setLiveName(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_tv_live_distance:Lv/VText;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_tv_live_audience_amount:Lv/VText;

    .line 23
    .line 24
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public e(Ll/byu;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ll/ner;Ll/ft5;I)V
    .locals 1

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_cover:Lv/VFrame;

    .line 2
    .line 3
    const/4 p4, 0x1

    .line 4
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p3, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_tv_live_distance:Lv/VText;

    .line 8
    .line 9
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p3, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 13
    .line 14
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p3, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_tv_live_audience_amount:Lv/VText;

    .line 18
    .line 19
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 23
    .line 24
    if-eqz p3, :cond_0

    .line 25
    .line 26
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->location:Lcom/p1/mobile/putong/data/Location;

    .line 27
    .line 28
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->setDistance(Lcom/p1/mobile/putong/data/Location;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->b()V

    .line 33
    .line 34
    .line 35
    :goto_0
    iget-object p3, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 36
    .line 37
    iget-object p5, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {p5}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result p5

    .line 43
    xor-int/2addr p4, p5

    .line 44
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object p3, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 48
    .line 49
    const/4 p4, 0x0

    .line 50
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;->setAAreaLabelEnable(Z)V

    .line 51
    .line 52
    .line 53
    iget-object p3, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 54
    .line 55
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;->setBAreaLabelEnable(Z)V

    .line 56
    .line 57
    .line 58
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 59
    .line 60
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    if-nez p3, :cond_1

    .line 65
    .line 66
    iget-object p3, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 67
    .line 68
    iget-object p4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 69
    .line 70
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;->O(Ljava/util/List;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 74
    .line 75
    if-eqz p3, :cond_2

    .line 76
    .line 77
    iget-object p3, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 78
    .line 79
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->getSimpleDraweeView()Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 80
    .line 81
    .line 82
    move-result-object p3

    .line 83
    iget-object p4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 84
    .line 85
    iget-object p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->coverUrl:Ljava/lang/String;

    .line 86
    .line 87
    iget p5, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->recommendedSideLength:I

    .line 88
    .line 89
    const-string v0, "context_square"

    .line 90
    .line 91
    invoke-static {v0, p3, p4, p5, p5}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 92
    .line 93
    .line 94
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 95
    .line 96
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->title:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->setLiveName(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_2
    iget-object p3, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_tv_live_name:Lv/VText;

    .line 102
    .line 103
    const/high16 p4, 0x41700000    # 15.0f

    .line 104
    .line 105
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 106
    .line 107
    .line 108
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 109
    .line 110
    int-to-float p2, p2

    .line 111
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 112
    .line 113
    .line 114
    move-result p2

    .line 115
    int-to-long p2, p2

    .line 116
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->setAudienceAmount(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    new-instance p2, Ll/ffu;

    .line 124
    .line 125
    invoke-direct {p2, p0, p1}, Ll/ffu;-><init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;Ll/byu;)V

    .line 126
    .line 127
    .line 128
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 129
    .line 130
    .line 131
    iget-object p0, p1, Ll/byu;->localTrackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 132
    .line 133
    if-eqz p0, :cond_3

    .line 134
    .line 135
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMv(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 136
    .line 137
    .line 138
    :cond_3
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/jdc0;->k0:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 13
    .line 14
    sget v0, Ll/jdc0;->D:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VFrame;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_cover:Lv/VFrame;

    .line 23
    .line 24
    sget v0, Ll/jdc0;->c:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VDraweeView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_anchor_level_icon:Lv/VDraweeView;

    .line 33
    .line 34
    sget v0, Ll/jdc0;->e1:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/VText;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_tv_live_distance:Lv/VText;

    .line 43
    .line 44
    sget v0, Ll/jdc0;->d1:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lv/VText;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_tv_live_audience_amount:Lv/VText;

    .line 53
    .line 54
    sget v0, Ll/jdc0;->f1:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lv/VText;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_tv_live_name:Lv/VText;

    .line 63
    .line 64
    sget v0, Ll/jdc0;->n1:I

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 73
    .line 74
    return-void
.end method

.method public setAudienceAmount(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_tv_live_audience_amount:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDistance(Lcom/p1/mobile/putong/data/Location;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/Location;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_tv_live_distance:Lv/VText;

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

.method public setLiveName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->_tv_live_name:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
