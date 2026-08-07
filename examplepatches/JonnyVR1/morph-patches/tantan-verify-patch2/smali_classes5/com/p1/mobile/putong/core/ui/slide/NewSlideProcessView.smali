.class public Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/Paint;

.field public e:F

.field public final f:I

.field public final g:I

.field public h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "#03aeff"

    .line 5
    .line 6
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->a:I

    .line 11
    .line 12
    const-string p1, "#4a4a4a"

    .line 13
    .line 14
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->b:I

    .line 19
    .line 20
    const/high16 p1, -0x40800000    # -1.0f

    .line 21
    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->e:F

    .line 23
    .line 24
    invoke-static {}, Ll/bnl0;->y0()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    const/high16 v0, 0x41200000    # 10.0f

    .line 29
    .line 30
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    sub-int/2addr p1, v1

    .line 35
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->f:I

    .line 36
    .line 37
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->g:I

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->b()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 47
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 48
    const-string p1, "#03aeff"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->a:I

    .line 49
    const-string p1, "#4a4a4a"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->b:I

    const/high16 p1, -0x40800000    # -1.0f

    .line 50
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->e:F

    .line 51
    invoke-static {}, Ll/bnl0;->y0()I

    move-result p1

    const/high16 p2, 0x41200000    # 10.0f

    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result v0

    sub-int/2addr p1, v0

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->f:I

    .line 52
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->g:I

    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->b()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 54
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 55
    const-string p1, "#03aeff"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->a:I

    .line 56
    const-string p1, "#4a4a4a"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->b:I

    const/high16 p1, -0x40800000    # -1.0f

    .line 57
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->e:F

    .line 58
    invoke-static {}, Ll/bnl0;->y0()I

    move-result p1

    const/high16 p2, 0x41200000    # 10.0f

    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p3

    sub-int/2addr p1, p3

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->f:I

    .line 59
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->g:I

    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->b()V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->c()V

    return-void
.end method


# virtual methods
.method public final b()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->c:Landroid/graphics/Paint;

    .line 7
    .line 8
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->c:Landroid/graphics/Paint;

    .line 14
    .line 15
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->a:I

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->c:Landroid/graphics/Paint;

    .line 21
    .line 22
    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Landroid/graphics/Paint;

    .line 28
    .line 29
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->d:Landroid/graphics/Paint;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->d:Landroid/graphics/Paint;

    .line 38
    .line 39
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->b:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic c()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 13

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->e:F

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    cmpg-float v2, v0, v1

    .line 8
    .line 9
    if-gez v2, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->h:Z

    .line 13
    .line 14
    const/high16 v3, 0x40400000    # 3.0f

    .line 15
    .line 16
    if-nez v2, :cond_1

    .line 17
    .line 18
    cmpl-float v0, v0, v1

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->c:Landroid/graphics/Paint;

    .line 23
    .line 24
    const/high16 v1, 0x40e00000    # 7.0f

    .line 25
    .line 26
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    int-to-float v1, v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->d:Landroid/graphics/Paint;

    .line 35
    .line 36
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    int-to-float v1, v1

    .line 41
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 42
    .line 43
    .line 44
    const/4 v0, 0x1

    .line 45
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->h:Z

    .line 46
    .line 47
    invoke-static {}, Ll/bnl0;->y0()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    int-to-float v4, v0

    .line 52
    const/4 v5, 0x0

    .line 53
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->d:Landroid/graphics/Paint;

    .line 54
    .line 55
    const/4 v2, 0x0

    .line 56
    const/4 v3, 0x0

    .line 57
    move-object v1, p1

    .line 58
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 59
    .line 60
    .line 61
    move-object v7, v1

    .line 62
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->f:I

    .line 63
    .line 64
    int-to-float p1, p1

    .line 65
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->e:F

    .line 66
    .line 67
    mul-float/2addr p1, v0

    .line 68
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->g:I

    .line 69
    .line 70
    int-to-float v0, v0

    .line 71
    add-float v10, p1, v0

    .line 72
    .line 73
    const/4 v11, 0x0

    .line 74
    iget-object v12, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->c:Landroid/graphics/Paint;

    .line 75
    .line 76
    const/4 v8, 0x0

    .line 77
    const/4 v9, 0x0

    .line 78
    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 79
    .line 80
    .line 81
    new-instance p1, Ll/ci40;

    .line 82
    .line 83
    invoke-direct {p1, p0}, Ll/ci40;-><init>(Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;)V

    .line 84
    .line 85
    .line 86
    const-wide/16 v0, 0xbb8

    .line 87
    .line 88
    invoke-virtual {p0, p1, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_1
    move-object v7, p1

    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->c:Landroid/graphics/Paint;

    .line 94
    .line 95
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    int-to-float v0, v0

    .line 100
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->d:Landroid/graphics/Paint;

    .line 104
    .line 105
    const/high16 v0, 0x3f800000    # 1.0f

    .line 106
    .line 107
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    int-to-float v0, v0

    .line 112
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 113
    .line 114
    .line 115
    invoke-static {}, Ll/bnl0;->y0()I

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    int-to-float v10, p1

    .line 120
    const/4 v11, 0x0

    .line 121
    iget-object v12, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->d:Landroid/graphics/Paint;

    .line 122
    .line 123
    const/4 v8, 0x0

    .line 124
    const/4 v9, 0x0

    .line 125
    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 126
    .line 127
    .line 128
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->f:I

    .line 129
    .line 130
    int-to-float p1, p1

    .line 131
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->e:F

    .line 132
    .line 133
    mul-float/2addr p1, v0

    .line 134
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->g:I

    .line 135
    .line 136
    int-to-float v0, v0

    .line 137
    add-float v10, p1, v0

    .line 138
    .line 139
    iget-object v12, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->c:Landroid/graphics/Paint;

    .line 140
    .line 141
    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setProcess(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->e:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/slide/NewSlideProcessView;->e:F

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
