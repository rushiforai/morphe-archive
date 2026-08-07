.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public _avatar:Lv/VDraweeView;

.field public _avatar_1:Lv/VDraweeView;

.field public _avatar_2:Lv/VDraweeView;

.field public _avatar_3:Lv/VDraweeView;

.field public _container_avatar_1:Lcom/p1/mobile/putong/live/base/view/LiveAvatarNumberItemView;

.field public _container_avatar_2:Lcom/p1/mobile/putong/live/base/view/LiveAvatarNumberItemView;

.field public _container_avatar_3:Lcom/p1/mobile/putong/live/base/view/LiveAvatarNumberItemView;

.field public _frame_view:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

.field public _inner_ring:Landroid/view/View;

.field public _item_background:Lv/VImage;

.field public _location:Lv/VText;

.field public _member_count:Lv/VText;

.field public _middle_ring:Landroid/view/View;

.field public _outer_ring:Landroid/view/View;

.field public _tag:Lv/VLinear;

.field public _tag_container:Landroid/widget/FrameLayout;

.field public _tag_icon:Lv/VDraweeView;

.field public _tag_text:Landroid/widget/TextView;

.field public _title:Lv/VText;

.field private voiceCardBg:Landroid/graphics/drawable/GradientDrawable;


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

.method private getVoiceCardBlackThemeBg()Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 1
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 8
    .line 9
    .line 10
    const/high16 v0, 0x41200000    # 10.0f

    .line 11
    .line 12
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    int-to-float v0, v0

    .line 17
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 23
    .line 24
    .line 25
    return-object p0
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;->isOnCall:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private o0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_frame_view:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private r()V
    .locals 7

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->getVoiceCardBlackThemeBg()Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->voiceCardBg:Landroid/graphics/drawable/GradientDrawable;

    .line 6
    .line 7
    invoke-static {}, Ll/bnl0;->y0()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    int-to-float v0, v0

    .line 12
    const/high16 v1, 0x3f800000    # 1.0f

    .line 13
    .line 14
    mul-float/2addr v0, v1

    .line 15
    const v1, 0x43bb8000    # 375.0f

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-float v1, v1

    .line 23
    div-float/2addr v0, v1

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_outer_ring:Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->i0(Landroid/view/View;F)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_middle_ring:Landroid/view/View;

    .line 30
    .line 31
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->i0(Landroid/view/View;F)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_inner_ring:Landroid/view/View;

    .line 35
    .line 36
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->i0(Landroid/view/View;F)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_avatar:Lv/VDraweeView;

    .line 40
    .line 41
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->i0(Landroid/view/View;F)V

    .line 42
    .line 43
    .line 44
    const/high16 v0, 0x41200000    # 10.0f

    .line 45
    .line 46
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    const/4 v2, 0x0

    .line 51
    const/4 v3, 0x0

    .line 52
    const/4 v4, 0x0

    .line 53
    const/4 v5, 0x0

    .line 54
    move-object v1, p0

    .line 55
    invoke-static/range {v1 .. v6}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 56
    .line 57
    .line 58
    return-void
.end method


# virtual methods
.method public final i0(Landroid/view/View;F)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget v0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 6
    .line 7
    int-to-float v0, v0

    .line 8
    mul-float/2addr v0, p2

    .line 9
    float-to-int v0, v0

    .line 10
    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 11
    .line 12
    iget v0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 13
    .line 14
    int-to-float v0, v0

    .line 15
    mul-float/2addr v0, p2

    .line 16
    float-to-int p2, v0

    .line 17
    iput p2, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final j0(Ljava/lang/String;)Ljava/lang/String;
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

