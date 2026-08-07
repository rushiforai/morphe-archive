.class public Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;
.super Lcom/p1/mobile/putong/core/ui/VText_Medium;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView$Direction;
    }
.end annotation


# instance fields
.field public l:Landroid/graphics/Paint;

.field public m:Landroid/graphics/Paint;

.field public n:F

.field public o:Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView$Direction;

.field public p:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 18
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->s()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 16
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->s()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/VText_Medium;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->n:F

    .line 7
    .line 8
    sget-object p1, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView$Direction;->LEFT_TO_RIGHT:Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView$Direction;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->o:Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView$Direction;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->s()V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v7

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->l:Landroid/graphics/Paint;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->p:Landroid/graphics/Rect;

    .line 24
    .line 25
    const/4 v6, 0x0

    .line 26
    invoke-virtual {v3, v1, v6, v4, v5}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->p:Landroid/graphics/Rect;

    .line 30
    .line 31
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    div-int/lit8 v3, v7, 0x2

    .line 36
    .line 37
    div-int/lit8 v1, v1, 0x2

    .line 38
    .line 39
    sub-int/2addr v3, v1

    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->l:Landroid/graphics/Paint;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    div-int/lit8 v2, v2, 0x2

    .line 47
    .line 48
    iget v4, v1, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 49
    .line 50
    iget v1, v1, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 51
    .line 52
    sub-float v1, v4, v1

    .line 53
    .line 54
    const/high16 v5, 0x40000000    # 2.0f

    .line 55
    .line 56
    div-float/2addr v1, v5

    .line 57
    sub-float/2addr v1, v4

    .line 58
    float-to-int v1, v1

    .line 59
    add-int v4, v2, v1

    .line 60
    .line 61
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->n:F

    .line 62
    .line 63
    int-to-float v2, v7

    .line 64
    mul-float/2addr v1, v2

    .line 65
    float-to-int v5, v1

    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->o:Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView$Direction;

    .line 67
    .line 68
    sget-object v2, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView$Direction;->LEFT_TO_RIGHT:Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView$Direction;

    .line 69
    .line 70
    if-ne v1, v2, :cond_0

    .line 71
    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->m:Landroid/graphics/Paint;

    .line 73
    .line 74
    move v6, v5

    .line 75
    const/4 v5, 0x0

    .line 76
    move-object v0, p0

    .line 77
    move-object v1, p1

    .line 78
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->r(Landroid/graphics/Canvas;Landroid/graphics/Paint;IIII)V

    .line 79
    .line 80
    .line 81
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->l:Landroid/graphics/Paint;

    .line 82
    .line 83
    move v5, v6

    .line 84
    move v6, v7

    .line 85
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->r(Landroid/graphics/Canvas;Landroid/graphics/Paint;IIII)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_0
    move v6, v7

    .line 90
    sget-object v2, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView$Direction;->RIGHT_TO_LEFT:Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView$Direction;

    .line 91
    .line 92
    if-ne v1, v2, :cond_1

    .line 93
    .line 94
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->m:Landroid/graphics/Paint;

    .line 95
    .line 96
    sub-int v5, v6, v5

    .line 97
    .line 98
    move-object v0, p0

    .line 99
    move-object v1, p1

    .line 100
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->r(Landroid/graphics/Canvas;Landroid/graphics/Paint;IIII)V

    .line 101
    .line 102
    .line 103
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->l:Landroid/graphics/Paint;

    .line 104
    .line 105
    move v6, v5

    .line 106
    const/4 v5, 0x0

    .line 107
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->r(Landroid/graphics/Canvas;Landroid/graphics/Paint;IIII)V

    .line 108
    .line 109
    .line 110
    :cond_1
    return-void
.end method

.method public final q(I)Landroid/graphics/Paint;
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/TextView;->getTextSize()F

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public final r(Landroid/graphics/Canvas;Landroid/graphics/Paint;IIII)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p1, p5, v0, p6, v1}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    int-to-float p3, p3

    .line 21
    int-to-float p4, p4

    .line 22
    invoke-virtual {p1, p0, p3, p4, p2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final s()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->p:Landroid/graphics/Rect;

    .line 7
    .line 8
    const-string v0, "#33000000"

    .line 9
    .line 10
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->q(I)Landroid/graphics/Paint;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->l:Landroid/graphics/Paint;

    .line 19
    .line 20
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->q(I)Landroid/graphics/Paint;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->m:Landroid/graphics/Paint;

    .line 29
    .line 30
    return-void
.end method

.method public setDirection(Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView$Direction;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->o:Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView$Direction;

    .line 2
    .line 3
    return-void
.end method

.method public setProgress(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->n:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->l:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->m:Landroid/graphics/Paint;

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->n:F

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ColorTrackTextView;->p:Landroid/graphics/Rect;

    .line 15
    .line 16
    const/4 p2, 0x0

    .line 17
    invoke-virtual {p1, p2, p2, p2, p2}, Landroid/graphics/Rect;->set(IIII)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 21
    .line 22
    .line 23
    return-void
.end method
