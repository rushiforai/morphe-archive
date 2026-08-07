.class public Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 15
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 14
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/high16 p3, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;->a:F

    .line 7
    .line 8
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;->b:F

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    sget-object v0, Ll/vhc0;->o0:[I

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget p2, Ll/vhc0;->p0:I

    .line 8
    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;->b:F

    .line 16
    .line 17
    sget p2, Ll/vhc0;->q0:I

    .line 18
    .line 19
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;->a:F

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final b()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;->a:F

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    cmpl-float v0, v0, v1

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;->a:F

    .line 10
    .line 11
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;->a:F

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    cmpg-float v0, v0, v2

    .line 15
    .line 16
    if-gez v0, :cond_1

    .line 17
    .line 18
    iput v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;->a:F

    .line 19
    .line 20
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;->b:F

    .line 21
    .line 22
    cmpl-float v0, v0, v1

    .line 23
    .line 24
    if-lez v0, :cond_2

    .line 25
    .line 26
    iput v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;->b:F

    .line 27
    .line 28
    :cond_2
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;->b:F

    .line 29
    .line 30
    cmpg-float v0, v0, v2

    .line 31
    .line 32
    if-gez v0, :cond_3

    .line 33
    .line 34
    iput v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;->b:F

    .line 35
    .line 36
    :cond_3
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;->b()V

    .line 10
    .line 11
    .line 12
    int-to-float p2, p2

    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;->b:F

    .line 14
    .line 15
    mul-float/2addr p2, v0

    .line 16
    float-to-int p2, p2

    .line 17
    int-to-float p1, p1

    .line 18
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardHeadRatioView;->a:F

    .line 19
    .line 20
    mul-float/2addr p1, v0

    .line 21
    float-to-int p1, p1

    .line 22
    invoke-virtual {p0, p2, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