.method public k0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_frame_view:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_frame_view:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;->d()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final l0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
    .locals 9

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberAvatars:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_avatar:Lv/VDraweeView;

    .line 17
    .line 18
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;->avatar:Ljava/lang/String;

    .line 19
    .line 20
    sget v3, Ll/qa00;->S:I

    .line 21
    .line 22
    invoke-static {}, Ll/irn;->a()Z

    .line 23
    .line 24
    .line 25
    move-result v7

    .line 26
    const/4 v8, 0x0

    .line 27
    const-string v0, "context_common"

    .line 28
    .line 29
    const/4 v5, 0x0

    .line 30
    const/4 v6, 0x0

    .line 31
    move v4, v3

    .line 32
    invoke-static/range {v0 .. v8}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final m0(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_item_background:Lv/VImage;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->voiceCardBg:Landroid/graphics/drawable/GradientDrawable;

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/f4n0;->a(I)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->voiceCardBg:Landroid/graphics/drawable/GradientDrawable;

    .line 13
    .line 14
    iget-object p2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p2, Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p1, Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    filled-new-array {p2, p1}, [I

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public n0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Lcom/p1/mobile/putong/live/base/data/BLiveFrame;)V
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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_frame_view:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

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
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->o0(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_frame_view:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 32
    .line 33
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/jdc0;->W:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VImage;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_item_background:Lv/VImage;

    .line 13
    .line 14
    sget v0, Ll/jdc0;->N:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_frame_view:Lcom/p1/mobile/putong/live/base/view/LiveIntlSquareFrameView;

    .line 23
    .line 24
    sget v0, Ll/jdc0;->t0:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_outer_ring:Landroid/view/View;

    .line 31
    .line 32
    sget v0, Ll/jdc0;->o0:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_middle_ring:Landroid/view/View;

    .line 39
    .line 40
    sget v0, Ll/jdc0;->U:I

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_inner_ring:Landroid/view/View;

    .line 47
    .line 48
    sget v0, Ll/jdc0;->j:I

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lv/VDraweeView;

    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_avatar:Lv/VDraweeView;

    .line 57
    .line 58
    sget v0, Ll/jdc0;->Z0:I

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Lv/VText;

    .line 65
    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_title:Lv/VText;

    .line 67
    .line 68
    sget v0, Ll/jdc0;->O0:I

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Landroid/widget/FrameLayout;

    .line 75
    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_tag_container:Landroid/widget/FrameLayout;

    .line 77
    .line 78
    sget v0, Ll/jdc0;->N0:I

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Lv/VLinear;

    .line 85
    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_tag:Lv/VLinear;

    .line 87
    .line 88
    sget v0, Ll/jdc0;->P0:I

    .line 89
    .line 90
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Lv/VDraweeView;

    .line 95
    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_tag_icon:Lv/VDraweeView;

    .line 97
    .line 98
    sget v0, Ll/jdc0;->Q0:I

    .line 99
    .line 100
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Landroid/widget/TextView;

    .line 105
    .line 106
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_tag_text:Landroid/widget/TextView;

    .line 107
    .line 108
    sget v0, Ll/jdc0;->w:I

    .line 109
    .line 110
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/LiveAvatarNumberItemView;

    .line 115
    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_container_avatar_1:Lcom/p1/mobile/putong/live/base/view/LiveAvatarNumberItemView;

    .line 117
    .line 118
    sget v0, Ll/jdc0;->k:I

    .line 119
    .line 120
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Lv/VDraweeView;

    .line 125
    .line 126
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_avatar_1:Lv/VDraweeView;

    .line 127
    .line 128
    sget v0, Ll/jdc0;->x:I

    .line 129
    .line 130
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/LiveAvatarNumberItemView;

    .line 135
    .line 136
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_container_avatar_2:Lcom/p1/mobile/putong/live/base/view/LiveAvatarNumberItemView;

    .line 137
    .line 138
    sget v0, Ll/jdc0;->l:I

    .line 139
    .line 140
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    check-cast v0, Lv/VDraweeView;

    .line 145
    .line 146
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_avatar_2:Lv/VDraweeView;

    .line 147
    .line 148
    sget v0, Ll/jdc0;->y:I

    .line 149
    .line 150
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/LiveAvatarNumberItemView;

    .line 155
    .line 156
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_container_avatar_3:Lcom/p1/mobile/putong/live/base/view/LiveAvatarNumberItemView;

    .line 157
    .line 158
    sget v0, Ll/jdc0;->m:I

    .line 159
    .line 160
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    check-cast v0, Lv/VDraweeView;

    .line 165
    .line 166
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_avatar_3:Lv/VDraweeView;

    .line 167
    .line 168
    sget v0, Ll/jdc0;->m0:I

    .line 169
    .line 170
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    check-cast v0, Lv/VText;

    .line 175
    .line 176
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_member_count:Lv/VText;

    .line 177
    .line 178
    sget v0, Ll/jdc0;->i0:I

    .line 179
    .line 180
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    check-cast v0, Lv/VText;

    .line 185
    .line 186
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_location:Lv/VText;

    .line 187
    .line 188
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->r()V

    .line 189
    .line 190
    .line 191
    return-void
.end method

.method public final p0(Lv/VDraweeView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;)V
    .locals 9

    .line 1
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;->avatar:Ljava/lang/String;

    .line 2
    .line 3
    sget v3, Ll/qa00;->o:I

    .line 4
    .line 5
    invoke-static {}, Ll/irn;->a()Z

    .line 6
    .line 7
    .line 8
    move-result v7

    .line 9
    const/4 v8, 0x0

    .line 10
    const-string v0, "context_common"

    .line 11
    .line 12
    const/4 v5, 0x1

    .line 13
    const/4 v6, 0x0

    .line 14
    move v4, v3

    .line 15
    move-object v1, p1

    .line 16
    invoke-static/range {v0 .. v8}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final q0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_location:Lv/VText;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_location:Lv/VText;

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

.method public final r0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberAvatars:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/cvo0;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/cvo0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_container_avatar_1:Lcom/p1/mobile/putong/live/base/view/LiveAvatarNumberItemView;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_container_avatar_2:Lcom/p1/mobile/putong/live/base/view/LiveAvatarNumberItemView;

    .line 19
    .line 20
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_container_avatar_3:Lcom/p1/mobile/putong/live/base/view/LiveAvatarNumberItemView;

    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const/4 v3, 0x1

    .line 33
    if-lt v1, v3, :cond_0

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_avatar_1:Lv/VDraweeView;

    .line 36
    .line 37
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;

    .line 42
    .line 43
    invoke-virtual {p0, v1, v4}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->p0(Lv/VDraweeView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_container_avatar_1:Lcom/p1/mobile/putong/live/base/view/LiveAvatarNumberItemView;

    .line 47
    .line 48
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    const/4 v4, 0x2

    .line 56
    if-lt v1, v4, :cond_1

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_avatar_2:Lv/VDraweeView;

    .line 59
    .line 60
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;

    .line 65
    .line 66
    invoke-virtual {p0, v1, v5}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->p0(Lv/VDraweeView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_container_avatar_2:Lcom/p1/mobile/putong/live/base/view/LiveAvatarNumberItemView;

    .line 70
    .line 71
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    const/4 v5, 0x3

    .line 79
    if-lt v1, v5, :cond_2

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_avatar_3:Lv/VDraweeView;

    .line 82
    .line 83
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;

    .line 88
    .line 89
    invoke-virtual {p0, v1, v4}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->p0(Lv/VDraweeView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;)V

    .line 90
    .line 91
    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_container_avatar_3:Lcom/p1/mobile/putong/live/base/view/LiveAvatarNumberItemView;

    .line 93
    .line 94
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_member_count:Lv/VText;

    .line 98
    .line 99
    sget v4, Lcom/p1/mobile/putong/live/base/R$string;->d0:I

    .line 100
    .line 101
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberCount:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->j0(Ljava/lang/String;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-static {v4, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_member_count:Lv/VText;

    .line 115
    .line 116
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-lez p1, :cond_3

    .line 121
    .line 122
    move v2, v3

    .line 123
    :cond_3
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public final s0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_tag_container:Landroid/widget/FrameLayout;

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
    goto :goto_2

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
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_tag_container:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    xor-int/lit8 v3, v0, 0x1

    .line 21
    .line 22
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    if-nez v0, :cond_4

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;->topTags:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_tag_text:Landroid/widget/TextView;

    .line 36
    .line 37
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->text:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_tag_icon:Lv/VDraweeView;

    .line 43
    .line 44
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->url:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    xor-int/lit8 v2, v2, 0x1

    .line 51
    .line 52
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->url:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_1

    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_tag_icon:Lv/VDraweeView;

    .line 64
    .line 65
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->url:Ljava/lang/String;

    .line 66
    .line 67
    const-string v3, "context_square"

    .line 68
    .line 69
    invoke-static {v3, v0, v2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->startColor:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_2

    .line 79
    .line 80
    sget v0, Ll/l9c0;->g:I

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->startColor:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    :goto_0
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->endColor:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-eqz v2, :cond_3

    .line 96
    .line 97
    sget p1, Ll/l9c0;->g:I

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->endColor:Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_tag:Lv/VLinear;

    .line 107
    .line 108
    filled-new-array {v0, p1}, [I

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    sget-object v0, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 113
    .line 114
    sget v2, Ll/qa00;->g:I

    .line 115
    .line 116
    int-to-float v2, v2

    .line 117
    invoke-static {p1, v0, v2, v1}, Ll/fc2;->e([ILandroid/graphics/drawable/GradientDrawable$Orientation;FZ)Landroid/graphics/drawable/Drawable;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 122
    .line 123
    .line 124
    :cond_4
    :goto_2
    return-void
.end method

.method public final t0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->_title:Lv/VText;

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

.method public u0(Ll/bwp;I)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/bwp;->c()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->m0(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->t0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->r0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->s0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ll/bwp;->g()Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->q0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ll/bwp;->b()Lcom/p1/mobile/putong/live/base/data/BLiveFrame;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/feed/VoiceSquareThemeAFeedCardView;->n0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Lcom/p1/mobile/putong/live/base/data/BLiveFrame;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
