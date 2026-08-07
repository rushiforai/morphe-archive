.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/RectF;

.field public b:Landroid/graphics/Paint;

.field public c:I

.field public d:F

.field public e:I

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:D


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 21
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 20
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    const/high16 p1, 0x43b40000    # 360.0f

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->d:F

    .line 7
    .line 8
    const-string p1, "#f9f9f9"

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->f:Ljava/lang/String;

    .line 11
    .line 12
    const-string p1, ""

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->g:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->a()V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 6

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->b:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->b:Landroid/graphics/Paint;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->b:Landroid/graphics/Paint;

    .line 18
    .line 19
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->b:Landroid/graphics/Paint;

    .line 25
    .line 26
    const/high16 v1, 0x40400000    # 3.0f

    .line 27
    .line 28
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    int-to-float v2, v2

    .line 33
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 34
    .line 35
    .line 36
    const/high16 v0, 0x428a0000    # 69.0f

    .line 37
    .line 38
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->c:I

    .line 43
    .line 44
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->e:I

    .line 49
    .line 50
    new-instance v0, Landroid/graphics/RectF;

    .line 51
    .line 52
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->e:I

    .line 53
    .line 54
    int-to-float v2, v1

    .line 55
    int-to-float v3, v1

    .line 56
    iget v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->c:I

    .line 57
    .line 58
    sub-int v5, v4, v1

    .line 59
    .line 60
    int-to-float v5, v5

    .line 61
    sub-int/2addr v4, v1

    .line 62
    int-to-float v1, v4

    .line 63
    invoke-direct {v0, v2, v3, v5, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->a:Landroid/graphics/RectF;

    .line 67
    .line 68
    const-wide v0, 0x3fd9364da0000000L    # 0.39393940567970276

    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    invoke-static {v0, v1}, Ljava/lang/Math;->atan(D)D

    .line 74
    .line 75
    .line 76
    move-result-wide v0

    .line 77
    const-wide v2, 0x4066800000000000L    # 180.0

    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    mul-double/2addr v0, v2

    .line 83
    const-wide v2, 0x400921fb54442d18L    # Math.PI

    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    div-double/2addr v0, v2

    .line 89
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->h:D

    .line 90
    .line 91
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 14

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->b:Landroid/graphics/Paint;

    .line 5
    .line 6
    const-string v1, "#ffffff"

    .line 7
    .line 8
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->a:Landroid/graphics/RectF;

    .line 16
    .line 17
    iget v1, v0, Landroid/graphics/RectF;->right:F

    .line 18
    .line 19
    iget v2, v0, Landroid/graphics/RectF;->left:F

    .line 20
    .line 21
    add-float/2addr v1, v2

    .line 22
    const/high16 v3, 0x40000000    # 2.0f

    .line 23
    .line 24
    div-float/2addr v1, v3

    .line 25
    iget v4, v0, Landroid/graphics/RectF;->top:F

    .line 26
    .line 27
    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    .line 28
    .line 29
    add-float/2addr v4, v0

    .line 30
    div-float/2addr v4, v3

    .line 31
    sub-float/2addr v0, v2

    .line 32
    div-float/2addr v0, v3

    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->b:Landroid/graphics/Paint;

    .line 34
    .line 35
    invoke-virtual {p1, v1, v4, v0, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->b:Landroid/graphics/Paint;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->f:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 47
    .line 48
    .line 49
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->a:Landroid/graphics/RectF;

    .line 50
    .line 51
    const/4 v6, 0x0

    .line 52
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->b:Landroid/graphics/Paint;

    .line 53
    .line 54
    const/high16 v4, 0x42b40000    # 90.0f

    .line 55
    .line 56
    const/high16 v5, 0x43b40000    # 360.0f

    .line 57
    .line 58
    move-object v2, p1

    .line 59
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->g:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-nez p1, :cond_0

    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->b:Landroid/graphics/Paint;

    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->g:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 79
    .line 80
    .line 81
    iget-object v9, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->a:Landroid/graphics/RectF;

    .line 82
    .line 83
    iget v11, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->d:F

    .line 84
    .line 85
    const/4 v12, 0x0

    .line 86
    iget-object v13, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->b:Landroid/graphics/Paint;

    .line 87
    .line 88
    const/high16 v10, 0x42b40000    # 90.0f

    .line 89
    .line 90
    move-object v8, v2

    .line 91
    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 92
    .line 93
    .line 94
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->c:I

    .line 5
    .line 6
    invoke-virtual {p0, p1, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setOuterColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSweepDegree(F)V
    .locals 8

    .line 1
    const/high16 v0, 0x43b40000    # 360.0f

    .line 2
    .line 3
    cmpl-float v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->d:F

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->h:D

    .line 11
    .line 12
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 13
    .line 14
    mul-double/2addr v2, v0

    .line 15
    const-wide v4, 0x4076800000000000L    # 360.0

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    sub-double v2, v4, v2

    .line 21
    .line 22
    float-to-double v6, p1

    .line 23
    mul-double/2addr v2, v6

    .line 24
    div-double/2addr v2, v4

    .line 25
    add-double/2addr v2, v0

    .line 26
    double-to-int p1, v2

    .line 27
    int-to-float p1, p1

    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostRoundView;->d:F

    .line 29
    .line 30
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 31
    .line 32
    .line 33
    return-void
.end method
