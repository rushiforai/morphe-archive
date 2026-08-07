.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Landroid/widget/RelativeLayout;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/FrameLayout;

.field public g:Lv/VDraweeView;

.field public h:Lv/VDraweeView;

.field public i:Lv/VText;


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


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/nkn0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallItemView;->f:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const-string v1, "context_single_room"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-ne p2, v3, :cond_0

    .line 8
    .line 9
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    new-instance p2, Landroid/graphics/ColorMatrix;

    .line 13
    .line 14
    invoke-direct {p2}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p2, v0}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Landroid/graphics/ColorMatrixColorFilter;

    .line 22
    .line 23
    invoke-direct {v0, p2}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallItemView;->e:Lv/VDraweeView;

    .line 27
    .line 28
    invoke-virtual {p2, v0}, Lv/VDraweeView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserAvatar:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallItemView;->g:Lv/VDraweeView;

    .line 42
    .line 43
    if-nez p2, :cond_1

    .line 44
    .line 45
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserAvatar:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v1, v0, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallItemView;->g:Lv/VDraweeView;

    .line 51
    .line 52
    invoke-static {p2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    :goto_0
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserAvatar:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    if-nez p2, :cond_2

    .line 66
    .line 67
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserId:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserId:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    if-nez p2, :cond_2

    .line 76
    .line 77
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallItemView;->h:Lv/VDraweeView;

    .line 78
    .line 79
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserAvatar:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v1, p2, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallItemView;->h:Lv/VDraweeView;

    .line 85
    .line 86
    invoke-static {p2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallItemView;->h:Lv/VDraweeView;

    .line 91
    .line 92
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallItemView;->e:Lv/VDraweeView;

    .line 96
    .line 97
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftImage:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v1, p2, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallItemView;->i:Lv/VText;

    .line 103
    .line 104
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftTitle:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/giftwall/view/VoiceGiftWallItemView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
