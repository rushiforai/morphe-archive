.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public _anchor_level_icon:Lv/VDraweeView;

.field public _cover:Lv/VFrame;

.field public _media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

.field public _msg_scroll_view:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;

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
    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->recommendedSideLength:I

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

    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->recommendedSideLength:I

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

    iput p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->recommendedSideLength:I

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;Ll/byu;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->f(Ll/byu;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/Long;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->e(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/Long;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final c(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x4

    .line 6
    if-le p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    invoke-virtual {p1, p0, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p1, "..."

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :cond_0
    const-string p0, ":"

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_anchor_level_icon:Lv/VDraweeView;

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

.method public final synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/Long;Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->chatMessages:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    int-to-long v2, p2

    .line 12
    rem-long/2addr v0, v2

    .line 13
    long-to-int p2, v0

    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->chatMessages:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMsg;

    .line 21
    .line 22
    instance-of p2, p3, Landroid/widget/TextView;

    .line 23
    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMsg;->userName:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->c(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p2, p0}, Ll/vuf0;->a(Landroid/content/Context;Ljava/lang/CharSequence;)Ll/vuf0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    sget p2, Ll/l9c0;->i:I

    .line 41
    .line 42
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    invoke-virtual {p0, p2}, Ll/vuf0$a;->c(I)Ll/vuf0$a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMsg;->msg:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Ll/vuf0$a;->a(Ljava/lang/CharSequence;)Ll/vuf0$a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const/4 p1, -0x1

    .line 57
    invoke-virtual {p0, p1}, Ll/vuf0$a;->c(I)Ll/vuf0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ll/vuf0$a;->b()Landroid/text/SpannableStringBuilder;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    check-cast p3, Landroid/widget/TextView;

    .line 66
    .line 67
    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method

.method public final synthetic f(Ll/byu;Landroid/view/View;)V
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

.method public g(Ll/byu;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ll/ner;Ll/ft5;)V
    .locals 3

    .line 1
    iget-object p4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    iget-object p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->location:Lcom/p1/mobile/putong/data/Location;

    .line 6
    .line 7
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->setDistance(Lcom/p1/mobile/putong/data/Location;)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->d()V

    .line 12
    .line 13
    .line 14
    :goto_0
    iget-object p4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 15
    .line 16
    if-eqz p4, :cond_1

    .line 17
    .line 18
    iget-object p4, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 19
    .line 20
    invoke-virtual {p4}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->getSimpleDraweeView()Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 21
    .line 22
    .line 23
    move-result-object p4

    .line 24
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->coverUrl:Ljava/lang/String;

    .line 27
    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->recommendedSideLength:I

    .line 29
    .line 30
    const-string v2, "context_square"

    .line 31
    .line 32
    invoke-static {v2, p4, v0, v1, v1}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 33
    .line 34
    .line 35
    iget-object p4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 36
    .line 37
    iget-object p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->title:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->setLiveName(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object p4, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 43
    .line 44
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 45
    .line 46
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    xor-int/lit8 v0, v0, 0x1

    .line 51
    .line 52
    invoke-static {p4, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    iget-object p4, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    invoke-virtual {p4, v0}, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;->setCAreaLabelEnable(Z)V

    .line 59
    .line 60
    .line 61
    iget-object p4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 62
    .line 63
    invoke-static {p4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 64
    .line 65
    .line 66
    move-result p4

    .line 67
    if-nez p4, :cond_2

    .line 68
    .line 69
    iget-object p4, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 70
    .line 71
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 72
    .line 73
    invoke-virtual {p4, v0}, Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;->O(Ljava/util/List;)V

    .line 74
    .line 75
    .line 76
    :cond_2
    iget-object p4, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_tv_live_name:Lv/VText;

    .line 77
    .line 78
    const/high16 v0, 0x41700000    # 15.0f

    .line 79
    .line 80
    invoke-virtual {p4, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 81
    .line 82
    .line 83
    iget p4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 84
    .line 85
    int-to-float p4, p4

    .line 86
    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    .line 87
    .line 88
    .line 89
    move-result p4

    .line 90
    int-to-long v0, p4

    .line 91
    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p4

    .line 95
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->setAudienceAmount(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget-object p4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->chatMessages:Ljava/util/List;

    .line 99
    .line 100
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 101
    .line 102
    .line 103
    move-result p4

    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_msg_scroll_view:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;

    .line 105
    .line 106
    const/4 v1, 0x5

    .line 107
    if-lt p4, v1, :cond_3

    .line 108
    .line 109
    new-instance p4, Ll/gfu;

    .line 110
    .line 111
    invoke-direct {p4, p0, p2}, Ll/gfu;-><init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, p4}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->setViewRender(Ll/z20;)V

    .line 115
    .line 116
    .line 117
    iget-object p4, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_msg_scroll_view:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;

    .line 118
    .line 119
    invoke-virtual {p4, p3}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->e(Ll/ner;)V

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;->f()V

    .line 124
    .line 125
    .line 126
    :goto_1
    new-instance p3, Ll/hfu;

    .line 127
    .line 128
    invoke-direct {p3, p0, p1}, Ll/hfu;-><init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;Ll/byu;)V

    .line 129
    .line 130
    .line 131
    invoke-static {p0, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 132
    .line 133
    .line 134
    iget-object p1, p1, Ll/byu;->localTrackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 135
    .line 136
    if-eqz p1, :cond_4

    .line 137
    .line 138
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMv(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 139
    .line 140
    .line 141
    :cond_4
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-nez p1, :cond_5

    .line 148
    .line 149
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 150
    .line 151
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->n(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    :cond_5
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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_media_view:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_cover:Lv/VFrame;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_anchor_level_icon:Lv/VDraweeView;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_tv_live_distance:Lv/VText;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_tv_live_audience_amount:Lv/VText;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_tv_live_name:Lv/VText;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_view_group_opt_label:Lcom/p1/mobile/putong/live/base/view/LiveNewOptLabelView;

    .line 73
    .line 74
    sget v0, Ll/jdc0;->p0:I

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;

    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_msg_scroll_view:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveMsgAutoScrollView;

    .line 83
    .line 84
    return-void
.end method

.method public setAudienceAmount(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_tv_live_audience_amount:Lv/VText;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_tv_live_distance:Lv/VText;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardMainItemView;->_tv_live_name:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
