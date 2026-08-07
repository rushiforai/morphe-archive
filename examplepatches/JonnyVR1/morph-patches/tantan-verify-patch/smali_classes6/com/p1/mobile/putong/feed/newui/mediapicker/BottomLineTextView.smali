.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;
.super Lv/VText;
.source "SourceFile"


# instance fields
.field public i:Landroid/graphics/Paint;

.field public j:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;->j:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;->j:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;->j:Z

    return-void
.end method


# virtual methods
.method public l(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;->j:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;->j:Z

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    int-to-float v0, v0

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    int-to-float v1, v1

    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;->i:Landroid/graphics/Paint;

    .line 19
    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    new-instance v2, Landroid/graphics/Paint;

    .line 23
    .line 24
    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;->i:Landroid/graphics/Paint;

    .line 28
    .line 29
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;->i:Landroid/graphics/Paint;

    .line 30
    .line 31
    const-string v3, "#ff450e"

    .line 32
    .line 33
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;->i:Landroid/graphics/Paint;

    .line 41
    .line 42
    const/4 v3, 0x1

    .line 43
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 44
    .line 45
    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;->i:Landroid/graphics/Paint;

    .line 47
    .line 48
    const/high16 v3, 0x3f800000    # 1.0f

    .line 49
    .line 50
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    int-to-float v4, v4

    .line 55
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 56
    .line 57
    .line 58
    const/high16 v2, 0x42980000    # 76.0f

    .line 59
    .line 60
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    int-to-float v4, v4

    .line 65
    sub-float/2addr v0, v4

    .line 66
    const/high16 v4, 0x40000000    # 2.0f

    .line 67
    .line 68
    div-float v6, v0, v4

    .line 69
    .line 70
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    int-to-float v0, v0

    .line 75
    sub-float v7, v1, v0

    .line 76
    .line 77
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    int-to-float v0, v0

    .line 82
    add-float v8, v6, v0

    .line 83
    .line 84
    iget-object v10, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/BottomLineTextView;->i:Landroid/graphics/Paint;

    .line 85
    .line 86
    move v9, v7

    .line 87
    move-object v5, p1

    .line 88
    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 89
    .line 90
    .line 91
    :cond_1
    return-void
.end method
