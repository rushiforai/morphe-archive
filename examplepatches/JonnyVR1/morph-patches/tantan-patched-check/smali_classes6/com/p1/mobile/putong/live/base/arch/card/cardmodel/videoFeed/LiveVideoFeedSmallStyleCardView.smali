.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# static fields
.field public static final DISTANCE_DIFFERENT_CITY:I = 0x186a0


# instance fields
.field public _media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

.field public _tv_distance:Lv/VText;

.field public _tv_live_name:Lv/VText;

.field public _tv_member_count:Lv/VText;

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
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->recommendedSideLength:I

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
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->recommendedSideLength:I

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
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->recommendedSideLength:I

    return-void
.end method

.method public static c(D)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->getCurrentLiveConfigs()Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-object v1

    .line 10
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->square:Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareConfig;->nearby:Lcom/p1/mobile/putong/live/base/data/BLiveSquareNearByConfig;

    .line 13
    .line 14
    iget-boolean v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareNearByConfig;->showMemberCount:Z

    .line 15
    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareNearByConfig;->showMemberText:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/q8g0;->v(D)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_1
    return-object v1
.end method

.method public static getCurrentLiveConfigs()Lcom/p1/mobile/putong/live/base/data/BLiveConfig;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Ll/vxr;->g()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    return-object v0

    .line 13
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 14
    .line 15
    return-object v0
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
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->recommendedSideLength:I

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->getSimpleDraweeView()Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Ll/wlj;

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    sget v0, Ll/mbc0;->v:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ll/wlj;->D(I)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 32
    .line 33
    sget p1, Ll/qa00;->i:I

    .line 34
    .line 35
    int-to-float p1, p1

    .line 36
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->setRadius(F)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public b(D)V
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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_tv_member_count:Lv/VText;

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
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->c(D)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_tv_member_count:Lv/VText;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_tv_member_count:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->n(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Ll/byu;)V
    .locals 3

    .line 1
    iget-object p1, p1, Ll/byu;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->coverUrl:Ljava/lang/String;

    .line 10
    .line 11
    iget v2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->recommendedSideLength:I

    .line 12
    .line 13
    invoke-static {v1, v0, v2}, Ll/vl4;->g(Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 17
    .line 18
    int-to-double v0, v0

    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->b(D)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->location:Lcom/p1/mobile/putong/data/Location;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->setDistance(Lcom/p1/mobile/putong/data/Location;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->name:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->setLiveName(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->isOnLive()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    xor-int/lit8 v0, v0, 0x1

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->g(Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 48
    .line 49
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 50
    .line 51
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    xor-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 61
    .line 62
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_2

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;->O(Ljava/util/List;)V

    .line 73
    .line 74
    .line 75
    :cond_2
    return-void
.end method

.method public g(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_view_group_live_end:Lv/VFrame;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 13
    .line 14
    sget v0, Ll/jdc0;->m1:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_view_group_live_end:Lv/VFrame;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_tv_live_name:Lv/VText;

    .line 43
    .line 44
    sget v0, Ll/jdc0;->c1:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_tv_distance:Lv/VText;

    .line 53
    .line 54
    sget v0, Ll/jdc0;->g1:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_tv_member_count:Lv/VText;

    .line 63
    .line 64
    return-void
.end method

.method public setDistance(Lcom/p1/mobile/putong/data/Location;)V
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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_tv_distance:Lv/VText;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_tv_member_count:Lv/VText;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->d(Lcom/p1/mobile/putong/data/Location;)Z

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_tv_distance:Lv/VText;

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_tv_distance:Lv/VText;

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public setLiveName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/videoFeed/LiveVideoFeedSmallStyleCardView;->_tv_live_name:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
