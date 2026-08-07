.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public _avatar:Lv/VDraweeView;

.field public _frame_view:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

.field public _location:Lv/VText;

.field public _member_container:Lv/VLinear;

.field public _member_count:Lv/VText;

.field public _tag:Lv/VLinear;

.field public _tag_container:Landroid/widget/FrameLayout;

.field public _tag_icon:Lv/VDraweeView;

.field public _tag_text:Landroid/widget/TextView;

.field public _title:Lv/VText;

.field public left_top_tag:Lv/VDraweeView;


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

.method private i0(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/16 v0, 0x3e8

    .line 10
    .line 11
    if-lt p0, v0, :cond_0

    .line 12
    .line 13
    const-string p0, "+999"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    return-object p1
.end method

.method private k0(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
    .locals 9

    .line 1
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberAvatars:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    const/4 p2, 0x0

    .line 10
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_avatar:Lv/VDraweeView;

    .line 17
    .line 18
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;->avatar:Ljava/lang/String;

    .line 19
    .line 20
    const/high16 p0, 0x43300000    # 176.0f

    .line 21
    .line 22
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    invoke-static {}, Ll/irn;->a()Z

    .line 31
    .line 32
    .line 33
    move-result v7

    .line 34
    const/4 v8, 0x0

    .line 35
    const-string v0, "context_common"

    .line 36
    .line 37
    const/4 v5, 0x0

    .line 38
    const/4 v6, 0x0

    .line 39
    invoke-static/range {v0 .. v8}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method private l0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Lcom/p1/mobile/putong/live/base/data/BLiveFrame;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p1, :cond_2

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;->frameId:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    if-nez p2, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_frame_view:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 18
    .line 19
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFrame;->framePicUrl:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFrame;->frameSvgUrl:Ljava/lang/String;

    .line 26
    .line 27
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->m0(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_frame_view:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 32
    .line 33
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private m0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_frame_view:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private n0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_location:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_1

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorLocation:Lcom/p1/mobile/putong/data/Location;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 11
    .line 12
    iget-object p2, p1, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_location:Lv/VText;

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method private o0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_member_container:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberAvatars:Ljava/util/List;

    .line 7
    .line 8
    const/4 v1, 0x3

    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x0

    .line 18
    move v3, v2

    .line 19
    :goto_0
    if-ge v3, v1, :cond_2

    .line 20
    .line 21
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;

    .line 26
    .line 27
    iget-boolean v5, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;->isOnCall:Z

    .line 28
    .line 29
    if-nez v5, :cond_0

    .line 30
    .line 31
    goto :goto_2

    .line 32
    :cond_0
    if-nez v3, :cond_1

    .line 33
    .line 34
    move v5, v2

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    const/high16 v5, 0x40a00000    # 5.0f

    .line 37
    .line 38
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    neg-int v5, v5

    .line 43
    :goto_1
    invoke-virtual {p0, v4, v5}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->h0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_member_container:Lv/VLinear;

    .line 48
    .line 49
    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_member_count:Lv/VText;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberCount:Ljava/lang/String;

    .line 58
    .line 59
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->i0(Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_member_count:Lv/VText;

    .line 67
    .line 68
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-lez p1, :cond_3

    .line 73
    .line 74
    const/4 v2, 0x1

    .line 75
    :cond_3
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method private p0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_tag_container:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveAttributeTags:Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;->topTags:Ljava/util/List;

    .line 13
    .line 14
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_tag_container:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    xor-int/lit8 v3, v0, 0x1

    .line 21
    .line 22
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    const-string v2, "context_square"

    .line 26
    .line 27
    const/4 v3, 0x1

    .line 28
    if-nez v0, :cond_4

    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;->topTags:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;

    .line 37
    .line 38
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_tag_text:Landroid/widget/TextView;

    .line 39
    .line 40
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->text:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_tag_icon:Lv/VDraweeView;

    .line 46
    .line 47
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->url:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    xor-int/2addr v5, v3

    .line 54
    invoke-static {v4, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->url:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    if-nez v4, :cond_1

    .line 64
    .line 65
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_tag_icon:Lv/VDraweeView;

    .line 66
    .line 67
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->url:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v2, v4, v5}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :cond_1
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->startColor:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-eqz v4, :cond_2

    .line 79
    .line 80
    sget v4, Ll/l9c0;->g:I

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->startColor:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    :goto_0
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->endColor:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    if-eqz v5, :cond_3

    .line 96
    .line 97
    sget v0, Ll/l9c0;->g:I

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->endColor:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    :goto_1
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_tag:Lv/VLinear;

    .line 107
    .line 108
    filled-new-array {v4, v0}, [I

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    sget-object v4, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 113
    .line 114
    sget v6, Ll/qa00;->g:I

    .line 115
    .line 116
    int-to-float v6, v6

    .line 117
    invoke-static {v0, v4, v6, v1}, Ll/fc2;->e([ILandroid/graphics/drawable/GradientDrawable$Orientation;FZ)Landroid/graphics/drawable/Drawable;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v5, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 122
    .line 123
    .line 124
    :cond_4
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;->leftTopTags:Ljava/util/List;

    .line 125
    .line 126
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->left_top_tag:Lv/VDraweeView;

    .line 131
    .line 132
    if-nez v0, :cond_5

    .line 133
    .line 134
    invoke-static {v4, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->left_top_tag:Lv/VDraweeView;

    .line 138
    .line 139
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;

    .line 144
    .line 145
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->url:Ljava/lang/String;

    .line 146
    .line 147
    new-instance v1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView$a;

    .line 148
    .line 149
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView$a;-><init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;)V

    .line 150
    .line 151
    .line 152
    invoke-static {v2, v0, p1, v1}, Ll/izs;->w(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_5
    invoke-static {v4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method private q0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_title:Lv/VText;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTitle:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private r()V
    .locals 7

    .line 1
    const/high16 v0, 0x41200000    # 10.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v6

    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x0

    .line 9
    const/4 v4, 0x0

    .line 10
    const/4 v5, 0x0

    .line 11
    move-object v1, p0

    .line 12
    invoke-static/range {v1 .. v6}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final h0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;I)Landroid/view/View;
    .locals 10

    .line 1
    new-instance v1, Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {v1, v0}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/xlj;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-direct {v0, v2}, Ll/xlj;-><init>(Landroid/content/res/Resources;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ll/xlj;->a()Ll/wlj;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {}, Lcom/facebook/drawee/generic/RoundingParams;->a()Lcom/facebook/drawee/generic/RoundingParams;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v2}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 28
    .line 29
    .line 30
    sget v2, Ll/mbc0;->T:I

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ll/wlj;->z(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v0}, Lcom/facebook/drawee/view/DraweeView;->setHierarchy(Ll/mde;)V

    .line 36
    .line 37
    .line 38
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 39
    .line 40
    sget v3, Ll/qa00;->n:I

    .line 41
    .line 42
    invoke-direct {v0, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 46
    .line 47
    .line 48
    new-instance v9, Landroid/widget/FrameLayout;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-direct {v9, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 55
    .line 56
    .line 57
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 58
    .line 59
    const/4 v0, -0x2

    .line 60
    invoke-direct {p0, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v9, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v9, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 70
    .line 71
    .line 72
    sget p0, Ll/qa00;->a:I

    .line 73
    .line 74
    invoke-virtual {v9, p0, p0, p0, p0}, Landroid/view/View;->setPadding(IIII)V

    .line 75
    .line 76
    .line 77
    sget p0, Ll/l9c0;->h:I

    .line 78
    .line 79
    invoke-static {p0}, Ll/n3d0;->a(I)I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    invoke-static {p0}, Ll/fc2;->h(I)Landroid/graphics/drawable/GradientDrawable;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {v9, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 88
    .line 89
    .line 90
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;->avatar:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {}, Ll/irn;->a()Z

    .line 93
    .line 94
    .line 95
    move-result v7

    .line 96
    const/4 v8, 0x0

    .line 97
    const-string v0, "context_common"

    .line 98
    .line 99
    const/4 v5, 0x1

    .line 100
    const/4 v6, 0x0

    .line 101
    move v4, v3

    .line 102
    invoke-static/range {v0 .. v8}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 103
    .line 104
    .line 105
    return-object v9
.end method

.method public j0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_frame_view:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_frame_view:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->d()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/jdc0;->N:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_frame_view:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 13
    .line 14
    sget v0, Ll/jdc0;->j:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VDraweeView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_avatar:Lv/VDraweeView;

    .line 23
    .line 24
    sget v0, Ll/jdc0;->Z0:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VText;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_title:Lv/VText;

    .line 33
    .line 34
    sget v0, Ll/jdc0;->O0:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroid/widget/FrameLayout;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_tag_container:Landroid/widget/FrameLayout;

    .line 43
    .line 44
    sget v0, Ll/jdc0;->N0:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lv/VLinear;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_tag:Lv/VLinear;

    .line 53
    .line 54
    sget v0, Ll/jdc0;->P0:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lv/VDraweeView;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_tag_icon:Lv/VDraweeView;

    .line 63
    .line 64
    sget v0, Ll/jdc0;->Q0:I

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Landroid/widget/TextView;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_tag_text:Landroid/widget/TextView;

    .line 73
    .line 74
    sget v0, Ll/jdc0;->m0:I

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_member_count:Lv/VText;

    .line 83
    .line 84
    sget v0, Ll/jdc0;->i0:I

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Lv/VText;

    .line 91
    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_location:Lv/VText;

    .line 93
    .line 94
    sget v0, Ll/jdc0;->l0:I

    .line 95
    .line 96
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Lv/VLinear;

    .line 101
    .line 102
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->_member_container:Lv/VLinear;

    .line 103
    .line 104
    sget v0, Ll/jdc0;->a0:I

    .line 105
    .line 106
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    check-cast v0, Lv/VDraweeView;

    .line 111
    .line 112
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->left_top_tag:Lv/VDraweeView;

    .line 113
    .line 114
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->r()V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public r0(Ll/bwp;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/bwp;->c()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/bwp;->d()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-direct {p0, v1, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->k0(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->q0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->p0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ll/bwp;->g()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->n0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Z)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ll/bwp;->b()Lcom/p1/mobile/putong/live/base/data/BLiveFrame;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-direct {p0, v0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeBFeedCardView;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Lcom/p1/mobile/putong/live/base/data/BLiveFrame;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
