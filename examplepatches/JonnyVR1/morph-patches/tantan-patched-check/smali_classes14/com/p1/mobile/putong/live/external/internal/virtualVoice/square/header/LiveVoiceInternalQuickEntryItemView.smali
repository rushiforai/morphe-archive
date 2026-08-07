.class public Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalQuickEntryItemView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalQuickEntryItemView;

.field public d:Lv/VDraweeView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;


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

.method private r()V
    .locals 7

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget v1, Ll/qa00;->w:I

    .line 6
    .line 7
    sub-int/2addr v0, v1

    .line 8
    div-int/lit8 v0, v0, 0x3

    .line 9
    .line 10
    int-to-float v1, v0

    .line 11
    const v2, 0x3ff77777

    .line 12
    .line 13
    .line 14
    div-float v2, v1, v2

    .line 15
    .line 16
    float-to-int v2, v2

    .line 17
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalQuickEntryItemView;->c:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalQuickEntryItemView;

    .line 18
    .line 19
    const/4 v4, 0x1

    .line 20
    new-array v5, v4, [Landroid/view/View;

    .line 21
    .line 22
    const/4 v6, 0x0

    .line 23
    aput-object v3, v5, v6

    .line 24
    .line 25
    invoke-static {v0, v5}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalQuickEntryItemView;->c:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalQuickEntryItemView;

    .line 29
    .line 30
    invoke-static {v0, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 31
    .line 32
    .line 33
    const/high16 v0, 0x42200000    # 40.0f

    .line 34
    .line 35
    mul-float/2addr v1, v0

    .line 36
    const/high16 v3, 0x42e80000    # 116.0f

    .line 37
    .line 38
    div-float/2addr v1, v3

    .line 39
    float-to-int v1, v1

    .line 40
    int-to-float v2, v2

    .line 41
    mul-float/2addr v2, v0

    .line 42
    const/high16 v0, 0x42700000    # 60.0f

    .line 43
    .line 44
    div-float/2addr v2, v0

    .line 45
    float-to-int v0, v2

    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalQuickEntryItemView;->d:Lv/VDraweeView;

    .line 47
    .line 48
    new-array v3, v4, [Landroid/view/View;

    .line 49
    .line 50
    aput-object v2, v3, v6

    .line 51
    .line 52
    invoke-static {v1, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalQuickEntryItemView;->d:Lv/VDraweeView;

    .line 56
    .line 57
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 58
    .line 59
    .line 60
    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/r7v;->a(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalQuickEntryItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final Q(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Landroid/graphics/drawable/GradientDrawable$Orientation;->TR_BL:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 9
    .line 10
    .line 11
    const/high16 v0, 0x41200000    # 10.0f

    .line 12
    .line 13
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    int-to-float v0, v0

    .line 18
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 19
    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 30
    .line 31
    .line 32
    return-object p0
.end method

.method public R(Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalQuickEntryItemView;->e:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;->getTitle()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalQuickEntryItemView;->f:Landroid/widget/TextView;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;->getSubTitle()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalQuickEntryItemView;->c:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalQuickEntryItemView;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;->getBgColor()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalQuickEntryItemView;->Q(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalQuickEntryItemView;->d:Lv/VDraweeView;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;->getIcon()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "context_square"

    .line 39
    .line 40
    invoke-static {v1, p0, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const-string p0, "p_audio_explore_recommend"

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntryCardData;->getTrackData()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const-string v0, "e_audio_shortcut"

    .line 50
    .line 51
    invoke-static {v0, p0, p1}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalQuickEntryItemView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/header/LiveVoiceInternalQuickEntryItemView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
