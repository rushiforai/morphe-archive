.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public _cover:Lv/VFrame;

.field public _media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

.field public _tv_live_name:Lv/VText;

.field private _tv_subTitle:Lv/VText;

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
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->recommendedSideLength:I

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
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->recommendedSideLength:I

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
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->recommendedSideLength:I

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
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->recommendedSideLength:I

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->_cover:Lv/VFrame;

    .line 11
    .line 12
    iget v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->recommendedSideLength:I

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

.method public b(Ll/byu;)V
    .locals 3

    .line 1
    iget-object p1, p1, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->_tv_subTitle:Lv/VText;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->subtitle:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->coverUrl:Ljava/lang/String;

    .line 17
    .line 18
    iget v2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->recommendedSideLength:I

    .line 19
    .line 20
    invoke-static {v1, v0, v2}, Ll/vl4;->g(Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->_tv_live_name:Lv/VText;

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->title:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->_tv_live_name:Lv/VText;

    .line 33
    .line 34
    const/high16 v1, 0x41600000    # 14.0f

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->_view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 40
    .line 41
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 42
    .line 43
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    xor-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 53
    .line 54
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->_view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;->O(Ljava/util/List;)V

    .line 65
    .line 66
    .line 67
    :cond_1
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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->_cover:Lv/VFrame;

    .line 23
    .line 24
    sget v0, Ll/jdc0;->n1:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->_view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 33
    .line 34
    sget v0, Ll/jdc0;->f1:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->_tv_live_name:Lv/VText;

    .line 43
    .line 44
    sget v0, Ll/jdc0;->h1:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedBStyleCardView;->_tv_subTitle:Lv/VText;

    .line 53
    .line 54
    return-void
.end method
