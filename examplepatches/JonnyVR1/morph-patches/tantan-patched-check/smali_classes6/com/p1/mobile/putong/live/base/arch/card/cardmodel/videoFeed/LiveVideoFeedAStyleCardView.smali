.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public _anchor_level_icon:Lv/VDraweeView;

.field public _cover:Lv/VFrame;

.field public _media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

.field public _tv_live_audience_amount:Lv/VText;

.field public _tv_live_distance:Lv/VText;

.field public _tv_live_name:Lv/VText;

.field public _view_group_live_end:Lv/VFrame;

.field public _view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

.field protected recommendedSideLength:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->recommendedSideLength:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->recommendedSideLength:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->recommendedSideLength:I

    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/vl4;->e(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->recommendedSideLength:I

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_cover:Lv/VFrame;

    .line 11
    .line 12
    iget v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->recommendedSideLength:I

    .line 13
    .line 14
    div-int/lit8 v0, v0, 0x2

    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    sget p1, Ll/qa00;->i:I

    .line 20
    .line 21
    invoke-static {p0, p1}, Ll/ynp0;->m(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->n(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Ll/byu;)V
    .locals 3

    .line 1
    iget-object p1, p1, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_tv_live_distance:Lv/VText;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->location:Lcom/p1/mobile/putong/data/Location;

    .line 10
    .line 11
    invoke-static {v0}, Ll/xau;->x(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_anchor_level_icon:Lv/VDraweeView;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->coverUrl:Ljava/lang/String;

    .line 32
    .line 33
    iget v2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->recommendedSideLength:I

    .line 34
    .line 35
    invoke-static {v1, v0, v2}, Ll/vl4;->g(Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;Ljava/lang/String;I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_tv_live_name:Lv/VText;

    .line 39
    .line 40
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->title:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_tv_live_name:Lv/VText;

    .line 48
    .line 49
    const/high16 v1, 0x41600000    # 14.0f

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_tv_live_audience_amount:Lv/VText;

    .line 55
    .line 56
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 57
    .line 58
    int-to-float v1, v1

    .line 59
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    int-to-long v1, v1

    .line 64
    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_view_group_live_end:Lv/VFrame;

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->isOnLive()Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    xor-int/lit8 v1, v1, 0x1

    .line 78
    .line 79
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 83
    .line 84
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 85
    .line 86
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    xor-int/lit8 v1, v1, 0x1

    .line 91
    .line 92
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 96
    .line 97
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-nez v0, :cond_2

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 104
    .line 105
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 106
    .line 107
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;->O(Ljava/util/List;)V

    .line 108
    .line 109
    .line 110
    :cond_2
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 13
    .line 14
    sget v0, Ll/jdc0;->J:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_view_group_live_end:Lv/VFrame;

    .line 23
    .line 24
    sget v0, Ll/jdc0;->D:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VFrame;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_cover:Lv/VFrame;

    .line 33
    .line 34
    sget v0, Ll/jdc0;->X:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 43
    .line 44
    sget v0, Ll/jdc0;->R:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lv/VDraweeView;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_anchor_level_icon:Lv/VDraweeView;

    .line 53
    .line 54
    sget v0, Ll/jdc0;->Z0:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_tv_live_name:Lv/VText;

    .line 63
    .line 64
    sget v0, Ll/jdc0;->B0:I

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lv/VText;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_tv_live_audience_amount:Lv/VText;

    .line 73
    .line 74
    sget v0, Ll/jdc0;->L0:I

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lv/VText;

    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedAStyleCardView;->_tv_live_distance:Lv/VText;

    .line 83
    .line 84
    return-void
.end method
