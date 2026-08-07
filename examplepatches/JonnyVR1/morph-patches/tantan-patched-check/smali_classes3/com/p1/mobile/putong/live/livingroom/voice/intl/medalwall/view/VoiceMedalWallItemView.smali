.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallItemView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;

.field public d:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/e7o0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;Z)V
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    new-instance p2, Landroid/graphics/ColorMatrix;

    .line 4
    .line 5
    invoke-direct {p2}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p2, v0}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Landroid/graphics/ColorMatrixColorFilter;

    .line 13
    .line 14
    invoke-direct {v0, p2}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallItemView;->c:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;

    .line 18
    .line 19
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;->getDraweeView()Lv/VDraweeView;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p2, v0}, Lv/VDraweeView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallItemView;->c:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;

    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;->getDraweeView()Lv/VDraweeView;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p2}, Landroid/widget/ImageView;->clearColorFilter()V

    .line 34
    .line 35
    .line 36
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallItemView;->c:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;

    .line 37
    .line 38
    const-string v0, "context_single_room"

    .line 39
    .line 40
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;->icon:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallItemView;->d:Lv/VText;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallItem;->name:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallItemView;->c:Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/SvgAndImageView;->a()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/view/VoiceMedalWallItemView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
